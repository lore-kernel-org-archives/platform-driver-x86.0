Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43375CD37B4
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Sep 2023 20:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241196AbjIQUi1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Sep 2023 16:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241270AbjIQUiY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Sep 2023 16:38:24 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 575EC115
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Sep 2023 13:38:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWz-0005ni-QN; Sun, 17 Sep 2023 22:38:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWz-007433-Ct; Sun, 17 Sep 2023 22:38:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWz-002Q7D-3U; Sun, 17 Sep 2023 22:38:13 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 4/7] platform/surface: aggregator-registry: Convert to platform remove callback returning void
Date:   Sun, 17 Sep 2023 22:38:02 +0200
Message-Id: <20230917203805.1149595-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
References: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yROS7RsrxYaxxX/blwDQjqKU8CNtnJkAA3bIRFelpSo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlB2OkVe+3XG6/5au4b+xtMC4kiAzQ/Q9HVz4v/ KmJQuEvWcyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQdjpAAKCRCPgPtYfRL+ TqGIB/9ikDdGucGKDdVEYhdbI/QtSbV5IUBTb0BVUSTrx172atCXX1k8mG6+ZFlSz3tPpFk2Q+M SmzrkhsE8SO7n+F++2hhDtPynw/EJMal8jIXWUCh9Q5japd0/x6ztoA4011YpiN0QmWUHx9LX60 4wZQ5IoWa9BB1rK4+QLQblf79QznjY2ZIt1XfeGxYgLq8/APKdliu2+BvkqaX8s3ruN4LCv2zDN 4xNp+zRb6Yw8J9eYfGvBXTZSqxg+EUWe5qjrSMYCRrm9FW3pEmP5ZWu+d9rUyv4El5DnQj0bIP2 zfLj2ooV2McRfuhi1Bd7FfdRr6D0wRa8JM0tE2MAk0KJJFsF
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
 drivers/platform/surface/surface_aggregator_registry.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 0fe5be539652..aeb3feae40ff 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -418,19 +418,18 @@ static int ssam_platform_hub_probe(struct platform_device *pdev)
 	return status;
 }
 
-static int ssam_platform_hub_remove(struct platform_device *pdev)
+static void ssam_platform_hub_remove(struct platform_device *pdev)
 {
 	const struct software_node **nodes = platform_get_drvdata(pdev);
 
 	ssam_remove_clients(&pdev->dev);
 	set_secondary_fwnode(&pdev->dev, NULL);
 	software_node_unregister_node_group(nodes);
-	return 0;
 }
 
 static struct platform_driver ssam_platform_hub_driver = {
 	.probe = ssam_platform_hub_probe,
-	.remove = ssam_platform_hub_remove,
+	.remove_new = ssam_platform_hub_remove,
 	.driver = {
 		.name = "surface_aggregator_platform_hub",
 		.acpi_match_table = ssam_platform_hub_match,
-- 
2.40.1

