Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7988B15B135
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712753321; cv=none; b=EtuZ6Mf0PhMeJaV7Kh4sMg2DITOX3Y9PG7+7FZBtK25jrzp3xWOhpXWjjK9iXqTuuBnV2ArcRELO+aIYgA8Cp/YjXkZqU17nikBaRKM0gdnCAeSr9lo6lQoFTswNlr5rpIlvsKmu3s7VYPkithbrk1M9GeIthGicmP8cVA8PYoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712753321; c=relaxed/simple;
	bh=SA3oeNhbB7rREzlWo0rPcQI6H4Vpo9GUJPlXaqy+jm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lGbEQy+H0YCAqESIZi7zjmn9wudunPGA4zcSqGGhwUcnYCUFe7z4a15o75LDMek0Q2WzOKd0UDLMzx0gdGzsGAASduezPJlyE39KI0O/Nq50z5aS2Cdpj3nz0Ji/kGLbUU+rHp9dh81QE9OGs0WCIqbw9Ek6RVLLy/Ilfqbk1LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruXNO-0000pf-L9; Wed, 10 Apr 2024 14:48:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruXNO-00BUuO-15; Wed, 10 Apr 2024 14:48:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruXNN-00HZFN-33;
	Wed, 10 Apr 2024 14:48:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mattia Dongili <malattia@linux.it>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] sonypi: Convert to platform remove callback returning void
Date: Wed, 10 Apr 2024 14:48:27 +0200
Message-ID: <20240410124827.194351-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=SA3oeNhbB7rREzlWo0rPcQI6H4Vpo9GUJPlXaqy+jm0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmFoqb9PlL6Z4fQb0vYZ2geOHRQgLmK10ZVfgEx 5uF6kKxuZyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhaKmwAKCRCPgPtYfRL+ TlkeCAC61F+0kzXl2Ia9gMkPQby1s0GuOIyC0n/wrArouPLP+Rdy2KBPtR5ceuIrludzxPTVJTg xeZ+IdBXfE5VKKatGfuuEhO0dAyn0P/hykTjCUvcKLLeXJ7JiKn9P3C6vXk8ps0K+w/ynfMffGh WNyCzYVFHfqqLpWd6uKF2EX/xhVFXC2NlfgMMI3/loI9SimRaeeYB1PJ0yZkZvNgNHnjXtesi4K fFO2+k4NvbmZEidx+TRETAi9Z8viyW+78353AjMy1Qve1oDRpl5fqZoIiPz2jGT0FarTzDLVzM6 2G0EQ/X+iW8yixzKJhHW9gpSIT/SUoO5TSWBbW5SdBN/Mjuv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/char/sonypi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/char/sonypi.c b/drivers/char/sonypi.c
index 22d249333f53..bb5115b1736a 100644
--- a/drivers/char/sonypi.c
+++ b/drivers/char/sonypi.c
@@ -1408,7 +1408,7 @@ static int sonypi_probe(struct platform_device *dev)
 	return error;
 }
 
-static int sonypi_remove(struct platform_device *dev)
+static void sonypi_remove(struct platform_device *dev)
 {
 	sonypi_disable();
 
@@ -1432,8 +1432,6 @@ static int sonypi_remove(struct platform_device *dev)
 	}
 
 	kfifo_free(&sonypi_device.fifo);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1470,7 +1468,7 @@ static struct platform_driver sonypi_driver = {
 		.pm	= SONYPI_PM,
 	},
 	.probe		= sonypi_probe,
-	.remove		= sonypi_remove,
+	.remove_new	= sonypi_remove,
 	.shutdown	= sonypi_shutdown,
 };
 

base-commit: 6ebf211bb11dfc004a2ff73a9de5386fa309c430
-- 
2.43.0

