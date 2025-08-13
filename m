Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E7823B63F
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Aug 2025 19:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755112108; cv=none; b=pyIGfOUvKv9LMycTai4/1873TqRBOAx5jyAWt63tPgT87S3D/4bdiC8jFO7tt79LzsDNTSE5p9LYH08Wge5JVz/Bii5+fSej6J4Vr4nmcLxJtjX/9tj6NM5N7EaUnuH6KD8cJJGKFP5/JWiFARLcE7UnJNcOat8mkjnytmE3o1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755112108; c=relaxed/simple;
	bh=nsdDHTmfERDHUJgAyXbuax5Yo3hPV8yNjgssO7BEpeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cu7Z6N76yG5sxDzJIdoYZQyjXyHuP/oF7OgOmUD1WDDokMh/1sEvrkN2N2FkeSi6HXk59DX0eYJ9qMEh/ZaoKICXK45TLHfenqY0fpnNeSM93HQKFtuMAdD4x2/0ABGzOJh+xsJ61HlRYOV5SexUoLS6mlbeZyPE5UH5n8QSevk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QC7XhfOL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QC7XhfOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ykd6w2KcK5ERGB
	4kKaM1jUGbMo85Y7sqQIkrWrdKSfE=; b=QC7XhfOL1CdVIZbY+BHG9Po8ihCmNh
	8jZFAtDPuRMYdp535NMJwACaSMo8WHMhsZO/xV/xG/+gMND2LmRGWRaV5bMpluZQ
	oYH/DEl8mMF5Lnap9EEX0bYCiYqtdkYKfS4YKehyhJuDnqo8BQALIAadu7PqZngE
	g3VudmG6hvpWzQo+flMf3bEGN1nLe3Z9BzWvE0tm/aE3MOgawQMKmm9cFOi7QhIT
	N5scpHKzE/ECHDDsb0g3Nd+rYwcpPLBlWNuqKZ3qLwXoRkrb04iOcGEK6xb/H2Lk
	16SRGhZ2QMaM7mOWIfR/geaxq2eIoO+0RgjrfvtdOp7pmuuNpEADzcpQ==
Received: (qmail 733385 invoked from network); 13 Aug 2025 21:08:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 21:08:23 +0200
X-UD-Smtp-Session: l3s3148p1@5IBt4UM8CtltKDDX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: platform-driver-x86@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yen-Chi Huang <jesse.huang@portwell.com.tw>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH] platform/x86: portwell-ec: don't print superfluous errors
Date: Wed, 13 Aug 2025 21:08:17 +0200
Message-ID: <20250813190816.3742-2-wsa+renesas@sang-engineering.com>
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
 drivers/platform/x86/portwell-ec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
index 322f296e9315..b4b7b42fa83d 100644
--- a/drivers/platform/x86/portwell-ec.c
+++ b/drivers/platform/x86/portwell-ec.c
@@ -238,10 +238,8 @@ static int pwec_probe(struct platform_device *pdev)
 
 	ec_wdt_dev.parent = &pdev->dev;
 	ret = devm_watchdog_register_device(&pdev->dev, &ec_wdt_dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to register Portwell EC Watchdog\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.47.2

