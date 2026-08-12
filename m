Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8420E435508;
	Wed, 12 Aug 2026 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534392; cv=none; b=CYGgE7HEK7ho85g5fiYThhlDgQHEm5PKsc0/knQMiB/8g32YnmAt1kYWs8p6g9bF+FrE/VoldejcR9FuCo8TmbkuQr0RveVci0yPqsr2g7+gaVvTSlPlQsPP07JTrmysQCl3UrUS3mUMjH7T0MbWWSAKgDGO+nugY1/INBIBFYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534392; c=relaxed/simple;
	bh=U2sp9S0Rkf82WbuDqa3pEasFaapD+9sfOgUm1s+QG5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I06OpAcnSFfj5OvqvTXgtwcIwXembg0TuiuKwGr+GkLfJFNnoo2IVLc/kEKbZyMjzQojV9ontOMY1o/SGSx8vXvvc4YnIvdHf0hzGULYs7ny2McC9T+4QOa37+oReqaULAHdDYva7pRQO1EE6R/R6ZIrWuytSyHo0BtUQ0aP5bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from ultra-5e8c07.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	(Authenticated sender: muhamadeevir)
	by air.basealt.ru (Postfix) with ESMTPSA id 5A2422339D;
	Wed, 12 Aug 2026 14:33:05 +0300 (MSK)
From: nicourced@altlinux.org
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: krishna.chomal108@gmail.com,
	emreleno@gmail.com,
	edip@medip.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ilya Mukhamadeev <nicourced@altlinux.org>
Subject: [PATCH] platform/x86/hp/hp-wmi: Add periodic tablet mode poll
Date: Wed, 12 Aug 2026 14:33:03 +0300
Message-ID: <20260812113303.106965-1-nicourced@altlinux.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ilya Mukhamadeev <nicourced@altlinux.org>

Some HP convertible laptops (e.g., ProBook x360 series) do not generate
ACPI events when switching between laptop and tablet mode, causing the
input subsystem to never receive SW_TABLET_MODE notifications.

Add a periodic delayed work that polls the tablet mode state every
second and reports changes via input_report_switch(). Track the last
known state to avoid sending duplicate events, and clean up the work
queue on module removal.
---
 drivers/platform/x86/hp/hp-wmi.c | 35 +++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..5fbfdde3291a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -460,6 +460,8 @@ static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
 static bool platform_profile_support;
 static bool zero_insize_support;
+static int last_tablet_state = -1;
+static struct delayed_work tablet_mode_work;
 
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
@@ -1176,9 +1178,13 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
 		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
 			input_report_switch(hp_wmi_input_dev, SW_DOCK,
 					    hp_wmi_get_dock_state());
-		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
-			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
-					    hp_wmi_get_tablet_mode());
+		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit)) {
+			int tablet = hp_wmi_get_tablet_mode();
+			if (tablet >= 0) {
+				last_tablet_state = tablet;
+				input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, tablet);
+			}
+		}
 		input_sync(hp_wmi_input_dev);
 		break;
 	case HPWMI_PARK_HDD:
@@ -1271,6 +1277,24 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
 	}
 }
 
+/*
+ * Periodically poll tablet mode state and send input events if changed.
+ * This works around missing ACPI events on some HP laptops.
+ */
+static void hp_wmi_tablet_mode_work_handler(struct work_struct *work)
+{
+	int cur = hp_wmi_get_tablet_mode();
+	if (cur >= 0 && cur != last_tablet_state) {
+		last_tablet_state = cur;
+		if (hp_wmi_input_dev && test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit)) {
+			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, cur);
+			input_sync(hp_wmi_input_dev);
+			pr_debug("Tablet mode changed to %d\n", cur);
+		}
+	}
+	schedule_delayed_work(&tablet_mode_work, msecs_to_jiffies(1000));
+}
+
 static int __init hp_wmi_input_setup(void)
 {
 	acpi_status status;
@@ -1298,6 +1322,9 @@ static int __init hp_wmi_input_setup(void)
 	if (!(val < 0)) {
 		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
 		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
+		last_tablet_state = val;
+		INIT_DELAYED_WORK(&tablet_mode_work, hp_wmi_tablet_mode_work_handler);
+		schedule_delayed_work(&tablet_mode_work, msecs_to_jiffies(1000));
 	}
 
 	err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
@@ -1331,6 +1358,8 @@ static int __init hp_wmi_input_setup(void)
 
 static void hp_wmi_input_destroy(void)
 {
+	cancel_delayed_work_sync(&tablet_mode_work);
+	last_tablet_state = -1;
 	wmi_remove_notify_handler(HPWMI_EVENT_GUID);
 	input_unregister_device(hp_wmi_input_dev);
 }
-- 
2.50.1

