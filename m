Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1179D1E5704
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729507525; cv=none; b=D/67FtiOeIrpb/ccWgksDAxlnS4LtC9I1EySe/hfHX55jJ+Taadcak+HRdkMpl6yxVx+fm8uN/2EH5K+eWcA31dK22TU68msUAIqlYzdHk1HXjvN604NiWUlvCOrEGoJtmc36X3WrfhMInolBzbxP2IY+ZfChlIUUhi+ntFVy7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729507525; c=relaxed/simple;
	bh=WF27qBqFlxa47fR6RZgi2nrHC+6rRe7/Ai9CV0XlLus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XPZrG8c69EXwkg5fCcNFqFOE7m9d6O9I/Yvq3rAmMhGOcKdSHaHbag9pZE/1nfvmMf5voDL08Uitoc0ZVe6cEjFMF4CHlDqsLT3J68ywF4/DUna+4GaTdS2JC+IyyETCwhnQYc3jNQPCaVtlrSTyqs870FuPG3ibhOmN/lxLxLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DQ/VzsKu; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DQ/VzsKu"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c957d8bce2so1993548a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 03:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729507520; x=1730112320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k3Cby4XV9gflu8W/UxOMiO5p42AshZvdOYCZUKwbt7o=;
        b=DQ/VzsKuDUxw0swuadk8uxTH+gagVMXHbiqr8RIyFLOYzuIxbYVP08TJCJ1MsttCCk
         mLa7rPsZM+944+JzqNlHb/0Y4E7L6jfPo0smcfcbGZP2dVsUbsjLmFnYe2O24G2KycH/
         pkJtJA69wmJGwPqsEGTA9C5r0X/K53Dt49kWQOXtlw+8GHd4SNt0G0P6UPgyv3ojHdCp
         EsEsjsxFC/ifp48sqxIZcS+tavjoD+dLcs31fwbtTMOYFukcoZRkS0gMG8rABmYV7UTh
         wr8A9co6qCNwFxLXTlzRYZct9c2Q48etivH9WmySHjBYmhPJu9+fXCWzrw+0gnLyp5Tp
         HG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507520; x=1730112320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3Cby4XV9gflu8W/UxOMiO5p42AshZvdOYCZUKwbt7o=;
        b=vyqfEfzCLbIs4SDjb7LAIV4rXdiytioK07k7pj0uUP6u/c1pE0Cn+nFwZXL/dzvXTk
         7zqpPo18GfegtC7/HBOB+/1uWre6i3ymah+7MTCUyZj26cGHAEn9xltKyFn2yzlkwFFr
         qmGZhl0EjhNieBaduPgl1nn+FHgRIC2hb24BEtY/vlC+eEZMVrQY1WAB7sMryEJgM9Wp
         8DBneMapUCMJF619PBqTC1Ejx7B0B15bzhBHup4Q/PZ5yGdcvFXTIOHSab+HUWWwJA9L
         Jig8/7ocEMf6lLj+gkYM/YL0+lI+HiCc7VXROF+V1wRqKElft059lhRfaO45kJIfa2fG
         VUXw==
X-Forwarded-Encrypted: i=1; AJvYcCXTsm/OeqoqP4uwHrGSQgYaNXCx0e5WIOdcSgNYcK7HSBRkE7WYzP6Q5wIl2XB/PqW5xvPGnCz1TJOdXPvfO6yGFESt@vger.kernel.org
X-Gm-Message-State: AOJu0YwELuSoCwFFPxvnQaBPc9tkDs/uoD+ex8u/GYRRahQKf//Ybcrw
	5g+GW3uLsExvITCXikldHMbU+PXHYA5xMggovjNUNIY5jLCpDGlfOpBRAiUF3RQ=
X-Google-Smtp-Source: AGHT+IEhQ3lbc8bcTJ8PlVXWeGqp6K4dGB5VDI8ZZrvz+LFlAzQU+b1XSNKxL45fg2rsrolynjs5Iw==
X-Received: by 2002:a05:6402:51ca:b0:5c9:5928:970 with SMTP id 4fb4d7f45d1cf-5ca0ac61c0bmr12512201a12.19.1729507520113;
        Mon, 21 Oct 2024 03:45:20 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4dcsm1900917a12.4.2024.10.21.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:45:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mattia Dongili <malattia@linux.it>,
	Michal Simek <michal.simek@amd.com>,
	Eli Billauer <eli.billauer@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] char: Switch back to struct platform_driver::remove()
Date: Mon, 21 Oct 2024 12:45:10 +0200
Message-ID: <20241021104511.405661-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=WF27qBqFlxa47fR6RZgi2nrHC+6rRe7/Ai9CV0XlLus=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnFjC3w6Kl7S70XmAcoWOq+It3bPB4+g2z0+2EQ UtyssaTcPmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZxYwtwAKCRCPgPtYfRL+ TpT2B/46n9Xt4qU9Wegsv/T7RB51fpED9noRiefgHo+uEsifrm2IjxEOl7NfbxZ1GEvbx2QRl5t zUHmzaViAgRoGfCHyBR6RIC6a5ckq8ybHJPzSJVlooIaghhldpod0/yXf0ge1mwIDJ/YTti8pVR RvDv2uKKLc3GYlg3Zf2amGdXucKqjVyMBECi81cHSWHjqRMsIcWozcyMfYEe1Kl9nWX44oRawC7 JqfJC5sLZKcmEtpGorzapBcnpoLp2CtJPb/9sp14y9GuLKiCwsOo8KuZbLXmBfhTnFd13QUYz7y ll/KDOfBPY2cAyoXl1jq/7tC8FXXuph8AGLiUnUKRfFZRuKO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers matched by the "CHAR and MISC DRIVERS"
maintainer's entry to use .remove(), with the eventual goal to drop
struct platform_driver::remove_new(). As .remove() and .remove_new()
have the same prototypes, conversion is done by just changing the
structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/char/powernv-op-panel.c            | 2 +-
 drivers/char/sonypi.c                      | 2 +-
 drivers/char/xilinx_hwicap/xilinx_hwicap.c | 2 +-
 drivers/char/xillybus/xillybus_of.c        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/char/powernv-op-panel.c b/drivers/char/powernv-op-panel.c
index f2cff1a6fed5..53467b0a6187 100644
--- a/drivers/char/powernv-op-panel.c
+++ b/drivers/char/powernv-op-panel.c
@@ -213,7 +213,7 @@ static struct platform_driver oppanel_driver = {
 		.of_match_table	= oppanel_match,
 	},
 	.probe	= oppanel_probe,
-	.remove_new = oppanel_remove,
+	.remove	= oppanel_remove,
 };
 
 module_platform_driver(oppanel_driver);
diff --git a/drivers/char/sonypi.c b/drivers/char/sonypi.c
index 0f8185e541ed..f887569fd3d0 100644
--- a/drivers/char/sonypi.c
+++ b/drivers/char/sonypi.c
@@ -1467,7 +1467,7 @@ static struct platform_driver sonypi_driver = {
 		.pm	= SONYPI_PM,
 	},
 	.probe		= sonypi_probe,
-	.remove_new	= sonypi_remove,
+	.remove		= sonypi_remove,
 	.shutdown	= sonypi_shutdown,
 };
 
diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
index 4f6c3cb8aa41..34a345dc5e72 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
@@ -738,7 +738,7 @@ MODULE_DEVICE_TABLE(of, hwicap_of_match);
 
 static struct platform_driver hwicap_platform_driver = {
 	.probe = hwicap_drv_probe,
-	.remove_new = hwicap_drv_remove,
+	.remove = hwicap_drv_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = hwicap_of_match,
diff --git a/drivers/char/xillybus/xillybus_of.c b/drivers/char/xillybus/xillybus_of.c
index 8802e2a6fd20..1a1e64133315 100644
--- a/drivers/char/xillybus/xillybus_of.c
+++ b/drivers/char/xillybus/xillybus_of.c
@@ -74,7 +74,7 @@ static void xilly_drv_remove(struct platform_device *op)
 
 static struct platform_driver xillybus_platform_driver = {
 	.probe = xilly_drv_probe,
-	.remove_new = xilly_drv_remove,
+	.remove = xilly_drv_remove,
 	.driver = {
 		.name = xillyname,
 		.of_match_table = xillybus_of_match,

base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
-- 
2.45.2

