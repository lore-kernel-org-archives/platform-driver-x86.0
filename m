Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615728;
	b=Z46U4RxhpDwYCKLhhTxVO4spS/oUSW/0Gb7MRNUN9ak98dTqlCotQThNXw/HvryjG51L
	 Y27IrkxrnA6si05y9NdqlUpV5ZVRMoohyMC3rRQ4xbUCoQ/lojOQE29M5bKt5jyDbm8e+
	 mh6aQnlZTKA658bcU7LJzAd78XNI3aIS0K5z/xpCHeHHkjtqjty4TjkyW8zHWvRAaQ7GC
	 IpZKNgHeXRh4HKlAvVnuxAMMgeIcUxTmrUVZFWCxNTzmAMpmhhqJPiXYbKyZG1d8S+vB8
	 WfFTfCDBdw8CAkrXS3Ly7QRBMmsW1VSTGaiU9rzrvPpVlyzLPuAT4ICSUc9oACte/LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bWflkeNz7q6YbQosoEF13kIprIGtM7ahDtEkEP4/P8Q=;
	b=tsN9R2q0BIZGiz9vU5+uJslL1BhNST96ZOSXC/0nKVPTs7Db+kC2Crfa717Pj3WmqVtK
	 ofkn9peMldOV9aJrX15AmkU7+AvfLG8isoFB7H/i9MCXB1Pvce1tCv6yXMRLiYNnnu0X/
	 fRNMRqmdYxT+QM4pRmP8+Tcoce7hS+Qi3M8KojYDPbEmadMBIwWDfEsyaLJL4oFazB0yM
	 atk9eOaugntrAyxEfjJ5NcRTpbG9osZGgqacHTLhZ7LMrj6B5GafSUoCjzq4quI2ImUOC
	 /xp6o1/m48s5hQi5rzUvO5TbOExmyL7wTt71lqV3oTklP+2Dt2ORKDunEX42PdB7dcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wf/hpEam";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06FA60A6F48
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 14:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E06FA60A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wf/hpEam
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so55523175e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 06:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795615726; x=1796220526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bWflkeNz7q6YbQosoEF13kIprIGtM7ahDtEkEP4/P8Q=;
        b=wf/hpEamM7ZH4xMlb+E1Qwvdwbj3lBMID0ijTSYQHb2EUcPBcXvPsNFAImHXBaFDam
         kpSw+i3bjxhVsAPOgtOjtRHCNZHUh96vR1EX9W13+scS3NkONy/EGmospstL1fLBKLcU
         hirAx5P0SD9LGRIyxK32ywXhsTibkb3ejWq4N183+U9YRst2b4fIzT3fxqL5CwOiGA+4
         h1SyHBeT9WBkeLo4sm1beXVwQY/HbiSo1TFIMbqdXVB4ESn9ppFi0zToMB8/B/M/o2HR
         5EwajErIGtWmBnjz2to0wmNVLTJE12QNxpIb7Jax3nnfP5xEtsJi0Br6qqCyDg0WVQr+
         FBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615726; x=1796220526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWflkeNz7q6YbQosoEF13kIprIGtM7ahDtEkEP4/P8Q=;
        b=OUeqS1WefcxWpJEAJRdYbML1Shge0TxGIDvz53MqcVKCOwOLio74wf2VE1j9n7EdHl
         sfsp1fL2NfwUpmbRdSKMZ8Eb9btU8/mOsCLG5r28OQmxb1JQNgEhDKUPpBm8XGpoZHXE
         49sstNSGtnNTI9neuIGcovxXEMNRdcc80QQplObDs8LHuVbd64NNcFqnNYA2sCK7NQB7
         fhvf/YhFGCu48WsHtG8e2PpzE+s6WqYtpRDjh0Qh4f8hzDWr0pEV4P9maCG1Uid7pBMm
         o9sJbqERHmj0qJE84n5XjFoWMXX5kMqgUwWNeydV5y0U7PhG6s1xNPP2xGPneP6iuMXf
         hQpg==
X-Gm-Message-State: APuU4Z8ypKsfrUsA3AVB3sIk0tq4qjSD9BbPpVtEiryulJbRI4KppFB1
	oCPEXdGuAFOJzy44Wa+OC7DmzO9+QfPvxDgPbQtZiM0rgLfldQxaoOt0JavQNg02Sng=
X-Gm-Gg: AZFdTZd2cODizaNFhvWHnzR9JedogLW2F8JFcfV9VV4LFBLaw28DvFuQZvI9h9RAbvn
	rNBZA+zikK11SdZCu26Bhhx+HKjgzqAE2d5hpk9yx2PA4S3ZmSUYiT64ZeTEfA04P2TGSsYvWCS
	CIlCQydzASiY1iqQdc+sTOecaHMSwTW5hcwFCu6ASEUR5nu3iNR2LZ03idGARvBj6JTOMFJ+Ng4
	GzoCViEg2ECCNi6cSdcUSQ0KO2xnzRPnt3d/tCvUQM9LButg2aM33TF/cbQMDq8ctYfspV/ME6l
	y/xHymovERQ0dTLTJwRLFxushhGWes3hssi7vR4leuy2skz4msC/QhTwONGuSiZjx+CQOZRC0by
	lEs6q2IBsSY1K0sae2XquQfuBwGdg8IyNc6i5BTiy6eqoO9c3DFwu7Lcj4RSYWOQxLhOEHHfL6E
	UnxC9RfFv7VJJVHnkaQ61c41xE+4co/OK4nBqXZtPztTPLlAtzYYPetRMeCuyloSa/hx0T/nUWq
	lEnBAXYP8frxTiyFhN2rpKygiwHgwqOUjtcmfiVmjFZBb0Zte1T/C6vrlKmnjlNawK295ynPaEr
	zcMn9NLeOHGu6J689h1vCmSTh9gvgsDx+b2egvOBOHOh2eXtS0YWKauPHQC8Q8Q=
X-Received: by 2002:a05:600c:4e87:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4bb88938d38mr378442695e9.30.1795615725917;
        Wed, 25 Nov 2026 06:08:45 -0800 (PST)
Received: from localhost.localdomain ([5.77.206.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm578212425e9.12.2026.11.25.06.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:08:45 -0800 (PST)
From: Artur Bakirov <darkonline.android@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	Artur Bakirov <darkonline.android@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the Digma CITI 1804 tablet
Date: Wed, 25 Nov 2026 14:08:19 +0400
Message-ID: <20261125100819.337-1-darkonline.android@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
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

Add touchscreen info for the Digma CITI 1804 (CS1069EW) tablet,
an Intel Atom x5-Z8350 (Cherry Trail) tablet with a Silead MSSL1680
touchscreen.

The firmware, extracted from the Windows driver of the tablet, is
submitted to the gsl-firmware repository as gsl1680-digma-citi-1804.fw.
The same settings were tested with the i2c_touchscreen_props kernel
parameter on a 6.18 kernel: touch works across the whole panel and the
Windows logo works as home button.

Link: https://github.com/onitake/gsl-firmware/pull/269
Signed-off-by: Artur Bakirov <darkonline.android@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index d83c387..606bdbb 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -369,6 +369,20 @@ static const struct ts_dmi_data dexp_ursus_kx210i_data = {
 	.properties	= dexp_ursus_kx210i_props,
 };
 
+static const struct property_entry digma_citi_1804_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1152),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-digma-citi-1804.fw"),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data digma_citi_1804_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= digma_citi_1804_props,
+};
+
 static const struct property_entry digma_citi_e200_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
@@ -1308,6 +1322,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "S107I"),
 		},
 	},
+	{
+		/* Digma CITI 1804 (CS1069EW) */
+		.driver_data = (void *)&digma_citi_1804_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Digma"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CITI 1804 CS1069EW"),
+			DMI_MATCH(DMI_BOARD_NAME, "J210Z"),
+		},
+	},
 	{
 		/* Digma Citi E200 */
 		.driver_data = (void *)&digma_citi_e200_data,
-- 
2.49.0.windows.1

