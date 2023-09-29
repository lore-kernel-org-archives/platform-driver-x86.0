Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DBFE80ABE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Sep 2023 11:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbjI2Le5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Sep 2023 07:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbjI2Lev (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Sep 2023 07:34:51 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761B51AA
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Sep 2023 04:34:49 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso226618861fa.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Sep 2023 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695987287; x=1696592087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgvBkNFX7DT832/YRa5MRZRs/u0vIhnj3FqFWmb5VjY=;
        b=GKOJOCP8KjU94/6+LzcauapVbqOar2A/mn+cKvoQhehmhLBNcF51tEQLquO3j/J/6g
         Mt8YLHRzIgmqgnoF7IXXvn04qEy1+hspO1rHAmG//EKlYi7H1pWz5EiPtFwhqoLEEQaG
         EJdfn2IwQOwSOWqkaeKmkrchFBEBFXx4Ld5Flsac6UutA7LUe1vP9opTvWORnpts7c4I
         wf1pdkn/fS451Zv9qqRgiBQQ0y+z0HI050LpZQRGfic5+9RKTKi0X3b3HKyuhhZ0QCsV
         yKQHsQeQemaMdf2sg6YD2g9bxtu0rkHuAraviQ4SZDfnD+M4Mqml2NwcrNnz2X/eUSer
         rdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695987287; x=1696592087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgvBkNFX7DT832/YRa5MRZRs/u0vIhnj3FqFWmb5VjY=;
        b=WCNwX3nHfHcKodSYvQYfs1Kzi4U6xqE4ZrnZMJMGbuaTVDKTWxFcASn0ZX2CDRQfHz
         OEFg02LX/ugTCJQ2qS4STSQJs5hdZVnbqBs5kP2JxxoO08D38UGTp6jsak4hl2JyT0LV
         YnftHVNDXMtHUe4XK3XWnUr6LFc3uhWFbF4cpa1WuCPZmqHvyHbsLU1NWgPlIHFChg9P
         YTkhUx+gAAHjjHwrTWORs/tgkp57/KArlOCxx+V3vTrIb71QZo1wUAADy8COoPkYk6Ny
         vKoi0n1H6zMsSOgPK44b8Rk9XRJwBPdombxAOv9hW4oC3fDj19tgQlk+TqOJJtNVvMEX
         BLLA==
X-Gm-Message-State: AOJu0YxiO7QmgzlMB3H8cWNyfb7RZpMKgJpYZ2TxVZe4EVV0G9IU7199
        VFzNjwPlbvCX4T+Lo9K9tTX91XMs+AI=
X-Google-Smtp-Source: AGHT+IG4+Q0rbwQLI29OOqc8C+UIce+tZsZ+d2WLVb3bQzOntCVYKM1tWjGCQgk1ZQAiDBvsqb9qqg==
X-Received: by 2002:a05:6512:3c87:b0:4f9:5426:6622 with SMTP id h7-20020a0565123c8700b004f954266622mr3617974lfv.69.1695987287282;
        Fri, 29 Sep 2023 04:34:47 -0700 (PDT)
Received: from localhost.localdomain ([31.173.85.123])
        by smtp.gmail.com with ESMTPSA id l23-20020a19c217000000b00501c77ad909sm3471315lfc.208.2023.09.29.04.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 04:34:47 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH 2/2] platform/x86: msi-ec: Add more EC configs
Date:   Fri, 29 Sep 2023 14:31:51 +0300
Message-ID: <20230929113149.587436-5-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929113149.587436-1-teackot@gmail.com>
References: <20230929113149.587436-1-teackot@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch adds configurations for new EC firmware from the downstream
version of the driver.

Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
Signed-off-by: Nikita Kravets <teackot@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 467 ++++++++++++++++++++++++++++++++++
 1 file changed, 467 insertions(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 3074aee878c1..f19504dbf164 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -667,6 +667,467 @@ static struct msi_ec_conf CONF7 __initdata = {
 	},
 };
 
+static const char * const ALLOWED_FW_8[] __initconst = {
+	"14F1EMS1.115",
+	NULL
+};
+
+static struct msi_ec_conf CONF8 __initdata = {
+	.allowed_fw = ALLOWED_FW_8,
+	.charge_control = {
+		.address      = 0xd7,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = MSI_EC_ADDR_UNSUPP,
+		.bit           = 1,
+	},
+	.fn_win_swap = {
+		.address = 0xe8,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xd2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = 0xeb,
+		.mask    = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xd4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_BASIC_NAME,    0x4d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71,
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = MSI_EC_ADDR_UNKNOWN,
+		.rt_fan_speed_address = MSI_EC_ADDR_UNKNOWN,
+	},
+	.leds = {
+		.micmute_led_address = MSI_EC_ADDR_UNSUPP,
+		.mute_led_address    = 0x2d,
+		.bit                 = 1,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = MSI_EC_ADDR_UNKNOWN, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = MSI_EC_ADDR_UNSUPP, // not functional
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_9[] __initconst = {
+	"14JKEMS1.104",
+	NULL
+};
+
+static struct msi_ec_conf CONF9 __initdata = {
+	.allowed_fw = ALLOWED_FW_9,
+	.charge_control = {
+		.address      = 0xef,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_win_swap = {
+		.address = 0xbf,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xf2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = MSI_EC_ADDR_UNSUPP, // unsupported or enabled by ECO shift
+		.mask    = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xf4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71,
+		.rt_fan_speed_base_min = 0x00,
+		.rt_fan_speed_base_max = 0x96,
+		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = MSI_EC_ADDR_UNSUPP,
+		.rt_fan_speed_address = MSI_EC_ADDR_UNSUPP,
+	},
+	.leds = {
+		.micmute_led_address = 0x2b,
+		.mute_led_address    = 0x2c,
+		.bit                 = 2,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = MSI_EC_ADDR_UNSUPP, // not presented in MSI app
+		.bl_modes         = { 0x00, 0x08 },
+		.max_mode         = 1,
+		.bl_state_address = 0xf3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_10[] __initconst = {
+	"1582EMS1.107", // GF66 11UC
+	NULL
+};
+
+static struct msi_ec_conf CONF10 __initdata = {
+	.allowed_fw = ALLOWED_FW_10,
+	.charge_control = {
+		.address      = 0xd7,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_win_swap = {
+		.address = MSI_EC_ADDR_UNSUPP,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xd2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			{ SM_TURBO_NAME,   0xc4 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = 0xe5,
+		.mask    = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xd4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71, // ?
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = MSI_EC_ADDR_UNKNOWN, // ?
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = 0x2c,
+		.mute_led_address    = 0x2d,
+		.bit                 = 1,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = 0x2c,
+		.bl_modes         = { 0x00, 0x08 },
+		.max_mode         = 1,
+		.bl_state_address = 0xd3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_11[] __initconst = {
+	"16S6EMS1.111", // Prestige 15 a11scx
+	"1552EMS1.115", // Modern 15 a11m
+	NULL
+};
+
+static struct msi_ec_conf CONF11 __initdata = {
+	.allowed_fw = ALLOWED_FW_11,
+	.charge_control = {
+		.address      = 0xd7,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = MSI_EC_ADDR_UNKNOWN,
+		.bit           = 1,
+	},
+	.fn_win_swap = {
+		.address = 0xe8,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xd2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = 0xeb,
+		.mask = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xd4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_ADVANCED_NAME, 0x4d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
+		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
+	},
+	.gpu = {
+		.rt_temp_address      = MSI_EC_ADDR_UNSUPP,
+		.rt_fan_speed_address = MSI_EC_ADDR_UNSUPP,
+	},
+	.leds = {
+		.micmute_led_address = 0x2c,
+		.mute_led_address    = 0x2d,
+		.bit                 = 1,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = MSI_EC_ADDR_UNKNOWN,
+		.bl_modes         = {}, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = 0xd3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_12[] __initconst = {
+	"16R6EMS1.104", // GF63 Thin 11UC
+	NULL
+};
+
+static struct msi_ec_conf CONF12 __initdata = {
+	.allowed_fw = ALLOWED_FW_12,
+	.charge_control = {
+		.address      = 0xd7,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_win_swap = {
+		.address = 0xe8,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xd2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			{ SM_TURBO_NAME,   0xc4 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = MSI_EC_ADDR_UNSUPP, // 0xeb
+		.mask    = 0x0f, // 00, 0f
+	},
+	.fan_mode = {
+		.address = 0xd4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71,
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = MSI_EC_ADDR_UNSUPP,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = MSI_EC_ADDR_UNSUPP,
+		.mute_led_address    = 0x2d,
+		.bit                 = 1,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = MSI_EC_ADDR_UNKNOWN,
+		.bl_modes         = { 0x00, 0x08 },
+		.max_mode         = 1,
+		.bl_state_address = 0xd3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char * const ALLOWED_FW_13[] __initconst = {
+	"1594EMS1.109", // MSI Prestige 16 Studio A13VE
+	NULL
+};
+
+static struct msi_ec_conf CONF13 __initdata = {
+	.allowed_fw = ALLOWED_FW_13,
+	.charge_control = {
+		.address      = 0xd7,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_win_swap = {
+		.address = 0xe8,
+		.bit     = 4, // 0x00-0x10
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xd2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 }, // super battery
+			{ SM_COMFORT_NAME, 0xc1 }, // balanced
+			{ SM_TURBO_NAME,   0xc4 }, // extreme
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = MSI_EC_ADDR_UNSUPP,
+		.mask    = 0x0f, // 00, 0f
+	},
+	.fan_mode = {
+		.address = 0xd4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71, // 0x0-0x96
+		.rt_fan_speed_base_min = 0x00,
+		.rt_fan_speed_base_max = 0x96,
+		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = 0x2c,
+		.mute_led_address    = 0x2d,
+		.bit                 = 1,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = 0x2c, // KB auto turn off
+		.bl_modes         = { 0x00, 0x08 }, // always on; off after 10 sec
+		.max_mode         = 1,
+		.bl_state_address = 0xd3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
 static struct msi_ec_conf *CONFIGS[] __initdata = {
 	&CONF0,
 	&CONF1,
@@ -676,6 +1137,12 @@ static struct msi_ec_conf *CONFIGS[] __initdata = {
 	&CONF5,
 	&CONF6,
 	&CONF7,
+	&CONF8,
+	&CONF9,
+	&CONF10,
+	&CONF11,
+	&CONF12,
+	&CONF13,
 	NULL
 };
 
-- 
2.42.0

