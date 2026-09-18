Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8A038AC6A;
	Fri, 18 Sep 2026 22:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770043; cv=none; b=J1t3bl0F20UHt83n2hige4sY6031cE5aOiLNRo6aODW3PPAxpH4gYwO7rtiDiFFQR8dNfA37n7njKj6tPiuPy5o/+H3ryBkBUsTYSK2JhsfGVBJFLarPTOzFPB2WFcAJwg+sNx51a0hETXHHH4yXKo93Knq5y5IfAM9srPpHn/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770043; c=relaxed/simple;
	bh=CvO0HgLAl3CWyx4WawNI5tgomHBjok2zhsEhStC9Nm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lghBUpuOYswz4asDnE3AD3AKS46mllGSjXRfnl/3yJoOvJ6EIrkz7/TXZqcT7BePd31VlbhE65FdaAWgUhbhG5v4UCZAlqTNbNIEzhyTJrY+zqwmAMiQ6nS+Q4QPtb8PJTzSLUq2hFw3QXT/H5yKmExCAkKCtItQEG+LCju4Oto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=jeBVoNmr; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="jeBVoNmr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789769897;
	bh=CvO0HgLAl3CWyx4WawNI5tgomHBjok2zhsEhStC9Nm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jeBVoNmrqKxHZDobDd8PvUmng6YTuph095rRSX8P0BYOTkoSF74jtDAONsYXE0ED1
	 NA2zd2hvgNHl/bR5I56EoTP42YxlqFWE1QqerzjAC9DxKTzGleRPlNC7cW7Oel4soo
	 qdFn3FtWIqHJJLsb9tuWwjQQDTgH+d4i6EaGxnmpmDieO9jFssH42Wq0aFg2IgvGCd
	 997x/I/IEpJE68zBMrM3Ra+lVQVz4nEdIUorNmKLFMKaeIEamu28W6zLNuPFG/CZs9
	 yS3VfxfTT64Z3/lLXvAFVwVRdu2wSC1ScgunFJhslqHZ2iq2aVQCSy7yE7daAAHbfx
	 6ELIr+4hG2NvA==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id A6FF420128;
	Fri, 18 Sep 2026 22:18:16 +0000 (UTC)
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
Subject: [PATCH 07/11] media: i2c: st-vd55g1: Clean up module error reporting
Date: Fri, 18 Sep 2026 18:17:01 -0400
Message-ID: <20260918221705.323510-8-pm@petermarshall.ca>
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

Downgrade helper error messages from dev_err to dev_dbg prints to keep
logs clean and actionable while preserving detailed information for
debugging.

Delegate module data management and error reporting to the callers of
power_on/power_off. Introduce dedicated PM handlers to dispatch them
instead of using them directly as module entry points.

Handle failure of a previously unchecked write in power_on.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 drivers/media/i2c/vd55g1.c | 112 +++++++++++++++++++++++--------------
 1 file changed, 69 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 3e2261a95f2d..f54f8ba71284 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -789,7 +789,7 @@ static int vd55g1_prepare_clock_tree(struct vd55g1 *sensor)
 
 	if (sensor->xclk_freq < VD55G1_XCLK_FREQ_MIN ||
 	    sensor->xclk_freq > VD55G1_XCLK_FREQ_MAX) {
-		dev_err(sensor->dev,
+		dev_dbg(sensor->dev,
 			"Only %luMhz-%luMhz clock range supported. Provided %lu MHz\n",
 			VD55G1_XCLK_FREQ_MIN / HZ_PER_MHZ,
 			VD55G1_XCLK_FREQ_MAX / HZ_PER_MHZ,
@@ -802,7 +802,7 @@ static int vd55g1_prepare_clock_tree(struct vd55g1 *sensor)
 
 	if (sensor->mipi_rate < VD55G1_MIPI_RATE_MIN ||
 	    sensor->mipi_rate > VD55G1_MIPI_RATE_MAX) {
-		dev_err(sensor->dev,
+		dev_dbg(sensor->dev,
 			"Only %luMbps-%luMbps data rate range supported. Provided %lu Mbps\n",
 			VD55G1_MIPI_RATE_MIN / MEGA,
 			VD55G1_MIPI_RATE_MAX / MEGA,
@@ -1220,14 +1220,14 @@ static int vd55g1_patch(struct vd55g1 *sensor)
 			     VD55G1_BOOT_PATCH_AND_BOOT, &ret);
 		vd55g1_poll_reg(sensor, VD55G1_REG_BOOT, 0, &ret);
 		if (ret) {
-			dev_err(sensor->dev, "Failed to apply patch\n");
+			dev_dbg(sensor->dev, "Failed to apply patch\n");
 			return ret;
 		}
 
 		vd55g1_read(sensor, VD55G1_REG_FWPATCH_REVISION, &patch, &ret);
 		if (patch != (VD55G1_FWPATCH_REVISION_MAJOR << 8) +
 		    VD55G1_FWPATCH_REVISION_MINOR) {
-			dev_err(sensor->dev, "Bad patch version expected %d.%d got %d.%d\n",
+			dev_dbg(sensor->dev, "Bad patch version expected %d.%d got %d.%d\n",
 				VD55G1_FWPATCH_REVISION_MAJOR,
 				VD55G1_FWPATCH_REVISION_MINOR,
 				(u8)(patch >> 8), (u8)(patch & 0xff));
@@ -1240,14 +1240,14 @@ static int vd55g1_patch(struct vd55g1 *sensor)
 		vd55g1_write(sensor, VD55G1_REG_BOOT, VD55G1_BOOT_BOOT, &ret);
 		vd55g1_poll_reg(sensor, VD55G1_REG_BOOT, 0, &ret);
 		if (ret) {
-			dev_err(sensor->dev, "Failed to boot\n");
+			dev_dbg(sensor->dev, "Failed to boot\n");
 			return ret;
 		}
 	}
 
 	ret = vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_SW_STBY, NULL);
 	if (ret) {
-		dev_err(sensor->dev, "Sensor waiting after boot failed\n");
+		dev_dbg(sensor->dev, "Sensor waiting after boot failed\n");
 		return ret;
 	}
 
@@ -1705,18 +1705,21 @@ static int vd55g1_detect(struct vd55g1 *sensor)
 
 	vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, &ret);
 	vd55g1_read(sensor, VD55G1_REG_COLOR_VERSION, &color, &ret);
-	if (ret)
+	if (ret) {
+		dev_dbg(sensor->dev,
+			"Failed to read sensor model: %d\n", ret);
 		return ret;
+	}
 
 	version = vd55g1_get_version(id, color);
 	if (!version) {
-		dev_warn(sensor->dev, "Unsupported sensor version, expected %s\n",
-			 dt_version->name);
+		dev_dbg(sensor->dev, "Unsupported sensor version, expected %s\n",
+			dt_version->name);
 		return -ENODEV;
 	}
 	if (version->id != dt_version->id ||
 	    version->color != dt_version->color) {
-		dev_err(sensor->dev, "Probed sensor version %s and device tree definition %s mismatch",
+		dev_dbg(sensor->dev, "Probed sensor version %s and device tree definition %s mismatch",
 			version->name, dt_version->name);
 		return -ENODEV;
 	}
@@ -1726,22 +1729,20 @@ static int vd55g1_detect(struct vd55g1 *sensor)
 	return 0;
 }
 
-static int vd55g1_power_on(struct device *dev)
+static int vd55g1_power_on(struct vd55g1 *sensor)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct vd55g1 *sensor = to_vd55g1(sd);
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(vd55g1_supply_name),
 				    sensor->supplies);
 	if (ret) {
-		dev_err(dev, "Failed to enable regulators %d\n", ret);
+		dev_dbg(sensor->dev, "Failed to enable regulators: %d\n", ret);
 		return ret;
 	}
 
 	ret = clk_prepare_enable(sensor->xclk);
 	if (ret) {
-		dev_err(dev, "Failed to enable clock %d\n", ret);
+		dev_dbg(sensor->dev, "Failed to enable clock: %d\n", ret);
 		goto disable_bulk;
 	}
 
@@ -1749,25 +1750,27 @@ static int vd55g1_power_on(struct device *dev)
 	usleep_range(5000, 10000);
 	ret = vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_READY_TO_BOOT, NULL);
 	if (ret) {
-		dev_err(dev, "Sensor reset failed %d\n", ret);
+		dev_dbg(sensor->dev, "Sensor reset failed: %d\n", ret);
 		goto disable_clock;
 	}
 
 	ret = vd55g1_detect(sensor);
-	if (ret) {
-		dev_err(dev, "Sensor detect failed %d\n", ret);
+	if (ret)
 		goto disable_clock;
-	}
 
 	/* Setup clock now to advance through system FSM states */
 	vd55g1_write(sensor, VD55G1_REG_EXT_CLOCK, sensor->xclk_freq, &ret);
-
-	ret = vd55g1_patch(sensor);
 	if (ret) {
-		dev_err(dev, "Sensor patch failed %d\n", ret);
+		dev_dbg(sensor->dev,
+			"Failed to write external clock frequency: %d\n",
+			ret);
 		goto disable_clock;
 	}
 
+	ret = vd55g1_patch(sensor);
+	if (ret)
+		goto disable_clock;
+
 	return 0;
 
 disable_clock:
@@ -1780,11 +1783,8 @@ static int vd55g1_power_on(struct device *dev)
 	return ret;
 }
 
-static int vd55g1_power_off(struct device *dev)
+static int vd55g1_power_off(struct vd55g1 *sensor)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct vd55g1 *sensor = to_vd55g1(sd);
-
 	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
 	clk_disable_unprepare(sensor->xclk);
 	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
@@ -1792,6 +1792,32 @@ static int vd55g1_power_off(struct device *dev)
 	return 0;
 }
 
+static int vd55g1_pm_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct vd55g1 *sensor = to_vd55g1(sd);
+	int ret;
+
+	ret = vd55g1_power_on(sensor);
+	if (ret)
+		dev_err(dev, "Failed to power on during PM resume: %d\n", ret);
+
+	return ret;
+}
+
+static int vd55g1_pm_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct vd55g1 *sensor = to_vd55g1(sd);
+	int ret;
+
+	ret = vd55g1_power_off(sensor);
+	if (ret)
+		dev_err(dev, "Failed to power off during PM suspend: %d\n", ret);
+
+	return ret;
+}
+
 static int vd55g1_check_csi_conf(struct vd55g1 *sensor)
 {
 	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
@@ -1809,7 +1835,7 @@ static int vd55g1_check_csi_conf(struct vd55g1 *sensor)
 	/* Check lanes number */
 	n_lanes = ep.bus.mipi_csi2.num_data_lanes;
 	if (n_lanes != 1) {
-		dev_err(sensor->dev, "Sensor only supports 1 lane, found %d\n",
+		dev_dbg(sensor->dev, "Sensor only supports 1 lane, found %d\n",
 			n_lanes);
 		ret = -EINVAL;
 		goto done;
@@ -1817,7 +1843,7 @@ static int vd55g1_check_csi_conf(struct vd55g1 *sensor)
 
 	/* Clock lane must be first */
 	if (ep.bus.mipi_csi2.clock_lane != 0) {
-		dev_err(sensor->dev, "Clock lane must be mapped to lane 0\n");
+		dev_dbg(sensor->dev, "Clock lane must be mapped to lane 0\n");
 		ret = -EINVAL;
 		goto done;
 	}
@@ -1828,12 +1854,12 @@ static int vd55g1_check_csi_conf(struct vd55g1 *sensor)
 
 	/* Check the link frequency set in device tree */
 	if (!ep.nr_of_link_frequencies) {
-		dev_err(sensor->dev, "link-frequency property not found in DT\n");
+		dev_dbg(sensor->dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
 		goto done;
 	}
 	if (ep.nr_of_link_frequencies != 1) {
-		dev_err(sensor->dev, "Multiple link frequencies not supported\n");
+		dev_dbg(sensor->dev, "Multiple link frequencies not supported\n");
 		ret = -EINVAL;
 		goto done;
 	}
@@ -1864,12 +1890,12 @@ static int vd55g1_parse_dt_gpios_array(struct vd55g1 *sensor,
 	ret = device_property_read_u32_array(sensor->dev,
 					     prop_name, array, *nb);
 	if (ret) {
-		dev_err(sensor->dev, "Failed to read %s prop\n", prop_name);
+		dev_dbg(sensor->dev, "Failed to read %s prop\n", prop_name);
 		return ret;
 	}
 	for (i = 0; i < *nb;  i++) {
 		if (array[i] >= VD55G1_NB_GPIOS) {
-			dev_err(sensor->dev, "Invalid GPIO number %d\n",
+			dev_dbg(sensor->dev, "Invalid GPIO number %d\n",
 				array[i]);
 			return -EINVAL;
 		}
@@ -1933,14 +1959,14 @@ static int vd55g1_subdev_init(struct vd55g1 *sensor)
 	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
 	if (ret) {
-		dev_err(sensor->dev, "Failed to init media entity: %d\n", ret);
+		dev_dbg(sensor->dev, "Failed to init media entity: %d\n", ret);
 		return ret;
 	}
 
 	sensor->sd.state_lock = sensor->ctrl_handler.lock;
 	ret = v4l2_subdev_init_finalize(&sensor->sd);
 	if (ret) {
-		dev_err(sensor->dev, "Subdev init error: %d\n", ret);
+		dev_dbg(sensor->dev, "Subdev init error: %d\n", ret);
 		goto err_ctrls;
 	}
 
@@ -1950,7 +1976,7 @@ static int vd55g1_subdev_init(struct vd55g1 *sensor)
 	 */
 	ret = vd55g1_init_ctrls(sensor);
 	if (ret) {
-		dev_err(sensor->dev, "Controls initialization failed %d\n",
+		dev_dbg(sensor->dev, "Controls initialization failed %d\n",
 			ret);
 		goto err_media;
 	}
@@ -2015,7 +2041,7 @@ static int vd55g1_probe(struct i2c_client *client)
 	sensor->xclk_freq = clk_get_rate(sensor->xclk);
 	ret = vd55g1_prepare_clock_tree(sensor);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "Unsupported clock configuration\n");
 
 	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
@@ -2029,9 +2055,9 @@ static int vd55g1_probe(struct i2c_client *client)
 				     "Failed to init regmap\n");
 
 	/* Detect if sensor is present and if its revision is supported */
-	ret = vd55g1_power_on(dev);
+	ret = vd55g1_power_on(sensor);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to power on during probe\n");
 
 	/* Enable pm_runtime and power off the sensor */
 	pm_runtime_set_active(dev);
@@ -2043,13 +2069,13 @@ static int vd55g1_probe(struct i2c_client *client)
 
 	ret = vd55g1_subdev_init(sensor);
 	if (ret) {
-		dev_err(dev, "V4l2 init failed: %d\n", ret);
+		dev_err_probe(dev, ret, "V4l2 subdev init failed\n");
 		goto err_power_off;
 	}
 
 	ret = v4l2_async_register_subdev(&sensor->sd);
 	if (ret) {
-		dev_err(dev, "async subdev register failed %d\n", ret);
+		dev_err_probe(dev, ret, "async subdev register failed\n");
 		goto err_subdev;
 	}
 
@@ -2061,7 +2087,7 @@ static int vd55g1_probe(struct i2c_client *client)
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_dont_use_autosuspend(dev);
-	vd55g1_power_off(dev);
+	vd55g1_power_off(sensor);
 
 	return ret;
 }
@@ -2075,7 +2101,7 @@ static void vd55g1_remove(struct i2c_client *client)
 
 	pm_runtime_disable(&client->dev);
 	if (!pm_runtime_status_suspended(&client->dev))
-		vd55g1_power_off(&client->dev);
+		vd55g1_power_off(sensor);
 	pm_runtime_set_suspended(&client->dev);
 	pm_runtime_dont_use_autosuspend(&client->dev);
 }
@@ -2089,7 +2115,7 @@ static const struct of_device_id vd55g1_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
 
 static const struct dev_pm_ops vd55g1_pm_ops = {
-	SET_RUNTIME_PM_OPS(vd55g1_power_off, vd55g1_power_on, NULL)
+	SET_RUNTIME_PM_OPS(vd55g1_pm_suspend, vd55g1_pm_resume, NULL)
 };
 
 static struct i2c_driver vd55g1_i2c_driver = {
-- 
2.55.0

