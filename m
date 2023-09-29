Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A114E80ABE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Sep 2023 11:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbjI2LeR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Sep 2023 07:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2LeQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Sep 2023 07:34:16 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B504AE7
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Sep 2023 04:34:13 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c189dabcc3so46439681fa.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Sep 2023 04:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695987252; x=1696592052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxjJlriY4wlKuLA1aZtjYB2eC7WoH6OiaT1kMbOS83I=;
        b=GcnoK4uMbjKpUh+6li6hLZ1D0U7dcDiaoJtGg/ehgtRjmLO6Ty+eOXae4aHCS34B6q
         48aAleLzlA+AVrT+oiYMYD2xbQXiFYh6NxD/SWe0lw2Lt+XxNSjpmQ8g3VZNmsU/9rFR
         axDHC6i4D6K+fwklKDHJM6EHtpCjC9fQ/gsCkoS3KtfID1sXwPNJJgAES4AKx7tdNXvc
         cHT0tjkvNfciAFc48cga6SD5y62N+jA9EL2UwK2aBtTJsXMBFqUjDbFnlnodIPjXTARq
         ukayBxPfRNugOayInPmwHZM5Ir3RbLXmB6TaozRM5F0yV2XnlBkcseqjuezzKu1YozlM
         nBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695987252; x=1696592052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxjJlriY4wlKuLA1aZtjYB2eC7WoH6OiaT1kMbOS83I=;
        b=k5io3q3SIZ/Bx/d+QZhwEc3nCzlV96feW7uwLCUlMx4W0FxfClEk7ZJCsGrzmWCf9g
         MiMeFKSHaVBjG614bKrSGXeoivyg/EfoD8fNvAmSJWTm7KKy6LmwzSN98yws+ieKc7KG
         bRYd/0oN3FrwejdXpmXgmcCx25f37sg0LDMlZe+onnPFwJlYTMLTIJMsPE6SYzFQaSEk
         KeHm4swBpRVj8GGeous1MAcggFIx+breFeqw0BQfK7k6897i1sstrHbjGGB95nDSMa/W
         SglMKzmiLYL2We5azoknAd5zyGJBNn1X8Q+6SisjAunNcXoMWzYke3AKpvQyZX8OtbP+
         lGtQ==
X-Gm-Message-State: AOJu0YyzvQp9HGBMzmrFoLzk2bTNiJwVtsQ1V3yyYZ2qoNeV13+6dCme
        cRGngjBQI6f0Zz+VGQmWwTuA/FiUsDo=
X-Google-Smtp-Source: AGHT+IHsko0GWIYJQU24uv6Pfvl1ZhS5E5Pdea/V5fHzZz7xCFyTStqwFB9BS8JaMx6YlYee6whXEw==
X-Received: by 2002:a05:6512:449:b0:504:2970:da62 with SMTP id y9-20020a056512044900b005042970da62mr3220028lfk.64.1695987250641;
        Fri, 29 Sep 2023 04:34:10 -0700 (PDT)
Received: from localhost.localdomain ([31.173.85.123])
        by smtp.gmail.com with ESMTPSA id l23-20020a19c217000000b00501c77ad909sm3471315lfc.208.2023.09.29.04.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 04:34:10 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH 1/2] platform/x86: msi-ec: Fix the 3rd config
Date:   Fri, 29 Sep 2023 14:31:49 +0300
Message-ID: <20230929113149.587436-3-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929113149.587436-1-teackot@gmail.com>
References: <20230929113149.587436-1-teackot@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the charge control address of CONF3 and remove an incorrect firmware
version which turned out to be a BIOS firmware and not an EC firmware.

This patch also renames fn_super_swap to fn_win_swap for consistency
with the downstream version of the driver.

Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
Signed-off-by: Nikita Kravets <teackot@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 19 +++++++++----------
 drivers/platform/x86/msi-ec.h |  4 ++--
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index f26a3121092f..3074aee878c1 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -58,7 +58,7 @@ static struct msi_ec_conf CONF0 __initdata = {
 		.block_address = 0x2f,
 		.bit           = 1,
 	},
-	.fn_super_swap = {
+	.fn_win_swap = {
 		.address = 0xbf,
 		.bit     = 4,
 	},
@@ -138,7 +138,7 @@ static struct msi_ec_conf CONF1 __initdata = {
 		.block_address = 0x2f,
 		.bit           = 1,
 	},
-	.fn_super_swap = {
+	.fn_win_swap = {
 		.address = 0xbf,
 		.bit     = 4,
 	},
@@ -215,7 +215,7 @@ static struct msi_ec_conf CONF2 __initdata = {
 		.block_address = 0x2f,
 		.bit           = 1,
 	},
-	.fn_super_swap = {
+	.fn_win_swap = {
 		.address = 0xe8,
 		.bit     = 4,
 	},
@@ -276,14 +276,13 @@ static struct msi_ec_conf CONF2 __initdata = {
 
 static const char * const ALLOWED_FW_3[] __initconst = {
 	"1592EMS1.111",
-	"E1592IMS.10C",
 	NULL
 };
 
 static struct msi_ec_conf CONF3 __initdata = {
 	.allowed_fw = ALLOWED_FW_3,
 	.charge_control = {
-		.address      = 0xef,
+		.address      = 0xd7,
 		.offset_start = 0x8a,
 		.offset_end   = 0x80,
 		.range_min    = 0x8a,
@@ -294,7 +293,7 @@ static struct msi_ec_conf CONF3 __initdata = {
 		.block_address = 0x2f,
 		.bit           = 1,
 	},
-	.fn_super_swap = {
+	.fn_win_swap = {
 		.address = 0xe8,
 		.bit     = 4,
 	},
@@ -372,7 +371,7 @@ static struct msi_ec_conf CONF4 __initdata = {
 		.block_address = 0x2f,
 		.bit           = 1,
 	},
-	.fn_super_swap = {
+	.fn_win_swap = {
 		.address = MSI_EC_ADDR_UNKNOWN, // supported, but unknown
 		.bit     = 4,
 	},
@@ -451,7 +450,7 @@ static struct msi_ec_conf CONF5 __initdata = {
 		.block_address = 0x2f,
 		.bit           = 1,
 	},
-	.fn_super_swap = { // todo: reverse
+	.fn_win_swap = { // todo: reverse
 		.address = 0xbf,
 		.bit     = 4,
 	},
@@ -529,7 +528,7 @@ static struct msi_ec_conf CONF6 __initdata = {
 		.block_address = MSI_EC_ADDR_UNSUPP,
 		.bit           = 1,
 	},
-	.fn_super_swap = {
+	.fn_win_swap = {
 		.address = 0xbf, // todo: reverse
 		.bit     = 4,
 	},
@@ -609,7 +608,7 @@ static struct msi_ec_conf CONF7 __initdata = {
 		.block_address = MSI_EC_ADDR_UNSUPP,
 		.bit           = 1,
 	},
-	.fn_super_swap = {
+	.fn_win_swap = {
 		.address = 0xbf, // needs testing
 		.bit     = 4,
 	},
diff --git a/drivers/platform/x86/msi-ec.h b/drivers/platform/x86/msi-ec.h
index be3533dc9cc6..086351217505 100644
--- a/drivers/platform/x86/msi-ec.h
+++ b/drivers/platform/x86/msi-ec.h
@@ -40,7 +40,7 @@ struct msi_ec_webcam_conf {
 	int bit;
 };
 
-struct msi_ec_fn_super_swap_conf {
+struct msi_ec_fn_win_swap_conf {
 	int address;
 	int bit;
 };
@@ -108,7 +108,7 @@ struct msi_ec_conf {
 
 	struct msi_ec_charge_control_conf charge_control;
 	struct msi_ec_webcam_conf         webcam;
-	struct msi_ec_fn_super_swap_conf  fn_super_swap;
+	struct msi_ec_fn_win_swap_conf    fn_win_swap;
 	struct msi_ec_cooler_boost_conf   cooler_boost;
 	struct msi_ec_shift_mode_conf     shift_mode;
 	struct msi_ec_super_battery_conf  super_battery;
-- 
2.42.0

