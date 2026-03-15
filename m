Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3D637CD25
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 21:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773611608; cv=none; b=Y4+qqESVTqWsNkyw2TZLTpBvXqWDWrBt4Py8l0kutMDN+t8Jax94uiaDTNJIRAgV1wLnHFLsot0Tj+/mqtPaRPNy0rGruaG5r//85m3eJLVoPvTLXPXTqB3lS90qh6ye9haS3RX3Drnkzmm+ypeI8l5rQxUrY/ZqRED6Ft1y3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773611608; c=relaxed/simple;
	bh=IBDYUK+3O1y5VL1z6GzT5aRoM2+wTLMn0ghXsNI6iG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZbXhVAu/kzUABnOjfnKBHuqCAJWNTkOxyM9MHFB6rvLf+YuXaS5t+z0iFrk2yKZMkavGkQIvBi3UXOVHLFMECLd1liFa93Byex+ndyJAJkTm9UKhQRW1yW8D6lM6wSZIXuFH5JikwZi3y1MEakplmkrec2y7rb6FfobGr05/2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP1DUyCy; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BP1DUyCy"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35a04d6aeb0so2350020a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 14:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773611606; x=1774216406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXUioPAqGCi/G7aJUPOn/95wAygcdDsF9zmaY+F6+Nc=;
        b=BP1DUyCy6qjgkEJ3qgba6JOxkZFgdWn3EWp3cyU3eZEMWKES+ljoamOpMNjrcOvTBL
         sHq03gDDtFj3OCdBVJXwNVEqLSigHsWzc45VW+jJb1czsNFvdgkD7x9PsHWG+IJ3JUfD
         iXGsfb4CK72PEZv/syyqg1TFlbOyHw5USbX1qBklhg96V4h7gTupbaO8imu9ej9y0ER9
         YP5zaNvoUN9oVT9WDqCrEKdyhjKspE5wjh67oN6zvOM9Gixb4PBh1lny8duW6pVy0a4L
         zBP6fLU5PasQBdHB2HTxQXKQgAXCsPX4v2yvU3opqMOWumA86yssLCbRzCB27bcP8MUd
         IGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773611606; x=1774216406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cXUioPAqGCi/G7aJUPOn/95wAygcdDsF9zmaY+F6+Nc=;
        b=IEUIXDjkIOc2nXVXu1l4eCxd7UvIVi+vxkSoN5yZQ3/iRr2ZcWEIlO58SNHoAo70Za
         PQ54eKRWVTDqcnXMEjUtLvgArsMkW7vmYhJ6RhUzEgFfw0NTU/EndtWzyZIJesp2Ka3Z
         pqntw3qZNhL8+fOolFZjLzmVY+bGYmU4alIC2pBVF4bp0GgQVrNq+B9MBvGZNwoRCt7A
         vXaefLbkXcF7tWkDGE4+yZZoSfr1z5YDbRhlvEbx2M3d2BFtn/NTRa+cU4yaJOXxSlGi
         zpVsZPfY3/l82x8EzWXAIp3vmwTacnyc2EnyyWjuXBqVy7nZp3x5ptXtl0ehtlOIm/3w
         Ovpg==
X-Forwarded-Encrypted: i=1; AJvYcCUCWvH8wpg+pjG9SfRFhUv3stmdrEd9zcrbeTrZmCmxXDK31vgK8eLDc5GdQS++1Q3W/kyhwMzpJO0C/THuPse7ShBl@vger.kernel.org
X-Gm-Message-State: AOJu0YxiNw3LzgHOIQhMYhJESfmyVCeIOqsTSv6wvPHSwzFJaPAYU4T2
	rrN9zHi/pb6GCfIBza6xeOE1Qb/lA9I8pBBCE1rgbbiOcTm7waPHbZA=
X-Gm-Gg: ATEYQzyY+TiarZQVSln9mrTQV1ZMheimQAR3eYD+B9JD7/Q74aiJXJfR0jHlT/PR80G
	3Ls755y2HnLJDzsU/ZLWrgLX/GLrdKA9ufmVh0/J23fBpYRw+iB/EYXbnq0bx6c+l7Bg1dw+IK4
	x80HYMOucRMfpkRkaOXiQ9za+ue/usgIXLdeITh1+Kju0QVNbgP+5FS6kQJRK86O1C5KrNNH3uU
	mGsFC+KqStwBGooyPeInPb9MSDIQWVlMYSj0qwv/Dbbdnqpx0BT82kZJvr7dR9wsE9lMRmGzpks
	tXFdGiw3mD+aNKBt9dni6AbBtqeNoCspNYrPphDDYIKsqDp0y+xPENvfuyLVp0wVKTcWyFm+lJG
	fqsddqmf4GyI+aAKg5Us5685uGHDf4hPZhAdY6zMZ6UxTiJHpbMR9GwpHU5aiIA3kKpsn3vrkGc
	uEFH72GfSpQO79Kc/+tIxTwq++VH361mnGXGzf9utfrl/Rk0BwcAn+WsI1yQgk1f0=
X-Received: by 2002:a17:90b:1d08:b0:359:409:49bf with SMTP id 98e67ed59e1d1-35a22063fb8mr10339166a91.21.1773611606207;
        Sun, 15 Mar 2026 14:53:26 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9303eb9bsm3074980a91.8.2026.03.15.14.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 14:53:25 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/2] platform/apple-gmux: use apple_brightness to save brightness to EFI
Date: Mon, 16 Mar 2026 03:22:42 +0530
Message-ID: <20260315215302.24087-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260315215302.24087-1-atharvatiwarilinuxdev@gmail.com>
References: <20260315215302.24087-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use apple_brightness to save brightness to EFI.

(tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 1417e230edbd..5a13c917c496 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/debugfs.h>
+#include <linux/platform_data/apple-brightness.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
@@ -78,6 +79,8 @@ struct apple_gmux_data {
 	/* debugfs data */
 	u8 selected_port;
 	struct dentry *debug_dentry;
+
+	bool save_efi;
 };
 
 static struct apple_gmux_data *apple_gmux_data;
@@ -960,6 +963,13 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	}
 
 	gmux_init_debugfs(gmux_data);
+	if (IS_ENABLED(CONFIG_APPLE_BRIGHTNESS)) {
+		ret = apple_brightness_probe(gmux_data->bdev, &gmux_get_brightness);
+		if (ret)
+			pr_warn("Unable to Enable EFI brightness save: %d\n", ret);
+
+		gmux_data->save_efi = true;
+	}
 	return 0;
 
 err_register_handler:
@@ -1012,6 +1022,16 @@ static void gmux_remove(struct pnp_dev *pnp)
 	kfree(gmux_data);
 }
 
+static void gmux_shutdown(struct pnp_dev *pnp)
+{
+	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
+
+	if (gmux_data->save_efi)
+		apple_brightness_shutdown();
+
+	gmux_remove(pnp);
+}
+
 static const struct pnp_device_id gmux_device_ids[] = {
 	{GMUX_ACPI_HID, 0},
 	{"", 0}
@@ -1026,6 +1046,7 @@ static struct pnp_driver gmux_pnp_driver = {
 	.name		= "apple-gmux",
 	.probe		= gmux_probe,
 	.remove		= gmux_remove,
+	.shutdown	= gmux_shutdown,
 	.id_table	= gmux_device_ids,
 	.driver		= {
 			.pm = &gmux_dev_pm_ops,
-- 
2.43.0

