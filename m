Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706D3EB64DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Jun 2023 10:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343764AbjFPK0O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 16 Jun 2023 06:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241493AbjFPKZu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jun 2023 06:25:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4391E30D1;
        Fri, 16 Jun 2023 03:25:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BFC9D62DD8;
        Fri, 16 Jun 2023 10:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6ACC433CD;
        Fri, 16 Jun 2023 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686911139;
        bh=oL/zh7i/hSXwrGKNTavv9AXBuIVM0dmjjSCpdnWImu4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MrUhy+Kd5H3GUFYo6Q13nyxdS+bcLpof2g4D4TdPtFDpYkzM+iqeKlYUNH2wJpV+s
         Bpp9Mf5ETilFzBrbyPyEvy3gy0WErqk03ma/apESo9JuihSRLSX27Dds5xOVudo226
         KN2b51x7xwv8kQAliy7owskdbMNsPN8ee0eE1WeoO7w4CpV/41+o55+klox4clrfU5
         ClTiWs37hNzvoLxAvha50kJ84fUGZKSeIDzxPnNDvpKjFb6G7QljZJAW4o8hHHlSVd
         /BXryBKHaVzhXBXlksA+TZ7Yo2t01lpSMKqDmmA7o9rvqecC+celmIU8o7sdjMXMjv
         ptfoBvWR0bKOQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>, djrscally@gmail.com,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 10/30] platform/x86: int3472: Avoid crash in unregistering regulator gpio
Date:   Fri, 16 Jun 2023 06:24:58 -0400
Message-Id: <20230616102521.673087-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102521.673087-1-sashal@kernel.org>
References: <20230616102521.673087-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Hao Yao <hao.yao@intel.com>

[ Upstream commit fb109fba728407fa4a84d659b5cb87cd8399d7b3 ]

When int3472 is loaded before GPIO driver, acpi_get_and_request_gpiod()
failed but the returned gpio descriptor is not NULL, it will cause panic
in later gpiod_put(), so set the gpio_desc to NULL in register error
handling to avoid such crash.

Signed-off-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Link: https://lore.kernel.org/r/20230524035135.90315-1-bingbu.cao@intel.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../platform/x86/intel/int3472/clk_and_regulator.c  | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 1086c3d834945..399f0623ca1b5 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -101,9 +101,11 @@ int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
 
 	int3472->clock.ena_gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
 							     "int3472,clk-enable");
-	if (IS_ERR(int3472->clock.ena_gpio))
-		return dev_err_probe(int3472->dev, PTR_ERR(int3472->clock.ena_gpio),
-				     "getting clk-enable GPIO\n");
+	if (IS_ERR(int3472->clock.ena_gpio)) {
+		ret = PTR_ERR(int3472->clock.ena_gpio);
+		int3472->clock.ena_gpio = NULL;
+		return dev_err_probe(int3472->dev, ret, "getting clk-enable GPIO\n");
+	}
 
 	if (polarity == GPIO_ACTIVE_LOW)
 		gpiod_toggle_active_low(int3472->clock.ena_gpio);
@@ -199,8 +201,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	int3472->regulator.gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
 							     "int3472,regulator");
 	if (IS_ERR(int3472->regulator.gpio)) {
-		dev_err(int3472->dev, "Failed to get regulator GPIO line\n");
-		return PTR_ERR(int3472->regulator.gpio);
+		ret = PTR_ERR(int3472->regulator.gpio);
+		int3472->regulator.gpio = NULL;
+		return dev_err_probe(int3472->dev, ret, "getting regulator GPIO\n");
 	}
 
 	/* Ensure the pin is in output mode and non-active state */
-- 
2.39.2

