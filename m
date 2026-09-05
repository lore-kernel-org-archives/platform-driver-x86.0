Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC722D46CE;
	Sat,  5 Sep 2026 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613307; cv=none; b=T4oej5bF8LfmoW/mvjSxyLN7Wks+aC4aR7H4eJplfi7uK6Alx4DXYkNOZNaw2MItxBThqm0SKpAfwgHyru8mE5JrLdLU1uppSpTTQcmaZE/eHG18IVWcdQlL1vCktOcoznoO0BWQw8F9Pkfl2FZjMhdN8tlP86Gn8Ig0RAeuhZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613307; c=relaxed/simple;
	bh=a/y4FY7r98UDLIkJ30GnvkmG46k/+IjJfmz+yRq4kpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U676d4A499BagzCCpr+BrL1DoGGLgl4M36Awnvql7/G4e2OvRsap1MSzVVByXZvLUxZTRD+nkwVmyCTD++aFMT4jUCIBDGfDMT9pMsyqaeMUlRZ/wYHT031gmdRHC7em6T5lxaUfjDMiqbQYbiKZ0rvKUyjPnfJQrP1wY8WX1Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=I/g0OLnn; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="I/g0OLnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788613302; x=1789218102; i=w_armin@gmx.de;
	bh=PCGcQUqfbxmWCti49lk5irnoLG1UcnlVocDxAGoj8LE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=I/g0OLnniqOvEO2rH/eishKWX12YwcCx33YYYG6x5D+hTThFqUdP/+2hSypfm9yP
	 4SSOHx7u6ePodFU/Vfe9Ow5Z7prub6fUMyirJETOE/uTJ+1rX9Z1FmAnLaxPfjlcm
	 iuMchWzf4+HDfztre2EGcVr17x5PjMDhadcsh2J0Oo272p4sxyA/9CbMHPGAs5+Nb
	 2SNbbF1cKpjPWsnMVX8jCmcLRhWszLAIq2vH9u484kZlkvJX3C+OETb7zA7TpGNwu
	 flY3Ka70jmIATJqfWpDH09GkROW28OA2NnD0T0coZ2kdFRfFSx+wm9E6y8HlAoI16
	 lm5OTgQRCtXJCv4+nA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLiCo-1xKVR01be4-00JoUW; Sat, 05
 Sep 2026 15:01:42 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] platform/x86: uniwill-laptop: Report correct lightbar brightness
Date: Sat,  5 Sep 2026 15:01:34 +0200
Message-Id: <20260905130138.6814-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260905130138.6814-1-W_Armin@gmx.de>
References: <20260905130138.6814-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ym/UO9GwHX7m6A7JBEdgWRutH+05otoHfUeyvq4IqC59lYvm7wG
 Z/7DMIZUmuSCEbXiEwhLxk0Xq8RNqpczvDdbNWfsFA71Fbk9J6PbKMgfTeQcP0KakDRTI7g
 6/X1/o1foRaKP/YLazoahwxCAR99N7q+GCyBEdFuy5E7Tw+3BqMXw6qIINtLNn0ITqRiWYp
 qpoQOPIiIHhChhN0Dculw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QX9zGt7pyms=;qV9l0xGa+ekOFwwbhV97tBA6woT
 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

The LED sysfs ABI now allows us to specify the maximum values for the
global brightness and the color intensity values independently. At the
same time the maximum brightness value reported for the lightbar (like
200) does not match the real value supported by the hardware (1),
potentially confusing users.

Report the correct maximum brightness value and only use the intensity
values for controlling the lightbar color.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 35 ++++++++++-----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 7a2eeaec4c96..7420e1dd4716 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -398,7 +398,7 @@ struct uniwill_data {
 	struct mutex super_key_lock;	/* Protects the toggling of the super key l=
ock state */
 	struct list_head batteries;
 	struct mutex led_lock;		/* Protects writes to the lightbar registers */
-	u8 lightbar_max_brightness;
+	u8 lightbar_max_intensity;
 	struct led_classdev_mc led_mc_cdev;
 	struct mc_subled led_mc_subled_info[LED_CHANNELS];
 	bool kbd_led_single_color;
@@ -429,7 +429,7 @@ struct uniwill_device_descriptor {
 	unsigned int features;
 	bool kbd_led_single_color;
 	u8 kbd_led_max_brightness;
-	u8 lightbar_max_brightness;
+	u8 lightbar_max_intensity;
 	/* Executed during driver probing */
 	int (*probe)(struct uniwill_data *data);
 };
@@ -1509,20 +1509,16 @@ static int uniwill_led_brightness_set(struct led_c=
lassdev *led_cdev, enum led_br
 	unsigned int value;
 	int ret;
=20
-	ret =3D led_mc_calc_color_components(led_mc_cdev, brightness);
-	if (ret < 0)
-		return ret;
-
 	guard(mutex)(&data->led_lock);
=20
 	for (int i =3D 0; i < LED_CHANNELS; i++) {
-		/* Prevent the brightness values from overflowing */
-		value =3D min(data->lightbar_max_brightness, data->led_mc_subled_info[i=
].brightness);
-		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], va=
lue);
+		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i],
+				   data->led_mc_subled_info[i].intensity);
 		if (ret < 0)
 			return ret;
=20
-		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i], v=
alue);
+		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i],
+				   data->led_mc_subled_info[i].intensity);
 		if (ret < 0)
 			return ret;
 	}
@@ -1586,14 +1582,14 @@ static int uniwill_led_init(struct uniwill_data *d=
ata)
 		return ret;
=20
 	data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
-	data->led_mc_cdev.led_cdev.max_brightness =3D data->lightbar_max_brightn=
ess;
+	data->led_mc_cdev.led_cdev.max_brightness =3D 1;
 	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
 	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_brigh=
tness_set;
=20
 	if (value & LIGHTBAR_S0_OFF)
 		data->led_mc_cdev.led_cdev.brightness =3D 0;
 	else
-		data->led_mc_cdev.led_cdev.brightness =3D data->lightbar_max_brightness=
;
+		data->led_mc_cdev.led_cdev.brightness =3D 1;
=20
 	for (int i =3D 0; i < LED_CHANNELS; i++) {
 		data->led_mc_subled_info[i].color_index =3D color_indices[i];
@@ -1604,9 +1600,9 @@ static int uniwill_led_init(struct uniwill_data *dat=
a)
=20
 		/*
 		 * Make sure that the initial intensity value is not greater than
-		 * the maximum brightness.
+		 * the maximum intensity.
 		 */
-		value =3D min(data->lightbar_max_brightness, value);
+		value =3D min(data->lightbar_max_intensity, value);
 		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], va=
lue);
 		if (ret < 0)
 			return ret;
@@ -1616,6 +1612,7 @@ static int uniwill_led_init(struct uniwill_data *dat=
a)
 			return ret;
=20
 		data->led_mc_subled_info[i].intensity =3D value;
+		data->led_mc_subled_info[i].max_intensity =3D data->lightbar_max_intens=
ity;
 		data->led_mc_subled_info[i].channel =3D i;
 	}
=20
@@ -2338,7 +2335,7 @@ static int uniwill_probe(struct platform_device *pde=
v)
 	data->features =3D device_descriptor.features;
 	data->kbd_led_single_color =3D device_descriptor.kbd_led_single_color;
 	data->kbd_led_max_brightness =3D device_descriptor.kbd_led_max_brightnes=
s;
-	data->lightbar_max_brightness =3D device_descriptor.lightbar_max_brightn=
ess;
+	data->lightbar_max_intensity =3D device_descriptor.lightbar_max_intensit=
y;
=20
 	/*
 	 * Some devices might need to perform some device-specific initializatio=
n steps
@@ -2685,7 +2682,7 @@ static struct uniwill_device_descriptor lapqc71a_lap=
qc71b_descriptor __initdata
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN,
-	.lightbar_max_brightness =3D 36,
+	.lightbar_max_intensity =3D 36,
 };
=20
 static struct uniwill_device_descriptor lapac71h_descriptor __initdata =
=3D {
@@ -2709,7 +2706,7 @@ static struct uniwill_device_descriptor lapkc71f_des=
criptor __initdata =3D {
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN,
-	.lightbar_max_brightness =3D 200,
+	.lightbar_max_intensity =3D 200,
 };
=20
 /*
@@ -3355,8 +3352,8 @@ static int __init uniwill_init(void)
 		device_descriptor.kbd_led_single_color =3D false;
 		/* Some models only support 3 brightness levels */
 		device_descriptor.kbd_led_max_brightness =3D 4;
-		/* Some models only support 36 brightness levels per color component */
-		device_descriptor.lightbar_max_brightness =3D 200;
+		/* Some models only support 36 intensity levels per color component */
+		device_descriptor.lightbar_max_intensity =3D 200;
 		pr_warn("Enabling potentially unsupported features\n");
 	}
=20
=2D-=20
2.39.5

