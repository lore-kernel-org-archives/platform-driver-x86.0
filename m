Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808AC3DD52B
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790705833; cv=none; b=OdeZW5cT5dsWxgO/E+OxGMP1FW84EM2osTBRVIqTZKUewh/5Z/pz5/Dyu96qWXutVToZOBP4trgGotsB+b/zYt4a43kpwJUX1eg9jNhj2uEcKqcC+thQb5Kz/oOYjQ4aF7WLNZYXXh9Md/YfQOeXgJYKGJ2YI7Ofl7vfeh6JvH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790705833; c=relaxed/simple;
	bh=QCtA6it1d9y3JYN9hfWG5xcX9b6w2iQhbxavcPCtOGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yyzs8bFNAw94TNti+/NXvFxjdiCR5tF9mKKYY8i5QxlFVlf97B5NQYI9sQGzkpXqZVbhTBAn4yQ+UhQewgs6gD0LCDFoFLsvNTny05YA4J43rusdjFR1N4KqTdSSAkSTxDZc6mdh5aC3yW6JejNwZEYzIpdt53sy31Jhi/BpnDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ceMD7Ij4; arc=none smtp.client-ip=91.218.175.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ceMD7Ij4"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QCtA6it1d9y3JYN9hfWG5xcX9b6w2iQhbxavcPCtOGE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790705828; v=1; x=1791310628;
 b=ceMD7Ij42UKebMo+WLKuwd4lxsNwUZNfgng0DJpsUmfoD/yD16McrE4jcQIjNlzgiQn2/DZg
 AZlHR6jNS+t82mfy2yyr/R0PSZ8ZGrVB2X8yGDjvB7g+4OoOfcSw9HSPTdxZr69kMJxmWmfBxn3
 EEVm7D4QwDDDGMRUa72YjENE=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 86cd8644d506ab5d;
	Tue, 29 Sep 2026 18:17:08 +0000
X-Mizu-Trace-ID: 86cd8644d506ab5d
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH] platform/x86/amd/pmc: Add spurious_8042 to ASUS ROG Flow Z13 GZ302EA
Date: Tue, 29 Sep 2026 20:16:55 +0200
Message-ID: <20260929181655.26105-1-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ROG Flow Z13 (GZ302EA/GZ302EAC) wakes up from suspend-to-idle
without any user input. With PM debug messages enabled, each unexpected
wakeup shows the EC raising IRQ1 at the same time as the ACPI SCI:

  PM: Triggering wakeup from IRQ 9
  PM: Triggering wakeup from IRQ 1
  ACPI: EC: Query(0xa3) started
  ACPI: PM: Wakeup after ACPI Notify sync

EC query 0xa3 only notifies the battery of a status change, which
happens when it transitions between Charging and Full while on AC.
The ACPI core correctly treats that as a non-wakeup event and cancels
the SCI wakeup, but the IRQ1 wakeup remains pending and resumes the
system. i8042 debugging confirms that the keyboard controller has no
data at that point ("Interrupt 1, without any data").

The detachable keyboard on this device is a USB device, so disabling
the i8042 wakeup source does not result in any functional loss. With
serio0 wakeup disabled, the same battery event is processed during
suspend-to-idle and the system stays asleep.

Add the spurious_8042 quirk for it. The GZ302EAC reports sys_vendor
"ASUS" while the GZ302EA reports "ASUSTeK COMPUTER INC.", so match on
"ASUS" and on the "GZ302EA" board name to cover both models.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 09a30f333759..ff5c90510c0c 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -143,6 +143,14 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "RC73YA"),
 		}
 	},
+	{
+		.ident = "ASUS ROG Flow Z13 GZ302EA",
+		.driver_data = &quirk_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
+			DMI_MATCH(DMI_BOARD_NAME, "GZ302EA"),
+		}
+	},
 	/* https://bugzilla.kernel.org/show_bug.cgi?id=218024 */
 	{
 		.ident = "V14 G4 AMN",
-- 
2.55.0

