Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8901D19F424
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Aug 2025 19:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755112464; cv=none; b=N1t6R4k4ZF7SPRnbIIFauGNoU3jPPB4mxisG/VRyxR//e3NELGS13JflMDaL5eKILQGo+D8Gmy+MeWI7TnyKr3AEEKaW3s0INB09ZNGXOucV2474mxtoQkWsF/n3EPTx1V3hmBnFwTNDsZVgrInIGaWSHxwYeBfhSzchOBIRYiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755112464; c=relaxed/simple;
	bh=YFfHXA3iVI/imVrmQZmYskpYDNVGH3qqb4HTconMmKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IlAU3Q/QLzHQ/AsRHGScEbvFMw4GxrQ+KiZ/EAhgyBTkvgkgXzaIdz/e95xUypYCgnjspx6g8ZZi/9GZiPt3mY8+PTW+XpyQWRmy2WV6E07GtmP/SjyCmuvFgnwVaSFJ5x+Ornmd3VihpFwrQdTBQOuwPnltX3gg7+fwBzjWsBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eWt8bnKD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eWt8bnKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=mGgKEn7KVUz3ra
	zfljm56Oiq7eaZi+TS97jN4whCk4U=; b=eWt8bnKDYCKA35Ih4bCjEpefvmQd6G
	/HEVZfPo7+wLmiMn9XprGzo4WJygj+Jg5RyBerq9+LdAYTxKpuYw6Hf8M1pCSGvb
	+msrKUEoGl/Kks29i2c/5ENwsDD120ZXV1Ms3quOrh/TQbFiEuhjKgMqykIsMyqR
	8cU4ACzF7VNmjy91fimto+SpAJ05pbrjyMDKURFFKzKvjWyQki7nz0Pj3PJncQtH
	GBSWg3JSoIU9B9w0+bSdrlqzCjHrJl5fJ4m0F7WF7IjfRswgg4o7gpG4eY/nZku3
	Ju0yptI2qGvfGUBGPFI3l8+g55NJ1t/AYoFjY67gWSLG5i8+y/bD1bwA==
Received: (qmail 734736 invoked from network); 13 Aug 2025 21:14:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 21:14:20 +0200
X-UD-Smtp-Session: l3s3148p1@/HSz9kM8OqttKDDX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: platform-driver-x86@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yen-Chi Huang <jesse.huang@portwell.com.tw>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2] platform/x86: portwell-ec: don't print superfluous errors
Date: Wed, 13 Aug 2025 21:13:44 +0200
Message-ID: <20250813191416.6860-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The watchdog core will handle error messages already.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1: simplified more into a single return statement

 drivers/platform/x86/portwell-ec.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
index 322f296e9315..b603e68c82e9 100644
--- a/drivers/platform/x86/portwell-ec.c
+++ b/drivers/platform/x86/portwell-ec.c
@@ -237,13 +237,7 @@ static int pwec_probe(struct platform_device *pdev)
 	}
 
 	ec_wdt_dev.parent = &pdev->dev;
-	ret = devm_watchdog_register_device(&pdev->dev, &ec_wdt_dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to register Portwell EC Watchdog\n");
-		return ret;
-	}
-
-	return 0;
+	return devm_watchdog_register_device(&pdev->dev, &ec_wdt_dev);
 }
 
 static struct platform_driver pwec_driver = {
-- 
2.47.2

