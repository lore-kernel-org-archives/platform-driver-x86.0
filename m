Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AB6C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Sep 2022 07:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbiITHB0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Sep 2022 03:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiITHBZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Sep 2022 03:01:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60904A805
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Sep 2022 00:01:24 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaXFv-0007j9-P3; Tue, 20 Sep 2022 09:01:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaXFv-001oCK-UJ; Tue, 20 Sep 2022 09:01:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaXFt-0028uW-U8; Tue, 20 Sep 2022 09:01:17 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] platform/x86: int3472/discrete: Drop a forward declaration
Date:   Tue, 20 Sep 2022 09:01:01 +0200
Message-Id: <20220920070101.907596-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yOFYzS7qJqt0sg1oK7XcJk/4o9lx/Qw0xHCBt/FyEb4=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjKWUpl8DN6QhQ+Mbl/V82KMtt+zyMMWXXDBG7zfPz NcC0q02JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYyllKQAKCRDB/BR4rcrsCVYAB/ 41jz95hwGFNNmp6FfH/y3Dc8otmVBYcx8OEQsfm9J81f7R8ZPrRqulOszj9obb1SMXc/DGbpGII97q aUyEvj0aIRdVYV2JOu7tZ9KXEqTf/QGG2mxps2AzpeHMkcct+cAuYGpgkM1vP1tribhOUaeHdj6fDZ kQG0RvuoH6ddgEKvaPYUXDyyNaNqPZ0TrY7d4MTcPlej+8P085zJD3lsMRLv6fFO64L8L0iBWy5t/R m48WQheUfKkNJz4lqj87OR9hiHoMOkZCIzV4MhxZ66rgQfO86tXuEHB0sdJY+4CFgdEAk1dMjqOn42 7Q+zOj6FGKH57hFt5/76Sk9wKHTQLI
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

By swapping the definition of skl_int3472_discrete_remove() and
skl_int3472_discrete_probe() the forward declaration of the former can
be dropped. This is a good thing as it removes code duplication.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I didn't check in detail, but in my experience calling the remove
function in the error path of the probe function is prone to cleanup
errors. I didn't spot anything after a quick glance, but let me point
out this is unstable. E.g. in an error path of
skl_int3472_register_clock() the function is left with
int3472->clock.clk pointing to an unregistered clk and int3472->clock.cl
== NULL. Someone modifying the return function must be well aware of
that.

Best regards
Uwe

 drivers/platform/x86/intel/int3472/discrete.c | 34 +++++++++----------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index ed4c9d760757..974a132db651 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -331,7 +331,22 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
 	return 0;
 }
 
-static int skl_int3472_discrete_remove(struct platform_device *pdev);
+static int skl_int3472_discrete_remove(struct platform_device *pdev)
+{
+	struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
+
+	gpiod_remove_lookup_table(&int3472->gpios);
+
+	if (int3472->clock.cl)
+		skl_int3472_unregister_clock(int3472);
+
+	gpiod_put(int3472->clock.ena_gpio);
+	gpiod_put(int3472->clock.led_gpio);
+
+	skl_int3472_unregister_regulator(int3472);
+
+	return 0;
+}
 
 static int skl_int3472_discrete_probe(struct platform_device *pdev)
 {
@@ -383,23 +398,6 @@ static int skl_int3472_discrete_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int skl_int3472_discrete_remove(struct platform_device *pdev)
-{
-	struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
-
-	gpiod_remove_lookup_table(&int3472->gpios);
-
-	if (int3472->clock.cl)
-		skl_int3472_unregister_clock(int3472);
-
-	gpiod_put(int3472->clock.ena_gpio);
-	gpiod_put(int3472->clock.led_gpio);
-
-	skl_int3472_unregister_regulator(int3472);
-
-	return 0;
-}
-
 static const struct acpi_device_id int3472_device_id[] = {
 	{ "INT3472", 0 },
 	{ }

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.2

