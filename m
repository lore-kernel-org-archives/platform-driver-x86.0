Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40D431AF2D;
	Fri, 18 Sep 2026 22:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770089; cv=none; b=Ja3jwpNi0CH/1rTtPexUyn0sv2zTnSF5uXqrshvbJHqEovt16ql72wi3lRnKM8xp5Vm0DShjEXNJWvPllfCxGsNElKZJT1jL+XZBYyLQgqTjgLBKuF+kswAYZ8wwZCU16GwVHdWNBmo7bNP26hNjapV1H1FCTUXr44oo8T8C/bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770089; c=relaxed/simple;
	bh=6ZJ+5HgZLIQfLXw6QmMkGKzCGyrjBuc19HGNQpdMdtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dlrmy2o+0ivLVpXzPlGgzf98m6EzEb4igGdQi2RePN3JiFuaoisk/MNDnhsRhW4Qw/nvuQG5CJvzxNWLyOdbKeD+a9Qa4L7vYGunRuIbB2pKsrvNNqWUlzXg0U6+Nqk9iCgNAr0MHeaiARYjBbxqk4LfZSvTlBF5wCBTjAuTm0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=GdfCwoBS; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="GdfCwoBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789769900;
	bh=6ZJ+5HgZLIQfLXw6QmMkGKzCGyrjBuc19HGNQpdMdtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GdfCwoBS44QwILr9MnAs9o2q4D/1V0KNEJHpConJAZmv9gnC+ZStFTWz5t1zIvBuW
	 YKQarw+9F3Umfd4fKaaHkQ8/zOZ+aEOeXodXUmbgRoZGCp0H3hAwQE71aI0jmz3vSl
	 PGzq4/EKtMyorVImXDE7s76v/AUbgXQlxKkxs0CspeKATHenQ5S+Bd+tVnxf/u0bA2
	 iwUP6bpnnJ7SKnLqgeQpOV4LkTMVw4Wb2P528fNIzP+TmV+D/AzMXcysTCA0d4J6ZF
	 bJgbWLROBppkrbocsjIoT4Tn5XZ6syZ2IFcFjjnN2Lu8kUSSPa7oab4zeiBEs9i8eG
	 ecolzaO8suYGw==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id A4BFA2012E;
	Fri, 18 Sep 2026 22:18:19 +0000 (UTC)
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
Subject: [PATCH 09/11] media: i2c: st-vd55g1: Abstract sensor models, revisions, and features
Date: Fri, 18 Sep 2026 18:17:03 -0400
Message-ID: <20260918221705.323510-10-pm@petermarshall.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918221705.323510-1-pm@petermarshall.ca>
References: <20260918221705.323510-1-pm@petermarshall.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store a reference to the requested model struct in the client data
early during probe. This lets init steps know what sensor model we're
expecting even before it gets verified in detect().

Reintroduce the chip revision check that was lost during a restructure
in commit 7a1e5239ae63 ("media: i2c: vd55g1: Add support for vd55g4")
to prevent a firmware patch mismatch. Pass a list of supported revisions
and their required patch in the model struct. Skip check for vd55g4
where the revisions are unknown.

Break up the checks in detect() to report exactly which identifier
field had an unexpected value. Bail out on the first mismatch instead of
trying to detect what other supported chip it may represent.

Replace feature gating based on the color support code with a boolean
flag.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 drivers/media/i2c/vd55g1.c | 183 ++++++++++++++++++++++++-------------
 1 file changed, 120 insertions(+), 63 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 1776f5ec6a7d..24bc4a4dc0ac 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -29,6 +29,7 @@
 
 /* Register Map */
 #define VD55G1_REG_MODEL_ID				CCI_REG32_LE(0x0000)
+#define VD55G1_REG_REVISION				CCI_REG16_LE(0x0004)
 #define VD55G1_REG_COLOR_VERSION			CCI_REG32_LE(0x0670)
 #define VD55G1_REG_FWPATCH_REVISION			CCI_REG16_LE(0x0012)
 #define VD55G1_REG_FWPATCH_START_ADDR			CCI_REG8(0x2000)
@@ -126,8 +127,6 @@
 #define VD55G1_FRAME_LENGTH_DEF				1860 /* 60 fps */
 #define VD55G1_MIPI_MARGIN				900
 #define VD55G1_CTX_OFFSET				0x50
-#define VD55G1_FWPATCH_REVISION_MAJOR			2
-#define VD55G1_FWPATCH_REVISION_MINOR			9
 #define VD55G1_XCLK_FREQ_MIN				(6 * HZ_PER_MHZ)
 #define VD55G1_XCLK_FREQ_MAX				(27 * HZ_PER_MHZ)
 #define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
@@ -143,30 +142,6 @@ enum vd55g1_color_version {
 	VD55G1_COLOR_VERSION_BAYER,
 };
 
-struct vd55g1_version {
-	char *name;
-	enum vd55g1_model_id id;
-	enum vd55g1_color_version color;
-};
-
-static const struct vd55g1_version vd55g1_versions[] = {
-	{
-		.name  = "vd55g1",
-		.id    = VD55G1_MODEL_ID_2,
-		.color = VD55G1_COLOR_VERSION_MONO,
-	},
-	{
-		.name  = "vd55g4",
-		.id    = VD55G1_MODEL_ID_3,
-		.color = VD55G1_COLOR_VERSION_MONO,
-	},
-	{
-		.name  = "vd65g4",
-		.id    = VD55G1_MODEL_ID_3,
-		.color = VD55G1_COLOR_VERSION_BAYER,
-	},
-};
-
 static const u8 vd55g1_patch_array[] = {
 	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,
 	0xf0, 0x01, 0x42, 0x00, 0xe6, 0x01, 0x42, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -564,15 +539,90 @@ struct vd55g1_frame_timings {
 	u16 expo_max;
 };
 
+#define VD55G1_REVISION_ANY 0
+
+struct vd55g1_revision {
+	u64 id;
+	bool needs_patch;
+	const struct vd55g1_firmware *builtin_fw;
+};
+
+struct vd55g1_model {
+	const char *name;
+	unsigned int id;
+	enum vd55g1_color_version color;
+	const struct vd55g1_revision *revisions;
+	u16 num_revisions;
+	bool bayer;
+};
+
+struct vd55g1_firmware {
+	size_t size;
+	const u8 *data;
+	u8 v_major;
+	u8 v_minor;
+};
+
+static const struct vd55g1_firmware vd55g1_builtin_fw = {
+	.data = vd55g1_patch_array,
+	.size = ARRAY_SIZE(vd55g1_patch_array),
+	.v_major = 2,
+	.v_minor = 9,
+};
+
+static const struct vd55g1_revision vd55g1_revisions[] = {
+	{
+		.id = 0x2020,
+		.needs_patch = true,
+		.builtin_fw = &vd55g1_builtin_fw
+	},
+};
+
+static const struct vd55g1_revision vd55g4_revisions[] = {
+	{ .id = VD55G1_REVISION_ANY, .needs_patch = false },
+};
+
+static const struct vd55g1_revision vd65g4_revisions[] = {
+	{ .id = 0x3030, .needs_patch = false },
+};
+
+static const struct vd55g1_model vd55g1_model = {
+	.name = "vd55g1",
+	.id = VD55G1_MODEL_ID_2,
+	.color = VD55G1_COLOR_VERSION_MONO,
+	.revisions = vd55g1_revisions,
+	.num_revisions = ARRAY_SIZE(vd55g1_revisions),
+	.bayer = false,
+};
+
+static const struct vd55g1_model vd55g4_model = {
+	.name  = "vd55g4",
+	.id = VD55G1_MODEL_ID_3,
+	.color = VD55G1_COLOR_VERSION_MONO,
+	.revisions = vd55g4_revisions,
+	.num_revisions = ARRAY_SIZE(vd55g4_revisions),
+	.bayer = false,
+};
+
+static const struct vd55g1_model vd65g4_model = {
+	.name = "vd65g4",
+	.id = VD55G1_MODEL_ID_3,
+	.color = VD55G1_COLOR_VERSION_BAYER,
+	.revisions = vd65g4_revisions,
+	.num_revisions = ARRAY_SIZE(vd65g4_revisions),
+	.bayer = true,
+};
+
 struct vd55g1 {
 	struct device *dev;
-	const struct vd55g1_version *version;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(vd55g1_supply_name)];
 	struct gpio_desc *reset_gpio;
 	struct clk *xclk;
 	struct regmap *regmap;
+	const struct vd55g1_model *model;
+	const struct vd55g1_revision *revision;
 	u32 xclk_freq;
 	u16 oif_ctrl;
 	u8 gpios[VD55G1_NB_GPIOS];
@@ -660,7 +710,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
 	u32 fallback_code;
 	unsigned int i, j;
 
-	if (sensor->version->color == VD55G1_COLOR_VERSION_MONO) {
+	if (!sensor->model->bayer) {
 		fallback_code = vd55g1_mbus_formats_mono[0];
 		for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_formats_mono); i++)
 			if (vd55g1_mbus_formats_mono[i] == code)
@@ -1222,28 +1272,25 @@ static int vd55g1_disable_streams(struct v4l2_subdev *sd,
 
 static int vd55g1_patch(struct vd55g1 *sensor)
 {
+	const struct vd55g1_firmware *fw = sensor->revision->builtin_fw;
 	u64 patch;
 	int ret = 0;
 
-	/* Version 2 needs a patch while version 3 does not */
-	if (sensor->version->id == VD55G1_MODEL_ID_2) {
+	if (sensor->revision->needs_patch) {
 		vd55g1_write_array(sensor, VD55G1_REG_FWPATCH_START_ADDR,
-				   sizeof(vd55g1_patch_array),
-				   vd55g1_patch_array, &ret);
+				   fw->size, fw->data, &ret);
 		vd55g1_write(sensor, VD55G1_REG_BOOT,
 			     VD55G1_BOOT_PATCH_AND_BOOT, &ret);
 		vd55g1_poll_reg(sensor, VD55G1_REG_BOOT, 0, &ret);
+		vd55g1_read(sensor, VD55G1_REG_FWPATCH_REVISION, &patch, &ret);
 		if (ret) {
 			dev_dbg(sensor->dev, "Failed to apply patch\n");
 			return ret;
 		}
 
-		vd55g1_read(sensor, VD55G1_REG_FWPATCH_REVISION, &patch, &ret);
-		if (patch != (VD55G1_FWPATCH_REVISION_MAJOR << 8) +
-		    VD55G1_FWPATCH_REVISION_MINOR) {
+		if (patch != (fw->v_major << 8) + fw->v_minor) {
 			dev_dbg(sensor->dev, "Bad patch version expected %d.%d got %d.%d\n",
-				VD55G1_FWPATCH_REVISION_MAJOR,
-				VD55G1_FWPATCH_REVISION_MINOR,
+				fw->v_major, fw->v_minor,
 				(u8)(patch >> 8), (u8)(patch & 0xff));
 			return -ENODEV;
 		}
@@ -1299,7 +1346,7 @@ static int vd55g1_enum_mbus_code(struct v4l2_subdev *sd,
 	struct vd55g1 *sensor = to_vd55g1(sd);
 	u32 base_code;
 
-	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER) {
+	if (!sensor->model->bayer) {
 		if (code->index >= ARRAY_SIZE(vd55g1_mbus_formats_mono))
 			return -EINVAL;
 		base_code = vd55g1_mbus_formats_mono[code->index];
@@ -1408,7 +1455,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
+	if (!sensor->model->bayer)
 		code = vd55g1_mbus_formats_mono[0];
 	else
 		code = vd55g1_mbus_formats_bayer[0][0];
@@ -1693,28 +1740,30 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
 	return ret;
 }
 
-static const struct vd55g1_version *
-vd55g1_get_version(enum vd55g1_model_id id,
-		   enum vd55g1_color_version color)
+static int vd55g1_match_revision(struct vd55g1 *sensor, u64 rev)
 {
-	for (unsigned int i = 0; i < ARRAY_SIZE(vd55g1_versions); i++) {
-		if (vd55g1_versions[i].id == id &&
-		    vd55g1_versions[i].color == color)
-			return &vd55g1_versions[i];
+	const struct vd55g1_revision *revision;
+
+	for (int i = 0; i < sensor->model->num_revisions; i++) {
+		revision = &sensor->model->revisions[i];
+
+		if (revision->id == rev ||
+		    revision->id == VD55G1_REVISION_ANY) {
+			sensor->revision = revision;
+			return 0;
+		}
 	}
 
-	return NULL;
+	return -ENOENT;
 }
 
 static int vd55g1_detect(struct vd55g1 *sensor)
 {
-	const struct vd55g1_version *dt_version =
-		device_get_match_data(sensor->dev);
-	const struct vd55g1_version *version;
-	u64 color, id;
+	u64 color, id, rev;
 	int ret = 0;
 
 	vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, &ret);
+	vd55g1_read(sensor, VD55G1_REG_REVISION, &rev, &ret);
 	vd55g1_read(sensor, VD55G1_REG_COLOR_VERSION, &color, &ret);
 	if (ret) {
 		dev_dbg(sensor->dev,
@@ -1722,20 +1771,26 @@ static int vd55g1_detect(struct vd55g1 *sensor)
 		return ret;
 	}
 
-	version = vd55g1_get_version(id, color);
-	if (!version) {
-		dev_dbg(sensor->dev, "Unsupported sensor version, expected %s\n",
-			dt_version->name);
+	if (id != sensor->model->id) {
+		dev_dbg(sensor->dev,
+			"Expected %s (0x%x), but detected mismatched sensor id 0x%x\n",
+			sensor->model->name, (u32)sensor->model->id, (u32)id);
 		return -ENODEV;
 	}
-	if (version->id != dt_version->id ||
-	    version->color != dt_version->color) {
-		dev_dbg(sensor->dev, "Probed sensor version %s and device tree definition %s mismatch",
-			version->name, dt_version->name);
+	if (color != sensor->model->color) {
+		dev_dbg(sensor->dev,
+			"Expected %s (0x%x), but detected mismatched color version 0x%x\n",
+			sensor->model->name, (u32)sensor->model->color, (u32)color);
 		return -ENODEV;
 	}
 
-	sensor->version = version;
+	ret = vd55g1_match_revision(sensor, rev);
+	if (ret == -ENOENT) {
+		dev_dbg(sensor->dev,
+			"Unsupported sensor revision 0x%x, expected %s\n",
+			(u16)rev, sensor->model->name);
+		return -ENODEV;
+	}
 
 	return 0;
 }
@@ -2033,6 +2088,8 @@ static int vd55g1_probe(struct i2c_client *client)
 		return -ENOMEM;
 	sensor->dev = &client->dev;
 
+	sensor->model = device_get_match_data(dev);
+
 	v4l2_i2c_subdev_init(&sensor->sd, client, &vd55g1_subdev_ops);
 
 	ret = vd55g1_parse_dt(sensor);
@@ -2118,9 +2175,9 @@ static void vd55g1_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id vd55g1_dt_ids[] = {
-	{ .compatible = "st,vd55g1", .data = (void *)&vd55g1_versions[0] },
-	{ .compatible = "st,vd55g4", .data = (void *)&vd55g1_versions[1] },
-	{ .compatible = "st,vd65g4", .data = (void *)&vd55g1_versions[2] },
+	{ .compatible = "st,vd55g1", .data = &vd55g1_model },
+	{ .compatible = "st,vd55g4", .data = &vd55g4_model },
+	{ .compatible = "st,vd65g4", .data = &vd65g4_model },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
-- 
2.55.0

