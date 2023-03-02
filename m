Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8DCC6FA8E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 14:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjCBOru (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 09:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbjCBOrt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 09:47:49 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F0F3C7B3
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 06:47:46 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDZ-0003r6-VC; Thu, 02 Mar 2023 15:47:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDY-001Lqs-Vp; Thu, 02 Mar 2023 15:47:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDY-001ZpN-DZ; Thu, 02 Mar 2023 15:47:36 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "Lee, Chun-Yi" <jlee@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/29] platform/x86: acer-wmi: Convert to platform remove callback returning void
Date:   Thu,  2 Mar 2023 15:47:04 +0100
Message-Id: <20230302144732.1903781-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
References: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Bm3IBa63g4dbgofO/bfNR14JENf89OQOoGmeXdiQOJc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkALaFAqKKBbmCSVfcZrLlnzJ+gOTOoySP5usQ4 WnoEH90y2qJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAC2hQAKCRDB/BR4rcrs CabdB/0cg/Acoa8r2+suMRlOz0PBSjcB5VhhGvP3dYKuJ6A6dX4ci2tjWdyuwCSLSgMfbjT4G2H qKb6IyhR/ePsmIFeOd1uk42EcKfvfQ4foviGVtnN+Ca7oiq8mKAK4wOs9ApfiED0NqIpjZbHMVr r/hgcFtd3wUb8TtGZ/PLXHbHPG0q5PqLK+Doo2pCAFpFnLm8w468D5aRf7g21oDk3uLQdZ09AcJ pg+miSkuaMYOaMdihp2t7QzuqgVP6t7yLsmym+/LtkZMjsJobC6leuiuzFLZU6frDPCBjef9KmN xRqert54tYxk+AqnYb3G1YHhCmFnekROZJvSI3sMktGkxpt0
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
 drivers/platform/x86/acer-wmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index ee67efdd5499..377a0becd1a1 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2258,7 +2258,7 @@ static int acer_platform_probe(struct platform_device *device)
 	return err;
 }
 
-static int acer_platform_remove(struct platform_device *device)
+static void acer_platform_remove(struct platform_device *device)
 {
 	if (has_cap(ACER_CAP_MAILLED))
 		acer_led_exit();
@@ -2266,7 +2266,6 @@ static int acer_platform_remove(struct platform_device *device)
 		acer_backlight_exit();
 
 	acer_rfkill_exit();
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -2334,7 +2333,7 @@ static struct platform_driver acer_platform_driver = {
 		.pm = &acer_pm,
 	},
 	.probe = acer_platform_probe,
-	.remove = acer_platform_remove,
+	.remove_new = acer_platform_remove,
 	.shutdown = acer_platform_shutdown,
 };
 
-- 
2.39.1

