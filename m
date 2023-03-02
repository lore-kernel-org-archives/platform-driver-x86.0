Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055B1C6FA8E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 14:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjCBOr4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 09:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjCBOrv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 09:47:51 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9424608E
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 06:47:48 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDd-0003vc-BQ; Thu, 02 Mar 2023 15:47:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDc-001Lrx-MA; Thu, 02 Mar 2023 15:47:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDb-001ZqJ-Vx; Thu, 02 Mar 2023 15:47:40 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 16/29] platform/x86: intel: chtdc_ti_pwrbtn: Convert to platform remove callback returning void
Date:   Thu,  2 Mar 2023 15:47:19 +0100
Message-Id: <20230302144732.1903781-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
References: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0FfJsPYwKB4jfuUCcPtgucO0ayHu8PD4oizQzml1AH0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkALbHYN1EOHZvD7l11dIMQJzyoun4YkwBQNCyA 2bvZ8S9P/OJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAC2xwAKCRDB/BR4rcrs CZF+B/9fI4K2aRPUXCIfLqsznjaTirvwYRUDQhGrKP1fIQPXc+cJ5y6M5+XQVyct0f8sXIIXyH8 Hp4cYQOK/nN2PjVWKDxAn94MI4NKgK2Z19dhQF4hEKFIWZO+yrr92fwNjJMVM+YABrjAWqqDkVM X4zLxJXZ+ZTFXXB+9V3jdRlzLvyMi4P3Htyy9XjhCSuZZ6ZfvkQ/4ww9374sMosD759Dar1K97u NyOO3vbhT0y6vJFVPsjpxr69h5oCscAKq4Yr4RCJWVcFKN3OZh3slLgspdeWsIHwClZ+iIx4G9Y D6wwQWrzAFy+J7+sDD2TOicVX1EVzKWL0TG1fTKXqlR/ECAQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/x86/intel/chtdc_ti_pwrbtn.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/chtdc_ti_pwrbtn.c b/drivers/platform/x86/intel/chtdc_ti_pwrbtn.c
index 9606a994af22..615f8d1a0c68 100644
--- a/drivers/platform/x86/intel/chtdc_ti_pwrbtn.c
+++ b/drivers/platform/x86/intel/chtdc_ti_pwrbtn.c
@@ -67,11 +67,10 @@ static int chtdc_ti_pwrbtn_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int chtdc_ti_pwrbtn_remove(struct platform_device *pdev)
+static void chtdc_ti_pwrbtn_remove(struct platform_device *pdev)
 {
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-	return 0;
 }
 
 static const struct platform_device_id chtdc_ti_pwrbtn_id_table[] = {
@@ -85,7 +84,7 @@ static struct platform_driver chtdc_ti_pwrbtn_driver = {
 		.name	= KBUILD_MODNAME,
 	},
 	.probe		= chtdc_ti_pwrbtn_probe,
-	.remove		= chtdc_ti_pwrbtn_remove,
+	.remove_new	= chtdc_ti_pwrbtn_remove,
 	.id_table	= chtdc_ti_pwrbtn_id_table,
 };
 module_platform_driver(chtdc_ti_pwrbtn_driver);
-- 
2.39.1

