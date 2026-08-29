Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85C9425879
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 22:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788044258; cv=none; b=IY7hqHnxcYUrhgSjsVrJgDlHJRKkk5G3moIKznL1KTh09AXxD9x7I4fFXet3/ZiY3Qc6IECJJuBeXnvNonF9S6KqsQIIVLSvuEK+0BWv8yQfz22nJJ9D4Ah4x/dk4ESK4oL7L1lnHNFsSDQmdppoirQIyX4ylyLeWcb5jL1tgWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788044258; c=relaxed/simple;
	bh=ikr0xmonSVEBBrsqTIBByVAQfkgWDFTQ5xl7Lwxfkqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLZyCkjELBaS2ttPmUd05JW8+dI7xtDf6t7kmSgqMagVemc1DzM1LUZdfuS3Bk75dWEgrHZJo21EH8NI33c4Qr8mW9ElXvWjToBnPk5iWLQhaddGcJV9s3Lo/9XzQ0VRECeCvnsKWEvAhmmMud+/LRNcm1ACKYu02tQN7oTSRP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFBU2vRU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFBU2vRU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b9320423cso21403155e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 15:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788044255; x=1788649055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhbptZ7sTwzXtkLdl4fxPAWO4oqXaG6ecccqmYbEYoA=;
        b=hFBU2vRUeEnl3wznIlVufoHZ1vkWLuxJVECq5ie74IP7hUg3suB9VrprCBzDtbkZwz
         TIIZACASBA51sQ6NW2xZerQaMN4wCAYQw0gmOwBrvT4IKPucpyKZyoAeWiPtCQN0yRjx
         MAOZm+bK0StSNAk17KWYMSyQaRWgEYNVQaCPKJb3Y2E40Akxhq4nd8ffNBuMsC9A4zxw
         HAzcrTqykwwTqBGw8rMpEj7SL9hhLWbqZakbH41rKxoptrHMiADFP/73aBJTAYOgbi7+
         xAVYv9+2XyHeMKzMc7wKSrWJxTReikU3WbOD6l2pV/wheh0hOfwJbCo7uZpw9V+PsVQz
         MMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788044255; x=1788649055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhbptZ7sTwzXtkLdl4fxPAWO4oqXaG6ecccqmYbEYoA=;
        b=gptoS7d/MDDnv3z4dzUFPoIj1Y92aQ3X6QJ9bGowdU7mHNZ+VqBb2hKBWg4lbr8zRT
         2JdhqoRfg1EJ/wYdAKweGhDf+EVjdq+WYuiaMc6YAhcIhLw3RvUd3kEi9aSneT8w2Ihp
         EzomQOia+0GeL6mbLY17TqcXxcK7Bz2H3Pv00v5YFwu/JWZ3GCWQB+HqwzYMCr1EGoqQ
         dHTLj6roY0ez338ilMDz+TEGpDtikG1jQNlI/5sOKszcOF4KqFwBpeTLfL1y4/ZIJgYM
         VzOSXcVQuhBorBX1qhII5wjSkw/YiGTmGrhRpMO+GjO8EpMletaigGUeTxOE1KaGt2Lb
         gFsg==
X-Forwarded-Encrypted: i=1; AHgh+Rpc2Y34fF8Nh9X9n1DBoq3RSei24xtiAEUFjj1vR0LA9I8i11g0AJZB/4ftsVQVGbTUnzRIsWYMrkyDz58IUuSu0+MW@vger.kernel.org
X-Gm-Message-State: AFuF++kXNRgVLeyFEmCnC/RzhJzu9utR9ahT8rAR2uZioNaXm5Fe8NM2
	38zj0L3dzQxcQxnvNGgiciLqPGzk/aaUJynjiT9keWbXE1hdH+vd2hd8
X-Gm-Gg: AR+sD13mhDnFJnK25Tk6qG0fzz8NIK4wa7zlEr9V/t+ne0aqECeGFH/wg+Cw4s6GjeW
	0j/2lDsFyrHMIdnec/ww2RayoRBo4XgNP2+YUm54kCjnC2B5fLKUVw03KDC0vOraVIJGdpI8eFb
	woeIsq2ePYyzjfxEYsOVQJq+wezIWKACam8v6PRq1ukQNdkAnarewHFY4h0WPTa2Vfa9JoQNvPZ
	hjM6chdB+LhI1d+7+aCb+fBhvxtooZ5aKKwbR6OtNgBUmUC6BL/Q7nqu5heUgskxmhWgMj+qhup
	kMANSJXi/oubQV1txRzEs98Rrbev1aMIioF5CG8m1fAcfGzB2tTlaCRYjdWxp458yhZhB3670kE
	yTBc6FWin49AzqmWoK3RTBlvufcH8fpHtOGv6tz7DDgJGE2jpK1DO4ghy7W3N2Gs6qKTYRITG1i
	DHXGJAqBCH7JbvAf+0+YVQV8odR3xVlrXTqrWxU4UFXLqSh+t8FT1lB3tce+hP7x2zBcZxC8pH/
	BUxB491/hYyChiYOLMXPuDc8YH/g+ZfVl5v1buBSxo9ahV68OE7lZY=
X-Received: by 2002:a05:600c:4452:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49b91c2e42bmr261263835e9.7.1788044255220;
        Sat, 29 Aug 2026 15:57:35 -0700 (PDT)
Received: from 1Z10 ([37.161.113.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm60751835e9.0.2026.08.29.15.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:57:34 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 2/3] platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
Date: Sun, 30 Aug 2026 00:57:28 +0200
Message-ID: <20260829225729.395270-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829225729.395270-1-mauriziocasciano7@gmail.com>
References: <apLZF6b3F39z6bUc@google.com>
 <20260829225729.395270-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L firmware describes the TS3A227E headset
detector as a secondary resource of the RT5677 codec rather than as an
independent I2C device. No client is therefore created for it.

Instantiate the device on I2C1 at address 0x3b, describe its GPIO
interrupt, and provide the mic-bias setting used by the Yoga Book
design. This lets the ASoC machine driver use jack and button detection.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol [sparse]
---
 .../platform/x86/x86-android-tablets/lenovo.c | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index a8c849ee03db..88693b9a1b01 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -149,6 +149,16 @@ static const struct software_node * const lenovo_yb1_x91_drv2604_nodes[] = {
 	&lenovo_yb1_x91_drv2604_1_node,
 };
 
+static const struct property_entry lenovo_yb1_ts3a227e_props[] = {
+	/* Value taken from the Lenovo Android kernel code drop. */
+	PROPERTY_ENTRY_U32("ti,micbias", 7),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_ts3a227e_node = {
+	.properties = lenovo_yb1_ts3a227e_props,
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -304,7 +314,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.init = lenovo_yb1_x90_init,
 };
 
-/* Lenovo Yoga Book X91F/L Windows tablet needs manual instantiation of the fuel-gauge client */
+/* Lenovo Yoga Book X91F/L Windows tablet needs extra platform descriptions. */
 static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -315,6 +325,23 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 			.swnode = &fg_bq25890_supply_node,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {
+		/* The jack-detection IC is described as a secondary RT5677 resource. */
+		.board_info = {
+			.type = "ts3a227e",
+			.addr = 0x3b,
+			.dev_name = "ts3a227e",
+			.swnode = &lenovo_yb1_ts3a227e_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:00",
+			.index = 77,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+			.con_id = "ts3a227e_irq",
+		},
 	},
 };
 
-- 
2.53.0

