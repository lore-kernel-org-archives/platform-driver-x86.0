Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6513B4E80;
	Fri, 18 Sep 2026 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770112; cv=none; b=SIPeO0KaHU2okTFTM9shI7zVo2tuyiYkW8f6yXvVkF9MRZr9l7B+rple7r9RBMYRnnXBoNMUuYh8OGKdwi1PPrXstrt7IgQqUZOXj+Ofq0XRF9N+s7qfT1/wyj8cF0guuws12ysuZvo1a32Z62i2z5LJiE/Cjf9NDZ3cJZmb4kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770112; c=relaxed/simple;
	bh=eyQOxzQ/0Twrcm+ka/3yRG6LqItWa89E0OLFfQeYybc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZDL+TVgDwHunz1UKM3B4qCsjv7HhYxlc4kTM9lBfmOIXEyckl1GJXrrcm0Obce3Iu1c1YiBAgLHr7KYadF6O5uRK90Exq4QXItxjcmBZd/dsExlSNjqQ2eZCL/W9bDFKvmV4wRTSFsAYIj07LuYrYeZYJ5FVOFiiNPn7G2gW+5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=ljsE12Fq; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="ljsE12Fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789769931;
	bh=eyQOxzQ/0Twrcm+ka/3yRG6LqItWa89E0OLFfQeYybc=;
	h=From:To:Cc:Subject:Date:From;
	b=ljsE12FqxIIEIdxTd2lEnxwWKEjM0fytgnGt9hpKF34PwtU/UmNXwwyz49msmhAaj
	 0QkY/5UJ0JKQQaR9nHiNX7RRrzdhDprWIVGcI9zPu+uVKgthHZaAxy0LcERPJHu4am
	 pyIXHhKYrMUB+gjka0oaC+wtevM6fZWixh+6U0FaeDhepRsZL4hGNdfPcjsSWVEdDh
	 sstv5IGCBtbwBIBQGysioRJQGuhVXTWdCnka0efw5KQZIyDhSFzkuBWnOA/iKJX2m7
	 Iv+HsTriqR/LV3iStWmUPgG9Q/9SQmXjFxP5cswAgFvRPqpzrE2eyp5N5jKKN6e8kT
	 yvf08sLXHUIrg==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id 239F720135;
	Fri, 18 Sep 2026 22:18:51 +0000 (UTC)
From: Peter Marshall <pm@petermarshall.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>
Subject: [PATCH 10/11] media: i2c: st-vd55g1: Use indirect hardware register addressing
Date: Fri, 18 Sep 2026 18:18:30 -0400
Message-ID: <20260918221832.323751-1-pm@petermarshall.ca>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce an enum listing driver-internal register IDs and map them
to hardware addresses with a lookup table referenced in the chip model
struct. Refactor the register access functions to operate on internal
IDs instead of raw CCI definitions.

This indirection facilitates the support of sensors with operationally
equivalent registers at disjoint hardware addresses. Currently all
sensors use the same address table. No functional change.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 drivers/media/i2c/vd55g1.c | 469 +++++++++++++++++++++++++------------
 1 file changed, 315 insertions(+), 154 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 24bc4a4dc0ac..54350df9869a 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -28,89 +28,32 @@
 #include <media/v4l2-subdev.h>
 
 /* Register Map */
-#define VD55G1_REG_MODEL_ID				CCI_REG32_LE(0x0000)
-#define VD55G1_REG_REVISION				CCI_REG16_LE(0x0004)
-#define VD55G1_REG_COLOR_VERSION			CCI_REG32_LE(0x0670)
-#define VD55G1_REG_FWPATCH_REVISION			CCI_REG16_LE(0x0012)
-#define VD55G1_REG_FWPATCH_START_ADDR			CCI_REG8(0x2000)
-#define VD55G1_REG_SYSTEM_FSM				CCI_REG8(0x001c)
 #define VD55G1_SYSTEM_FSM_READY_TO_BOOT			0x01
 #define VD55G1_SYSTEM_FSM_SW_STBY			0x02
 #define VD55G1_SYSTEM_FSM_STREAMING			0x03
-#define VD55G1_REG_BOOT					CCI_REG8(0x0200)
 #define VD55G1_BOOT_BOOT				1
 #define VD55G1_BOOT_PATCH_AND_BOOT			2
-#define VD55G1_REG_STBY					CCI_REG8(0x0201)
 #define VD55G1_STBY_START_STREAM			1
-#define VD55G1_REG_STREAMING				CCI_REG8(0x0202)
 #define VD55G1_STREAMING_STOP_STREAM			1
-#define VD55G1_REG_EXT_CLOCK				CCI_REG32_LE(0x0220)
-#define VD55G1_REG_LINE_LENGTH				CCI_REG16_LE(0x0300)
-#define VD55G1_REG_ORIENTATION				CCI_REG8(0x0302)
-#define VD55G1_REG_FORMAT_CTRL				CCI_REG8(0x030a)
-#define VD55G1_REG_OIF_CTRL				CCI_REG16_LE(0x030c)
-#define VD55G1_REG_ISL_ENABLE				CCI_REG16_LE(0x326)
-#define VD55G1_REG_OIF_IMG_CTRL				CCI_REG8(0x030f)
-#define VD55G1_REG_MIPI_DATA_RATE			CCI_REG32_LE(0x0224)
-#define VD55G1_REG_PATGEN_CTRL				CCI_REG16_LE(0x0304)
 #define VD55G1_PATGEN_TYPE_SHIFT			4
 #define VD55G1_PATGEN_ENABLE				BIT(0)
-#define VD55G1_REG_MANUAL_ANALOG_GAIN			CCI_REG8(0x0501)
-#define VD55G1_REG_MANUAL_COARSE_EXPOSURE		CCI_REG16_LE(0x0502)
-#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH0		CCI_REG16_LE(0x0504)
-#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH1		CCI_REG16_LE(0x0506)
-#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH2		CCI_REG16_LE(0x0508)
-#define VD55G1_REG_MANUAL_DIGITAL_GAIN_CH3		CCI_REG16_LE(0x050a)
-#define VD55G1_REG_APPLIED_COARSE_EXPOSURE		CCI_REG16_LE(0x00e8)
-#define VD55G1_REG_APPLIED_ANALOG_GAIN			CCI_REG16_LE(0x00ea)
-#define VD55G1_REG_APPLIED_DIGITAL_GAIN			CCI_REG16_LE(0x00ec)
-#define VD55G1_REG_AE_FORCE_COLDSTART			CCI_REG8(0x0308)
-#define VD55G1_REG_AE_COLDSTART_EXP_TIME		CCI_REG32_LE(0x0374)
-#define VD55G1_REG_READOUT_CTRL				CCI_REG8(0x052e)
 #define VD55G1_READOUT_CTRL_BIN_MODE_NORMAL		0
 #define VD55G1_READOUT_CTRL_BIN_MODE_DIGITAL_X2		1
-#define VD55G1_REG_DUSTER_CTRL				CCI_REG8(0x03ae)
 #define VD55G1_DUSTER_ENABLE				BIT(0)
 #define VD55G1_DUSTER_DISABLE				0
 #define VD55G1_DUSTER_DYN_ENABLE			BIT(1)
 #define VD55G1_DUSTER_RING_ENABLE			BIT(4)
-#define VD55G1_REG_AE_TARGET_PERCENTAGE			CCI_REG8(0x0486)
-#define VD55G1_REG_NEXT_CTX				CCI_REG16_LE(0x03e4)
-#define VD55G1_REG_EXPOSURE_USE_CASES			CCI_REG8(0x0312)
 #define VD55G1_EXPOSURE_USE_CASES_MULTI_CONTEXT		BIT(2)
-#define VD55G1_REG_EXPOSURE_MAX_COARSE			CCI_REG16_LE(0x0372)
 #define VD55G1_EXPOSURE_MAX_COARSE_DEF			0x7fff
 #define VD55G1_EXPOSURE_MAX_COARSE_SUB			446
-#define VD55G1_REG_CTX_REPEAT_COUNT_CTX0		CCI_REG16_LE(0x03dc)
-#define VD55G1_REG_CTX_REPEAT_COUNT_CTX1		CCI_REG16_LE(0x03de)
-
-#define VD55G1_REG_EXP_MODE(ctx) \
-	CCI_REG8(0x0500 + VD55G1_CTX_OFFSET * (ctx))
-#define VD55G1_REG_FRAME_LENGTH(ctx) \
-	CCI_REG32_LE(0x050c + VD55G1_CTX_OFFSET * (ctx))
-#define VD55G1_REG_X_START(ctx) \
-	CCI_REG16_LE(0x0514 + VD55G1_CTX_OFFSET * (ctx))
-#define VD55G1_REG_X_WIDTH(ctx) \
-	CCI_REG16_LE(0x0516 + VD55G1_CTX_OFFSET * (ctx))
-#define VD55G1_REG_Y_START(ctx) \
-	CCI_REG16_LE(0x0510 + VD55G1_CTX_OFFSET * (ctx))
-#define VD55G1_REG_Y_HEIGHT(ctx) \
-	CCI_REG16_LE(0x0512 + VD55G1_CTX_OFFSET * (ctx))
-#define VD55G1_REG_GPIO_0_CTRL(ctx) \
-	CCI_REG8(0x051d + VD55G1_CTX_OFFSET * (ctx))
+
 #define VD55G1_GPIO_MODE_FSYNC_OUT			0x00
 #define VD55G1_GPIO_MODE_IN				0x01
 #define VD55G1_GPIO_MODE_STROBE				0x02
-#define VD55G1_REG_VT_MODE(ctx) \
-	CCI_REG8(0x0536 + VD55G1_CTX_OFFSET * (ctx))
 #define VD55G1_VT_MODE_NORMAL				0
 #define VD55G1_VT_MODE_SUBTRACTION			1
-#define VD55G1_REG_MASK_FRAME_CTRL(ctx) \
-	CCI_REG8(0x0537 + VD55G1_CTX_OFFSET * (ctx))
 #define VD55G1_MASK_FRAME_CTRL_OUTPUT			0
 #define VD55G1_MASK_FRAME_CTRL_MASK			1
-#define VD55G1_REG_EXPOSURE_INSTANCE(ctx) \
-	CCI_REG32_LE(0x52D + VD55G1_CTX_OFFSET * (ctx))
 
 #define VD55G1_WIDTH					804
 #define VD55G1_HEIGHT					704
@@ -142,6 +85,122 @@ enum vd55g1_color_version {
 	VD55G1_COLOR_VERSION_BAYER,
 };
 
+enum vd55g1_reg_id {
+	REG_MODEL_ID,
+	REG_COLOR_VERSION,
+	REG_REVISION,
+	REG_FWPATCH_START_ADDR,
+	REG_BOOT,
+	REG_STBY,
+	REG_STREAMING,
+	REG_EXT_CLOCK,
+	REG_LINE_LENGTH,
+	REG_ORIENTATION,
+	REG_FORMAT_CTRL,
+	REG_OIF_CTRL,
+	REG_OIF_IMG_CTRL,
+	REG_MIPI_DATA_RATE,
+
+	/* Model-specific */
+	REG_SYSTEM_FSM,
+	REG_ISL_ENABLE,
+	REG_FWPATCH_REVISION,
+	REG_PATGEN_CTRL,
+	REG_READOUT_CTRL,
+	REG_DUSTER_CTRL,
+	REG_AE_TARGET_PERCENTAGE,
+	REG_MANUAL_ANALOG_GAIN,
+	REG_MANUAL_COARSE_EXPOSURE,
+	REG_MANUAL_DIGITAL_GAIN_CH0,
+	REG_MANUAL_DIGITAL_GAIN_CH1,
+	REG_MANUAL_DIGITAL_GAIN_CH2,
+	REG_MANUAL_DIGITAL_GAIN_CH3,
+	REG_APPLIED_COARSE_EXPOSURE,
+	REG_APPLIED_ANALOG_GAIN,
+	REG_APPLIED_DIGITAL_GAIN,
+	REG_AE_FORCE_COLDSTART,
+	REG_AE_COLDSTART_EXPOSURE_US,
+	REG_AE_COLDSTART_COARSE_EXPOSURE,
+	/* HDR-specific */
+	REG_NEXT_CTX,
+	REG_EXPOSURE_USE_CASES,
+	REG_EXPOSURE_MAX_COARSE,
+	REG_CTX_REPEAT_COUNT_CTX0,
+	REG_CTX_REPEAT_COUNT_CTX1,
+
+	/* Context-specific register bases */
+	REG_CTX_STRIDE, /* Not a real register, stores the context bank offset */
+	REG_CTX_REPEAT_COUNT,
+	REG_CTX_EXP_MODE,
+	REG_CTX_FRAME_LENGTH,
+	REG_CTX_X_START,
+	REG_CTX_X_WIDTH,
+	REG_CTX_X_END,
+	REG_CTX_Y_START,
+	REG_CTX_Y_HEIGHT,
+	REG_CTX_Y_END,
+	REG_CTX_GPIO_0_CTRL,
+	/* HDR-specific */
+	REG_CTX_VT_MODE,
+	REG_CTX_MASK_FRAME_CTRL,
+	REG_CTX_EXPOSURE_INSTANCE,
+
+	REG_MAX_INDEX /* Keeps track of enum size */
+};
+
+static const int vd55g1_reg_map[REG_MAX_INDEX] = {
+	[REG_MODEL_ID] = CCI_REG32_LE(0x0000),
+	[REG_COLOR_VERSION] = CCI_REG32_LE(0x0670),
+	[REG_REVISION] = CCI_REG16_LE(0x0004),
+	[REG_FWPATCH_START_ADDR] = CCI_REG8(0x2000),
+	[REG_BOOT] = CCI_REG8(0x0200),
+	[REG_STBY] = CCI_REG8(0x0201),
+	[REG_STREAMING] = CCI_REG8(0x0202),
+	[REG_EXT_CLOCK] = CCI_REG32_LE(0x0220),
+	[REG_LINE_LENGTH] = CCI_REG16_LE(0x0300),
+	[REG_ORIENTATION] = CCI_REG8(0x0302),
+	[REG_FORMAT_CTRL] = CCI_REG8(0x030a),
+	[REG_OIF_CTRL] = CCI_REG16_LE(0x030c),
+	[REG_OIF_IMG_CTRL] = CCI_REG8(0x030f),
+	[REG_MIPI_DATA_RATE] = CCI_REG32_LE(0x0224),
+	[REG_SYSTEM_FSM] = CCI_REG8(0x001c),
+	[REG_ISL_ENABLE] = CCI_REG8(0x0326),
+	[REG_FWPATCH_REVISION] = CCI_REG16_LE(0x0012),
+	[REG_PATGEN_CTRL] = CCI_REG16_LE(0x0304),
+	[REG_READOUT_CTRL] = CCI_REG8(0x057e),
+	[REG_DUSTER_CTRL] = CCI_REG8(0x03ae),
+	[REG_AE_TARGET_PERCENTAGE] = CCI_REG8(0x0486),
+	[REG_MANUAL_ANALOG_GAIN] = CCI_REG8(0x0501),
+	[REG_MANUAL_COARSE_EXPOSURE] = CCI_REG16_LE(0x0502),
+	[REG_MANUAL_DIGITAL_GAIN_CH0] = CCI_REG16_LE(0x0504),
+	[REG_MANUAL_DIGITAL_GAIN_CH1] = CCI_REG16_LE(0x0506),
+	[REG_MANUAL_DIGITAL_GAIN_CH2] = CCI_REG16_LE(0x0508),
+	[REG_MANUAL_DIGITAL_GAIN_CH3] = CCI_REG16_LE(0x050a),
+	[REG_APPLIED_COARSE_EXPOSURE] = CCI_REG16_LE(0x00e8),
+	[REG_APPLIED_ANALOG_GAIN] = CCI_REG16_LE(0x00ea),
+	[REG_APPLIED_DIGITAL_GAIN] = CCI_REG16_LE(0x00ec),
+	[REG_AE_FORCE_COLDSTART] = CCI_REG8(0x0308),
+	[REG_AE_COLDSTART_EXPOSURE_US] = CCI_REG32_LE(0x0374),
+	[REG_NEXT_CTX] = CCI_REG16_LE(0x03e4),
+	[REG_EXPOSURE_USE_CASES] = CCI_REG8(0x0312),
+	[REG_EXPOSURE_MAX_COARSE] = CCI_REG16_LE(0x0372),
+	[REG_CTX_REPEAT_COUNT_CTX0] = CCI_REG16_LE(0x03dc),
+	[REG_CTX_REPEAT_COUNT_CTX1] = CCI_REG16_LE(0x03de),
+
+	/* Context properties */
+	[REG_CTX_STRIDE] = 0x50,
+	[REG_CTX_EXP_MODE] = CCI_REG8(0x0500),
+	[REG_CTX_FRAME_LENGTH] = CCI_REG32_LE(0x050c),
+	[REG_CTX_X_START] = CCI_REG16_LE(0x0514),
+	[REG_CTX_X_WIDTH] = CCI_REG16_LE(0x0516),
+	[REG_CTX_Y_START] = CCI_REG16_LE(0x0510),
+	[REG_CTX_Y_HEIGHT] = CCI_REG16_LE(0x0512),
+	[REG_CTX_GPIO_0_CTRL] = CCI_REG8(0x051d),
+	[REG_CTX_VT_MODE] = CCI_REG8(0x0536),
+	[REG_CTX_MASK_FRAME_CTRL] = CCI_REG8(0x0537),
+	[REG_CTX_EXPOSURE_INSTANCE] = CCI_REG32_LE(0x052d),
+};
+
 static const u8 vd55g1_patch_array[] = {
 	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,
 	0xf0, 0x01, 0x42, 0x00, 0xe6, 0x01, 0x42, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -551,6 +610,7 @@ struct vd55g1_model {
 	const char *name;
 	unsigned int id;
 	enum vd55g1_color_version color;
+	const int *reg_map;
 	const struct vd55g1_revision *revisions;
 	u16 num_revisions;
 	bool bayer;
@@ -590,6 +650,7 @@ static const struct vd55g1_model vd55g1_model = {
 	.name = "vd55g1",
 	.id = VD55G1_MODEL_ID_2,
 	.color = VD55G1_COLOR_VERSION_MONO,
+	.reg_map = vd55g1_reg_map,
 	.revisions = vd55g1_revisions,
 	.num_revisions = ARRAY_SIZE(vd55g1_revisions),
 	.bayer = false,
@@ -599,6 +660,7 @@ static const struct vd55g1_model vd55g4_model = {
 	.name  = "vd55g4",
 	.id = VD55G1_MODEL_ID_3,
 	.color = VD55G1_COLOR_VERSION_MONO,
+	.reg_map = vd55g1_reg_map,
 	.revisions = vd55g4_revisions,
 	.num_revisions = ARRAY_SIZE(vd55g4_revisions),
 	.bayer = false,
@@ -608,6 +670,7 @@ static const struct vd55g1_model vd65g4_model = {
 	.name = "vd65g4",
 	.id = VD55G1_MODEL_ID_3,
 	.color = VD55G1_COLOR_VERSION_BAYER,
+	.reg_map = vd55g1_reg_map,
 	.revisions = vd65g4_revisions,
 	.num_revisions = ARRAY_SIZE(vd65g4_revisions),
 	.bayer = true,
@@ -786,33 +849,115 @@ static void vd55g1_get_frame_timings(struct vd55g1 *sensor,
 	timings->expo_max = timings->frame_length - VD55G1_EXPO_MAX_TERM;
 }
 
+static inline int vd55g1_get_ctx_addr(struct vd55g1 *sensor,
+				      enum vd55g1_reg_id reg, u8 ctx, u8 offset, u32 *addr)
+{
+	u32 base_addr;
+	u32 stride;
+	int ret = 0;
+
+	base_addr = sensor->model->reg_map[reg];
+
+	if (!base_addr) {
+		dev_dbg(sensor->dev,
+			"Register %d not supported on this variant\n", reg);
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	stride = sensor->model->reg_map[REG_CTX_STRIDE];
+
+	*addr = base_addr + ctx * stride + offset;
+
+out:
+	return ret;
+}
+
 #define vd55g1_read(sensor, reg, val, err) \
-	cci_read((sensor)->regmap, reg, val, err)
+	vd55g1_read_ctx(sensor, reg, 0, val, err)
 
 #define vd55g1_write(sensor, reg, val, err) \
-	cci_write((sensor)->regmap, reg, val, err)
+	vd55g1_write_ctx(sensor, reg, 0, val, err)
+
+#define vd55g1_read_ctx(sensor, reg, ctx, val, err) \
+	vd55g1_read_ctx_offset(sensor, reg, ctx, 0, val, err)
+
+#define vd55g1_write_ctx(sensor, reg, ctx, val, err) \
+	vd55g1_write_ctx_offset(sensor, reg, ctx, 0, val, err)
+
+static int vd55g1_read_ctx_offset(struct vd55g1 *sensor,
+				  enum vd55g1_reg_id reg, u8 ctx, u8 offset,
+				  u64 *val, int *err)
+{
+	u32 addr;
+	int ret;
+
+	if (err && *err)
+		return *err;
+
+	ret = vd55g1_get_ctx_addr(sensor, reg, ctx, offset, &addr);
+	if (ret)
+		goto out;
+
+	return cci_read(sensor->regmap, addr, val, err);
+
+out:
+	if (ret && err)
+		*err = ret;
+
+	return ret;
+}
+
+static int vd55g1_write_ctx_offset(struct vd55g1 *sensor,
+				   enum vd55g1_reg_id reg, u8 ctx, u8 offset,
+				   u32 val, int *err)
+{
+	u32 addr;
+	int ret;
+
+	if (err && *err)
+		return *err;
+
+	ret = vd55g1_get_ctx_addr(sensor, reg, ctx, offset, &addr);
+	if (ret)
+		goto out;
+
+	return cci_write(sensor->regmap, addr, val, err);
 
-static int vd55g1_write_array(struct vd55g1 *sensor, u32 reg, unsigned int len,
+out:
+	if (ret && err)
+		*err = ret;
+
+	return ret;
+}
+
+static int vd55g1_write_array(struct vd55g1 *sensor,
+			      enum vd55g1_reg_id reg, unsigned int len,
 			      const u8 *array, int *err)
 {
 	unsigned int chunk_sz = 1024;
 	unsigned int sz;
+	u32 addr;
 	int ret = 0;
 
 	if (err && *err)
 		return *err;
 
+	ret = vd55g1_get_ctx_addr(sensor, reg, 0, 0, &addr);
+	if (ret)
+		goto out;
+
 	/*
 	 * This loop isn't necessary but in certains conditions (platforms, cpu
 	 * load, etc.) it has been observed that the bulk write could timeout.
 	 */
 	while (len) {
 		sz = min(len, chunk_sz);
-		ret = regmap_bulk_write(sensor->regmap, reg, array, sz);
+		ret = regmap_bulk_write(sensor->regmap, addr, array, sz);
 		if (ret < 0)
 			goto out;
 		len -= sz;
-		reg += sz;
+		addr += sz;
 		array += sz;
 	}
 
@@ -823,19 +968,24 @@ static int vd55g1_write_array(struct vd55g1 *sensor, u32 reg, unsigned int len,
 	return ret;
 }
 
-static int vd55g1_poll_reg(struct vd55g1 *sensor, u32 reg, u8 poll_val,
-			   int *err)
+static int vd55g1_poll_reg(struct vd55g1 *sensor, enum vd55g1_reg_id reg, u8 poll_val, int *err)
 {
 	unsigned int val = 0;
+	u32 addr;
 	int ret;
 
 	if (err && *err)
 		return *err;
 
-	ret = regmap_read_poll_timeout(sensor->regmap, CCI_REG_ADDR(reg), val,
+	ret = vd55g1_get_ctx_addr(sensor, reg, 0, 0, &addr);
+	if (ret)
+		goto out;
+
+	ret = regmap_read_poll_timeout(sensor->regmap, CCI_REG_ADDR(addr), val,
 				       (val == poll_val), 2000,
 				       500 * USEC_PER_MSEC);
 
+out:
 	if (ret && err)
 		*err = ret;
 
@@ -844,7 +994,7 @@ static int vd55g1_poll_reg(struct vd55g1 *sensor, u32 reg, u8 poll_val,
 
 static int vd55g1_wait_state(struct vd55g1 *sensor, int state, int *err)
 {
-	return vd55g1_poll_reg(sensor, VD55G1_REG_SYSTEM_FSM, state, err);
+	return vd55g1_poll_reg(sensor, REG_SYSTEM_FSM, state, err);
 }
 
 static int vd55g1_prepare_clock_tree(struct vd55g1 *sensor)
@@ -914,8 +1064,8 @@ static int vd55g1_update_patgen(struct vd55g1 *sensor, u32 patgen_index)
 		duster = VD55G1_DUSTER_DISABLE;
 	}
 
-	vd55g1_write(sensor, VD55G1_REG_DUSTER_CTRL, duster, &ret);
-	vd55g1_write(sensor, VD55G1_REG_PATGEN_CTRL, reg, &ret);
+	vd55g1_write(sensor, REG_DUSTER_CTRL, duster, &ret);
+	vd55g1_write(sensor, REG_PATGEN_CTRL, reg, &ret);
 
 	return ret;
 }
@@ -927,32 +1077,33 @@ static int vd55g1_update_expo_cluster(struct vd55g1 *sensor, bool is_auto)
 	int ret = 0;
 
 	if (sensor->ae_ctrl->is_new)
-		vd55g1_write(sensor, VD55G1_REG_EXP_MODE(0), expo_state, &ret);
+		vd55g1_write_ctx(sensor, REG_CTX_EXP_MODE, 0, expo_state,
+				 &ret);
 
 	if (sensor->hdr_ctrl->val == VD55G1_HDR_SUB &&
 	    sensor->hdr_ctrl->is_new) {
-		vd55g1_write(sensor, VD55G1_REG_EXP_MODE(1), VD55G1_EXP_BYPASS,
-			     &ret);
+		vd55g1_write_ctx(sensor, REG_CTX_EXP_MODE, 1,
+				 VD55G1_EXP_BYPASS, &ret);
 		if (ret)
 			return ret;
 	}
 
 	if (!is_auto && sensor->expo_ctrl->is_new)
-		vd55g1_write(sensor, VD55G1_REG_MANUAL_COARSE_EXPOSURE,
+		vd55g1_write(sensor, REG_MANUAL_COARSE_EXPOSURE,
 			     sensor->expo_ctrl->val, &ret);
 
 	if (!is_auto && sensor->again_ctrl->is_new)
-		vd55g1_write(sensor, VD55G1_REG_MANUAL_ANALOG_GAIN,
+		vd55g1_write(sensor, REG_MANUAL_ANALOG_GAIN,
 			     sensor->again_ctrl->val, &ret);
 
 	if (!is_auto && sensor->dgain_ctrl->is_new) {
-		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH0,
+		vd55g1_write(sensor, REG_MANUAL_DIGITAL_GAIN_CH0,
 			     sensor->dgain_ctrl->val, &ret);
-		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH1,
+		vd55g1_write(sensor, REG_MANUAL_DIGITAL_GAIN_CH1,
 			     sensor->dgain_ctrl->val, &ret);
-		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH2,
+		vd55g1_write(sensor, REG_MANUAL_DIGITAL_GAIN_CH2,
 			     sensor->dgain_ctrl->val, &ret);
-		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN_CH3,
+		vd55g1_write(sensor, REG_MANUAL_DIGITAL_GAIN_CH3,
 			     sensor->dgain_ctrl->val, &ret);
 	}
 
@@ -967,7 +1118,8 @@ static int vd55g1_lock_exposure(struct vd55g1 *sensor, u32 lock_val)
 	int ret = 0;
 
 	if (sensor->ae_ctrl->val == V4L2_EXPOSURE_AUTO)
-		vd55g1_write(sensor, VD55G1_REG_EXP_MODE(0), expo_state, &ret);
+		vd55g1_write_ctx(sensor, REG_CTX_EXP_MODE, 0, expo_state,
+				 &ret);
 
 	return ret;
 }
@@ -979,10 +1131,9 @@ static int vd55g1_read_expo_cluster(struct vd55g1 *sensor)
 	u64 dgain = 0;
 	int ret = 0;
 
-	vd55g1_read(sensor, VD55G1_REG_APPLIED_COARSE_EXPOSURE, &exposure,
-		    &ret);
-	vd55g1_read(sensor, VD55G1_REG_APPLIED_ANALOG_GAIN, &again, &ret);
-	vd55g1_read(sensor, VD55G1_REG_APPLIED_DIGITAL_GAIN, &dgain, &ret);
+	vd55g1_read(sensor, REG_APPLIED_COARSE_EXPOSURE, &exposure, &ret);
+	vd55g1_read(sensor, REG_APPLIED_ANALOG_GAIN, &again, &ret);
+	vd55g1_read(sensor, REG_APPLIED_DIGITAL_GAIN, &dgain, &ret);
 	if (ret)
 		return ret;
 
@@ -999,9 +1150,10 @@ static int vd55g1_update_frame_length(struct vd55g1 *sensor,
 	int ret = 0;
 
 	if (sensor->hdr_ctrl->val == VD55G1_HDR_SUB)
-		vd55g1_write(sensor, VD55G1_REG_FRAME_LENGTH(1), frame_length,
-			     &ret);
-	vd55g1_write(sensor, VD55G1_REG_FRAME_LENGTH(0), frame_length, &ret);
+		vd55g1_write_ctx(sensor, REG_CTX_FRAME_LENGTH, 1,
+				 frame_length, &ret);
+	vd55g1_write_ctx(sensor, REG_CTX_FRAME_LENGTH, 0, frame_length,
+			 &ret);
 
 	return ret;
 }
@@ -1017,8 +1169,8 @@ static int vd55g1_update_exposure_target(struct vd55g1 *sensor, int index)
 	};
 	int exposure_target = index2exposure_target[index];
 
-	return vd55g1_write(sensor, VD55G1_REG_AE_TARGET_PERCENTAGE,
-			    exposure_target, NULL);
+	return vd55g1_write(sensor, REG_AE_TARGET_PERCENTAGE,
+			       exposure_target, NULL);
 }
 
 static int vd55g1_apply_cold_start(struct vd55g1 *sensor,
@@ -1039,8 +1191,9 @@ static int vd55g1_apply_cold_start(struct vd55g1 *sensor,
 			       line_time_us;
 	int ret = 0;
 
-	vd55g1_write(sensor, VD55G1_REG_AE_FORCE_COLDSTART, 1, &ret);
-	vd55g1_write(sensor, VD55G1_REG_AE_COLDSTART_EXP_TIME, expo_us, &ret);
+	vd55g1_write(sensor, REG_AE_FORCE_COLDSTART, 1, &ret);
+	vd55g1_write(sensor, REG_AE_COLDSTART_EXPOSURE_US, expo_us,
+		     &ret);
 
 	return ret;
 }
@@ -1065,38 +1218,40 @@ static int vd55g1_update_hdr_mode(struct vd55g1 *sensor)
 
 	switch (sensor->hdr_ctrl->val) {
 	case VD55G1_NO_HDR:
-		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_MAX_COARSE,
+		vd55g1_write(sensor, REG_EXPOSURE_MAX_COARSE,
 			     VD55G1_EXPOSURE_MAX_COARSE_DEF, &ret);
-		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_USE_CASES, 0, &ret);
-		vd55g1_write(sensor, VD55G1_REG_NEXT_CTX, 0x0, &ret);
+		vd55g1_write(sensor, REG_EXPOSURE_USE_CASES, 0, &ret);
+		vd55g1_write(sensor, REG_NEXT_CTX, 0x0, &ret);
 
-		vd55g1_write(sensor, VD55G1_REG_CTX_REPEAT_COUNT_CTX0, 0, &ret);
+		vd55g1_write(sensor, REG_CTX_REPEAT_COUNT_CTX0, 0, &ret);
 
-		vd55g1_write(sensor, VD55G1_REG_VT_MODE(0),
-			     VD55G1_VT_MODE_NORMAL, &ret);
-		vd55g1_write(sensor, VD55G1_REG_MASK_FRAME_CTRL(0),
-			     VD55G1_MASK_FRAME_CTRL_OUTPUT, &ret);
+		vd55g1_write_ctx(sensor, REG_CTX_VT_MODE, 0,
+				 VD55G1_VT_MODE_NORMAL, &ret);
+		vd55g1_write_ctx(sensor, REG_CTX_MASK_FRAME_CTRL, 0,
+				 VD55G1_MASK_FRAME_CTRL_OUTPUT, &ret);
 		break;
 	case VD55G1_HDR_SUB:
-		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_MAX_COARSE,
+		vd55g1_write(sensor, REG_EXPOSURE_MAX_COARSE,
 			     VD55G1_EXPOSURE_MAX_COARSE_SUB, &ret);
-		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_USE_CASES,
+		vd55g1_write(sensor, REG_EXPOSURE_USE_CASES,
 			     VD55G1_EXPOSURE_USE_CASES_MULTI_CONTEXT, &ret);
-		vd55g1_write(sensor, VD55G1_REG_NEXT_CTX, 0x0001, &ret);
-
-		vd55g1_write(sensor, VD55G1_REG_CTX_REPEAT_COUNT_CTX0, 1, &ret);
-		vd55g1_write(sensor, VD55G1_REG_CTX_REPEAT_COUNT_CTX1, 1, &ret);
-
-		vd55g1_write(sensor, VD55G1_REG_VT_MODE(0),
-			     VD55G1_VT_MODE_NORMAL, &ret);
-		vd55g1_write(sensor, VD55G1_REG_MASK_FRAME_CTRL(0),
-			     VD55G1_MASK_FRAME_CTRL_MASK, &ret);
-		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_INSTANCE(0), 0, &ret);
-		vd55g1_write(sensor, VD55G1_REG_VT_MODE(1),
-			     VD55G1_VT_MODE_SUBTRACTION, &ret);
-		vd55g1_write(sensor, VD55G1_REG_MASK_FRAME_CTRL(1),
-			     VD55G1_MASK_FRAME_CTRL_OUTPUT, &ret);
-		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_INSTANCE(1), 1, &ret);
+		vd55g1_write(sensor, REG_NEXT_CTX, 0x0001, &ret);
+
+		vd55g1_write(sensor, REG_CTX_REPEAT_COUNT_CTX0, 1, &ret);
+		vd55g1_write(sensor, REG_CTX_REPEAT_COUNT_CTX1, 1, &ret);
+
+		vd55g1_write_ctx(sensor, REG_CTX_VT_MODE, 0,
+				 VD55G1_VT_MODE_NORMAL, &ret);
+		vd55g1_write_ctx(sensor, REG_CTX_MASK_FRAME_CTRL, 0,
+				 VD55G1_MASK_FRAME_CTRL_MASK, &ret);
+		vd55g1_write_ctx(sensor, REG_CTX_EXPOSURE_INSTANCE, 0, 0,
+				 &ret);
+		vd55g1_write_ctx(sensor, REG_CTX_VT_MODE, 1,
+				 VD55G1_VT_MODE_SUBTRACTION, &ret);
+		vd55g1_write_ctx(sensor, REG_CTX_MASK_FRAME_CTRL, 1,
+				 VD55G1_MASK_FRAME_CTRL_OUTPUT, &ret);
+		vd55g1_write_ctx(sensor, REG_CTX_EXPOSURE_INSTANCE, 1, 1,
+				 &ret);
 		break;
 	default:
 		ret = -EINVAL;
@@ -1112,9 +1267,9 @@ static int vd55g1_set_framefmt(struct vd55g1 *sensor,
 	u8 binning;
 	int ret = 0;
 
-	vd55g1_write(sensor, VD55G1_REG_FORMAT_CTRL,
+	vd55g1_write(sensor, REG_FORMAT_CTRL,
 		     vd55g1_get_fmt_bpp(format->code), &ret);
-	vd55g1_write(sensor, VD55G1_REG_OIF_IMG_CTRL,
+	vd55g1_write(sensor, REG_OIF_IMG_CTRL,
 		     vd55g1_get_fmt_data_type(format->code), &ret);
 
 	switch (crop->width / format->width) {
@@ -1126,17 +1281,23 @@ static int vd55g1_set_framefmt(struct vd55g1 *sensor,
 		binning = VD55G1_READOUT_CTRL_BIN_MODE_DIGITAL_X2;
 		break;
 	}
-	vd55g1_write(sensor, VD55G1_REG_READOUT_CTRL, binning, &ret);
-
-	vd55g1_write(sensor, VD55G1_REG_X_START(0), crop->left, &ret);
-	vd55g1_write(sensor, VD55G1_REG_X_WIDTH(0), crop->width, &ret);
-	vd55g1_write(sensor, VD55G1_REG_Y_START(0), crop->top, &ret);
-	vd55g1_write(sensor, VD55G1_REG_Y_HEIGHT(0), crop->height, &ret);
-
-	vd55g1_write(sensor, VD55G1_REG_X_START(1), crop->left, &ret);
-	vd55g1_write(sensor, VD55G1_REG_X_WIDTH(1), crop->width, &ret);
-	vd55g1_write(sensor, VD55G1_REG_Y_START(1), crop->top, &ret);
-	vd55g1_write(sensor, VD55G1_REG_Y_HEIGHT(1), crop->height, &ret);
+	vd55g1_write(sensor, REG_READOUT_CTRL, binning, &ret);
+
+	vd55g1_write_ctx(sensor, REG_CTX_X_START, 0, crop->left, &ret);
+	vd55g1_write_ctx(sensor, REG_CTX_Y_START, 0, crop->top, &ret);
+	vd55g1_write_ctx(sensor, REG_CTX_X_WIDTH, 0,
+			 crop->width, &ret);
+	vd55g1_write_ctx(sensor, REG_CTX_Y_HEIGHT, 0,
+			 crop->height, &ret);
+
+	vd55g1_write_ctx(sensor, REG_CTX_X_START, 1,
+			 crop->left, &ret);
+	vd55g1_write_ctx(sensor, REG_CTX_Y_START, 1,
+			 crop->top, &ret);
+	vd55g1_write_ctx(sensor, REG_CTX_X_WIDTH, 1,
+			 crop->width, &ret);
+	vd55g1_write_ctx(sensor, REG_CTX_Y_HEIGHT, 1,
+			 crop->height, &ret);
 
 	return ret;
 }
@@ -1155,14 +1316,15 @@ static int vd55g1_update_gpios(struct vd55g1 *sensor, unsigned long gpio_mask)
 			gpio_val = VD55G1_GPIO_MODE_IN;
 			if (sensor->hdr_ctrl->val == VD55G1_HDR_SUB) {
 				/* Make its context 1 counterpart strobe too */
-				vd55g1_write(sensor,
-					     VD55G1_REG_GPIO_0_CTRL(1) + io,
-					     gpio_val, &ret);
+				vd55g1_write_ctx_offset(sensor,
+							REG_CTX_GPIO_0_CTRL,
+							1, io,
+							gpio_val, &ret);
 			}
 		}
 
-		ret = vd55g1_write(sensor, VD55G1_REG_GPIO_0_CTRL(0) + io,
-				   gpio_val, &ret);
+		ret = vd55g1_write_ctx_offset(sensor, REG_CTX_GPIO_0_CTRL, 0, io,
+					      gpio_val, &ret);
 	}
 
 	return ret;
@@ -1170,8 +1332,8 @@ static int vd55g1_update_gpios(struct vd55g1 *sensor, unsigned long gpio_mask)
 
 static int vd55g1_ro_ctrls_setup(struct vd55g1 *sensor, struct v4l2_rect *crop)
 {
-	return vd55g1_write(sensor, VD55G1_REG_LINE_LENGTH,
-			    crop->width + sensor->hblank_ctrl->val, NULL);
+	return vd55g1_write(sensor, REG_LINE_LENGTH,
+			   crop->width + sensor->hblank_ctrl->val, NULL);
 }
 
 static void vd55g1_grab_ctrls(struct vd55g1 *sensor, bool enable)
@@ -1199,10 +1361,9 @@ static int vd55g1_enable_streams(struct v4l2_subdev *sd,
 		return ret;
 
 	/* Configure output */
-	vd55g1_write(sensor, VD55G1_REG_MIPI_DATA_RATE,
-		     sensor->mipi_rate, &ret);
-	vd55g1_write(sensor, VD55G1_REG_OIF_CTRL, sensor->oif_ctrl, &ret);
-	vd55g1_write(sensor, VD55G1_REG_ISL_ENABLE, 0, &ret);
+	vd55g1_write(sensor, REG_MIPI_DATA_RATE, sensor->mipi_rate, &ret);
+	vd55g1_write(sensor, REG_OIF_CTRL, sensor->oif_ctrl, &ret);
+	vd55g1_write(sensor, REG_ISL_ENABLE, 0, &ret);
 	if (ret)
 		goto err_rpm_put;
 
@@ -1230,8 +1391,8 @@ static int vd55g1_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 
 	/* Start streaming */
-	vd55g1_write(sensor, VD55G1_REG_STBY, VD55G1_STBY_START_STREAM, &ret);
-	vd55g1_poll_reg(sensor, VD55G1_REG_STBY, 0, &ret);
+	vd55g1_write(sensor, REG_STBY, VD55G1_STBY_START_STREAM, &ret);
+	vd55g1_poll_reg(sensor, REG_STBY, 0, &ret);
 	vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_STREAMING, &ret);
 	if (ret)
 		goto err_rpm_put;
@@ -1255,9 +1416,9 @@ static int vd55g1_disable_streams(struct v4l2_subdev *sd,
 	/* Retrieve Expo cluster to enable coldstart of AE */
 	ret = vd55g1_read_expo_cluster(sensor);
 
-	vd55g1_write(sensor, VD55G1_REG_STREAMING, VD55G1_STREAMING_STOP_STREAM,
+	vd55g1_write(sensor, REG_STREAMING, VD55G1_STREAMING_STOP_STREAM,
 		     &ret);
-	vd55g1_poll_reg(sensor, VD55G1_REG_STREAMING, 0, &ret);
+	vd55g1_poll_reg(sensor, REG_STREAMING, 0, &ret);
 	vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_SW_STBY, &ret);
 
 	if (ret)
@@ -1277,12 +1438,12 @@ static int vd55g1_patch(struct vd55g1 *sensor)
 	int ret = 0;
 
 	if (sensor->revision->needs_patch) {
-		vd55g1_write_array(sensor, VD55G1_REG_FWPATCH_START_ADDR,
+		vd55g1_write_array(sensor, REG_FWPATCH_START_ADDR,
 				   fw->size, fw->data, &ret);
-		vd55g1_write(sensor, VD55G1_REG_BOOT,
+		vd55g1_write(sensor, REG_BOOT,
 			     VD55G1_BOOT_PATCH_AND_BOOT, &ret);
-		vd55g1_poll_reg(sensor, VD55G1_REG_BOOT, 0, &ret);
-		vd55g1_read(sensor, VD55G1_REG_FWPATCH_REVISION, &patch, &ret);
+		vd55g1_poll_reg(sensor, REG_BOOT, 0, &ret);
+		vd55g1_read(sensor, REG_FWPATCH_REVISION, &patch, &ret);
 		if (ret) {
 			dev_dbg(sensor->dev, "Failed to apply patch\n");
 			return ret;
@@ -1298,8 +1459,8 @@ static int vd55g1_patch(struct vd55g1 *sensor)
 			(u8)(patch >> 8), (u8)(patch & 0xff));
 
 	} else {
-		vd55g1_write(sensor, VD55G1_REG_BOOT, VD55G1_BOOT_BOOT, &ret);
-		vd55g1_poll_reg(sensor, VD55G1_REG_BOOT, 0, &ret);
+		vd55g1_write(sensor, REG_BOOT, VD55G1_BOOT_BOOT, &ret);
+		vd55g1_poll_reg(sensor, REG_BOOT, 0, &ret);
 		if (ret) {
 			dev_dbg(sensor->dev, "Failed to boot\n");
 			return ret;
@@ -1587,7 +1748,7 @@ static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_HFLIP:
-		ret = vd55g1_write(sensor, VD55G1_REG_ORIENTATION,
+		ret = vd55g1_write(sensor, REG_ORIENTATION,
 				   sensor->hflip_ctrl->val |
 					   (sensor->vflip_ctrl->val << 1),
 				   NULL);
@@ -1762,9 +1923,9 @@ static int vd55g1_detect(struct vd55g1 *sensor)
 	u64 color, id, rev;
 	int ret = 0;
 
-	vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, &ret);
-	vd55g1_read(sensor, VD55G1_REG_REVISION, &rev, &ret);
-	vd55g1_read(sensor, VD55G1_REG_COLOR_VERSION, &color, &ret);
+	vd55g1_read(sensor, REG_MODEL_ID, &id, &ret);
+	vd55g1_read(sensor, REG_REVISION, &rev, &ret);
+	vd55g1_read(sensor, REG_COLOR_VERSION, &color, &ret);
 	if (ret) {
 		dev_dbg(sensor->dev,
 			"Failed to read sensor model: %d\n", ret);
@@ -1825,7 +1986,7 @@ static int vd55g1_power_on(struct vd55g1 *sensor)
 		goto disable_clock;
 
 	/* Setup clock now to advance through system FSM states */
-	vd55g1_write(sensor, VD55G1_REG_EXT_CLOCK, sensor->xclk_freq, &ret);
+	vd55g1_write(sensor, REG_EXT_CLOCK, sensor->xclk_freq, &ret);
 	if (ret) {
 		dev_dbg(sensor->dev,
 			"Failed to write external clock frequency: %d\n",
-- 
2.55.0

