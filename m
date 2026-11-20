Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188319;
	b=yhUeFzEMUj7DLIWdIqsbYdmDSMGOzUOQChbwphWynGhChd1WXh6w8QS8DxFnmWq/KCjf
	 Fl+1ZFo7gEa5sothc767dG5XSmalwbT4A6mIXukSW3MR6ryzx16O2aSK7pnPcXattbg0a
	 KmeuM4cprsXsIajXO6Yo/TgXhyBhefISBXoeXI55GfOLsJoAqTqYHdA4O8lBMWqTKmMfh
	 6l1oZyOdzXOp1wISYOeHAM6q+4xN7zqCFaUyf3+Wc8wZVa6F5xvVMzFPACC6Wp5oyuLs2
	 mqVvQdr46BKK3uf8P1FHYx6x2QubsmcCRox+1xo9CoDRQ5Q1kFrQuaqzizzrHvjMvgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188319;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=eKJ9ZcgQ0plbbLKy1sHm+A6RarK2aCkoMQ/aWF15v1E=;
	b=bp190OERIo2AP+ZPURFwiRYu3FwHyQVnjD4S9VR4kHRnubApcTW5Dxs2nhV6Yvx2lZgG
	 PVBXyVqswwbw9brgvvlF4fc9y9RmXvFSkVI3Kkt8WuGTIRETgJG5NsgNvoQk37PwGHfJs
	 wQWPdcbMlRzoNrYT2Ly9Gt28cou6xc8ehFvjHZZthRi9SAOskwPQxTW5r2Q+86QNjvZdQ
	 9cnupKApdR52FR6bRn/y+d61oU8AYX3FPnwl7yiG/dq9tfzIXapz75BZ2PemyKtHdiqaB
	 wuu4gCXkiGw0ByK39ccD2pZ/AWwRm/A3sSw4GU+gSEepgwpG639c3rYYNQCAt/cWbwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Cx5+lfmY;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89D9606A320;
	Fri, 20 Nov 2026 15:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E89D9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Cx5+lfmY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1795188316; x=1795447516;
	bh=eKJ9ZcgQ0plbbLKy1sHm+A6RarK2aCkoMQ/aWF15v1E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Cx5+lfmY3H3HHzU3oSP9Gmdupn0ufy4RXnGzCotVbRaw/Wkd9obS5Q31WRgT8nwdo
	 4iojvZRMPNn+NKb1alK1fe0WCMvi03MIUwiYtecHcIEjQ3rjJ7nypfD+hYOlyw3ONL
	 R3akvz2O8RyjVavHX0axaXUOlROBwRY3v1JOF9L2xx1MfJiBNlprdZAWfJNm/T+1nE
	 KPKOdmMTGz6J6UcuM9vEvWBCV62+N33utpinKWl6jUlPiUCfkk/fs2fo27fHTWmNgY
	 emSt/C8OUMnYq1zRwSuax+KZqiKf/EBhJMSbM+Foh7CbL0go3s4OVOfvYC228nwTF+
	 Yjlymflx8YhAA==
Date: Fri, 20 Nov 2026 15:25:09 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, Emfox Zhou <emfox@debian.org>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fixup! media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261120152501.82411-1-lsa.uz@pm.me>
In-Reply-To: <awAyiCEXYnf2TJpC@kekkonen.localdomain>
References: <20261114095815.74012-1-lsa.uz@pm.me> <20261114095815.74012-3-lsa.uz@pm.me> <awAyiCEXYnf2TJpC@kekkonen.localdomain>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 4e7aece7f2af07b9f6e04ea38619e4722249d7a0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sakari's review of v5 2/6:
- name the test patterns as the manual describes them, in the words
  other sensor drivers use;
- keep the auto exposure cold start in the exposure controls' current
  values, as vd55g1 does, rather than in a copy in the driver;
- no runtime PM reference across probe: autosuspend is set up after
  registration, and pm_runtime_idle() ends probe;
- in remove, set the device suspended only when it was not.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
Hi Sakari,

The fixup for v5 2/6, as you suggested. 3/6 to 6/6 do not touch the file.

- The test patterns are named after the manual's table, UM2829, in the
  words vd55g1 and the CCS drivers use.
- The cold start is the exposure controls' cur.val now. The first stream
  after probe therefore starts from their defaults, 200 lines, where v5's
  copy started from 50.
- On the error path only pm_runtime_put_noidle() went:
  pm_runtime_disable() and pm_runtime_set_suspended() stay, as in imx219,
  since probe sets the device active. The autosuspend delay and
  use_autosuspend() moved after registration too. With no reference
  held, either call before it would suspend the sensor at once.

Tested on the Surface Pro 11, on 7.4.0-rc1 with KASAN and lockdep:
- probe powers the sensor off after registration, not before;
- v4l2-compliance 46/46, capture at 59.14 fps;
- in every stream the cold start registers equal the controls read
  before it: the defaults after probe, then what the last stream left,
  manual or auto;
- each test pattern writes v5's PATGEN_CTRL value;
- a failed registration, and unbind, leave the clock and supplies off
  without a WARN.

Sergey

Tool use, per Documentation/process/generated-content.rst (Assisted-by
tags in commits were dropped in 7.4-rc1):

* My contributions to this series were prepared with Claude Code
  (claude-opus-5-5); work by others in it is their own.
* This replaces any Assisted-by tags in earlier versions.

 drivers/media/i2c/vd55g0.c | 65 ++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 38 deletions(-)

diff --git a/drivers/media/i2c/vd55g0.c b/drivers/media/i2c/vd55g0.c
index 99bfb05225d..dc1cf48bee6 100644
--- a/drivers/media/i2c/vd55g0.c
+++ b/drivers/media/i2c/vd55g0.c
@@ -726,13 +726,13 @@ static const struct vd55g0_patch vd55g0_patch_cut2 =
=3D {
=20
 static const char * const vd55g0_test_pattern_menu[] =3D {
 =09"Disabled",
-=09"Solid",
-=09"Colorbar",
-=09"Gradbar",
-=09"Hgrey",
-=09"Vgrey",
-=09"Dgrey",
-=09"PN28",
+=09"Solid Colour",
+=09"Vertical Colour Bars",
+=09"Colour Bars With Fade to Grey",
+=09"Horizontal Grey Scale",
+=09"Vertical Grey Scale",
+=09"Diagonal Grey Scale",
+=09"Pseudo-random Noise (PN28)",
 };
=20
 static const s64 vd55g0_ev_bias_menu[] =3D {
@@ -863,12 +863,6 @@ struct vd55g0_dev {
 =09=09struct v4l2_ctrl *dgain_ctrl;
 =09};
 =09struct v4l2_ctrl *ae_lock_ctrl;
-=09/* What the last stream applied, for the next one to start from */
-=09struct {
-=09=09u16 expo;
-=09=09u16 digital_gain;
-=09=09u8 analog_gain;
-=09} cold_start;
 };
=20
 static inline struct vd55g0_dev *to_vd55g0_dev(struct v4l2_subdev *sd)
@@ -1161,16 +1155,20 @@ vd55g0_try_fmt(struct v4l2_mbus_framefmt *fmt)
 =09return mode;
 }
=20
+/* The auto exposure starts from the exposure controls' current values */
 static int vd55g0_apply_cold_start(struct vd55g0_dev *sensor)
 {
+=09/* A range change under auto exposure did not clamp it */
+=09u32 expo =3D min_t(s64, sensor->expo_ctrl->cur.val,
+=09=09=09 sensor->expo_ctrl->maximum);
 =09int ret =3D 0;
=20
-=09vd55g0_write(sensor, VD55G0_REG_AE_COLDSTART_COARSE_EXPOSURE,
-=09=09     sensor->cold_start.expo, &ret);
+=09vd55g0_write(sensor, VD55G0_REG_AE_COLDSTART_COARSE_EXPOSURE, expo,
+=09=09     &ret);
 =09vd55g0_write(sensor, VD55G0_REG_AE_COLDSTART_ANALOG_GAIN,
-=09=09     sensor->cold_start.analog_gain, &ret);
+=09=09     sensor->again_ctrl->cur.val, &ret);
 =09vd55g0_write(sensor, VD55G0_REG_AE_COLDSTART_DIGITAL_GAIN,
-=09=09     sensor->cold_start.digital_gain, &ret);
+=09=09     sensor->dgain_ctrl->cur.val, &ret);
=20
 =09return ret;
 }
@@ -1288,11 +1286,12 @@ static void vd55g0_save_exposure(struct vd55g0_dev =
*sensor)
 =09/* On a read error, keep what the previous stream left */
 =09if (!vd55g0_read(sensor, VD55G0_REG_APPLIED_COARSE_EXPOSURE, &val,
 =09=09=09 NULL))
-=09=09sensor->cold_start.expo =3D val;
+=09=09sensor->expo_ctrl->cur.val =3D min_t(u64, val,
+=09=09=09=09=09=09   sensor->expo_ctrl->maximum);
 =09if (!vd55g0_read(sensor, VD55G0_REG_APPLIED_DIGITAL_GAIN, &val, NULL))
-=09=09sensor->cold_start.digital_gain =3D val;
+=09=09sensor->dgain_ctrl->cur.val =3D val;
 =09if (!vd55g0_read(sensor, VD55G0_REG_APPLIED_ANALOG_GAIN, &val, NULL))
-=09=09sensor->cold_start.analog_gain =3D val;
+=09=09sensor->again_ctrl->cur.val =3D val;
 }
=20
 static void vd55g0_stream_disable(struct vd55g0_dev *sensor)
@@ -1693,14 +1692,9 @@ static int vd55g0_g_volatile_ctrl(struct v4l2_ctrl *=
ctrl)
 =09u64 expo, again, dgain;
 =09int ret =3D 0;
=20
-=09/* Unpowered: the last stream's values, the next one's start */
-=09if (!pm_runtime_get_if_in_use(dev)) {
-=09=09sensor->expo_ctrl->val =3D min_t(u32, sensor->cold_start.expo,
-=09=09=09=09=09       sensor->expo_ctrl->maximum);
-=09=09sensor->again_ctrl->val =3D sensor->cold_start.analog_gain;
-=09=09sensor->dgain_ctrl->val =3D sensor->cold_start.digital_gain;
+=09/* Unpowered: the current values, which the last stream left */
+=09if (!pm_runtime_get_if_in_use(dev))
 =09=09return 0;
-=09}
=20
 =09vd55g0_read(sensor, VD55G0_REG_APPLIED_COARSE_EXPOSURE, &expo, &ret);
 =09vd55g0_read(sensor, VD55G0_REG_APPLIED_ANALOG_GAIN, &again, &ret);
@@ -2066,9 +2060,6 @@ static int vd55g0_probe(struct i2c_client *client)
 =09if (IS_ERR(sensor->regmap))
 =09=09return dev_err_probe(&client->dev, PTR_ERR(sensor->regmap),
 =09=09=09=09     "failed to init CCI\n");
-=09sensor->cold_start.expo =3D 0x32;
-=09sensor->cold_start.digital_gain =3D 256;
-=09sensor->cold_start.analog_gain =3D 0;
=20
 =09handle =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
=20
@@ -2140,12 +2131,8 @@ static int vd55g0_probe(struct i2c_client *client)
 =09=09goto error_media_entity;
 =09}
=20
-=09/* Held until registered, so that runtime PM cannot power it down */
 =09pm_runtime_set_active(dev);
-=09pm_runtime_get_noresume(dev);
 =09pm_runtime_enable(dev);
-=09pm_runtime_set_autosuspend_delay(dev, 1000);
-=09pm_runtime_use_autosuspend(dev);
=20
 =09ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
 =09if (ret) {
@@ -2153,7 +2140,9 @@ static int vd55g0_probe(struct i2c_client *client)
 =09=09goto error_pm_runtime;
 =09}
=20
-=09pm_runtime_put_autosuspend(dev);
+=09pm_runtime_set_autosuspend_delay(dev, 1000);
+=09pm_runtime_use_autosuspend(dev);
+=09pm_runtime_idle(dev);
=20
 =09dev_dbg(&client->dev, "vd55g0 probe successfully\n");
=20
@@ -2167,7 +2156,6 @@ static int vd55g0_probe(struct i2c_client *client)
 error_pm_runtime:
 =09pm_runtime_disable(dev);
 =09pm_runtime_set_suspended(dev);
-=09pm_runtime_put_noidle(dev);
 =09v4l2_subdev_cleanup(&sensor->sd);
 error_media_entity:
 =09media_entity_cleanup(&sensor->sd.entity);
@@ -2190,9 +2178,10 @@ static void vd55g0_remove(struct i2c_client *client)
 =09v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
=20
 =09pm_runtime_disable(&client->dev);
-=09if (!pm_runtime_status_suspended(&client->dev))
+=09if (!pm_runtime_status_suspended(&client->dev)) {
 =09=09vd55g0_power_off(&client->dev);
-=09pm_runtime_set_suspended(&client->dev);
+=09=09pm_runtime_set_suspended(&client->dev);
+=09}
 }
=20
 static const struct of_device_id vd55g0_dt_ids[] =3D {
--=20
2.54.0


