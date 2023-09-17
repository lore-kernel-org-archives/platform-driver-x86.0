Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33983CD13D3
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Sep 2023 20:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241231AbjIQUi7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Sep 2023 16:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241273AbjIQUiY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Sep 2023 16:38:24 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1391F133
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Sep 2023 13:38:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWz-0005nb-JG; Sun, 17 Sep 2023 22:38:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWy-00742s-La; Sun, 17 Sep 2023 22:38:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWy-002Q71-CM; Sun, 17 Sep 2023 22:38:12 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/7] platform/surface: surface3-wmi: Convert to platform remove callback returning void
Date:   Sun, 17 Sep 2023 22:37:59 +0200
Message-Id: <20230917203805.1149595-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
References: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rK7FmuKl9TDejR04w+UJ40TgF76fwC4kyoeNmSUR+2Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlB2OhtatsN53cIJtktNOboorVHtZJkzbFVwc36 Iwqes+OOU+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQdjoQAKCRCPgPtYfRL+ TsthB/9EEDRu+ZcliQ2l2SNxgtwysA6kabKgzO1Zq0a+NY2t/IEhKXArsqnMvqw0EkQ6KryYm88 Z0GTmFrWdCvtFo6McnCUYuZf2C1H+ApwaQo9TRm8GAgVHi4u4jfWwl/rePAUP3kUWF5G2n8pw4y h9blPSvrD9nk6zmpinKbbeLh98dVfZJAAHnX0ilHQXXka0SH27txX/l1kkrrNRvZaQFjgqBmVhz C9cUfdIE/MB7smbXSi0S+f00COeAzBmQyR7S29fubfOlGadWjDxElzurbY6LT6NlE8jqXOpXqgP cC68LrrMCMMwtKER8ZophJ6H+QloPRcAE+N5A1b9FaY36Qm3
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
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/surface/surface3-wmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/surface/surface3-wmi.c b/drivers/platform/surface/surface3-wmi.c
index ca4602bcc7de..c15ed7a12784 100644
--- a/drivers/platform/surface/surface3-wmi.c
+++ b/drivers/platform/surface/surface3-wmi.c
@@ -226,14 +226,13 @@ static int __init s3_wmi_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int s3_wmi_remove(struct platform_device *device)
+static void s3_wmi_remove(struct platform_device *device)
 {
 	/* remove the hotplug context from the acpi device */
 	s3_wmi.touchscreen_adev->hp = NULL;
 
 	/* reinstall the actual PNPC0C0D LID default handle */
 	acpi_bus_scan(s3_wmi.pnp0c0d_adev->handle);
-	return 0;
 }
 
 static int __maybe_unused s3_wmi_resume(struct device *dev)
@@ -248,7 +247,7 @@ static struct platform_driver s3_wmi_driver = {
 		.name = "surface3-wmi",
 		.pm = &s3_wmi_pm,
 	},
-	.remove = s3_wmi_remove,
+	.remove_new = s3_wmi_remove,
 };
 
 static int __init s3_wmi_init(void)
-- 
2.40.1

