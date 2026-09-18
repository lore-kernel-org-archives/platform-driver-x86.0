Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101693B9DA6;
	Fri, 18 Sep 2026 22:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770066; cv=none; b=mT/ER5QnscT7AohUBdqPgsBa9YbGLFBa3f3TXFB1P448SnejeJKYtalpXuTbNkLk92yxRwUZwD6N6sp35SVH5be8dUXf4M/0JFNylL5884YVgpuOjzcnG+4G4LfFnDTQTFy95v9Q7/V3xNI1VdhGt6JxenAF+Bpyy7mOqB6Xwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770066; c=relaxed/simple;
	bh=BAbop81CgXTt8eoslTk2OohM0UMLqSPnbkhwsF2dlG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGG4r9JSvUnttydifIY1Tm6oRyWH59Ui6b1VEHrcJDojqTIvXQJV+gXL3KGPcPqvFEkiQeFViMuzyij8FFUjTv19UoR9nQdd+ufHLQYWO6fy6hq+PCL6C/2E8IF94EathT35bZ3g0LIskDTzXOQhA2qUmW2vhpX6DebXJm4Mpn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=GE6xfrb8; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="GE6xfrb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789769898;
	bh=BAbop81CgXTt8eoslTk2OohM0UMLqSPnbkhwsF2dlG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GE6xfrb8qyXDnC6PyfXL0XxHblAKmICwa6ObsyfyYJu0s90uFMC6A7wE0uNmlGuqu
	 skoX6N38SY6hEzSCI1jZ5q5zgoE6qCLf1F8faTuCT3/1yOgfzLKb2LWpmyTF/+9KxK
	 udruGlEfLWn1rfEeLtlc91G/hKdfi4oAWz4rQroeuM2BSYnDKxRNe6CyNq5BHD2/B2
	 a2m4aI6xNeKhIR6xh9CUImC+f3HdrRP/znODKDplTSuP/6QWfWITjxONMVTaFC7G+J
	 oZRVcdj4qIdaX1igGZycJdD2I4c1qIYuaA9DOmd+/uZDi+k7PwIjinrqc8dkDasAt2
	 kbgbseHU8Psyw==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id 1E40B2012C;
	Fri, 18 Sep 2026 22:18:18 +0000 (UTC)
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
Subject: [PATCH 08/11] media: i2c: st-vd55g1: Unify frame timing calculations
Date: Fri, 18 Sep 2026 18:17:02 -0400
Message-ID: <20260918221705.323510-9-pm@petermarshall.ca>
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

The calculation of frame length and maximum exposure lines is currently
duplicated both when changing to a new format and when adjusting vblank
time. Introduce a reusable function writing calculated frame time and
exposure limit to an info struct.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 drivers/media/i2c/vd55g1.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index f54f8ba71284..1776f5ec6a7d 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -559,6 +559,11 @@ struct vd55g1_vblank_limits {
 	u16 max;
 };
 
+struct vd55g1_frame_timings {
+	u16 frame_length;
+	u16 expo_max;
+};
+
 struct vd55g1 {
 	struct device *dev;
 	const struct vd55g1_version *version;
@@ -722,6 +727,15 @@ static void vd55g1_get_vblank_limits(struct vd55g1 *sensor,
 	limits->max = VD55G1_VBLANK_MAX - crop->height;
 }
 
+static void vd55g1_get_frame_timings(struct vd55g1 *sensor,
+				     struct v4l2_rect *crop,
+				     struct vd55g1_frame_timings *timings)
+{
+	timings->frame_length = crop->height + sensor->vblank_ctrl->val;
+
+	timings->expo_max = timings->frame_length - VD55G1_EXPO_MAX_TERM;
+}
+
 #define vd55g1_read(sensor, reg, val, err) \
 	cci_read((sensor)->regmap, reg, val, err)
 
@@ -1304,9 +1318,8 @@ static int vd55g1_new_format_change_controls(struct vd55g1 *sensor,
 					     struct v4l2_rect *crop)
 {
 	struct vd55g1_vblank_limits vblank;
+	struct vd55g1_frame_timings timings;
 	unsigned int hblank;
-	unsigned int frame_length = 0;
-	unsigned int expo_max;
 	int ret;
 
 	/* Reset vblank and frame length to default */
@@ -1317,10 +1330,9 @@ static int vd55g1_new_format_change_controls(struct vd55g1 *sensor,
 		return ret;
 
 	/* Max exposure changes with vblank */
-	frame_length = crop->height + sensor->vblank_ctrl->val;
-	expo_max = frame_length - VD55G1_EXPO_MAX_TERM;
-	ret = __v4l2_ctrl_modify_range(sensor->expo_ctrl, 0, expo_max, 1,
-				       VD55G1_EXPO_DEF);
+	vd55g1_get_frame_timings(sensor, crop, &timings);
+	ret = __v4l2_ctrl_modify_range(sensor->expo_ctrl, 0, timings.expo_max,
+				       1, VD55G1_EXPO_DEF);
 	if (ret)
 		return ret;
 
@@ -1478,8 +1490,6 @@ static int vd55g1_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct vd55g1 *sensor = ctrl_to_vd55g1(ctrl);
-	unsigned int frame_length = 0;
-	unsigned int expo_max;
 	struct v4l2_subdev_state *state =
 		v4l2_subdev_get_locked_active_state(&sensor->sd);
 	struct v4l2_rect *crop =
@@ -1487,6 +1497,7 @@ static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct v4l2_mbus_framefmt *format =
 		v4l2_subdev_state_get_format(state, 0);
 	unsigned int hblank = vd55g1_get_hblank_min(sensor, format, crop);
+	struct vd55g1_frame_timings timings;
 	bool is_auto = false;
 	int ret = 0;
 
@@ -1496,10 +1507,10 @@ static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
 	/* Update controls state, range, etc. whatever the state of the HW */
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
-		frame_length = crop->height + ctrl->val;
-		expo_max = frame_length - VD55G1_EXPO_MAX_TERM;
-		ret = __v4l2_ctrl_modify_range(sensor->expo_ctrl, 0, expo_max,
-					       1, VD55G1_EXPO_DEF);
+		vd55g1_get_frame_timings(sensor, crop, &timings);
+		ret = __v4l2_ctrl_modify_range(sensor->expo_ctrl, 0,
+					       timings.expo_max, 1,
+					       VD55G1_EXPO_DEF);
 		break;
 	case V4L2_CID_EXPOSURE_AUTO:
 		is_auto = (ctrl->val == V4L2_EXPOSURE_AUTO);
@@ -1551,7 +1562,7 @@ static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = vd55g1_update_exposure_target(sensor, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
-		ret = vd55g1_update_frame_length(sensor, frame_length);
+		ret = vd55g1_update_frame_length(sensor, timings.frame_length);
 		break;
 	case V4L2_CID_FLASH_LED_MODE:
 		ret = vd55g1_update_gpios(sensor, sensor->ext_leds_mask);
-- 
2.55.0

