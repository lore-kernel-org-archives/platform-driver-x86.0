Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E343F353A6F
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Sep 2026 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499416; cv=none; b=WNNwciSNYK4ajYzzDnweozheZWLro/G/anGD4eZYgDytAjAuFSmuSEPz4LuCCuViL3MPgez5aBiQ/IkW/Bh2YKkD2JKidvhJBDUirVWdiMUu7gUdX4GnkVl5rZuzLqCjn509OdMTn64ZrdioFuA7Lbgfs+20OB3NEknpmCH2Edw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499416; c=relaxed/simple;
	bh=na7MnqEQJuC8olHclKKsjrvhEuivz8p97wbWlBBlwDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3lHhYK8eCe1wCId05MOESxJw897fwzRLMzrx9LSQea3sUTysW/IcNpqg5r8fMqqwV5FWYh40XPzQMwVjoCTHqz96RdGOrdio+tbiw0kCNdOlOutsmNp+pIDUQSZjR6Yj9JTMDCGY6R8St2OnSimQ5tFgueJHnbht1/XWpFibXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9O4Segi; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9O4Segi"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88272e1d069so290814b3a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Sep 2026 01:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790499414; x=1791104214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5txqVmu2LVZOtoXfw0E2UO1BnJaAiJFq4i/7tF5xvb4=;
        b=S9O4Segi3CMI6CxH8R+FDXEyfH6QjfDsITpeJjCGj0hFD7tVBJMJPgoglgLnWcH5qA
         DWVCuvwYqHWgXjlNb1EdLj2CJ/1LIMKq+EG41VIaNbaFNY1V6MsGC4S6e8kRGPEZmwhJ
         Ija4FWTUWX3iNshqck7dOHnQgihqxKHS8iMSiVfV77gwO0uDi6JCrW6eDbPsIr98qkJr
         jXxBrFc/788T53gpnJfiTbxNtkR1eKV3tQQpAK3GaLNv9RXv5qRJDf2tXier5KtDZz5b
         Y1liBJz4cA5Me/u+JFhzY8hyKX5bbM9r/syv5P8w08lQuJ+tkcgt/mi8ujDDD/VcPZ7Q
         YYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790499414; x=1791104214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5txqVmu2LVZOtoXfw0E2UO1BnJaAiJFq4i/7tF5xvb4=;
        b=gKjyl+LKmf+rAVugGHR4b7ms4YG20joF/PdNZedklCEuRHufT3Y9p20Z82Wk4vqNa2
         jS/m8aM9/dRCVLF3RX//ZYCvKW7b0iKFgzZIKGSC3seWiT2ziUlNc68C2ODKUZXaG2xs
         w2/P70qEF2TVD77DTznw8ni7scQaslFk6HsOmuj7XnE+nDc8/zjXFxr4XiWSktmWk0QD
         cjQDoH3DNpcDjTlbOdlPOs/IF4mBAtUfUZuLf3NISMPEZFtv6DHC2Tb71jQQLvSHB1Od
         B4iO/oRNz0PBZYUzfi0qXRMyJLegtDpyQIgBZEUIF8n1VU2rN/ts5p4XH/5ey4XNzQkn
         i6Zg==
X-Gm-Message-State: AFuF++nbgHsdAfa8RkFsupdpxPyOcqtmAGXja/b+xq78ALhYhrpFOmLC
	oFclQEogI2B4u6hlxoLeGiUl8rIL2V9LMta4HLrjVTGG0yVwRyxBkTYHgp956tb2
X-Gm-Gg: AYBFou2C9vSHmqTmBV9HrhetT7uA1vS6lcDY7QbwTO7gXQwNycuCMAlY+OD8Sbvt9UF
	vmwKFa7VqSF1Xh70Vy5e6i0WCBO50Hs7vejslIdbbmff/xaUP35pNK8j1+2EM7jbsV/i2VnvK2m
	ciBQ5vHTUNKxZNEeZHDB1ehFc/qwmDIR//8PQ9fb9geE7EJHyug54mRjD0kPHgC0eYvobpYNg9R
	7Zp5gnEvQk9X3OSxp2ZKkzslynKsDIiGehHKCBrF5VQMwtniDX8vHti7xGwPVzBawih6uHgTUZe
	dBefIJ8Us5LpARo25olXJKP+nz699PQvWUjOw87uNNdXDmsw+UeImp4wbdRl75saE2252ARcfzx
	tZFKzKKp3yI1q0UWhpOMnkHJg75BIfBFzkLRKssBpAY/4xLOI94n/nciUYIYaatJauv+NCbvJ4n
	XFmKT2Wf7EyYywpfQSOtCPttIOW3FJxyWfhCMLf5Td6qsIFiyldcKgETeVOLd3moCjj2ieT63om
	C72t70CLT/WkuHhdIgoSUrY5/zEVHcK6AUrDTp1VKx2zA==
X-Received: by 2002:a05:6a00:408f:b0:882:98e8:5202 with SMTP id d2e1a72fcca58-88298e855ecmr1090552b3a.54.1790499414186;
        Sun, 27 Sep 2026 01:56:54 -0700 (PDT)
Received: from archlinux ([157.48.21.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea19800esm2795783b3a.10.2026.09.27.01.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:56:53 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Define known Victus S driver data
Date: Sun, 27 Sep 2026 14:25:39 +0530
Message-ID: <20260927085539.96791-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, Victus S thermal parameters use the Unknown Offset for TP
(Thermal Profile) from the EC offsets enum, even though there is a
Victus S EC Offset in the same enum.

This was done so because the EC layout is highly
variable across this lineup of laptops. The only place where the 0x59
offset is used is the driver data for Omen V1 models, despite it being
labelled as the Victus S TP offset. The name clearly doesn't relate
to the use case.

However, after some downstream searching, I have found that there is
a Victus S board which does have the expected EC layout corresponding to
the very Victus S offset itself.

Add known board parameters for the Victus S models to correctly map
the found board (8C99) and any others in the future.

Link: https://github.com/yunusemreyl/omen-space/commit/f32a76386592d1a604e574c693b323d15e978089
Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 7ab81ce5f8d4..6486e0ef8753 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -121,6 +121,13 @@ static const struct thermal_profile_params victus_s_thermal_params = {
 	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
 };
+
+static const struct thermal_profile_params victus_s_known_thermal_params = {
+	.performance  = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE,
+	.balanced     = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.low_power    = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.ec_tp_offset = HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET,
+};
+
 static const struct thermal_profile_params omen_v1_thermal_params = {
 	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
@@ -164,6 +171,11 @@ static const struct hp_wmi_board_params victus_s_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
+
+static const struct hp_wmi_board_params victus_s_known_board_params = {
+	.thermal_profile	= &victus_s_known_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params omen_v1_board_params = {
 	.thermal_profile	= &omen_v1_thermal_params,
 	.fan_profile		= &victus_s_fan_profile_params,
@@ -316,7 +328,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
-		.driver_data = (void *)&victus_s_board_params,
+		.driver_data = (void *)&victus_s_known_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
---
2.55.0

