Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEE0C678D4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 10:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjCBK0b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 05:26:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjCBK0a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 05:26:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5677D298E0
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 02:26:29 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 980A756A;
        Thu,  2 Mar 2023 11:26:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677752787;
        bh=eG0jItziwkPCaDow2XuvvZPRiOorbnHwbuSqh6p+pJQ=;
        h=From:To:Cc:Subject:Date:From;
        b=lobSBPKOgZTK0a6u34gDHQChUVfjvsAGQWH7Mg7JRbLHPa9QFTC+TpCnryJAwsddv
         JLMdPAP4g/nGI1QwsF5srgjJn0XK4GoYx7vt9Fd8rDapzR0XmsgkXMKvqpDZMt3mvo
         NDjwir2CHrB1PF/17RrIdvahlcdRcuekfb56UWSE=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        luzmaximilian@gmail.com
Subject: [PATCH] platform/x86: int3472: Add GPIOs to Surface Go 3 Board data
Date:   Thu,  2 Mar 2023 10:26:11 +0000
Message-Id: <20230302102611.314341-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add the INT347E GPIO lookup table to the board data for the Surface
Go 3. This is necessary to allow the ov7251 IR camera to probe
properly on that platform.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/platform/x86/intel/int3472/tps68470_board_data.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 309eab9c0558..322237e056f3 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -159,9 +159,10 @@ static const struct int3472_tps68470_board_data surface_go_tps68470_board_data =
 static const struct int3472_tps68470_board_data surface_go3_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:01",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
-	.n_gpiod_lookups = 1,
+	.n_gpiod_lookups = 2,
 	.tps68470_gpio_lookup_tables = {
-		&surface_go_int347a_gpios
+		&surface_go_int347a_gpios,
+		&surface_go_int347e_gpios,
 	},
 };
 
-- 
2.34.1

