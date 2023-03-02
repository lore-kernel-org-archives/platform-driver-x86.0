Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99AAC6FA8E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 14:47:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjCBOr6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 09:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbjCBOrw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 09:47:52 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C5341B47
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 06:47:50 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDg-000451-8n; Thu, 02 Mar 2023 15:47:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDe-001Lsc-Sl; Thu, 02 Mar 2023 15:47:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDd-001Zqs-Ur; Thu, 02 Mar 2023 15:47:41 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     AceLan Kao <acelan.kao@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 25/29] platform/x86: intel: vbtn: Convert to platform remove callback returning void
Date:   Thu,  2 Mar 2023 15:47:28 +0100
Message-Id: <20230302144732.1903781-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
References: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=4FZ1eGAX+X12ziQYLanXNlvTUV1hJsemEvhnUGuqfu0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkALbtPQx7WWOR6o/HDFF3FfDIA4I2AEt1OmhLd At+L54FrseJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAC27QAKCRDB/BR4rcrs Cfk6B/42GMBgRTuXwK3tgegTCPgEvh66TJeY3zga6GDbSZDjbOL1VJ4YF8MoNiPjI+2fUe15wd1 pQeyoHXuxGjlRYudlHcx6pmVyBIAjYUaaH8/k5lE9cXwku6V9sPs7hk+McfbSyYHM8p7hLkMl5n 5h+mhDYIHwJ/TrdLMaFeOYxGLauyNEQvaizZVq8zh/Qiid/wz0zefNaTSriAjC3AS+y1fl0SjyE Wht2m4tgxrjOPLthSMuICiwQ6hdzelGYb9ZnLaBIupruRfMM6p61r7+TC5Hry9LIhuh3dhplVkc UYE5lBP5y7xLkXXjAzm2TN8LEUs6lQyNVpsGDByJAM+w1cay
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
 drivers/platform/x86/intel/vbtn.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
index c5e4e35c8d20..6fa1735ad7a4 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -325,18 +325,12 @@ static int intel_vbtn_probe(struct platform_device *device)
 	return 0;
 }
 
-static int intel_vbtn_remove(struct platform_device *device)
+static void intel_vbtn_remove(struct platform_device *device)
 {
 	acpi_handle handle = ACPI_HANDLE(&device->dev);
 
 	device_init_wakeup(&device->dev, false);
 	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
-
-	/*
-	 * Even if we failed to shut off the event stream, we can still
-	 * safely detach from the device.
-	 */
-	return 0;
 }
 
 static int intel_vbtn_pm_prepare(struct device *dev)
@@ -377,7 +371,7 @@ static struct platform_driver intel_vbtn_pl_driver = {
 		.pm = &intel_vbtn_pm_ops,
 	},
 	.probe = intel_vbtn_probe,
-	.remove = intel_vbtn_remove,
+	.remove_new = intel_vbtn_remove,
 };
 
 static acpi_status __init
-- 
2.39.1

