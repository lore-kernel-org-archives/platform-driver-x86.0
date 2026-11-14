Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650353;
	b=lr2HoU29c+ZnyxE3kHEwuVBHOqyub4dG3/1SHU7U0eMGjxp835mQdqK/paNBSaa0lE+C
	 rBgaFeR2zFkeeGTd7cMRzj1djGtNaIeLlGXPdlPgv/VrOLKDGOwo6mZnZYYSxjTeUfp20
	 U66w/gYfIoMtuEIo1K0hmSfsLAUMgqBazpr0Ylxe3IOIes7ZZdiRCoC8eAEIWd4I9bYCQ
	 5goxOTVor53TDpczWchLTfXBEengCdS7S3xUPTHL+G4EzEVwPAY5nMw1GHgrFBWpuX00w
	 eUIfuyUbgYWYJVA8skgnLW9QO1ZEWQU1IHxAH+w14CU5YrRfC3ZqaHDnb6ZatasJVwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650353;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=y5ahDu/LB87CaZQzFchRv3LOKn/cvSr/kuogsWG99kc=;
	b=Gpv2yIkvByToMzOiFH/nKeFYNPpi2HEB0vzSnr2a2pAa4A+ZC0eXBCd5FyDcEgaEkbRP
	 x7auvIdQL9wRRK2oXw2FL6VgQCXHOQCsyZz3xWINfF5wY7lIXQ94p7kyeGGu87yLXQSf/
	 uziLFMzuPcSoCdyfTXt5onrg+lhEx7xF3/MPaqs7fQYz9g4NPSdQUhBIsyVFMqyXn9o4+
	 fZGdEpV4qK1cXGvlJkzismWaBPABXOkUtEgv3V/3efuLCsiqcEYkOUmhtdajz0mwp5Rty
	 /5K6WFW72CCMmm70gifiLPbOxRW8lcb73GheV4fw3PcHGp7YmotjiT0WgInlc5u//Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=JQfqGFAq;
	arc=none smtp.remote-ip=79.135.106.28
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CDC606A333;
	Sat, 14 Nov 2026 09:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7CDC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=JQfqGFAq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794650350; x=1794909550;
	bh=y5ahDu/LB87CaZQzFchRv3LOKn/cvSr/kuogsWG99kc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JQfqGFAqharJqgkFj6y+CjFO92dmo05fb2KYOzjte59GBrHQaaNnn8Vx7ClfjHFkT
	 yw3qBq9mz7Df8FWSqK3SZCnGhjoq/J/9Tp+puWvX1eb27d/hziyn+7aoQsMAujKiUB
	 /egOqA4Ozhej39QB+/hCfMH6fz45KO+O0+fC/19fINdxeGuZ4R5SQewleHWzZ32ZFX
	 lBTCoVMalwWINY5jYUNrkt0RKRSWVFr9UU4gG/9RGUvLzZ8a/0H5+p9XIr2CGKwTed
	 7WFU4jlKEsaSAXeC0SJ2NvO2nnUJVfNvukbuWg0NauF77OO+daf3VSJ7m2d28axY5e
	 6QTiDgHfMx+uw==
Date: Sat, 14 Nov 2026 09:59:05 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, Emfox Zhou <emfox@debian.org>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] media: ipu-bridge: Add the Surface Pro 8, 9 and 11 infrared illuminator
Message-ID: <20261114095815.74012-7-lsa.uz@pm.me>
In-Reply-To: <20261114095815.74012-1-lsa.uz@pm.me>
References: <20261114095815.74012-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 9fd48edfb60329c2b9574410e9a26116f02e32b2
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

On the Surface Pro 8, 9 and 11 with Intel, the infrared illuminator is
driven by the VD55G0's GPIO 1, which strobes it during the exposure. The
ACPI tables do not describe it, so the sensor driver finds no st,leds
and offers no V4L2_CID_FLASH_LED_MODE.

Give the sensor's software node st,leds from a DMI match, as the
upside-down quirk gives a rotation, in a dev_properties entry after
lens-focus. The software nodes outlive the module, so the property name
goes into struct ipu_property_names and the GPIO numbers into struct
ipu_sensor, where nothing points into the module image.

Tested-by: Emfox Zhou <emfox@debian.org>
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v5: the Surface Pro 8, and Emfox's Tested-by: he ran v4 with this
entry added.
v4: the st,leds entry takes its index through 5/6. Fernando's Tested-by
is off, as the code changed.
v3: no change.
v2: the st,leds name and GPIO numbers live in the bridge's own
structs, as the software nodes outlive the module (Fernando); the
Surface Pro 9 is added (Fernando).

 drivers/media/pci/intel/ipu-bridge.c | 71 ++++++++++++++++++++++++++++
 include/media/ipu-bridge.h           |  5 ++
 2 files changed, 76 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 4fa9d533e5e..9a3c78b056c 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -305,6 +305,49 @@ static const struct dmi_system_id upside_down_sensor_d=
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
+=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 8"),
+=09=09},
+=09=09.driver_data =3D (void *)&surface_pro_ir_leds,
+=09},
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
@@ -314,6 +357,7 @@ static const struct ipu_property_names prop_names =3D {
 =09.remote_endpoint =3D "remote-endpoint",
 =09.link_frequencies =3D "link-frequencies",
 =09.clock_noncontinuous =3D "clock-noncontinuous",
+=09.st_leds =3D "st,leds",
 };
=20
 static const char * const ipu_vcm_types[] =3D {
@@ -585,6 +629,22 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, st=
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
@@ -592,6 +652,7 @@ static void ipu_bridge_create_fwnode_properties(
 {
 =09struct ipu_property_names *names =3D &sensor->prop_names;
 =09struct software_node *nodes =3D sensor->swnodes;
+=09const struct ipu_sensor_leds *leds;
 =09unsigned int i =3D 0, d =3D 0;
=20
 =09sensor->prop_names =3D prop_names;
@@ -647,6 +708,16 @@ static void ipu_bridge_create_fwnode_properties(
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


