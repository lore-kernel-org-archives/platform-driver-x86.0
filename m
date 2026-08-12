Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1511D314B96
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521708; cv=none; b=jFZvBJ6DxspqpVThU2gcIZ/1agpgjyMAotIHWKdRuqsxaAHhWa9WPjM0+8Eh1gToAVxvoEFbbBEZ+cctudlreWmHYKSVsuIovMlG8wFzJ+s27eCmAhQT0sDg2Eqwi74nTSaTWOp152ZqpYaSihYgxiEz0cfUwqkFm5HZFvtbMck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521708; c=relaxed/simple;
	bh=fY02pbggqDt7t6nRXYyKMlHTdsUT2PIkqcP5Nw7uYa8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PkTYOff8R/LrxNSaO5XXUtxCG9H+vQgOeicM/OJgtta7UnOU3ah3i75m+Sm7L/tdUCRrkM/szE3a/TiZ5nrhQ60YNg+eJk1tQ7wZ0b84feGDm4gjfkKjJZnZBbru6nqZsI7OfoVQCs0xJrQOzw2FElNf9i0R/8fYNGYyDratFOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=basealt.ru; spf=pass smtp.mailfrom=basealt.ru; dkim=pass (2048-bit key) header.d=basealt.ru header.i=@basealt.ru header.b=hBfkZ5Si; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=basealt.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=basealt.ru header.i=@basealt.ru header.b="hBfkZ5Si"
Received: from [10.88.144.209] (obninsk.basealt.ru [217.15.195.17])
	(Authenticated sender: muhamadeevir)
	by air.basealt.ru (Postfix) with ESMTPSA id EFFE223372;
	Wed, 12 Aug 2026 11:01:40 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=basealt.ru; s=dkim;
	t=1786521701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jR/zicVrJcHE7+O84oBcfFDOQlUTX3iqBmyckXS/5fo=;
	b=hBfkZ5SiaCBd7ADBbzqCC3UrRUrwf8ae7tseqstWvELtKZoZcZfC+9mqw+l1pZl7ClOqw1
	dFHNQvCkNKdyLxKe5PxXVkhLYdLnhsSVO34Ng2lLWfMR5kZy8hhbOpHo3i8m1noEx01epA
	xs+tZLk2vSE3W/3/LZEKNwYQV6VQVwWiTOXMtiCpFHh1pPlfn+3j9/1O/z+devPQ8P/KGi
	Oo/4x6iO1kF/5YTuwl2sOETqbO0RDZ41XsHks5E8mzLQgjNkGyfQIE/2XAiJEx2de3EkNO
	9RSLcvSVsIi3jk41GFoyXXiDlSmE646EssA8ZwakeLwpyzcxODmVcZPpklV/UA==
Message-ID: <8bae58a6-83d6-4444-a97d-c6302eb666c9@basealt.ru>
Date: Wed, 12 Aug 2026 11:01:39 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: platform-driver-x86@vger.kernel.org, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
From: =?UTF-8?B?0JjQu9GM0Y8g0JzRg9GF0LDQvNCw0LTQtdC10LI=?=
 <muhamadeevir@basealt.ru>
Subject: [PATCH] platform/x86: hp-wmi: Add periodic tablet mode poll
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Greetings!

Some HP convertible laptops (e.g., ProBook x360 series) do not generate
ACPI events when switching between laptop and tablet mode, causing the
input subsystem to never receive SW_TABLET_MODE notifications.

Add a periodic delayed work that polls the tablet mode state every
second and reports changes via input_report_switch(). Track the last
known state to avoid sending duplicate events, and clean up the work
queue on module removal.

---
  drivers/platform/x86/hp/hp-wmi.c | 37 +++++++++++++++++++++++++++++---
  1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c 
b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..4a4d57fa6d29 100644
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
@@ -1176,9 +1178,14 @@ static void hp_wmi_notify(union acpi_object *obj, 
void *context)
                 if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
                         input_report_switch(hp_wmi_input_dev, SW_DOCK,
hp_wmi_get_dock_state());
-               if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
-                       input_report_switch(hp_wmi_input_dev, 
SW_TABLET_MODE,
-  hp_wmi_get_tablet_mode());
+               if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit)) {
+                       int tablet = hp_wmi_get_tablet_mode();
+                       if (tablet >= 0) {
+                               last_tablet_state = tablet;
+  input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
+                                           tablet);
+                       }
+               }
                 input_sync(hp_wmi_input_dev);
                 break;
         case HPWMI_PARK_HDD:
@@ -1271,6 +1278,24 @@ static void hp_wmi_notify(union acpi_object *obj, 
void *context)
         }
  }

+/*
+ * Periodically poll tablet mode state and send input events if changed.
+ * This works around missing ACPI events on some HP laptops.
+ */
+static void hp_wmi_tablet_mode_work_handler(struct work_struct *work)
+{
+       int cur = hp_wmi_get_tablet_mode();
+       if (cur >= 0 && cur != last_tablet_state) {
+               last_tablet_state = cur;
+               if (hp_wmi_input_dev && test_bit(SW_TABLET_MODE, 
hp_wmi_input_dev->swbit)) {
+                       input_report_switch(hp_wmi_input_dev, 
SW_TABLET_MODE, cur);
+                       input_sync(hp_wmi_input_dev);
+                       pr_debug("Tablet mode changed to %d\n", cur);
+               }
+       }
+       schedule_delayed_work(&tablet_mode_work, msecs_to_jiffies(1000));
+}
+
  static int __init hp_wmi_input_setup(void)
  {
         acpi_status status;
@@ -1298,6 +1323,10 @@ static int __init hp_wmi_input_setup(void)
         if (!(val < 0)) {
                 __set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
                 input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
+               last_tablet_state = val;
+               INIT_DELAYED_WORK(&tablet_mode_work,
+  hp_wmi_tablet_mode_work_handler);
+               schedule_delayed_work(&tablet_mode_work, 
msecs_to_jiffies(1000));
         }

         err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
@@ -1331,6 +1360,8 @@ static int __init hp_wmi_input_setup(void)

  static void hp_wmi_input_destroy(void)
  {
+       cancel_delayed_work_sync(&tablet_mode_work);
+       last_tablet_state = -1;
         wmi_remove_notify_handler(HPWMI_EVENT_GUID);
         input_unregister_device(hp_wmi_input_dev);
  }
-- 
2.50.1

