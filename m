Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8247CCD13DE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Sep 2023 20:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241236AbjIQUi7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Sep 2023 16:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241272AbjIQUiY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Sep 2023 16:38:24 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D075C11B
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Sep 2023 13:38:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyX0-0005oS-7W; Sun, 17 Sep 2023 22:38:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWz-00743P-Qy; Sun, 17 Sep 2023 22:38:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWz-002Q7L-Ho; Sun, 17 Sep 2023 22:38:13 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 6/7] platform/surface: gpe: Convert to platform remove callback returning void
Date:   Sun, 17 Sep 2023 22:38:04 +0200
Message-Id: <20230917203805.1149595-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
References: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=A8/mNBASSnoDS23LrI29IE0CtD5xUhsHXkUnF2jSKN4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlB2OnQAresGdBJZyZbgE88rkiSgRdbfS8O6te5 6gpBWgQQ4KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQdjpwAKCRCPgPtYfRL+ To4lB/9Yy3T47FSlwJTahE28EwUjIuiM/ZLwbbpXoqQ25/Xa1i11LohvjAHrzx0fOQGQpZiMaf3 sdK1Yaq8K4ZoLuXGWhw3hRHPmGN5/ZPzctc/tdycFai2D98UAkaV/291juKuCorX+ReLIXS7306 o/3UeLrR2pbH7iVyCvpI+K5MfV4Pv93vq9CiCHSZiy6MVd9DX6SQAuPsF4o3upLHt6PnQmWNqzN NuWUvPlwX24WmfN5u0FeGv15S6alzrFZKB2IAJnuHst27fVWdXQNX2hgYUk8J9F3E8K7O1OOitb cKWlC+EF0QeGYOvAQRDup5959Pndg9cU+kcnC7xEXhlz1eMl
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/surface/surface_gpe.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index c219b840d491..62fd4004db31 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -267,20 +267,18 @@ static int surface_gpe_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int surface_gpe_remove(struct platform_device *pdev)
+static void surface_gpe_remove(struct platform_device *pdev)
 {
 	struct surface_lid_device *lid = dev_get_drvdata(&pdev->dev);
 
 	/* restore default behavior without this module */
 	surface_lid_enable_wakeup(&pdev->dev, false);
 	acpi_disable_gpe(NULL, lid->gpe_number);
-
-	return 0;
 }
 
 static struct platform_driver surface_gpe_driver = {
 	.probe = surface_gpe_probe,
-	.remove = surface_gpe_remove,
+	.remove_new = surface_gpe_remove,
 	.driver = {
 		.name = "surface_gpe",
 		.pm = &surface_gpe_pm,
-- 
2.40.1

