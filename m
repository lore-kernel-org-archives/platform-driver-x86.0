Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38ADCD13D8
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Sep 2023 20:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241208AbjIQUi2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Sep 2023 16:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241268AbjIQUiX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Sep 2023 16:38:23 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC2E10E
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Sep 2023 13:38:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWz-0005nd-JG; Sun, 17 Sep 2023 22:38:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWz-00742y-62; Sun, 17 Sep 2023 22:38:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWy-002Q79-So; Sun, 17 Sep 2023 22:38:12 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 3/7] platform/surface: aggregator-cdev: Convert to platform remove callback returning void
Date:   Sun, 17 Sep 2023 22:38:01 +0200
Message-Id: <20230917203805.1149595-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
References: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=CEzK6ktEzqymZF2pAhogyNZYWD/p05seka6E4hr1zrY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlB2Ojd77rsTb71DC0p68lQg5Nvws9AcrI4yCsO JMOSMgj47yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQdjowAKCRCPgPtYfRL+ TovEB/9ym3ZzcGpSQ3ZUxskLDeFib6RZWTkFBNBxPmpi7tWc6DUaKRIur3544DL5Zmjv9olS+Dl rkJf597vVWkiAVXs9KR17S72GxxFMr3VzJX4tAhsGhGuaIHmyuxSCRx8D+3NXb0U1kXt4c6eK6E qS1nTQOo20y6FXH0VKajp/v6JUVNMalye81oYpAKiYPO33SGjoOAvUtXXXK7BJncHfDvhFwT/al LIH2h92MzvH+FzudJEUz+Rm3lNZRI0iJFoepVdrYf5VqwZF4g4i5tXg7Ityuc3WvV/WsEWixC4Z k7PfRDU2EyIOQiWMmU2Vb5ZmYSlyJey2EVz0ao2vSV6i4Hv+
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
 drivers/platform/surface/surface_aggregator_cdev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/surface/surface_aggregator_cdev.c b/drivers/platform/surface/surface_aggregator_cdev.c
index 07f0ed658369..07e065b9159f 100644
--- a/drivers/platform/surface/surface_aggregator_cdev.c
+++ b/drivers/platform/surface/surface_aggregator_cdev.c
@@ -714,7 +714,7 @@ static int ssam_dbg_device_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ssam_dbg_device_remove(struct platform_device *pdev)
+static void ssam_dbg_device_remove(struct platform_device *pdev)
 {
 	struct ssam_cdev *cdev = platform_get_drvdata(pdev);
 	struct ssam_cdev_client *client;
@@ -757,14 +757,13 @@ static int ssam_dbg_device_remove(struct platform_device *pdev)
 	misc_deregister(&cdev->mdev);
 
 	ssam_cdev_put(cdev);
-	return 0;
 }
 
 static struct platform_device *ssam_cdev_device;
 
 static struct platform_driver ssam_cdev_driver = {
 	.probe = ssam_dbg_device_probe,
-	.remove = ssam_dbg_device_remove,
+	.remove_new = ssam_dbg_device_remove,
 	.driver = {
 		.name = SSAM_CDEV_DEVICE_NAME,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-- 
2.40.1

