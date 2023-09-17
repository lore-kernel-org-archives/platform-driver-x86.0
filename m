Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0635ACD13D2
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Sep 2023 20:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241180AbjIQUi5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Sep 2023 16:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241275AbjIQUiY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Sep 2023 16:38:24 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E74123
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Sep 2023 13:38:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWz-0005nc-JG; Sun, 17 Sep 2023 22:38:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWy-00742v-U0; Sun, 17 Sep 2023 22:38:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWy-002Q75-Kf; Sun, 17 Sep 2023 22:38:12 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/7] platform/surface: acpi-notify: Convert to platform remove callback returning void
Date:   Sun, 17 Sep 2023 22:38:00 +0200
Message-Id: <20230917203805.1149595-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
References: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=MpOKhH0uoAR010lAUKn2htlumWVTsDfbF9BeI1OYL/E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlB2OiFPV+Y6qGveNAlEDOBMlDtIk6m6ShdEEOV 7zc6qsHAZ6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQdjogAKCRCPgPtYfRL+ Tt2NB/9jd5OiVAg6SWXLtxKphwGjroxt6kLrr3tYvAPCbendG8n87VwSjJLJG9KknZCajoOFH0h re7ABq1eFpb4OTO6U7FHqMpxNPxMunS4eqyk1YkPocwbnNuFEC6l1akYaqdHiGngXwToTh1MCEp BR3IB/d7tWpDOqHL6ZRJLianF57kCmHLPpXf7maD7z0SS0K69BKzgCxKzQHiSHOfxGyIB/uAmvb ivu3z7gjNvcNkSZB1zIUemeBih8Z1l7RqkGB7UQwfUpTpFdMPgz244RZtrhDtuTnMfb/pWQNG6b FAZCRLruAjSfVEli06Zy96Ti8Rv1crzNiWhGEPCxkgQq016v
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
 drivers/platform/surface/surface_acpi_notify.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
index 897cdd9c3aae..2c091066b6a1 100644
--- a/drivers/platform/surface/surface_acpi_notify.c
+++ b/drivers/platform/surface/surface_acpi_notify.c
@@ -850,7 +850,7 @@ static int san_probe(struct platform_device *pdev)
 	return status;
 }
 
-static int san_remove(struct platform_device *pdev)
+static void san_remove(struct platform_device *pdev)
 {
 	acpi_handle san = ACPI_HANDLE(&pdev->dev);
 
@@ -864,8 +864,6 @@ static int san_remove(struct platform_device *pdev)
 	 * all delayed works they may have spawned are run to completion.
 	 */
 	flush_workqueue(san_wq);
-
-	return 0;
 }
 
 static const struct acpi_device_id san_match[] = {
@@ -876,7 +874,7 @@ MODULE_DEVICE_TABLE(acpi, san_match);
 
 static struct platform_driver surface_acpi_notify = {
 	.probe = san_probe,
-	.remove = san_remove,
+	.remove_new = san_remove,
 	.driver = {
 		.name = "surface_acpi_notify",
 		.acpi_match_table = san_match,
-- 
2.40.1

