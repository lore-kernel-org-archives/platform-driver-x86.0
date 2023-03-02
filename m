Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A827C678D4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 14:48:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjCBOsF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 09:48:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjCBOry (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 09:47:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D21EC72
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 06:47:51 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDc-0003tn-QU; Thu, 02 Mar 2023 15:47:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDb-001Lrd-M2; Thu, 02 Mar 2023 15:47:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDb-001Zq3-2M; Thu, 02 Mar 2023 15:47:39 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Jorge Lopez <jorge.lopez2@hp.com>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/29] platform/x86: hp: tc1100-wmi: Convert to platform remove callback returning void
Date:   Thu,  2 Mar 2023 15:47:15 +0100
Message-Id: <20230302144732.1903781-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
References: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zAr8lrhzgrTr9284cFGceOvdHiakIwoRNxJOhICKzFI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkALa1jWUOkUSHXnHDU/cF6fh7JSAiKc1ZsJ7uT hFyAxBITMOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAC2tQAKCRDB/BR4rcrs Cf6ZCACOlBDPhtsPlbGQn4gmkWFsrmLzqnsN/L+mHDy3NMBRUTpfGepTn2GCSrNSDb1iIN4rC6/ oSHV9ZYUzvpfso4zN1he+to2/M3sI5vm7v2zO/p2BA+f1NfGGE2B2/b8FRskD118uICOCxkNolJ ZkNwv0ErPA0pBruPPVVo/tafq+gloZvYMZEfbjWhm9KqtmNW8ucFa9KgqnkA1UvqHNe917F4g6y kbtp1xwRTeR5e1DuBMXRROH0E0OPrKl9eiPz52Ui4vGvt+TT9KvGU3PODKl1Fng3P0v6QYr7j47 ctHRYBXm3tFEIa33nePri3wndsbHbJnBYF9OG9C8672AwxN1
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
 drivers/platform/x86/hp/tc1100-wmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/tc1100-wmi.c b/drivers/platform/x86/hp/tc1100-wmi.c
index ded26213c420..5298b0f6804f 100644
--- a/drivers/platform/x86/hp/tc1100-wmi.c
+++ b/drivers/platform/x86/hp/tc1100-wmi.c
@@ -170,11 +170,9 @@ static int __init tc1100_probe(struct platform_device *device)
 }
 
 
-static int tc1100_remove(struct platform_device *device)
+static void tc1100_remove(struct platform_device *device)
 {
 	sysfs_remove_group(&device->dev.kobj, &tc1100_attribute_group);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -223,7 +221,7 @@ static struct platform_driver tc1100_driver = {
 		.pm = &tc1100_pm_ops,
 #endif
 	},
-	.remove = tc1100_remove,
+	.remove_new = tc1100_remove,
 };
 
 static int __init tc1100_init(void)
-- 
2.39.1

