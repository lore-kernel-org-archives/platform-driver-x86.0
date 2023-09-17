Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92515CD13D3
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Sep 2023 20:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241183AbjIQUi0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Sep 2023 16:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241271AbjIQUiY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Sep 2023 16:38:24 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57D4118
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Sep 2023 13:38:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyX0-0005oi-I3; Sun, 17 Sep 2023 22:38:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyX0-00743T-30; Sun, 17 Sep 2023 22:38:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWz-002Q7P-Q3; Sun, 17 Sep 2023 22:38:13 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 7/7] platform/surface: hotplug: Convert to platform remove callback returning void
Date:   Sun, 17 Sep 2023 22:38:05 +0200
Message-Id: <20230917203805.1149595-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
References: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Jh1HVZXkx6Rx+ALiihWqjxEv+hD2xIyJD34jiaw6mso=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlB2OomvTyDOP3KixhGCa5btQjmL6UaM37v7Rka JetvmZeT7mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQdjqAAKCRCPgPtYfRL+ TuHNB/4pIWfMajvIbLRPKziJyLUgmvhaktGTfzWOTgIFFEcsf1N+8iRPm3ZPK3/ElYS97k+QuKH mhuvMkQphEIk76UohmM202Ak7wfOSfBMtxXWoA8HzZ9k41V/Un9WIpn86S3vlJ21WBtxjKNMu7L +Bno+ycelEFtnwTGk4CDpXMapVZWoWtR3vZHiBZd38CCXfScpX5KdgJ22Fsp+19etJnS615kt3Y JAeWKphx6FmnLZJUXDM7p5kNJu+bo5mie7S4dBe5k1YQTjtCIPA2j7/bZs3EWKI2KL2xGofWaBd /lVGo2QiBUbPh9oKjDXhVp2HM1v3x9D0QgzfGMCSDZigysox
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
 drivers/platform/surface/surface_hotplug.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/surface/surface_hotplug.c b/drivers/platform/surface/surface_hotplug.c
index 7b6d887dccdb..a404f26cfae8 100644
--- a/drivers/platform/surface/surface_hotplug.c
+++ b/drivers/platform/surface/surface_hotplug.c
@@ -183,7 +183,7 @@ static int shps_setup_irq(struct platform_device *pdev, enum shps_irq_type type)
 	return 0;
 }
 
-static int surface_hotplug_remove(struct platform_device *pdev)
+static void surface_hotplug_remove(struct platform_device *pdev)
 {
 	struct shps_device *sdev = platform_get_drvdata(pdev);
 	int i;
@@ -195,8 +195,6 @@ static int surface_hotplug_remove(struct platform_device *pdev)
 
 		mutex_destroy(&sdev->lock[i]);
 	}
-
-	return 0;
 }
 
 static int surface_hotplug_probe(struct platform_device *pdev)
@@ -261,7 +259,7 @@ MODULE_DEVICE_TABLE(acpi, surface_hotplug_acpi_match);
 
 static struct platform_driver surface_hotplug_driver = {
 	.probe = surface_hotplug_probe,
-	.remove = surface_hotplug_remove,
+	.remove_new = surface_hotplug_remove,
 	.driver = {
 		.name = "surface_hotplug",
 		.acpi_match_table = surface_hotplug_acpi_match,
-- 
2.40.1

