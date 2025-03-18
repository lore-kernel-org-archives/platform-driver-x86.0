Received: from mail.stravers.net (mail.stravers.net [185.170.214.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4258F58
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Mar 2025 01:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.170.214.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742259808; cv=none; b=vFTCUQtB+9enfltdQQsDJObAGHHMDdmRrwd1ETRefeEpcRD7KUDq8eGf5BbNtP05d3kUpFFHs/5QL/hRj5zf2F18oMpEiEAKB85f1JOIulzjjF17CaMSTFWFWEJNqYFfpjGylPTtE4RIKHXKKZPShzdv89+JAQpZ4C0fSpGHI9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742259808; c=relaxed/simple;
	bh=XMkLgnZMetMWlME7Ex0wl9A3Tvb3hfE6anJN/OUP4D0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=KC82pLzYNi2OVg0ExNdR5P3tZN5v5evuhZgOwl1MS0qFMug4a0q6umeijwnscsWPnZSTBc9YcYYnudDxACBbA15l74MDICxeYz9QF67A1u2xGiU8WihecF0GCZge8ZLDUACKzOL8nHcESIOBuKY5zp3Raew4I0Z0pFt+3t3ktm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stravers.net; spf=pass smtp.mailfrom=stravers.net; dkim=fail (1024-bit key) header.d=stravers.net header.i=@stravers.net header.b=DxnaGD9d reason="signature verification failed"; arc=none smtp.client-ip=185.170.214.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stravers.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stravers.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=stravers.net header.i=@stravers.net header.b="DxnaGD9d"
Message-ID: <fe59465c-3dfc-4d91-baca-ffbc3d4ff138@stravers.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stravers.net;
	s=mail; t=1742259299;
	bh=iP/kuozM7nd8WpKWFpNCn2uVQArIWq9PNmnjvtPg3/A=;
	h=Date:To:Cc:From:Subject;
	b=DxnaGD9dQi1bmMha++av1YEOScwpWMFQrFTCVdxMXTHN3uRzEGjoqwMLb3qMCoUIp
	 xtZF7Ia4SBHm11wE5c4fJImxSzBwVThNEnK2+dTv8Vym9YWcnbUW3D1FC+GgYhSoR5
	 bQmVmixU6tW+VaHaKSoLaxhfikgxbYzIeelGqsNQ=
Date: Mon, 17 Mar 2025 20:54:57 -0400
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: corentin.chary@gmail.com, luke@ljones.dev
Cc: platform-driver-x86@vger.kernel.org
From: Kevin Stravers <kevin@stravers.net>
Subject: [PATCH] platform/x86: asus-wmi: Add quirk for ASUS Vivobook S14
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

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
  drivers/platform/x86/asus-wmi.c    |  5 +++++
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
+    .skip_rfkill = true,
+};
+
  static int dmi_matched(const struct dmi_system_id *dmi)
  {
      pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -530,6 +534,15 @@ static const struct dmi_system_id asus_quirks[] = {
          },
          .driver_data = &quirk_asus_zenbook_duo_kbd,
      },
+    {
+        .callback = dmi_matched,
+        .ident = "ASUS VivoBook S14",
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+            DMI_MATCH(DMI_PRODUCT_NAME, "S5406SA"),
+        },
+        .driver_data = &quirk_asus_vivobook_s14,
+    },
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
+    if (asus->driver->quirks->skip_rfkill)
+        return;
      if (asus->driver->wlan_ctrl_by_user && ashs_present())
          return;

@@ -2188,6 +2190,9 @@ static void asus_wmi_rfkill_exit(struct asus_wmi 
*asus)

  static int asus_wmi_rfkill_init(struct asus_wmi *asus)
  {
+    if (asus->driver->quirks->skip_rfkill)
+        return 0;
+
      int result = 0;

      mutex_init(&asus->hotplug_lock);
-- 
2.48.1


