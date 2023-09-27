Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB28EE810A4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Sep 2023 08:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjI0ILJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Sep 2023 04:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbjI0ILB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2023 04:11:01 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F759CD7
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 01:10:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlPdC-00087e-Ts; Wed, 27 Sep 2023 10:10:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlPdC-009I82-41; Wed, 27 Sep 2023 10:10:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlPdB-005BRK-Qc; Wed, 27 Sep 2023 10:10:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 20/27] platform/x86/intel: bytcrc_pwrsrc: Convert to platform remove callback returning void
Date:   Wed, 27 Sep 2023 10:10:33 +0200
Message-Id: <20230927081040.2198742-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230927081040.2198742-1-u.kleine-koenig@pengutronix.de>
References: <20230927081040.2198742-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IkF+lDlwkjN6K0Pm182MURz1DLLLDEBB1BOOwDNN+eI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlE+N0lNm/++rcZ9gWDa7GNwRypiCKj8esDvynT KCcU7W4EoeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRPjdAAKCRCPgPtYfRL+ TkW7B/9s2E//wds1uDhEk2MGJH2TzzUldIFG09J+/gHRo8cFr/zCPNzESt1KHw7RVz3uPyx142/ pKH8U1eWocchJGhZQYnZjJhxWK2p7H+7CGQ4oOmI09Uae6mAPkyvcepx3VGhlMH9Jq3Rmu8u7vX +l5L0LWDRv7oNHfEdIEkoWCjXqIZNpK6LrbHsfZFG9sTDSbKa8y1X5Qt5hQJfHODnHC/+3Y0776 py7RCpYIfPBjqux0SIVG4vEot8rL8UG5JYMvKAN+zAateFbIikZZLnO/fh6qY8fdLz479G4RbUI CDBR0cK+aViC04gtWxMtxLJjc9Mjm03PrK+YziQtXaC6ccC4
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
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/x86/intel/bytcrc_pwrsrc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/bytcrc_pwrsrc.c b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
index 8a022b90d12d..418b71af27ff 100644
--- a/drivers/platform/x86/intel/bytcrc_pwrsrc.c
+++ b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
@@ -158,17 +158,16 @@ static int crc_pwrsrc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int crc_pwrsrc_remove(struct platform_device *pdev)
+static void crc_pwrsrc_remove(struct platform_device *pdev)
 {
 	struct crc_pwrsrc_data *data = platform_get_drvdata(pdev);
 
 	debugfs_remove_recursive(data->debug_dentry);
-	return 0;
 }
 
 static struct platform_driver crc_pwrsrc_driver = {
 	.probe = crc_pwrsrc_probe,
-	.remove = crc_pwrsrc_remove,
+	.remove_new = crc_pwrsrc_remove,
 	.driver = {
 		.name = "crystal_cove_pwrsrc",
 	},
-- 
2.40.1

