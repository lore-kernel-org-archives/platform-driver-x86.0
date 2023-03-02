Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE33C7EE32
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 14:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjCBOru (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 09:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjCBOrt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 09:47:49 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA0541B47
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 06:47:47 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDb-0003sE-TX; Thu, 02 Mar 2023 15:47:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDb-001LrT-6Z; Thu, 02 Mar 2023 15:47:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDa-001Zpp-D6; Thu, 02 Mar 2023 15:47:38 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Stuart Hayes <stuart.w.hayes@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/29] platform/x86: dell: dcdbas: Convert to platform remove callback returning void
Date:   Thu,  2 Mar 2023 15:47:12 +0100
Message-Id: <20230302144732.1903781-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
References: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zWMnGRQm3Ty/zUvYwolgkenvaIlIv2W9jAYb7LshPlE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkALal8iQzvOAk8kcRYck9HCN5PPyQOMhn4YqQ1 zNd2tx5CJSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAC2pQAKCRDB/BR4rcrs CeOaCACCKUaaSpf8mPOFmwqSBnGsfK1pAU9t+R+XcdOeiK7oH7DLlQjM4lsfX9IDAVUpyg86Esf bgF1ndsG5SnGTJLNwxHwgozXPEj/r+fLMtml0IHpd6sQdCGnT9emqgKsYnWCO2oDb0cjs/GwZum C7hKUxmiWtjiTKtGUdurGVHS0YoKrdmVGWIRwfHzzzMfyCkg70M+6fk0bgK4jwpKVukAQJcRAYt hETFxolMfdkaoZ8O1yQhS5iXKL714j3Jx0L1xoA/AMShWEEl4ouKYJB249jbKkhCDp0ZFQ9TQud TcD/9LNcoHt8pPWct25/+HWmVNnad/al2gHPIuRTk/1f5Q1i
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
 drivers/platform/x86/dell/dcdbas.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 0ecb7b164750..76787369d7fa 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -698,12 +698,10 @@ static int dcdbas_probe(struct platform_device *dev)
 	return 0;
 }
 
-static int dcdbas_remove(struct platform_device *dev)
+static void dcdbas_remove(struct platform_device *dev)
 {
 	unregister_reboot_notifier(&dcdbas_reboot_nb);
 	sysfs_remove_group(&dev->dev.kobj, &dcdbas_attr_group);
-
-	return 0;
 }
 
 static struct platform_driver dcdbas_driver = {
@@ -711,7 +709,7 @@ static struct platform_driver dcdbas_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= dcdbas_probe,
-	.remove		= dcdbas_remove,
+	.remove_new	= dcdbas_remove,
 };
 
 static const struct platform_device_info dcdbas_dev_info __initconst = {
-- 
2.39.1

