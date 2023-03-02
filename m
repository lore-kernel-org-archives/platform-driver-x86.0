Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8277C6FA8E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 14:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjCBOsJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 09:48:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjCBOr6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 09:47:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA654233
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 06:47:54 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDg-00048A-PW; Thu, 02 Mar 2023 15:47:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDf-001Lt1-RN; Thu, 02 Mar 2023 15:47:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDd-001Zqo-OP; Thu, 02 Mar 2023 15:47:41 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        "David E. Box" <david.e.box@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 24/29] platform/x86: intel: telemetry: pltdrv: Convert to platform remove callback returning void
Date:   Thu,  2 Mar 2023 15:47:27 +0100
Message-Id: <20230302144732.1903781-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
References: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hOir3yXd83a78a0bPOR4SmKCgiiootAaMYiyANLQEpI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkALbpEeUZ2FAWsS9vjuh00XXV+PbA7DK9BvZCw bFvDL9yflGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAC26QAKCRDB/BR4rcrs Cec9B/4kKCwcif2sEiaGMCtMBS7J4kjTOZUvQu09kErcZ4jZGTPc0DiCYDREV7dTPB5wXw4RZTo 265n8tnVihTjLjhdtSO51y48UYb9jcKZ2iVYggvXheuLDdOGVpKu9mBu5DqT97cyi3Zaea92WYs gB8moR2M1skFePwt6DreEGlLQcRkoag4Qnn76W1DgB7ljDa7oJ3oPPH1JAluOFBoOeEghcacXVz 2fJiEXASlquRiXQbZg7E7DIbuR4exRroCEfDabawYbULJPea2GeyUXnYB5f2aMBf1zMUkm7gudH /HZT7d5YDGH9uciLohUgJNZoDQiAv3rO0J6NenKGnJjAqSSX
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
 drivers/platform/x86/intel/telemetry/pltdrv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/telemetry/pltdrv.c b/drivers/platform/x86/intel/telemetry/pltdrv.c
index 405dea87de6b..06311d0e9451 100644
--- a/drivers/platform/x86/intel/telemetry/pltdrv.c
+++ b/drivers/platform/x86/intel/telemetry/pltdrv.c
@@ -1156,15 +1156,14 @@ static int telemetry_pltdrv_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int telemetry_pltdrv_remove(struct platform_device *pdev)
+static void telemetry_pltdrv_remove(struct platform_device *pdev)
 {
 	telemetry_clear_pltdata();
-	return 0;
 }
 
 static struct platform_driver telemetry_soc_driver = {
 	.probe		= telemetry_pltdrv_probe,
-	.remove		= telemetry_pltdrv_remove,
+	.remove_new	= telemetry_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 	},
-- 
2.39.1

