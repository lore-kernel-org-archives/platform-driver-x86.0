Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B066C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Dec 2022 16:24:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbiLMQYQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Dec 2022 11:24:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235640AbiLMQYP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Dec 2022 11:24:15 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F73EBF7
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Dec 2022 08:24:14 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584c-00013T-K3; Tue, 13 Dec 2022 17:24:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584a-004Hp0-Cr; Tue, 13 Dec 2022 17:24:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584a-004orJ-8o; Tue, 13 Dec 2022 17:24:04 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Zha Qipeng <qipeng.zha@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 3/3] platform/x86: intel: punit_ipc: Drop empty platform remove function
Date:   Tue, 13 Dec 2022 17:23:59 +0100
Message-Id: <20221213162359.651529-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
References: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Oqtr1ShuGnn0s4quLFzsA5XYsSbLKXxBI8mDvtbvgZ0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjmKcZ3w9nUslOGAJ23cy0cCiTiOKfM04ZwVBt/y8A epdJofaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5inGQAKCRDB/BR4rcrsCc34B/ 4sufiBYrxqlGcBrK72Sc+BXe7zmIKkG3cGG0MwosU1kzP2GtqlpfBqemCfkRnwO9eRxt6OHaoKf6ty yFYYhEfseZ4dyYyEM1lA+1uXR8Pxi9quzRjoKjnYJdpSPtBhHcdEF8pYjC6wFrx1JtvWkcc+1WwQuE V2ANBg1llQX75OPDpbCBnUlkBnkaSvF6N3Ffupz1AzHu38zlyR+oYP7TV6vSWPSKrdkMIGGsylG7Fs P0OrB1uWXi4IRoOpNwoMeAueS17XUd9eTJDIVcaV8kmIJVFTbhUGxVHK8rVGmnLx79SbfXyhpQaUkr WvCYdWIWiySllRy93l9bU4oZc9JF9T
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
 drivers/platform/x86/intel/punit_ipc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/platform/x86/intel/punit_ipc.c b/drivers/platform/x86/intel/punit_ipc.c
index 66bb39fd0ef9..cd0ba84cc8e4 100644
--- a/drivers/platform/x86/intel/punit_ipc.c
+++ b/drivers/platform/x86/intel/punit_ipc.c
@@ -302,11 +302,6 @@ static int intel_punit_ipc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int intel_punit_ipc_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static const struct acpi_device_id punit_ipc_acpi_ids[] = {
 	{ "INT34D4", 0 },
 	{ }
@@ -315,7 +310,6 @@ MODULE_DEVICE_TABLE(acpi, punit_ipc_acpi_ids);
 
 static struct platform_driver intel_punit_ipc_driver = {
 	.probe = intel_punit_ipc_probe,
-	.remove = intel_punit_ipc_remove,
 	.driver = {
 		.name = "intel_punit_ipc",
 		.acpi_match_table = punit_ipc_acpi_ids,
-- 
2.38.1

