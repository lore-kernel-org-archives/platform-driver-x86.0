Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483C0C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Nov 2021 19:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236275AbhKUTOo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Nov 2021 14:14:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20425 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238470AbhKUTOo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Nov 2021 14:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637521898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2RZ2WXDWsr0oq/XznCEuldrSKPR4z5s8c+P3vUjw3LY=;
        b=X0a4JkmfWoHen6BvN1fwzjPc7yvHKSbChze2AeMYQbjaqLHVZQNlYGkY36pSsxvENPYr2+
        QP3AME0iTJVyP26W+oZhr98vwPutHkqFlqoCh7vUayP0cfFBfbee52bviB+TOVjYS6/Efo
        oDrMgJCsSgNXe2zq9PW/mY4sTPqBgBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-ir6C3yUiOZCJvU1nibV3dw-1; Sun, 21 Nov 2021 14:11:35 -0500
X-MC-Unique: ir6C3yUiOZCJvU1nibV3dw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32877871805;
        Sun, 21 Nov 2021 19:11:34 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E6B145DF21;
        Sun, 21 Nov 2021 19:11:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/7] platform/x86: thinkpad_acpi: Make *_init() functions return -ENODEV instead of 1
Date:   Sun, 21 Nov 2021 20:11:24 +0100
Message-Id: <20211121191129.256713-3-hdegoede@redhat.com>
In-Reply-To: <20211121191129.256713-1-hdegoede@redhat.com>
References: <20211121191129.256713-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Make ibm_init_struct.init() callbacks return -ENODEV instead of 1 when
the subdevice / function is not available.

Using -ENODEV clearly states what it going on where as a magic return of
"1" requires a deep dive into the code to figure out what is going on.

This also allows for some cleanups, avoiding the need to translate an
-ENODEV return into "return 1" (which often mistakenly was "return 0").

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 85 +++++++++++-----------------
 1 file changed, 34 insertions(+), 51 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 62daf0109b4a..24a3c79a045e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3379,7 +3379,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		str_supported(tp_features.hotkey));
 
 	if (!tp_features.hotkey)
-		return 1;
+		return -ENODEV;
 
 	quirks = tpacpi_check_quirks(tpacpi_hotkey_qtable,
 				     ARRAY_SIZE(tpacpi_hotkey_qtable));
@@ -3586,7 +3586,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	return 0;
 
 err_exit:
-	return (res < 0) ? res : 1;
+	return (res < 0) ? res : -ENODEV;
 }
 
 /* Thinkpad X1 Carbon support 5 modes including Home mode, Web browser
@@ -4467,7 +4467,7 @@ static int __init bluetooth_init(struct ibm_init_struct *iibm)
 	}
 
 	if (!tp_features.bluetooth)
-		return 1;
+		return -ENODEV;
 
 	res = tpacpi_new_rfkill(TPACPI_RFK_BLUETOOTH_SW_ID,
 				&bluetooth_tprfk_ops,
@@ -4647,7 +4647,7 @@ static int __init wan_init(struct ibm_init_struct *iibm)
 	}
 
 	if (!tp_features.wan)
-		return 1;
+		return -ENODEV;
 
 	res = tpacpi_new_rfkill(TPACPI_RFK_WWAN_SW_ID,
 				&wan_tprfk_ops,
@@ -4776,7 +4776,7 @@ static int __init uwb_init(struct ibm_init_struct *iibm)
 	}
 
 	if (!tp_features.uwb)
-		return 1;
+		return -ENODEV;
 
 	res = tpacpi_new_rfkill(TPACPI_RFK_UWB_SW_ID,
 				&uwb_tprfk_ops,
@@ -4869,7 +4869,7 @@ static int __init video_init(struct ibm_init_struct *iibm)
 		str_supported(video_supported != TPACPI_VIDEO_NONE),
 		video_supported);
 
-	return (video_supported != TPACPI_VIDEO_NONE) ? 0 : 1;
+	return (video_supported != TPACPI_VIDEO_NONE) ? 0 : -ENODEV;
 }
 
 static void video_exit(void)
@@ -5277,7 +5277,7 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 	if (!kbdlight_is_supported()) {
 		tp_features.kbdlight = 0;
 		vdbg_printk(TPACPI_DBG_INIT, "kbdlight is unsupported\n");
-		return 1;
+		return -ENODEV;
 	}
 
 	kbdlight_brightness = kbdlight_sysfs_get(NULL);
@@ -5467,7 +5467,7 @@ static int __init light_init(struct ibm_init_struct *iibm)
 		str_supported(tp_features.light_status));
 
 	if (!tp_features.light)
-		return 1;
+		return -ENODEV;
 
 	rc = led_classdev_register(&tpacpi_pdev->dev,
 				   &tpacpi_led_thinklight.led_classdev);
@@ -5583,7 +5583,7 @@ static int __init cmos_init(struct ibm_init_struct *iibm)
 	vdbg_printk(TPACPI_DBG_INIT, "cmos commands are %s\n",
 		    str_supported(cmos_handle != NULL));
 
-	return cmos_handle ? 0 : 1;
+	return cmos_handle ? 0 : -ENODEV;
 }
 
 static int cmos_read(struct seq_file *m)
@@ -5928,7 +5928,7 @@ static int __init led_init(struct ibm_init_struct *iibm)
 		str_supported(led_supported), led_supported);
 
 	if (led_supported == TPACPI_LED_NONE)
-		return 1;
+		return -ENODEV;
 
 	tpacpi_leds = kcalloc(TPACPI_LED_NUMLEDS, sizeof(*tpacpi_leds),
 			      GFP_KERNEL);
@@ -6057,7 +6057,7 @@ static int __init beep_init(struct ibm_init_struct *iibm)
 
 	tp_features.beep_needs_two_args = !!(quirks & TPACPI_BEEP_Q1);
 
-	return (beep_handle) ? 0 : 1;
+	return (beep_handle) ? 0 : -ENODEV;
 }
 
 static int beep_read(struct seq_file *m)
@@ -6441,7 +6441,7 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 		str_supported(thermal_read_mode != TPACPI_THERMAL_NONE),
 		thermal_read_mode);
 
-	return thermal_read_mode == TPACPI_THERMAL_NONE ? 1 : 0;
+	return thermal_read_mode != TPACPI_THERMAL_NONE ? 0 : -ENODEV;
 }
 
 static int thermal_read(struct seq_file *m)
@@ -6852,25 +6852,25 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 
 	/* if it is unknown, we don't handle it: it wouldn't be safe */
 	if (tp_features.bright_unkfw)
-		return 1;
+		return -ENODEV;
 
 	if (!brightness_enable) {
 		dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_BRGHT,
 			   "brightness support disabled by module parameter\n");
-		return 1;
+		return -ENODEV;
 	}
 
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor) {
 		if (brightness_enable > 1) {
 			pr_info("Standard ACPI backlight interface available, not loading native one\n");
-			return 1;
+			return -ENODEV;
 		} else if (brightness_enable == 1) {
 			pr_warn("Cannot enable backlight brightness support, ACPI is already handling it.  Refer to the acpi_backlight kernel parameter.\n");
-			return 1;
+			return -ENODEV;
 		}
 	} else if (!tp_features.bright_acpimode) {
 		pr_notice("ACPI backlight interface not available\n");
-		return 1;
+		return -ENODEV;
 	}
 
 	pr_notice("ACPI native brightness control enabled\n");
@@ -6903,7 +6903,7 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 		return -EINVAL;
 
 	if (tpacpi_brightness_get_raw(&b) < 0)
-		return 1;
+		return -ENODEV;
 
 	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_PLATFORM;
@@ -7493,7 +7493,7 @@ static int __init volume_create_alsa_mixer(void)
 			  sizeof(struct tpacpi_alsa_data), &card);
 	if (rc < 0 || !card) {
 		pr_err("Failed to create ALSA card structures: %d\n", rc);
-		return 1;
+		return -ENODEV;
 	}
 
 	BUG_ON(!card->private_data);
@@ -7552,7 +7552,7 @@ static int __init volume_create_alsa_mixer(void)
 
 err_exit:
 	snd_card_free(card);
-	return 1;
+	return -ENODEV;
 }
 
 #define TPACPI_VOL_Q_MUTEONLY	0x0001	/* Mute-only control available */
@@ -7601,7 +7601,7 @@ static int __init volume_init(struct ibm_init_struct *iibm)
 	if (volume_mode == TPACPI_VOL_MODE_UCMS_STEP) {
 		pr_err("UCMS step volume mode not implemented, please contact %s\n",
 		       TPACPI_MAIL);
-		return 1;
+		return -ENODEV;
 	}
 
 	if (volume_capabilities >= TPACPI_VOL_CAP_MAX)
@@ -7614,7 +7614,7 @@ static int __init volume_init(struct ibm_init_struct *iibm)
 	if (!alsa_enable) {
 		vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_MIXER,
 			    "ALSA mixer disabled by parameter, not loading volume subdriver...\n");
-		return 1;
+		return -ENODEV;
 	}
 
 	quirks = tpacpi_check_quirks(volume_quirk_table,
@@ -7627,7 +7627,7 @@ static int __init volume_init(struct ibm_init_struct *iibm)
 		else if (quirks & TPACPI_VOL_Q_LEVEL)
 			tp_features.mixer_no_level_control = 0;
 		else
-			return 1; /* no mixer */
+			return -ENODEV; /* no mixer */
 		break;
 	case TPACPI_VOL_CAP_VOLMUTE:
 		tp_features.mixer_no_level_control = 0;
@@ -7636,7 +7636,7 @@ static int __init volume_init(struct ibm_init_struct *iibm)
 		tp_features.mixer_no_level_control = 1;
 		break;
 	default:
-		return 1;
+		return -ENODEV;
 	}
 
 	if (volume_capabilities != TPACPI_VOL_CAP_AUTO)
@@ -7808,7 +7808,7 @@ static int __init volume_init(struct ibm_init_struct *iibm)
 {
 	pr_info("volume: disabled as there is no ALSA support in this kernel\n");
 
-	return 1;
+	return -ENODEV;
 }
 
 static struct ibm_struct volume_driver_data = {
@@ -8745,7 +8745,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 			}
 		} else {
 			pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
-			return 1;
+			return -ENODEV;
 		}
 	}
 
@@ -8794,11 +8794,11 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 	if (fan_status_access_mode != TPACPI_FAN_NONE)
 		fan_get_status_safe(NULL);
 
-	if (fan_status_access_mode != TPACPI_FAN_NONE ||
-	    fan_control_access_mode != TPACPI_FAN_WR_NONE)
-		return 0;
+	if (fan_status_access_mode == TPACPI_FAN_NONE &&
+	    fan_control_access_mode == TPACPI_FAN_WR_NONE)
+		return -ENODEV;
 
-	return 1;
+	return 0;
 }
 
 static void fan_exit(void)
@@ -9925,12 +9925,9 @@ static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
 
 	palm_err = palmsensor_get(&has_palmsensor, &palm_state);
 	lap_err = lapsensor_get(&has_lapsensor, &lap_state);
-	/*
-	 * If support isn't available (ENODEV) for both devices then quit, but
-	 * don't return an error.
-	 */
+	/* If support isn't available for both devices return -ENODEV */
 	if ((palm_err == -ENODEV) && (lap_err == -ENODEV))
-		return 0;
+		return -ENODEV;
 	/* Otherwise, if there was an error return it */
 	if (palm_err && (palm_err != -ENODEV))
 		return palm_err;
@@ -10166,13 +10163,6 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 
 	dytc_profile_available = false;
 	err = dytc_command(DYTC_CMD_QUERY, &output);
-	/*
-	 * If support isn't available (ENODEV) then don't return an error
-	 * and don't create the sysfs group
-	 */
-	if (err == -ENODEV)
-		return 0;
-	/* For all other errors we can flag the failure */
 	if (err)
 		return err;
 
@@ -10475,16 +10465,9 @@ static const struct attribute_group dprc_attr_group = {
 
 static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
 {
-	int err = get_wwan_antenna(&wwan_antennatype);
-
-	/*
-	 * If support isn't available (ENODEV) then quit, but don't
-	 * return an error.
-	 */
-	if (err == -ENODEV)
-		return 0;
+	int err;
 
-	/* If there was an error return it */
+	err = get_wwan_antenna(&wwan_antennatype);
 	if (err)
 		return err;
 
-- 
2.31.1

