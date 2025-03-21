Received: from mail.stravers.net (mail.stravers.net [185.170.214.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C8A1E25EB
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 17:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.170.214.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742576668; cv=none; b=T7PVUe6RuJ9AsSEuE87+JEtGbWQm8MU/CEoi3IgKEi4ZBdMCkkFb3Cb3Ew200R3/bj3lZglZPmpulPd4W3kRSvPJS7tEeiuDahkCV+hUnNbDdH8WStn3i9hIgPYIPrt8ShOgOqhuKpWdvZRBLj4SqDoIXFb4HFraPyNOpQQ32AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742576668; c=relaxed/simple;
	bh=ZumMrZ/Dr9GN7sItOsOQ82LebVm6/To+9Xo8/3ErYFI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=nHNbDkB0EcWfXsXk46tdwR84VSWjkVzJlFFoDt7OkcULNPSwDedWbL+/eKdfXRzOh6/BMn5qfy+8i2Xfml/7LlxmXAZ8cw9+Nk+2Vql06N8DSQhrUtDod1gHOCRWSJ2NASg4aEEAVMvhrItRK4vJG6QsYBzpt6iDskrUhFUB6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stravers.net; spf=pass smtp.mailfrom=stravers.net; dkim=fail (1024-bit key) header.d=stravers.net header.i=@stravers.net header.b=3nE0nYs+ reason="signature verification failed"; arc=none smtp.client-ip=185.170.214.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stravers.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stravers.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=stravers.net header.i=@stravers.net header.b="3nE0nYs+"
Message-ID: <a22c2077-4f74-4972-be2b-f60b67f67bab@stravers.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stravers.net;
	s=mail; t=1742576663;
	bh=6v1Itygiy9AhpcEy1AWbpVWhKHCg5vlVjDwko82Wuto=;
	h=Date:To:Cc:From:Subject;
	b=3nE0nYs+Ri0vRvtAb83ys6OR5Z7rCTIJYRIVDcLIyG35fEHaTZ+mZ7QwFKdzrE+sY
	 eY1SGkHVnmPIJXZRBjcdL6GFl2+QAlHFNET5Mc9FV/alZ9Xcx126NIK96JsbaKat5R
	 Hl+xHgvcYkxfFXNS4mXTnebuPGSmcDw/D/4knuTg=
Date: Fri, 21 Mar 2025 13:04:20 -0400
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: luke@ljones.dev, platform-driver-x86@vger.kernel.org,
 corentin.chary@gmail.com
From: Kevin Stravers <kevin@stravers.net>
Subject: [PATCHv2] platform/x86: asus-wmi: Add quirk for ASUS Vivobook S14
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 From 9af8ba6cfd6305d7696d6cfc8eedb12405cb572f Mon Sep 17 00:00:00 2001
From: Kevin Robert Stravers <kevin@stravers.net>
Date: Mon, 17 Mar 2025 20:41:44 -0400
Subject: [PATCH] platform/x86: asus-wmi: Add quirk for ASUS Vivobook S14

The ASUS Vivobook S14 will have wifi disabled on boot as well as
resumption from suspend if the asus-wmi driver invokes rfkill functions.

This patch disables asus-wmi's rfkill usage to prevent the wifi card
from being software disabled.
---
  drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
  drivers/platform/x86/asus-wmi.c    |  5 +++++
  2 files changed, 18 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c 
b/drivers/platform/x86/asus-nb-wmi.c
index 3f8b2a324efd..1e6fb9308560 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -150,6 +150,10 @@ static struct quirk_entry 
quirk_asus_zenbook_duo_kbd = {
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

diff --git a/drivers/platform/x86/asus-wmi.c 
b/drivers/platform/x86/asus-wmi.c
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

@@ -2188,6 +2190,9 @@ static void asus_wmi_rfkill_exit(struct asus_wmi 
*asus)

  static int asus_wmi_rfkill_init(struct asus_wmi *asus)
  {
+	if (asus->driver->quirks->skip_rfkill)
+		return 0;
+
  	int result = 0;

  	mutex_init(&asus->hotplug_lock);
-- 
2.48.1

