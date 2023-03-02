Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904B0C6FA8E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 14:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbjCBOsM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 09:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjCBOsF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 09:48:05 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F5A4684
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 06:47:55 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDf-0003zW-0v; Thu, 02 Mar 2023 15:47:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDd-001LsM-OB; Thu, 02 Mar 2023 15:47:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDc-001ZqY-RR; Thu, 02 Mar 2023 15:47:40 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Shravan Sudhakar <s.shravan@intel.com>,
        Intel Corporation <linuxwwan@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 20/29] platform/x86: intel: int1092: intel_sar: Convert to platform remove callback returning void
Date:   Thu,  2 Mar 2023 15:47:23 +0100
Message-Id: <20230302144732.1903781-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
References: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1699; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0WhBbWaUwjGupEusr4fiMYsWZw2q9sM3XpKt7s0kViQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkALbY61PKNuhLdthRcF9cFYPCDVTf2JIATQZ3F ZhH35ZrolqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAC22AAKCRDB/BR4rcrs CfTaB/0YWSxxN2MEgUnkqLZ8bB6kqb0wGvTpXbJGzDaRdHNlFe4HLCSihoBgVR0KGiP4faA2cl1 BIEyE9F/I851BQzjcEdCsFmSXaT6DS5ZQTzb7wwBz8Giz1pyiYyi1lTeY/ah3WunJBbpFk2B8zF HTsSKodrXFwVTGuy8nmkGMxxFZWB6x3wMF0hV1nNAiNyVUVhOQazN3cdR/7BEYZ+KDo9gsrvog5 MWbNcs3I9RuNB6BR4MBjgfGU6zXt0SdJABBwjSmvLYYTq/7jGe3XfxnSUpxnfc6ObBkgy65WZKM M3Bfl00b8SdNqNtG1F3Obkc9XPfRz5G8atN2x70YRW4B+WWT
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
 drivers/platform/x86/intel/int1092/intel_sar.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int1092/intel_sar.c b/drivers/platform/x86/intel/int1092/intel_sar.c
index 352fc4596494..6246c066ade2 100644
--- a/drivers/platform/x86/intel/int1092/intel_sar.c
+++ b/drivers/platform/x86/intel/int1092/intel_sar.c
@@ -292,7 +292,7 @@ static int sar_probe(struct platform_device *device)
 	return result;
 }
 
-static int sar_remove(struct platform_device *device)
+static void sar_remove(struct platform_device *device)
 {
 	struct wwan_sar_context *context = dev_get_drvdata(&device->dev);
 	int reg;
@@ -304,12 +304,11 @@ static int sar_remove(struct platform_device *device)
 		kfree(context->config_data[reg].device_mode_info);
 
 	kfree(context);
-	return 0;
 }
 
 static struct platform_driver sar_driver = {
 	.probe = sar_probe,
-	.remove = sar_remove,
+	.remove_new = sar_remove,
 	.driver = {
 		.name = DRVNAME,
 		.acpi_match_table = ACPI_PTR(sar_device_ids)
-- 
2.39.1

