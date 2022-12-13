Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A00BC10F1B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Dec 2022 16:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234940AbiLMQYN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Dec 2022 11:24:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235640AbiLMQYM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Dec 2022 11:24:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E31CBF7
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Dec 2022 08:24:11 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584b-00013S-SO; Tue, 13 Dec 2022 17:24:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584a-004Hox-2m; Tue, 13 Dec 2022 17:24:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584a-004orG-2V; Tue, 13 Dec 2022 17:24:04 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/3] platform/x86: intel: oaktrail: Drop empty platform remove function
Date:   Tue, 13 Dec 2022 17:23:58 +0100
Message-Id: <20221213162359.651529-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
References: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=QeCHVvR8aLgsxdVAHd0xh5qb7jlR0YsvXySGpb04hf8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjmKcWCi+7RvJNnl6sBBPlKD0CDuvh2M32ciGLFV39 x5OSLMeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5inFgAKCRDB/BR4rcrsCadFB/ 9lW11qX6e8qEbxHTX+gktgDSKEkduMPd0tRrflQ6u3WTei0Zj+t7ILK6OOBPgXdXriroFgWNPQtC1r 8ePaVVZ0ZuEW0KTI6eAtvau0jfwx38wIfiD+zRCAGVmCIDvHVIDeN1Vswkibt1MB/M0ROBiQMDL0J8 XbX10eSF9lK1hYVpMg7f2LKyvn6xXQWelZQwukbf9hYn3VxhgqLupfMUNNZ8NN+fxLOfkSAg74u8yM BQnF7rfnLAuk0nAieeIC6UqMd2YvRkaT78qAE43uz3L7gahmmnzB+DZzUti4bq3FZp+bxtupY2ssAv Zzz2Gw1eHxil3aO3PThu4INp74Fj+V
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/x86/intel/oaktrail.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/platform/x86/intel/oaktrail.c b/drivers/platform/x86/intel/oaktrail.c
index 7c5c623630c1..fa720967e69b 100644
--- a/drivers/platform/x86/intel/oaktrail.c
+++ b/drivers/platform/x86/intel/oaktrail.c
@@ -266,17 +266,11 @@ static int oaktrail_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int oaktrail_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver oaktrail_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 	},
 	.probe	= oaktrail_probe,
-	.remove	= oaktrail_remove,
 };
 
 static int dmi_check_cb(const struct dmi_system_id *id)
-- 
2.38.1

