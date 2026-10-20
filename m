Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461056;
	b=NnA6mQdygGLs8s0aBz6ajjxbwxWqmuD6MLp+XfbiFOmBvj5oaLCOtlJD+VbdixbBkPSz
	 o4EIaY0Ee/tohzyvExx87AifU+ZO+KuPHmBGpdjHayzhQhc+uFtEGrXsxdhWT5zujPSuB
	 oe3Bj64XFUSEtWd2S8MHrm1mAmoGenDDIB468pjR/aeSEP4nzr38bbjEyHaesS4LsEW8q
	 Vi+NP0jicX4l1Q+yFdfDXXnuCRoYB76cgeQo3On7QClv8fFdUvlApNWv/NOMUjpWkjDIz
	 4GKTrZn4ahkeOQYUIAQsOKtgGkD721Dk2vJsdbNkcInn99ZYUYX99KH8SnBIsUF+SjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ye2UCYDkzUtw3x3YVhdyIXWosmkvPQLa6K6q92dzMmg=;
	b=KRA1TJQC8fF0uabmSc7feOCQgD9k2FQ3Wtu2sxf+LxroQJ282FQa+8YB+48Xikz/pH2D
	 4DU70SzcYi5yyPo+uILbsJpdNqhdrWGq6gtc9Ohvzdn5+waoYiDER33QL5U316OB7Ew3q
	 EkUhDAgCYdgdSbjAgV4sk1kNa8g6105yXTSE6DdTqPACS0a8QRRmZf1goWp19mx+pIfaA
	 d+qvEQuClbRBqgIuzfqy/787LdWDThgY6xnmDsPukeIvWXO0MBPQlkwXiLfOnd7/A+5HH
	 UELRMilSZzPn/oErKnN9otf+hxbuP3EwZAYudf2zV/juE+fRgxB+KAqJWA1GTwdQeAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U7Fj1IXr;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5D2606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 01:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B5D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U7Fj1IXr
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15354aa70e8so3061965c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 18:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461055; x=1793065855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ye2UCYDkzUtw3x3YVhdyIXWosmkvPQLa6K6q92dzMmg=;
        b=U7Fj1IXr3KLaa/ieNjmvQTBn6WaMEb3UTgU/qik2TaW0vD3iGWMMmmNGvLSW/cgAwx
         CgXkZnh+vH4zxMzPj9cP2+FtJ5k+Td40REHTIOlTnkm2PRGLpYmIUWuK9ZYqBNjZBTDG
         xpvYL7iMAKn6JvVrnP/pICZwF/n8mEcsnLy+Q3CBg1UvFnga6qyXEKFjZGqUf3mvikDS
         KNf37fGJgIoKZOQ7f5f+pVPUpgxPH/nz/xlb+gJvX9T5n3u+TTNz+StxkCAw6MGkgB2y
         5MM731QRZ4P/j4v+ksShDD2Rk4LnqeYJC1V8PjOUZsyG8hSfJqjaWEUn11qjedkTCrd/
         3a8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461055; x=1793065855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ye2UCYDkzUtw3x3YVhdyIXWosmkvPQLa6K6q92dzMmg=;
        b=N6J4oCQEvYY44bVq9vKR+m3x2yYIU+50dnWwyD5JAWuDyC8d58BWaP8G5Ad59voG9J
         WgiVXPay3GO78IJv2Wxq/BQEvSmLTAHzA9+zNF0kPwWrRpYejUr0j+meWuzTmTgbi2gX
         B6rAktYgplWdwKn+QYJh+nfZ4yXL5XXk0HlS2bebhQfecp3/WkWg6ZASbNQ8Mau8yIjc
         AMCr/7zSV1WgFVNmhvh63cuzmD4ppwt4N4ASMGwIqo9i+YsLuXDEZ9MG6oX/M3KHolxY
         N7Bfme35xKd8gVWy+wB/KhFOv32FQiE21XXJyWCV2a10cPLVXlzXx+JZ/dV3qQnbccH2
         JSzA==
X-Forwarded-Encrypted: i=1; AKwUvBwZW7wcKJl3uq5ThY8UfU5hpeQPv5EKpzIzqnWcDixyh5+7lu29cx4CyAgzwFJKbO+9yAK3OT5IGo6zumantNp64aUH@vger.kernel.org
X-Gm-Message-State: AFq9FYIUyiKSAhGtAExETJrbSLYJQJUU4wL591UZXv5Kt49S33yDHoTl
	2zhybgt1zwRR6XOoNdl2Y++/yM5/0M8tH4mXv1Cbe33Ji8/iN6rnXN5j
X-Gm-Gg: AYBFou1G4C781+/zjBve+kFmoCzjAfNLIVU7nTHbackbkJ4kSZa/UGmTXetBvLxs6XA
	tplCrg1tp6A+bfZGghchvw0sFtGcNUGMkWqLQbamCSz7JoL3XgL0yH86x8UqJQ1Iq584KG/fd14
	eQbpTaTRlJ4H7VriqyFHfZmFpQTlXPWsk/YuZUBy06bT/nzmsxDjMChZr0GZ0iNNQ/fF7Sgvrcw
	ORogxNKFU0OdbaFfVWy8A9Nsm2YeSxuTrTdRttTm+IudZb6DP5jbAY/yuffB9YfxX+Rbft6Z+u0
	XeEQD6/KTutKGDhANB8QgbkUx46accIEgNcDs/EBdWCjod/VplmDqbCRCdlZ9REMINyWRYl6NQC
	IdPHSWd/vvofIY+oLQhSsu/W6BqDG+5X8axk45x7h8zzZcKwJS8ic03cl4FmrFkAkShgIcxYd9v
	pZPljdapWCU23QCrJszb8/dQmMnibItFavj2thxeXGS5X5eCXOgNlCeVLlNZ/eZfolIrxNcZFt1
	bCYvkzRjzwVEvLlxAWYZwC0/XRvZkwyymFE8c0gw4IdgrD2IzAomSzI
X-Received: by 2002:a05:7022:f902:10b0:143:298f:33b8 with SMTP id a92af1059eb24-18514914dd4mr14587384c88.44.1792461055381;
        Mon, 19 Oct 2026 18:50:55 -0700 (PDT)
Received: from duo.lan ([2001:fd8:f0db:3ee7:799b:69c2:e95b:f04e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm32684879c88.7.2026.10.19.18.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:50:54 -0700 (PDT)
From: Alexander Patrakov <patrakov@gmail.com>
To: johannes.goede@oss.qualcomm.com
Cc: adee.sahan@gmail.com,
	andy@kernel.org,
	antti.laakso@linux.intel.com,
	dan.scally@ideasonboard.com,
	diamondback@cohunt.app,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	Alexander Patrakov <patrakov@gmail.com>
Subject: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
Date: Tue, 20 Oct 2026 09:50:01 +0800
Message-ID: <20261020015001.15672-3-patrakov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020015001.15672-1-patrakov@gmail.com>
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The front camera of the Lenovo Yoga Duet 7 13ITL6 and of the Dell
Latitude 7320 Detachable is described in ACPI as OVTI5678. The part
reports the chip id of the OV5675 and takes its register settings, but
its color filter array is a complex 4x4 RGB-IR one.

The silicon is likely the same as the one of the OVTI5675, so it still
has some features (binned mode, hardware defective pixel concealment)
that assume the classic 2x2 GRBG Bayer array and thus produce meaningless
output with the RGB-IR array. Disable them for OVTI5678.

NOTE: This patch cannot be upstreamed as there is no way to properly
describe the color filter array layout of the OVTI5678. The color format
is a placeholder at this point.

Signed-off-by: Alexander Patrakov <patrakov@gmail.com>
---
 drivers/media/i2c/ov5675.c | 149 ++++++++++++++++++++++++++++++++-----
 1 file changed, 131 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 9cf600c9c94a..7563a462abea 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -6,8 +6,10 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
 
@@ -28,6 +30,10 @@
 #define OV5675_REG_CHIP_ID		0x300a
 #define OV5675_CHIP_ID			0x5675
 
+/* On-chip processing; bits 1 and 2 enable the defect pixel correction */
+#define OV5675_REG_ISP_CTRL		0x5000
+#define OV5675_ISP_CTRL_NO_DPC		0x71
+
 #define OV5675_REG_MODE_SELECT		0x0100
 #define OV5675_MODE_STANDBY		0x00
 #define OV5675_MODE_STREAMING		0x01
@@ -492,8 +498,58 @@ static const struct ov5675_mode supported_modes[] = {
 	}
 };
 
+/* The modes of the RGB-IR part, see ov5675_get_modes() */
+static const struct ov5675_mode ov5678_supported_modes[] = {
+	{
+		.width = 2592,
+		.height = 1944,
+		.hts = 1500,
+		.vts_def = OV5675_VTS_30FPS,
+		.vts_min = OV5675_VTS_30FPS_MIN,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
+			.regs = mode_2592x1944_regs,
+		},
+		.link_freq_index = OV5675_LINK_FREQ_900MBPS,
+	}
+};
+
+/**
+ * struct ov5675_variant - What differs between the parts this driver handles
+ * @model: Name of the sub-device, by which user space tells the parts apart
+ * @code: Media bus code of the output
+ */
+struct ov5675_variant {
+	const char *model;
+	u32 code;
+};
+
+static const struct ov5675_variant ov5675_variant_bayer = {
+	.model = "ov5675",
+	.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+};
+
+/*
+ * The part ACPI calls OVTI5678 reports the chip id of the OV5675 and takes
+ * its register settings, but has a 4x4 RGB-IR color filter array:
+ *
+ *	G I G I
+ *	R G B G
+ *	G I G I
+ *	B G R G
+ *
+ * No media bus code describes that. MEDIA_BUS_FMT_Y10_1X10 is used because it
+ * is the 10-bit code that claims no Bayer order, so that nothing demosaics the
+ * data as if it were Bayer. The samples are not luma.
+ */
+static const struct ov5675_variant ov5675_variant_rgbir = {
+	.model = "ov5678",
+	.code = MEDIA_BUS_FMT_Y10_1X10,
+};
+
 struct ov5675 {
 	struct device *dev;
+	const struct ov5675_variant *variant;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -857,12 +913,30 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
 	return ret;
 }
 
-static void ov5675_update_pad_format(const struct ov5675_mode *mode,
+/*
+ * The 1296x972 mode is 2x2 binned. The hardware averages pixels two positions
+ * apart, which have the same color in a Bayer array, but not in the RGB-IR
+ * array. Therefore, the RGB-IR color filter array is incompatible with binning.
+ */
+static const struct ov5675_mode *ov5675_get_modes(const struct ov5675 *ov5675,
+						  unsigned int *num_modes)
+{
+	if (ov5675->variant->code != MEDIA_BUS_FMT_SGRBG10_1X10) {
+		*num_modes = ARRAY_SIZE(ov5678_supported_modes);
+		return ov5678_supported_modes;
+	}
+
+	*num_modes = ARRAY_SIZE(supported_modes);
+	return supported_modes;
+}
+
+static void ov5675_update_pad_format(struct ov5675 *ov5675,
+				     const struct ov5675_mode *mode,
 				     struct v4l2_mbus_framefmt *fmt)
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->code = ov5675->variant->code;
 	fmt->field = V4L2_FIELD_NONE;
 }
 
@@ -914,6 +988,25 @@ static int ov5675_start_streaming(struct ov5675 *ov5675)
 		return ret;
 	}
 
+	/*
+	 * The mode settings enable the on-chip defect pixel correction. It
+	 * compares a pixel with the ones two positions away, which have the
+	 * same color in a Bayer array. In the RGB-IR array the pixel two
+	 * positions from a red one is blue, and so comparing or mixing them
+	 * makes no sense. So defect pixel correction is on for the Bayer part
+	 * only. Intel's Windows driver for the OVTI5678 turns it off in the
+	 * same way, by writing 0x71 to this register.
+	 */
+	if (ov5675->variant->code != MEDIA_BUS_FMT_SGRBG10_1X10) {
+		ret = ov5675_write_reg(ov5675, OV5675_REG_ISP_CTRL,
+				       OV5675_REG_VALUE_08BIT,
+				       OV5675_ISP_CTRL_NO_DPC);
+		if (ret) {
+			dev_err(ov5675->dev, "failed to disable defect correction");
+			return ret;
+		}
+	}
+
 	ret = __v4l2_ctrl_handler_setup(ov5675->sd.ctrl_handler);
 	if (ret)
 		return ret;
@@ -1020,16 +1113,16 @@ static int ov5675_set_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct ov5675 *ov5675 = to_ov5675(sd);
-	const struct ov5675_mode *mode;
+	const struct ov5675_mode *modes, *mode;
+	unsigned int num_modes;
 	s32 vblank_def, h_blank;
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes), width,
-				      height, fmt->format.width,
-				      fmt->format.height);
+	modes = ov5675_get_modes(ov5675, &num_modes);
+	mode = v4l2_find_nearest_size(modes, num_modes, width, height,
+				      fmt->format.width, fmt->format.height);
 
 	mutex_lock(&ov5675->mutex);
-	ov5675_update_pad_format(mode, &fmt->format);
+	ov5675_update_pad_format(ov5675, mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 	} else {
@@ -1067,7 +1160,8 @@ static int ov5675_get_format(struct v4l2_subdev *sd,
 		fmt->format = *v4l2_subdev_state_get_format(sd_state,
 							    fmt->pad);
 	else
-		ov5675_update_pad_format(ov5675->cur_mode, &fmt->format);
+		ov5675_update_pad_format(ov5675, ov5675->cur_mode,
+					 &fmt->format);
 
 	mutex_unlock(&ov5675->mutex);
 
@@ -1104,10 +1198,12 @@ static int ov5675_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct ov5675 *ov5675 = to_ov5675(sd);
+
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	code->code = ov5675->variant->code;
 
 	return 0;
 }
@@ -1116,15 +1212,20 @@ static int ov5675_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes))
+	struct ov5675 *ov5675 = to_ov5675(sd);
+	const struct ov5675_mode *modes;
+	unsigned int num_modes;
+
+	modes = ov5675_get_modes(ov5675, &num_modes);
+	if (fse->index >= num_modes)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+	if (fse->code != ov5675->variant->code)
 		return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
+	fse->min_width = modes[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
+	fse->min_height = modes[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -1133,9 +1234,13 @@ static int ov5675_enum_frame_size(struct v4l2_subdev *sd,
 static int ov5675_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct ov5675 *ov5675 = to_ov5675(sd);
+	const struct ov5675_mode *modes;
+	unsigned int num_modes;
+
+	modes = ov5675_get_modes(ov5675, &num_modes);
 
 	mutex_lock(&ov5675->mutex);
-	ov5675_update_pad_format(&supported_modes[0],
+	ov5675_update_pad_format(ov5675, &modes[0],
 				 v4l2_subdev_state_get_format(fh->state, 0));
 	mutex_unlock(&ov5675->mutex);
 
@@ -1281,6 +1386,7 @@ static void ov5675_remove(struct i2c_client *client)
 static int ov5675_probe(struct i2c_client *client)
 {
 	struct ov5675 *ov5675;
+	unsigned int num_modes;
 	bool full_power;
 	int ret;
 
@@ -1290,11 +1396,17 @@ static int ov5675_probe(struct i2c_client *client)
 
 	ov5675->dev = &client->dev;
 
+	ov5675->variant = device_get_match_data(ov5675->dev);
+	if (!ov5675->variant)
+		ov5675->variant = &ov5675_variant_bayer;
+
 	ret = ov5675_get_hwcfg(ov5675);
 	if (ret)
 		return ret;
 
 	v4l2_i2c_subdev_init(&ov5675->sd, client, &ov5675_subdev_ops);
+	v4l2_i2c_subdev_set_name(&ov5675->sd, client, ov5675->variant->model,
+				 NULL);
 
 	ret = ov5675_power_on(ov5675->dev);
 	if (ret) {
@@ -1312,7 +1424,7 @@ static int ov5675_probe(struct i2c_client *client)
 	}
 
 	mutex_init(&ov5675->mutex);
-	ov5675->cur_mode = &supported_modes[0];
+	ov5675->cur_mode = ov5675_get_modes(ov5675, &num_modes);
 	ret = ov5675_init_controls(ov5675);
 	if (ret) {
 		dev_err(ov5675->dev, "failed to init controls: %d", ret);
@@ -1363,7 +1475,8 @@ static const struct dev_pm_ops ov5675_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5675_acpi_ids[] = {
-	{"OVTI5675"},
+	{"OVTI5675", (kernel_ulong_t)&ov5675_variant_bayer},
+	{"OVTI5678", (kernel_ulong_t)&ov5675_variant_rgbir},
 	{}
 };
 
@@ -1371,7 +1484,7 @@ MODULE_DEVICE_TABLE(acpi, ov5675_acpi_ids);
 #endif
 
 static const struct of_device_id ov5675_of_match[] = {
-	{ .compatible = "ovti,ov5675", },
+	{ .compatible = "ovti,ov5675", .data = &ov5675_variant_bayer },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, ov5675_of_match);
-- 
2.56.0

