Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D931DE81E1B
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 17:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbjJFR6e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 13:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233145AbjJFR6a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 13:58:30 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52877113
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 10:58:25 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50444e756deso3215565e87.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Oct 2023 10:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696615102; x=1697219902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqYZqozuCKQmjBYeWSTh4y5QzCjHekFMDFeNSb7UBqQ=;
        b=K/uYFDoIwZQv/vbEJq9/6ZEsI8c1bsAWupImxDoM/lxyDZZYUz9B2mh7XTyq6gM9Pp
         03WPBHu1/UydF1aIhkivFvLLZGVsMSA9xR/aEimpLOgGJ/HWxmg+2RwRSzMK3Sfx9e3I
         4WaTs58XU/wYimZ87ws/ekodV1cgsIJez4TxCy0VNphTkPbiaBuoi6xS0fbJjfKyI+tW
         3/ovlYohcfv7U5+Yccirydty9sym9obZ7BWqSmGCbLjJgs9yf28UwcP6NAM1vvPYDNl8
         jsSTiIKHxkDaV8wbDT3jpEgvaFIfmFb/+5r3Um5tcwplS5t76f837P4OjqlscV/mPZL3
         s8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696615102; x=1697219902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqYZqozuCKQmjBYeWSTh4y5QzCjHekFMDFeNSb7UBqQ=;
        b=M/ThOxU4xXVCjLUiwSlKpKlYzeHFDQ2OFNr+FU75aRq0WE1mZZ9/ZZ7rrcCangacqm
         9xKpJ58OzwPnT7HWVLAUbwVxknzpmet64P2+WTyTrBzRXgoNo+cyyVmpC1uwedduPkqY
         5VUR14kMyJHVAZBZbjkomQ+EaTm7GY6sIf0OqrnriLXyEP76GWqd+SZXNWNPQS+8YFcM
         pI3YuTLFVfsSOuwXTEyOgCb4y7noipig63acocn/eg9ELGS6BnnBL4YJZAlfc4HCkszH
         JiTQ4H5+ZfYRsgwycfse7edqws1SAaG/6eWOjgPAZ8WaecQ47lEW3t8YCvuqm/DpDu0k
         bQhw==
X-Gm-Message-State: AOJu0Yw/jSg8u25gOBqyo6VNxOdhH1zNqsEww5rAikDdZeOrsY3WQbwX
        3hyvoLhkxVM7pTE/UM306xey/gN+iIE=
X-Google-Smtp-Source: AGHT+IErTeiTazBg+UIItvYQBgB8Qk123kIMMjWEzM4AV0yOwP8MmPBMC8qfQ524AMWjBlfLVfLSug==
X-Received: by 2002:a05:6512:60f:b0:4fe:94a1:da84 with SMTP id b15-20020a056512060f00b004fe94a1da84mr7213330lfe.5.1696615102409;
        Fri, 06 Oct 2023 10:58:22 -0700 (PDT)
Received: from localhost.localdomain ([81.177.126.202])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ee09000000b00500d1a72734sm379050lfb.130.2023.10.06.10.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 10:58:22 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH v2 2/3] platform/x86: msi-ec: rename fn_super_swap
Date:   Fri,  6 Oct 2023 20:53:55 +0300
Message-ID: <20231006175352.1753017-7-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006175352.1753017-3-teackot@gmail.com>
References: <20231006175352.1753017-3-teackot@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch renames fn_super_swap to fn_win_swap for consistency
with the downstream version of the driver. Renaming the field to
fn_super_swap in the downstream driver would require modifying several
branches that are yet to be merged into the main branch, so I decided
to do it here instead.

Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
Signed-off-by: Nikita Kravets <teackot@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 16 ++++++++--------
 drivers/platform/x86/msi-ec.h |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 492eb383ee7a..3074aee878c1 100644
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
@@ -293,7 +293,7 @@ static struct msi_ec_conf CONF3 __initdata = {
 		.block_address = 0x2f,
 		.bit           = 1,
 	},
-	.fn_super_swap = {
+	.fn_win_swap = {
 		.address = 0xe8,
 		.bit     = 4,
 	},
@@ -371,7 +371,7 @@ static struct msi_ec_conf CONF4 __initdata = {
 		.block_address = 0x2f,
 		.bit           = 1,
 	},
-	.fn_super_swap = {
+	.fn_win_swap = {
 		.address = MSI_EC_ADDR_UNKNOWN, // supported, but unknown
 		.bit     = 4,
 	},
@@ -450,7 +450,7 @@ static struct msi_ec_conf CONF5 __initdata = {
 		.block_address = 0x2f,
 		.bit           = 1,
 	},
-	.fn_super_swap = { // todo: reverse
+	.fn_win_swap = { // todo: reverse
 		.address = 0xbf,
 		.bit     = 4,
 	},
@@ -528,7 +528,7 @@ static struct msi_ec_conf CONF6 __initdata = {
 		.block_address = MSI_EC_ADDR_UNSUPP,
 		.bit           = 1,
 	},
-	.fn_super_swap = {
+	.fn_win_swap = {
 		.address = 0xbf, // todo: reverse
 		.bit     = 4,
 	},
@@ -608,7 +608,7 @@ static struct msi_ec_conf CONF7 __initdata = {
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

