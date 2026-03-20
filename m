Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3811FC110
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 00:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773967788; cv=none; b=D3oe+l7hHtQtaRUGtYcagWtpqcda6y5PWgTAmf0CJ1IRLYytqOxMYC8zSe6XXReOWHtWFXsqY62ZaDwe2+M9mTxuZurVsKWM8qiLhjekyoEBR5hee/icC3FdGfPOMOt9uK8ZCq9kAFXrp4jmkh5ah1sJHwM1aE/EvuwvvidMsIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773967788; c=relaxed/simple;
	bh=aj+amzHykz0VP8Omkgv4PdojHt+uGLfiOHMytOe5yJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qzKIvINDl+tdsiMqm1oKTgIEStbJh5KtrLM1K6oPH1qupHLh4f+1JRFQcGnjNfTr1g7XcZ3/V66xM641+EAJWI3d+OeYLVYElGYSPV3A/Vm1hegDy+WZCJCJFl3bncQ/bq4GmQkX07rn6qKTAs+urDJpWXSAWtiO/HpN5hdm9W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBGJqv5S; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBGJqv5S"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b04fc8851cso14190185ad.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 17:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773967786; x=1774572586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IpBmk5APBUS2BhHlK8KMNZh8R0vKiaeWox7A/MEW/zg=;
        b=YBGJqv5Ss08VGKNl6/PqnSL9fts+KjEqoZJ3BW44RhBpm6HD0hEVdu37PKeN894VwM
         E46q+pqCEuoISqRD0DwhoHcApkb9K/kO6uCYRmGOMzKIhiD3mXsF/SRXBJm39ub/B5qR
         rZcPPT7jnADzDohlENu0P3K12Vae45vpUMHx0GlgjdY2I6Bt0OtTNK9NCim/9TU8G9/z
         yc9svMbqGpOp6B5GHzw9ybA+XWheAZErLS56oDLPm9zYZ+ku4n7hpTLKbkKXPCS6q4Wh
         2pgYRhbKRRfJnr75wJNJZlzzc8vpHJLwo4eb6YHfVPcqeQh0YgJa0jHGiW10ZCmJuyZh
         /5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773967786; x=1774572586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpBmk5APBUS2BhHlK8KMNZh8R0vKiaeWox7A/MEW/zg=;
        b=C3U0JCxgahzQdoJg95Bb6qBgHT3Ab8SkQEKjNuZFwkoajcJuigXsECytE6jP5hbiSC
         W5uom9cHik+DinqanBBDmGJQEKF0qw0qCqT7VcdOQ/6MaQWzgpaf0eqYZQhR3Sx+Zbv8
         N6MK/7SiuCpGntUSP8BB9321Yjb/18ENDCURYdZtmTH4B3E91RaTBuYG+kt7IDG3dUt3
         ZEu1DYXTzmtgfs+6Vzuq4c+p2C8p0CroPS4LDbTYsEy/mRKc/M7d+bynUQn6ds2qJv6I
         kjjoHycCJ6krA8b32WWlSvyt4QaFXmnLKplDSt4Vcgo2AfFTUZk+o+XPnq/0uU7g7iQ5
         YT5Q==
X-Gm-Message-State: AOJu0YyGeAD/i3XusepR6PeSqM9Vf3Qaici/bLfnbkurj3zg2GdOkBBQ
	88d7hxTEN4Zb+GsCAOvo6h1YRuuM9lRnXfAC8Q686OtflvzCWc7irj4swdIAc3v8
X-Gm-Gg: ATEYQzyd7Sk7ZY/3wQDzrHUu7QaGeBrO+AWyAqs5sOiMtjj4YLqzA4vDK7KMn+lEziv
	v5YoMrcoVRQE2C00P5bG36Z1yYNIH1tCcoI4/3e0g7YCAd9hMXnt6SNp7Bm0pKG0uzYE1OyM4UR
	iew0xxJJ0idpqZw/PtZ+QOcCbrosJFyFUa5zE16o4WPyUYuEGRduDcD0Ele/hTw2pOpVGezmgt+
	vX6Kqw0RnOnlVipgo8WOTwDzXPrFweI3jE9nC95cpKKdAWqEFeYhzOWX28utrAI4d+IbUYuiDP+
	fCbg1REoYtgd6kUAvLpC3v+4Jf2reNl8oxhbLi8Iq8UqgUnqBI9Ik73Qr0wVQSnevYKnnA3bUvp
	roIC7P4znjXACt8xIr3KFj0z6cCNCmTwS4YYIxT0Oxj4De1JyUxpE0QxwqbPVYYMX0dlYJoJUUL
	mWuVOV+XkBRLherYgWGsrHPcdIS5jBCn0awXFqSKExj6o+uHW9yMW+XAY=
X-Received: by 2002:a17:903:124e:b0:2b0:5a4c:726b with SMTP id d9443c01a7336-2b0827ca665mr9999575ad.40.1773967786258;
        Thu, 19 Mar 2026 17:49:46 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08353e94asm4299265ad.25.2026.03.19.17.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:49:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] platform/x86: panasonic-laptop: simplify allocation of sinf
Date: Thu, 19 Mar 2026 17:49:28 -0700
Message-ID: <20260320004928.29914-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change to a flexible array member to allocate once instead of twice.

Allows using __counted_by for extra runtime analysis. Move the counting
variable assignment to right after allocation as required by
__counted_by.

Remove + 1 to allocation. It's already done in the previous line.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index d923ddaa4849..4d663fffbcc8 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -248,11 +248,11 @@ struct pcc_acpi {
 	int			ac_brightness;
 	int			dc_brightness;
 	int			current_brightness;
-	u32			*sinf;
 	struct acpi_device	*device;
 	struct input_dev	*input_dev;
 	struct backlight_device	*backlight;
 	struct platform_device	*platform;
+	u32			sinf[] __counted_by(num_sifr);
 };
 
 /*
@@ -1017,21 +1017,15 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 	 */
 	num_sifr++;
 
-	pcc = kzalloc_obj(struct pcc_acpi);
+	pcc = kzalloc_flex(*pcc, sinf, num_sifr);
 	if (!pcc) {
 		pr_err("Couldn't allocate mem for pcc");
 		return -ENOMEM;
 	}
 
-	pcc->sinf = kcalloc(num_sifr + 1, sizeof(u32), GFP_KERNEL);
-	if (!pcc->sinf) {
-		result = -ENOMEM;
-		goto out_hotkey;
-	}
-
+	pcc->num_sifr = num_sifr;
 	pcc->device = device;
 	pcc->handle = device->handle;
-	pcc->num_sifr = num_sifr;
 	device->driver_data = pcc;
 	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
 	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
@@ -1039,7 +1033,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 	result = acpi_pcc_init_input(pcc);
 	if (result) {
 		pr_err("Error installing keyinput handler\n");
-		goto out_sinf;
+		goto out_hotkey;
 	}
 
 	if (!acpi_pcc_retrieve_biosdata(pcc)) {
@@ -1111,8 +1105,6 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 	backlight_device_unregister(pcc->backlight);
 out_input:
 	input_unregister_device(pcc->input_dev);
-out_sinf:
-	kfree(pcc->sinf);
 out_hotkey:
 	kfree(pcc);
 
@@ -1140,7 +1132,6 @@ static void acpi_pcc_hotkey_remove(struct acpi_device *device)
 
 	input_unregister_device(pcc->input_dev);
 
-	kfree(pcc->sinf);
 	kfree(pcc);
 }
 
-- 
2.53.0

