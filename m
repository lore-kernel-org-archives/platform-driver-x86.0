Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3EEC7EE43
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jun 2023 07:41:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234726AbjFLHlZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jun 2023 03:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234739AbjFLHlY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 03:41:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B1710E4
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 00:40:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8r-00042t-0I; Mon, 12 Jun 2023 09:39:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8q-006pms-3F; Mon, 12 Jun 2023 09:39:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8p-00DQwn-0p; Mon, 12 Jun 2023 09:39:07 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/3] surface: surface3_power: Switch back to use struct i2c_driver's .probe()
Date:   Mon, 12 Jun 2023 09:39:00 +0200
Message-Id: <20230612073902.840435-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
References: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5VBpEbwwjLibKQ1hJeDDk2jYrZy4z907n7I4AJXbIjc=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpS20xMCjbZ2yyg2uaorP1AynbLky5dP25fffX/2g/2Xu dHLu/M0OhmNWRgYuRhkxRRZ7BvXZFpVyUV2rv13GWYQKxPIFAYuTgGYiO979r+y3G3rZV55y89Q mZUVNu1awjv15lcmfR/O6n1ys4k9yOZ48oOnpHsar+H+FQvMrX+dLI5dcVGtdE7XkZ1qiU39f3J 2Rl/9cbKv4OqX9Jl6nxacns7t5dlp9cZYJu/SuwXnJR1yl9yuiH0ZHP5J0fuuTk2+kWv/5+7jl2 /UH2x8xFszi+8ib8KlUuU0H/PSNTmZAnFflHef52bjOe7R7DhHX6HZReWFrfvd63V7SxS+C2f/0 pAJmSbd5Jnq7LLL7Yj8TS2DbIWuf5NvFnJONL7QqBpVFNo181VN3rqjAcamR/5GyqtndS6p/x67 3+PbTcWjRbJbjO6qs8RMyPg1uUbfbHe4cbD8GWkLnSdLAA==
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
 drivers/platform/surface/surface3_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
index 73961a24c849..4c0f92562a79 100644
--- a/drivers/platform/surface/surface3_power.c
+++ b/drivers/platform/surface/surface3_power.c
@@ -573,7 +573,7 @@ static const struct acpi_device_id mshw0011_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, mshw0011_acpi_match);
 
 static struct i2c_driver mshw0011_driver = {
-	.probe_new = mshw0011_probe,
+	.probe = mshw0011_probe,
 	.remove = mshw0011_remove,
 	.driver = {
 		.name = "mshw0011",
-- 
2.39.2

