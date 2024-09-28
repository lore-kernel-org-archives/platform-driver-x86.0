Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B6D57CBE
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Sep 2024 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727540261; cv=none; b=ptgjXDC9mkAge9DYrI4y4rf9jPHeX3y1/Ww3nNtIv2EwPVCOqPLNvuz3auBYiQ5yL7yz1dcq5qbcfGmAirn+N7vN7y3JR900Lh2JYKaI+UsB1k/KAF3OsYAMax4Uc8tqr5JIFItgCERZIqHP/2WzWdqPQaPD9g5hpVpjm+J1nYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727540261; c=relaxed/simple;
	bh=t9t1N/PKxfxn7j2Uv1P7SPS1Tyd3qWcE4CYU2F4dFd4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=DIHV9i0gkdZEPCUpuKqzU89JMUDGbN3YCsL9iH9jGO+I62KTDzmbJyyHCLx9SAAM75XeOfzfwYk2kqoJ2D6oSUur+TpK2C6JFAc3rhfUhDQfRJgLOKLolwlHEqWDxJlWZ2iuFqKLGYCDHwq73omDMpbRMn/AkqWrHF2BmE1RwqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEbkJ93m; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEbkJ93m"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42e5e758093so25443925e9.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Sep 2024 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727540258; x=1728145058; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UA4EUH00XK4jHFDC/BTpAP2ThrqAhUufTPf+ZPQklok=;
        b=XEbkJ93m6LraLCh5WxM5nbLUQrl9750acLgIhJeD8nczPBKb7f+b4DGcTrlM3FU4rD
         QAEW6KqGoQxPqQzr7Sdi2VDwGf0nAIZab1kRTIs4cmmtNjnCye/vUYIEMgK/dKFtlKl0
         L3VW042Ubr/ucJdvECS+Ici6iVf0a62NcaW4s+b0W4LxOggQcqoJDrJnrc4Q3E8aJW24
         oQgWs9yKVdoGPGtcT3j7fI1gk7eA5J3jaKvYrNVpgy1JQss7GN74oDqL1/0Vq9ncB7Uo
         5lPQnHjLh9Gq3XB/KTatiCOFTrd8yeNP/wt6JbqhD49X8dBJj8IhrvlyXM30ATqZlbCx
         u1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727540258; x=1728145058;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UA4EUH00XK4jHFDC/BTpAP2ThrqAhUufTPf+ZPQklok=;
        b=Ow19U/A+kRtkjoJAPoJf3ss5b8dkbyolMm89TOCtNXmiOHp7neQnNAdjxRrpqPBymG
         Gju5n7/XI7yDDGkwgIabHqpDzibDE9XiMr3iUxthJTtgbp1BDhHkTDpJsWdECELlUc42
         tv7h6tFUdsitDHwVlbxvo0gOcNLQpKzPmIpcaU/sBPm2W1NTJlEhj4/YxtTK6+TWQRXH
         KdPeMYdJeq449VCv0xxnMKbvsGAi0skZ4m2fiOJGrwHrFeKY4AektXtq7V0A+eQXLmLP
         3LS2mVtak2T6u5xIYpSziLXFcePasnck3x6klpEEil/7hL4pDahvRyIQulb7eNe2Z2oW
         aMBQ==
X-Gm-Message-State: AOJu0YyeicVll7bATVR7EqaWdZlQW20Lt1kqR+dkKoZ/P62qSOv937GU
	bes59nkms9ngEa260lEB7iOlzbVBkpWxluvyu6Mvy0PH9rS3+iOOOASwTi0p
X-Google-Smtp-Source: AGHT+IGTmKmawh93+KfclBjanDPcrPKYg3xPFf6LT2ywEcNdoXOj52h1VUZIg8Bf3KyRD6bqmoBMDg==
X-Received: by 2002:a05:600c:3b06:b0:42c:d7da:737b with SMTP id 5b1f17b1804b1-42f58430021mr44906275e9.9.1727540257645;
        Sat, 28 Sep 2024 09:17:37 -0700 (PDT)
Received: from [192.168.178.62] (p5dd074c3.dip0.t-ipconnect.de. [93.208.116.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ffa3dsm105290125e9.23.2024.09.28.09.17.35
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2024 09:17:36 -0700 (PDT)
Message-ID: <a983e6d5-c7ab-4758-be9b-7dcfc1b44ed3@gmail.com>
Date: Sat, 28 Sep 2024 18:17:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: platform-driver-x86@vger.kernel.org
From: Stefan Blum <stefanblum2004@gmail.com>
Subject: [PATCH] Fix Asus B2402FBA internal keyboard and track point
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

By default the internal keyboard and track point on the Asus Expertbook
B2 Flip B2402FVA are not functional.

Similar to the Asus board B2402FBA, on the B2402FVA the internal keyboard
is only functional by adding it to the irq1_level_low_skip_override array.

For the internal elan track point, i have found out that setting the class to
MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSM makes the track point function as expected.

Signed-off-by: Stefan Blum <stefan.blum@gmail.com>

---
 drivers/acpi/resource.c      | 8 ++++++++
 drivers/hid/hid-multitouch.c | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
index df5d5a554..c29e71401 100644
--- a/drivers/acpi/resource.c
+++ b/drivers/acpi/resource.c
@@ -489,6 +489,14 @@ static const struct dmi_system_id irq1_level_low_skip_override[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "B2402FBA"),
 		},
 	},
+	{
+		/* Asus ExpertBook B2402FVA */
+		.ident = "Asus ExpertBook B2402FVA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "B2402FVA"),
+		},
+	},
 	{
 		/* Asus ExpertBook B2502 */
 		.matches = {
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 56fc78841..3f93c5ef6 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1992,6 +1992,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_ELAN, 0x3148) },
 
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_ELAN, 0x32ae) },
+
 	/* Elitegroup panel */
 	{ .driver_data = MT_CLS_SERIAL,
 		MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,
-- 
2.39.5
