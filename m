Received: from mail.stravers.net (mail.stravers.net [185.170.214.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F427494
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.170.214.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742579002; cv=none; b=fM0NH0PARiY/rQ3gb1TKijmOrcfudNBLaEdrk1JqNRK+1IYrgIUFe1RH/2IQSDcWlqH3nHvlliZZeVJLuRHlvsQR+3ODCzEiJt+6JaiZKcyxU5kUniSV7PWToHAx7RQYYeNUoqqweeNvuovUa+K/emuQf6dV0xe/oODB4B85kF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742579002; c=relaxed/simple;
	bh=w08mjC+AEG3vz/ylEx3bsC73dCzcXQwBJZAP5rw1Ps8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lsRMm7SO46izpmy2GxXIZTHfxoy+G2M9CDIUSUVAhpkiqoUN0aeaLcAT2Ubp5VUu3v5tS5Y9cy0/Om4FsXiAYFL3A3LsBxYNjcs51eYiT3aewvQjhBEcQpx7bYeurFc3lU2NN/kT8HoN/DFXiRwL6hpuu1YwBLvISTSbRnUDcho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stravers.net; spf=pass smtp.mailfrom=stravers.net; dkim=fail (1024-bit key) header.d=stravers.net header.i=@stravers.net header.b=IInNAW2M reason="signature verification failed"; arc=none smtp.client-ip=185.170.214.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stravers.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stravers.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=stravers.net header.i=@stravers.net header.b="IInNAW2M"
From: Kevin Robert Stravers <kevin@stravers.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stravers.net;
	s=mail; t=1742578997;
	bh=OWh3X2GpNYHeyRSSBsAQ8ikDv3pzuu7ASee56/8WW7o=;
	h=From:To:Cc:Subject:Date;
	b=IInNAW2MIl+kzB1e8jYUXXYmEIeou42dTllzLFZo32QXURDn9u3OwPgtJwVA3Xmlz
	 QcTkhCrYWyDygJGDADA7EfIX1gsywR2c2H2PwxdjVkLzSusQ85IQt8cSbxhscXHDzJ
	 1upIdovReeRDDvq1/vc6dWUVWXB6Z17xsSodpOo8=
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Kevin Robert Stravers <kevin@stravers.net>
Subject: [PATCHv3] platform/x86: asus-wmi: Add quirk for ASUS Vivobook S14
Date: Fri, 21 Mar 2025 13:43:07 -0400
Message-ID: <20250321174307.1831859-1-kevin@stravers.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS Vivobook S14 will have wifi disabled on boot as well as
resumption from suspend if the asus-wmi driver invokes rfkill functions.

This patch disables asus-wmi's rfkill usage to prevent the wifi card
from being software disabled.
---
 drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
 drivers/platform/x86/asus-wmi.c    |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 3f8b2a324efd..1e6fb9308560 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
 	.ignore_key_wlan = true,
 };
 
+static struct quirk_entry quirk_asus_vivobook_s14 = {
+	.skip_rfkill = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -530,6 +534,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_zenbook_duo_kbd,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS VivoBook S14",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "S5406SA"),
+		},
+		.driver_data = &quirk_asus_vivobook_s14,
+	},
 	{},
 };
 
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 38ef778e8c19..42e58a28c3e2 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2138,6 +2138,8 @@ static int asus_new_rfkill(struct asus_wmi *asus,
 
 static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
 {
+	if (asus->driver->quirks->skip_rfkill)
+		return;
 	if (asus->driver->wlan_ctrl_by_user && ashs_present())
 		return;
 
@@ -2188,6 +2190,9 @@ static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
 
 static int asus_wmi_rfkill_init(struct asus_wmi *asus)
 {
+	if (asus->driver->quirks->skip_rfkill)
+		return 0;
+
 	int result = 0;
 
 	mutex_init(&asus->hotplug_lock);
-- 
2.48.1

