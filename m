Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340548;
	b=OoHl7xPCO1SZCCx/0DseuN6j4JP9WI6dz6LWUVjl98Gp7Yhd1qWeB2gMs3wVZZMfBAzP
	 kVBc8O875j6NqniUWHvVeVFSnDNL332Ur77ezhlXGKoyeMWQ0sM5v7K9Dpu8lK1HziV64
	 zZK1Jj7uLswmI1hArGB9bZF1lKxndkFO7M0fpNBJn6BOzpK6W+KzcmwNovj2Okh+jJzW2
	 7IsrcjnGZTgH+P+es+weXYAp/C2BYE68NbO4OA9FUrEXZYCuycrFuJvQcve5CAKevaCmT
	 1p2dx/U4du5RmXMzygRGcMGbN5SXWw2a1PD17KcnZNs2pJWlzPM+Iad9uoCD/ie9KVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340548;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=xUGHLRH2DUAtwLZ1+cfsKCVVanZq7MpL7iaU6ALzyq4=;
	b=eSYsdMkcSYaYJlR35LZBdsT6WVgk/9kCUM0s7n2Q/wmQik3v6Xix5LroIrgOa5Bxle2+
	 kOy5EgYTEcTaLja2Y21ixCPVzG826qggPdBs6/lsMClnqxJZ3kpz45QK85nNxxWryws+p
	 TaHJL2WnfpJU8WHv/CqLCQuzfgNr3vZ+DmfSZ1uarv6up49qiWnPgIVwhFqJdW9Mse1gf
	 j0pAdwkXU/G31jbUiLMqv1sFgI9muJN0SBPOsuU4qwT/ECpXEP3S2FkbPrx+hI/tK1Uc2
	 SPme7TMjvuxgtucFWmUvZM+9JyGiGFCY5k/6z8tFY10jiG1gNcXE7COlBg+eCAFWbWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NPLfF3Fj;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0CF60A263F;
	Tue, 10 Nov 2026 19:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0CF60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NPLfF3Fj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794340544; x=1794599744;
	bh=xUGHLRH2DUAtwLZ1+cfsKCVVanZq7MpL7iaU6ALzyq4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NPLfF3FjGEXWCje60vdI9B1Vsu7PwjIKA9KlqPv8+IMeaoElBPDw3gxqZucrE4srY
	 Eq0+Dd/Ln5m+m2QvaMPxfx6IHuaSuUbZzoEH8z3XCfF1il5nu00Z5kA9jlJudrcYK5
	 6WNJAlwl75PR4TCdAun/jnxyxPGC6D4jCkFDWxDflmIF+lxEiYUWRl9h7dydfnPpIy
	 OU3VHlw3qCirydgezfVW3eL3e5q1dQxvReKH8AqBEfrnkfritZo4i8xsxil/C+0Udy
	 ZA0mfX7Lu094eWuVDCaDYxXQhwm+v3IIS8MjfDsrMMmqZWVngWxkMZBqLZLS8Fel5K
	 r0mle9IjGjz7g==
Date: Tue, 10 Nov 2026 19:55:41 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] media: ipu-bridge: Add the Surface Pro 9 and 11 infrared illuminator
Message-ID: <20261110195454.48176-7-lsa.uz@pm.me>
In-Reply-To: <20261110195454.48176-1-lsa.uz@pm.me>
References: <20261110195454.48176-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a9e5e513750ec23fc16d9f7cfcacdfe18fcd8053
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

On the Surface Pro 9 and on the Surface Pro 11 with Intel, the infrared
illuminator is driven by the VD55G0's GPIO 1, which strobes it during
the exposure. The ACPI tables do not describe it, so the sensor driver
finds no st,leds and offers no V4L2_CID_FLASH_LED_MODE.

Give the sensor's software node st,leds from a DMI match, as the
upside-down quirk gives a rotation, in a dev_properties entry after
lens-focus. The software nodes outlive the module, so the property name
goes into struct ipu_property_names and the GPIO numbers into struct
ipu_sensor, where nothing points into the module image.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v4: the st,leds entry takes its index through 5/6. Fernando's Tested-by
is off, as the code changed.
v3: no change.
v2: the st,leds name and GPIO numbers live in the bridge's own
structs, as the software nodes outlive the module (Fernando); the
Surface Pro 9 is added (Fernando).

 drivers/media/pci/intel/ipu-bridge.c | 64 ++++++++++++++++++++++++++++
 include/media/ipu-bridge.h           |  5 +++
 2 files changed, 69 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 2399a3d52b6..fe847fd39b4 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -283,6 +283,42 @@ static const struct dmi_system_id upside_down_sensor_d=
mi_ids[] =3D {
 =09{} /* Terminating entry */
 };
=20
+/*
+ * Sensor GPIOs that drive an illuminator, for machines whose ACPI tables =
do
+ * not say which. They reach the sensor driver as its own leds property.
+ */
+struct ipu_sensor_leds {
+=09const char *hid;
+=09u32 gpios[IPU_MAX_LED_GPIOS];
+=09unsigned int nr_gpios;
+};
+
+/* The infrared illuminator, strobed by the VD55G0's GPIO 1 */
+static const struct ipu_sensor_leds surface_pro_ir_leds =3D {
+=09.hid =3D "SMO55F0",
+=09.gpios =3D { 1 },
+=09.nr_gpios =3D 1,
+};
+
+static const struct dmi_system_id sensor_leds_dmi_ids[] =3D {
+=09{
+=09=09.matches =3D {
+=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 9"),
+=09=09},
+=09=09.driver_data =3D (void *)&surface_pro_ir_leds,
+=09},
+=09{
+=09=09.matches =3D {
+=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
+=09=09=09=09=09"Surface Pro for Business 11th Edition with Intel"),
+=09=09},
+=09=09.driver_data =3D (void *)&surface_pro_ir_leds,
+=09},
+=09{} /* Terminating entry */
+};
+
 static const struct ipu_property_names prop_names =3D {
 =09.clock_frequency =3D "clock-frequency",
 =09.rotation =3D "rotation",
@@ -292,6 +328,7 @@ static const struct ipu_property_names prop_names =3D {
 =09.remote_endpoint =3D "remote-endpoint",
 =09.link_frequencies =3D "link-frequencies",
 =09.clock_noncontinuous =3D "clock-noncontinuous",
+=09.st_leds =3D "st,leds",
 };
=20
 static const char * const ipu_vcm_types[] =3D {
@@ -563,6 +600,22 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, st=
ruct ipu_sensor *sensor)
 }
 EXPORT_SYMBOL_NS_GPL(ipu_bridge_parse_ssdb, "INTEL_IPU_BRIDGE");
=20
+static const struct ipu_sensor_leds *
+ipu_bridge_get_leds(const struct ipu_sensor_config *cfg)
+{
+=09const struct dmi_system_id *dmi_id;
+=09const struct ipu_sensor_leds *leds;
+
+=09for (dmi_id =3D dmi_first_match(sensor_leds_dmi_ids); dmi_id;
+=09     dmi_id =3D dmi_first_match(dmi_id + 1)) {
+=09=09leds =3D dmi_id->driver_data;
+=09=09if (!strcmp(cfg->hid, leds->hid))
+=09=09=09return leds;
+=09}
+
+=09return NULL;
+}
+
 static void ipu_bridge_create_fwnode_properties(
 =09struct ipu_sensor *sensor,
 =09struct ipu_bridge *bridge,
@@ -570,6 +623,7 @@ static void ipu_bridge_create_fwnode_properties(
 {
 =09struct ipu_property_names *names =3D &sensor->prop_names;
 =09struct software_node *nodes =3D sensor->swnodes;
+=09const struct ipu_sensor_leds *leds;
 =09unsigned int i =3D 0, d =3D 0;
=20
 =09sensor->prop_names =3D prop_names;
@@ -625,6 +679,16 @@ static void ipu_bridge_create_fwnode_properties(
 =09=09=09PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
 =09}
=20
+=09leds =3D ipu_bridge_get_leds(cfg);
+=09if (leds) {
+=09=09memcpy(sensor->led_gpios, leds->gpios,
+=09=09       sizeof(sensor->led_gpios));
+=09=09sensor->dev_properties[IPU_BRIDGE_NEXT_PROPERTY(d, DEV_ST_LEDS)] =3D
+=09=09=09PROPERTY_ENTRY_U32_ARRAY_LEN(names->st_leds,
+=09=09=09=09=09=09     sensor->led_gpios,
+=09=09=09=09=09=09     leds->nr_gpios);
+=09}
+
 =09sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_BUS_TYPE)] =3D
 =09=09PROPERTY_ENTRY_U32(names->bus_type,
 =09=09=09=09   V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 284e0d6cc93..46c7583ef4d 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -12,6 +12,7 @@
 #define IPU_MAX_LANES=09=09=09=094
 #define IPU_MAX_PORTS=09=09=09=094
 #define MAX_NUM_LINK_FREQS=09=09=093
+#define IPU_MAX_LED_GPIOS=09=09=094
=20
 /* Values are educated guesses as we don't have a spec */
 #define IPU_SENSOR_ROTATION_NORMAL=09=090
@@ -94,6 +95,7 @@ enum ipu_bridge_dev_props {
 =09IPU_BRIDGE_DEV_ROTATION,
 =09IPU_BRIDGE_DEV_ORIENTATION,
 =09IPU_BRIDGE_DEV_LENS_FOCUS,
+=09IPU_BRIDGE_DEV_ST_LEDS,
 =09IPU_BRIDGE_DEV_NUM_OF,
 =09IPU_BRIDGE_DEV_NUM_ENTRIES
 };
@@ -145,6 +147,7 @@ struct ipu_property_names {
 =09char remote_endpoint[16];
 =09char link_frequencies[17];
 =09char clock_noncontinuous[20];
+=09char st_leds[8];
 };
=20
 struct ipu_node_names {
@@ -187,6 +190,8 @@ struct ipu_sensor {
 =09const char *vcm_type;
=20
 =09struct ipu_property_names prop_names;
+=09/* The software nodes outlive the module, so these values live here */
+=09u32 led_gpios[IPU_MAX_LED_GPIOS];
 =09struct property_entry ep_properties[IPU_BRIDGE_EP_NUM_ENTRIES];
 =09struct property_entry dev_properties[IPU_BRIDGE_DEV_NUM_ENTRIES];
 =09struct property_entry ipu_properties[3];
--=20
2.54.0


