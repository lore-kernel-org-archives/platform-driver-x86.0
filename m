Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D17C7EE23
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jun 2023 07:41:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234739AbjFLHl0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jun 2023 03:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234707AbjFLHlZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 03:41:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D7410E7
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 00:40:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8r-00042s-09; Mon, 12 Jun 2023 09:39:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8q-006pmr-2M; Mon, 12 Jun 2023 09:39:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8p-00DQwt-Fo; Mon, 12 Jun 2023 09:39:07 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 3/3] platform/x86: int3472: Switch back to use struct i2c_driver's .probe()
Date:   Mon, 12 Jun 2023 09:39:02 +0200
Message-Id: <20230612073902.840435-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
References: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5hhhdijDbL+PhTRhsNe+B05ACsOv4bZdxiiUPZAtAZg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkhsuTq3jPRLjrXzvrD/VK1HI80WIT6dxHIOo+p 8F+U44y6LCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZIbLkwAKCRCPgPtYfRL+ TqODCACVDy0NyzSOYAwdnS1YV69hvOthUhBemPMTmAL8bud+ZVQtR4PWf+SW4ZcT9qFA5cW3q75 11JfY/WK33SKEnSZEKYEy9Jakp+cLJO+o1RzsTtjjOYJgnJevUwd+SjolhrfSGptFxc0k9VlInT VhQsW12UuMwce+r1eEvvdBbc0BFLuQ8miP8gNoncTBUBOm/3cMsvxRm0ZORfWmPBHixbPgfp68q Fit1Cpyp/LVua7TzSixtpg9Ayu09oU8+OGeHMYtlUrHrVlTi5kOb+7wSzESaMw02ZzkySdeun0y N+fhuRqY8nyieDOMKBn6gIkwLsVuiGbFmvFN6NR0M/pTaBvY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
commit 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
convert back to (the new) .probe() to be able to eventually drop
.probe_new() from struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 5b8d1a9620a5..1e107fd49f82 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -250,7 +250,7 @@ static struct i2c_driver int3472_tps68470 = {
 		.name = "int3472-tps68470",
 		.acpi_match_table = int3472_device_id,
 	},
-	.probe_new = skl_int3472_tps68470_probe,
+	.probe = skl_int3472_tps68470_probe,
 	.remove = skl_int3472_tps68470_remove,
 };
 module_i2c_driver(int3472_tps68470);
-- 
2.39.2

