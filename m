Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596C1C7EE23
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jun 2023 07:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234945AbjFLHli (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jun 2023 03:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234803AbjFLHl2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 03:41:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A0B10E6
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 00:40:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8r-00042u-1R; Mon, 12 Jun 2023 09:39:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8q-006pmx-6n; Mon, 12 Jun 2023 09:39:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8p-00DQwq-7E; Mon, 12 Jun 2023 09:39:07 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net, kernel@pengutronix.de
Subject: [PATCH 2/3] platform/x86: asus-tf103c-dock: Switch back to use struct i2c_driver's .probe()
Date:   Mon, 12 Jun 2023 09:39:01 +0200
Message-Id: <20230612073902.840435-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
References: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Kelt/FFO+HqivVC/5eHnz1tRfSfme+f5ftJ3Rt2R5JY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkhsuR3kvZ+F/rGJjBGXFRDd80GyOyOHjpQcNIF QvnYCbXIS2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZIbLkQAKCRCPgPtYfRL+ Tl6WB/92JVyeR/V9W5cqgOPitEZg8evE0yepKyVjbyI4IGFhROEve/OWNHalMGoRUNXhdG8Z71J 2reN3F2U5qXqBv8JimqdfaHCQTqkhYBsXiSQJFFMo0gjFYCbxm8PB/xNDeJ5J+HhVBdD2TcYtLV Xog999vRshQYNxNGGFQX3S6ly7kaImwbQ8awPoiJjXvJ8QGwxjYa+uHrCkb8CGSzaefX7q/xkji R/RYXyhYxxJDf8bjVQVktd9utkM8qp1BIOg2iCe6aari/3oKeTSBb6tpLvLaHRG8hxhE+scz8iB 6vBtj2BPsHpS9U03iSwBqWBFu6hHooU0uBfFL86+8Caxc+hv
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
 drivers/platform/x86/asus-tf103c-dock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x86/asus-tf103c-dock.c
index aeb1138464df..8f0f87637c5f 100644
--- a/drivers/platform/x86/asus-tf103c-dock.c
+++ b/drivers/platform/x86/asus-tf103c-dock.c
@@ -933,7 +933,7 @@ static struct i2c_driver tf103c_dock_driver = {
 		.pm = &tf103c_dock_pm_ops,
 		.acpi_match_table = tf103c_dock_acpi_match,
 	},
-	.probe_new = tf103c_dock_probe,
+	.probe = tf103c_dock_probe,
 	.remove	= tf103c_dock_remove,
 };
 module_i2c_driver(tf103c_dock_driver);
-- 
2.39.2

