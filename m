Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2EAC6FA8B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 12:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbiISMWx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 08:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbiISMW1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 08:22:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001C015FDF
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 05:22:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaFn1-0007TP-NM; Mon, 19 Sep 2022 14:22:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaFn2-001f0B-BK; Mon, 19 Sep 2022 14:22:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oaFn0-001xrm-1E; Mon, 19 Sep 2022 14:22:18 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] platform/x86: wmi: Drop forward declaration of static functions
Date:   Mon, 19 Sep 2022 14:22:13 +0200
Message-Id: <20220919122213.852322-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5D4W0kMYNqAdzOUP1zwVr0qDLiCf7/f0PFBfh5tMOlY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjKF7yOWORl8pFgV6oTttiayKKuSZRyPMEP+VoE4bL 3ben4giJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYyhe8gAKCRDB/BR4rcrsCbwkB/ wM8Eqlks+LHThNBLOouI7HkM//ORvJv+rYvQAoGt3d0zLMEaRVx+CgX+W43+DesY/xPvP3qcoI2WXJ wV0IPnjKn4t5KyIPLmx8YeLyXzUv+0AeFsp9zSKrFKtFP5evCs0akmWriVndssclPIlmu1UwYXMWvt LTL6RoNfZMQ5giyNEOVUpafyw6AswsoVEXj3rHBL415c28xE7v36QOMfmtt/42K2XkbMX5Z/0q3MJ5 QRn7BNqzilSLKp03Sa6W0GGnEVJao5U3NpR+3Q7vhQmrzLmHGA5lgxLWosrsTqaGOF0E55KznrXIRq SPkQWe4O8M8GsR1I9jn7a/lHU9B5n5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Usually it's not necessary to declare static functions if the symbols are
in the right order. Moving the definition of acpi_wmi_driver down in the
compilation unit allows to drop two such declarations.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/x86/wmi.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index aed293b5af81..dbc535b772b3 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -95,9 +95,6 @@ module_param(debug_dump_wdg, bool, 0444);
 MODULE_PARM_DESC(debug_dump_wdg,
 		 "Dump available WMI interfaces [0/1]");
 
-static int acpi_wmi_remove(struct platform_device *device);
-static int acpi_wmi_probe(struct platform_device *device);
-
 static const struct acpi_device_id wmi_device_ids[] = {
 	{"PNP0C14", 0},
 	{"pnp0c14", 0},
@@ -105,15 +102,6 @@ static const struct acpi_device_id wmi_device_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, wmi_device_ids);
 
-static struct platform_driver acpi_wmi_driver = {
-	.driver = {
-		.name = "acpi-wmi",
-		.acpi_match_table = wmi_device_ids,
-	},
-	.probe = acpi_wmi_probe,
-	.remove = acpi_wmi_remove,
-};
-
 /*
  * GUID parsing functions
  */
@@ -1449,6 +1437,15 @@ void wmi_driver_unregister(struct wmi_driver *driver)
 }
 EXPORT_SYMBOL(wmi_driver_unregister);
 
+static struct platform_driver acpi_wmi_driver = {
+	.driver = {
+		.name = "acpi-wmi",
+		.acpi_match_table = wmi_device_ids,
+	},
+	.probe = acpi_wmi_probe,
+	.remove = acpi_wmi_remove,
+};
+
 static int __init acpi_wmi_init(void)
 {
 	int error;

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.2

