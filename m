Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561110;
	b=tkMQANJK0jGBV7IDlxOlZQlzeCGivuY/V9Wnby2YWzdDQXfBNpYA6Kj1edW4EvyLJSA0
	 J7TyEdF2b39LN0Vir8YStMXxFAQGPCFzDTMwgGplIouKdoDlbZXstLBsRBEDgTqzuEkR9
	 vRg28g/fV9C8g1yYY6+tJe5yBnbiEi3G5b3ZcWJY8aKLyWwb9m/OiTKEmqtFI86GMhkfJ
	 YilY3zByzlAJ29nRRN69VlmUMw99X/MRsiBLpBukj1LCObdricWJVSCuCmh5gyfQyfL5c
	 644rGQpPcc0J6GMZZ3pwXrkhfVrmgSN4dXkHl3Wqi7t6QUW5D4uMpkzLfyffemNSaBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xXV71PcODW6FyL159mGZh1/JIAVBGIw9B7bUXiNfwTI=;
	b=ZKky5Obd/KEkunVIE2ZZiVgpjzu5QpW93HTCOOHbKjFDvKK5FZaBwbhJ/CzQnpCt39E+
	 WPZ81WFq2X7w1/pDoIfgxmNHL3DH1ZLXyhIyXB836bMCYYaxejT2YOgxp6qPtOhC+DYut
	 luMVHvgmQnv7uoXdjQ8ERnB6UHhK8Tbi5tcYHYlnLypoe4Ayb3nMiWptx2EOUcQzLOO4H
	 Gh0WhyLcWM1JfHfS2bA5qzcTL8FKOUQ318Hb5Lvu17j2u/EaldUMorx9Szs7HuBv354x3
	 fhmMpsQpbWSbM0wAdMAeVcBb9W03Iv2y7mA0eNx7E3OSsK7Xn9hwKx/oVLCN+8b/5UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGBKXP9I;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09019606A324
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 19:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09019606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGBKXP9I
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ab3d3c5761so20905337b3.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 11:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561109; x=1794165909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXV71PcODW6FyL159mGZh1/JIAVBGIw9B7bUXiNfwTI=;
        b=MGBKXP9I7UoSqv3lSgZIQdK3vGpqts+w+Ei2ixXGxRZ+rZfTZKcjYZsaHLRktxU7c0
         DR7AP7vVOqdGd6FTlK66g3jSONNRBnAcW+hZX3FhX0dbiF71VoxL2HcOn68SA0bwrgmI
         HEuH1xrbZM1y/GAhwDQbvg5RCK4cPY069AsSPHzMsAkfrBL2cvontgYWstyFJcD4gpiX
         8P/XyBa0oVOQ2WSxmWEE+WbwYRTwM9OGLSBYZIHcarQN0oRe8QmIcToMRvOPstTk+vjy
         +C/BWw/McX4V0JImSVOex9i1qosn9K+JMpwkB+FcNsxIb5hEE+cvMPYmbnX6fMUwWKz6
         nZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561109; x=1794165909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXV71PcODW6FyL159mGZh1/JIAVBGIw9B7bUXiNfwTI=;
        b=q6vnVBofCBVVcyQNpoJDBYlfc6FF9XiX0h0Ef8z1rNBATgutKAk7nVa7HPpEvzbGUJ
         SF5NqjW1aUewvOUPZrrUhvQ7wWWZbXiNy8jlpSWvzeqBAbreg1arJR5y0uYTW+duohKD
         Ci7kuAIXFkq9JyONjrLx42ZnJNU0poQzeKsygnID1FpOouasxY4HSkkx1oma1HklaMTE
         zxcckK67vO4wLLfGRG65RcJTT+RzH1kjBWypQ8BQMeVLKPz1UlkYBZU1EugbXFt8oFoD
         yG6qp5xmWgyzUSAhOWf+3m/2CXD45pqs4K0z0mGzVb88gsG0+YuncKrhnt3T4dFVyL/s
         7mfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRrJN0MSuM6IRn4IfR50baSuhNnxqCIV2kVIlmWx+p63mA1Od3dS/huoTFzS7nszO4uL4tGfTX0l5EIHyiGZhIUe/6@vger.kernel.org
X-Gm-Message-State: APuU4Z+Op4/sHZhYjldKP895YXUQqH73sSeyzLiS1GSqP470P3q56jE9
	50OJCGJ240RNIb+PZBOZU0rYEZXt/SkviVDnLA1qS0APpr4n5ooyFDNS
X-Gm-Gg: AYBFou0ICvpT+567K9TGSF/LNozbmsMuHo2Jmv+KZCRnD4wKuS70jQmUdl5IoAdtJY1
	XPk7AHQ1l4F3MZQm9og7f6Glx2oHy5hmX4UFuHfuLgFdGyRALCudpHPn3xlkjdAoXgt9w+RipfC
	dPuRhleviW5SBhlikzeifo3BOhrTPbagrhHkCTh3SRMUcNzvDwBZ8w+iFHt61kVJXkI4Qegr7qe
	aezHPX6bOrCVFL3GliNJ+qNmV9w7ug4x32MylnL+8CJOTrm03mRqOOMAcceSHnjtBdOQ0n0P1rB
	5a9lt0d2uUuyKTNHg8I7+kNQmBmbJbZTP6NzhLuoDy6azof6bSGvCmtP8P5mUbV1pZAtumY5HPW
	sHiDadt24QZcoRdDYsoRK79DKTEHeCaXgrLWCr2YfsztLLiPkzXRCEEeCQVaa9SXJ5PGbBR0ObE
	wUGeG1PK0Xkf14ocKg0uIaI8SkvjN3uJYn05jCUDFdwLG4YPF3P0Wp3zKmd5vhBOj3Nxfihugvo
	BT4sBdC7r/cp+PtEKpI+702uWvStQ7ODjnhk7/pnzcFH5upLqQhG2QydWg4rYWVckC43OhRVIzi
	6iJSm1dWeLz3w1gdf4/0qMqdqkYJDWCnyGm27aY=
X-Received: by 2002:a05:690c:fd3:b0:8b0:76e5:ecf0 with SMTP id 00721157ae682-8b2b65ba33emr54625067b3.4.1793561108916;
        Sun, 01 Nov 2026 11:25:08 -0800 (PST)
Received: from acer-pcaldeira.lan ([191.23.85.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7165abesm40430797b3.32.2026.11.01.11.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:25:08 -0800 (PST)
From: Pedro Caldeira <pdrocaldeira@gmail.com>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pedro Caldeira <pdrocaldeira@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: acer-wmi: Keep Bluetooth powered on Aspire E5-573
Date: Sun,  1 Nov 2026 16:24:44 -0300
Message-ID: <20261101192446.5615-1-pdrocaldeira@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SMBIOS type AAh table of the Aspire E5-573 reports a communication
button bitmap of 0x1 (WiFi only), although the laptop has internal
Bluetooth.

wmid3_set_device_status() reads the device states using this bitmap and
writes the result back, which loses the Bluetooth bit. Any write to the
acer-wireless rfkill device therefore powers Bluetooth off, even if the
WiFi state does not change. Userspace does such writes during boot, and
Bluetooth cannot be turned back on as it has no rfkill device.

Add a quirk that adds Bluetooth to the bitmap and to the capabilities.

Tested on BIOS V1.37 with an Intel 8260 card (USB 8087:0a2b) replacing
the original one: Bluetooth survives boot and acer-wireless writes, and
the new acer-bluetooth rfkill device blocks and unblocks it.

Fixes: 1d1fc8a75fec ("acer-wmi: replaced the hard coded bitmap by the communication devices bitmap from SMBIOS")
Assisted-by: LLM
Signed-off-by: Pedro Caldeira <pdrocaldeira@gmail.com>
---
Reproducer without this patch:

  # rfkill unblock <index of acer-wireless>
  usb 1-5: USB disconnect, device number 6

Runtime-tested with the same change on v7.2.11; only build-tested on
for-next. Not tested with the laptop's original card.

https://bugzilla.kernel.org/show_bug.cgi?id=190641 reports the same
symptom on an E5-573G with its original card. I left that model out
because I have no hardware to test it.

 drivers/platform/x86/acer-wmi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 3a018fdf5..60028fe9f 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -406,6 +406,7 @@ struct quirk_entry {
 	bool hwmon;
 	bool platform_profile;
 	bool pwm;
+	bool commun_bluetooth;
 };
 
 static struct quirk_entry *quirks;
@@ -430,6 +431,11 @@ static void __init set_quirks(void)
 
 	if (quirks->pwm)
 		interface->capability |= ACER_CAP_PWM;
+
+	if (quirks->commun_bluetooth) {
+		commun_func_bitmap |= ACER_WMID3_GDS_BLUETOOTH;
+		interface->capability |= ACER_CAP_BLUETOOTH;
+	}
 }
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
@@ -454,6 +460,11 @@ static struct quirk_entry quirk_acer_aspire_1520 = {
 	.brightness = -1,
 };
 
+/* The type AAh table omits the internal Bluetooth device */
+static struct quirk_entry quirk_acer_aspire_e5_573 = {
+	.commun_bluetooth = true,
+};
+
 static struct quirk_entry quirk_acer_aspire_a315_58g = {
 	.hwmon = true,
 };
@@ -663,6 +674,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_aspire_a315_58g,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Aspire E5-573",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Aspire E5-573"),
+		},
+		.driver_data = &quirk_acer_aspire_e5_573,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer TravelMate 2490",
-- 
2.56.0

