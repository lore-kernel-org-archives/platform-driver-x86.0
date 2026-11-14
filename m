Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650347;
	b=JucOovqKJ/zlLmWVPUwrBNbZ5J42NI8N9merAPH3S1iuQOpS3ccCyvb97i0tn0m5rPKb
	 MR+wSoqnYude1gOvd5Ducc55YQJNvL9qsIGFETWOdPlU/5Ce6dGdrTHvKjolNEFI0ehWs
	 vegAj3Rdtzw1XwTNvXQh8OjsQMKlP3j3K8RSZeRqkUDR1iBcz9yhn+elV5McdDX2y50z3
	 P2q/3V06JBmKVT+ucp9Ac6OTb0v2DrnAMjXqPp3TrFpuQ93xp2D88f9TFJgYc583PU5Qq
	 gA7ZFcpvSa8lYmp+qrZ7y8vRkHrY0q0kiuJfU50lTQZCAMMWkUHZlezwyIScacDmMBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650347;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=UxGs9R0TNm36/5Wcbz0ZI1Sowgg72C8LH2ue9z65ZKQ=;
	b=0K690j9+z4pEl9hSYXk66oPrxy6LmY6BEjnY1CFLeY/LazdF8zVzkTUjyq2XUeY1D929
	 IOApWu5cvXe61ZG2Fb0VqdVvBHHXvPFUeXeMgC1b5n36DAJxMoZvMELKB77AbwOrlHPAl
	 4C8pubeoQjqtpONlTxNgXm3pV/Fwv47sxjY5vGPFmjo8Hfls2jgrGn2XxcH9fzDagbmqN
	 6FGM/TYYSEsRIPq/yXWDSTLTSLz9+Cqk7eKz6rlta7G5sNVnpTPIWvp9mbXc5NevOIxJa
	 60uV0ezY/Eknp8D3WWDEyjpt6XHiJWmgy7gVK5RlMvj3+7YB5joNUn+cDRutI26Mdzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=VJkWrWLB;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94930606A331
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94930606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=VJkWrWLB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794650343; x=1794909543;
	bh=UxGs9R0TNm36/5Wcbz0ZI1Sowgg72C8LH2ue9z65ZKQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VJkWrWLBGbgrNSzBJgBP94Wq4tc16GpA1JCa9QnnN67yBZio6qbxh4G+LySzwJ6Ab
	 A6JejkUVrsbOQqwRce1S3DTtERZ5xROmAkvR2D9FqCF1E8ayogEbLRRDz5Rync9loR
	 KeWJVe3kMnmiQBzbckRLoC6cQ+fHfRfQsQrg483k+5OvgWsBJDcawUqBq2LADitd61
	 6XGA9297YUZ8pafYfiCSQkc3ru7ejeNEM0yEk8o9jastZrlF02Ve7q1Xk+gBD9Xqi/
	 pgoQ8xMiDvhjXY8JeIEL+Au+/VOES+nBpMN6AJVvKldRJNt7pU6bkofEqZBZ0ZBtO3
	 s6xBtxfeA82cg==
Date: Sat, 14 Nov 2026 09:58:58 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, Emfox Zhou <emfox@debian.org>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] media: ipu-bridge: Index the sensor device properties as the endpoint ones
Message-ID: <20261114095815.74012-6-lsa.uz@pm.me>
In-Reply-To: <20261114095815.74012-1-lsa.uz@pm.me>
References: <20261114095815.74012-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 34b5e374f24de8cd4b6a818bca217c6288fbe0b1
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

Fill dev_properties through an enum and IPU_BRIDGE_NEXT_PROPERTY(), as
ep_properties already is, so that an entry can be added without
counting slots by hand. No functional change.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v5: no change.
New in v4 (Sakari). The series that keeps what the software nodes point
to out of the module image is probably D. Manresa's, recalled on v3; it
changes the same lens-focus line, so whichever lands second needs a
trivial rebase:
https://lore.kernel.org/all/20261026082549.662885-1-dmanresa@gmail.com/

 drivers/media/pci/intel/ipu-bridge.c | 19 ++++++++-----------
 include/media/ipu-bridge.h           | 11 ++++++++++-
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 0f04395a2d7..4fa9d533e5e 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -592,7 +592,7 @@ static void ipu_bridge_create_fwnode_properties(
 {
 =09struct ipu_property_names *names =3D &sensor->prop_names;
 =09struct software_node *nodes =3D sensor->swnodes;
-=09unsigned int i =3D 0;
+=09unsigned int i =3D 0, d =3D 0;
=20
 =09sensor->prop_names =3D prop_names;
=20
@@ -634,19 +634,16 @@ static void ipu_bridge_create_fwnode_properties(
 =09=09=09SOFTWARE_NODE_REFERENCE(&nodes[SWNODE_SENSOR_ENDPOINT]);
 =09}
=20
-=09sensor->dev_properties[0] =3D PROPERTY_ENTRY_U32(
-=09=09=09=09=09sensor->prop_names.clock_frequency,
-=09=09=09=09=09sensor->mclkspeed);
-=09sensor->dev_properties[1] =3D PROPERTY_ENTRY_U32(
-=09=09=09=09=09sensor->prop_names.rotation,
-=09=09=09=09=09sensor->rotation);
-=09sensor->dev_properties[2] =3D PROPERTY_ENTRY_U32(
-=09=09=09=09=09sensor->prop_names.orientation,
-=09=09=09=09=09sensor->orientation);
+=09sensor->dev_properties[IPU_BRIDGE_NEXT_PROPERTY(d, DEV_CLOCK_FREQUENCY)=
] =3D
+=09=09PROPERTY_ENTRY_U32(names->clock_frequency, sensor->mclkspeed);
+=09sensor->dev_properties[IPU_BRIDGE_NEXT_PROPERTY(d, DEV_ROTATION)] =3D
+=09=09PROPERTY_ENTRY_U32(names->rotation, sensor->rotation);
+=09sensor->dev_properties[IPU_BRIDGE_NEXT_PROPERTY(d, DEV_ORIENTATION)] =
=3D
+=09=09PROPERTY_ENTRY_U32(names->orientation, sensor->orientation);
 =09if (sensor->vcm_type) {
 =09=09sensor->vcm_ref[0] =3D
 =09=09=09SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
-=09=09sensor->dev_properties[3] =3D
+=09=09sensor->dev_properties[IPU_BRIDGE_NEXT_PROPERTY(d, DEV_LENS_FOCUS)] =
=3D
 =09=09=09PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
 =09}
=20
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 3ef94c2b767..284e0d6cc93 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -89,6 +89,15 @@ enum ipu_bridge_ep_props {
 =09IPU_BRIDGE_EP_NUM_ENTRIES
 };
=20
+enum ipu_bridge_dev_props {
+=09IPU_BRIDGE_DEV_CLOCK_FREQUENCY,
+=09IPU_BRIDGE_DEV_ROTATION,
+=09IPU_BRIDGE_DEV_ORIENTATION,
+=09IPU_BRIDGE_DEV_LENS_FOCUS,
+=09IPU_BRIDGE_DEV_NUM_OF,
+=09IPU_BRIDGE_DEV_NUM_ENTRIES
+};
+
 /*
  * Get the index of the next property in a property array, with a given ma=
ximum
  * value.
@@ -179,7 +188,7 @@ struct ipu_sensor {
=20
 =09struct ipu_property_names prop_names;
 =09struct property_entry ep_properties[IPU_BRIDGE_EP_NUM_ENTRIES];
-=09struct property_entry dev_properties[5];
+=09struct property_entry dev_properties[IPU_BRIDGE_DEV_NUM_ENTRIES];
 =09struct property_entry ipu_properties[3];
 =09struct property_entry ivsc_properties[1];
 =09struct property_entry ivsc_sensor_ep_properties[4];
--=20
2.54.0


