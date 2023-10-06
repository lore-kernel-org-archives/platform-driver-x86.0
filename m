Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2840E81E1B
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 17:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbjJFR7A (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 13:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbjJFR6y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 13:58:54 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AD6C6
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 10:58:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5046bf37daeso3128996e87.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Oct 2023 10:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696615130; x=1697219930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgvBkNFX7DT832/YRa5MRZRs/u0vIhnj3FqFWmb5VjY=;
        b=EUC/ra4CNZSXyhDELTPBakt6cr4oLP9oEsluTiyOx8k544rt1St44dLIwdOEjKTwTE
         VAuI+ynr3KQV5TfvyX7X3nvo6M9i/MLnOJoJ/xalFouI3uxZounyF4uB4HmNdMujfFZd
         2HYf40llXQLfSjxYgihcpnRsOURGsOFPLCubjtINPgooOiX1tzQaX6qLltx4QY25GjAQ
         532LieTVMR3Ai8I2aVVrIZ9gDsy8K33lJMsVNDCvU4KOxrzcIbkr93mbYYxUdJSbSVmJ
         oCxzKDDe8gDNhA3olEzvEh6m9PTXun8MHVeJ1JCe6Xzn3NhfNKmzC3g9e2c+HdSyS9bg
         /yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696615130; x=1697219930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgvBkNFX7DT832/YRa5MRZRs/u0vIhnj3FqFWmb5VjY=;
        b=LJo4fOCXCqauIM2uPYnFerDeJj9ShW+z3vR3WqosPHmxWHBJHzTH5eU61hgg/l/rzP
         u1r30M4HkH3uoNoCa/cnXn5Ozm3mSrNpMUFVei6wUmHaPfwHgaCr7jJFkeweL75731Jf
         bLGJGV3K8qANVCKgY4qzekH3IrMws4YGDkamZuOGbiXblL3841pCxIFl+LezIaYvFLE/
         nSQNZAJ9JItgrWvlP0rr7zjoqOT5/tl+8Lwy+mek8FKC5bXSJckQzB+5Fjh5qF2CdSqR
         0DMwqWECrn7GTG2NfrEeh3/1EtTggMFpR7GouW8yNwoiFNSvLeiFCu8U8fWjzjkui2k4
         hbSg==
X-Gm-Message-State: AOJu0YyjHxx1YdDF54ez2Xzi2PMIIBg/QXAXFXzZkCZUgMV/8HHlS6o1
        4asfPgsDwaX4wBXmZ8mjLzSZP575zsk=
X-Google-Smtp-Source: AGHT+IF9EnljeAdI/A2tY1xe1Ybb/zpA2MhWALrZIgMRIWm8fuYd6abGQEIztYOtDDLNsjbc544sVg==
X-Received: by 2002:a19:6414:0:b0:4fb:8435:3efc with SMTP id y20-20020a196414000000b004fb84353efcmr6827934lfb.16.1696615129505;
        Fri, 06 Oct 2023 10:58:49 -0700 (PDT)
Received: from localhost.localdomain ([81.177.126.202])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ee09000000b00500d1a72734sm379050lfb.130.2023.10.06.10.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 10:58:49 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH v2 3/3] platform/x86: msi-ec: Add more EC configs
Date:   Fri,  6 Oct 2023 20:53:57 +0300
Message-ID: <20231006175352.1753017-9-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006175352.1753017-3-teackot@gmail.com>
References: <20231006175352.1753017-3-teackot@gmail.com>
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

