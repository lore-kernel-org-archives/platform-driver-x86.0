Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650331;
	b=GgshaLouZkrn+1a0unizMhOqASOjbhKS/E5LExZ98vnWhRSXVJkYPmrCS1MsaCBg7++t
	 CU6jREfDAuC4eBqSK5VemrgU0eDh8WcN8koydo0dc1dxHpmjVj2qZ7XypEg9td4/BhxIx
	 m/+44hOrtDjFSV84ikm0ikmVVOQdnikIxxH3oG3TujdroPjscqvA6QI0vGkMlMUHl/eL/
	 G9LpdPrIKBg4kMiI6bdswvE3A0U1cGh+lTrcV5fhLxX7p298S3AsAxOYLnyruurNfYWkA
	 89V1HxrNMFR7tyniN07sQX6eoPErHb740D7ra/b7Cd8N2q32gO+j3mBtISDe5ISGyBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650331;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=bglYoHNf594Uu9uAnFB2QRdNH/pghYHpeE23xqM1qyg=;
	b=thEJqkrvaQ9YUF+Pz24yb+G7ulNrzgxJGJL7voSpgkwSvWGvbCCShWY7+EG3yERSwl5U
	 o/cvIz/EUgd4ZU3SrsL4Ci9KPrr4NagHp1H3NAMn7cQ70cjn47PadOnW36f8KCqYBGoMa
	 WKLEgWMzzXDkuoxiChuOfLkyASKoljmWzZ6x5xF6tEILHUZS+R9PL1chTc+7v2Ovt5DBZ
	 iYcbEBhwvETNLoFOqjP9XOLRkFsswjg9YkLjmbuxNN96sZRCmt+7eE+FSrdQAC2KznD6f
	 uUK2xkJghFR6lIas372/KIAk3erQf62TDJx8cfdyFv6CpsA3UuMnbabZGYT6hsq4kZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nxRMBL6W;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E45606A335;
	Sat, 14 Nov 2026 09:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E45606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nxRMBL6W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794650328; x=1794909528;
	bh=bglYoHNf594Uu9uAnFB2QRdNH/pghYHpeE23xqM1qyg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nxRMBL6WUC0i9pFygbe7KVyqUNcagRuOoq+w4xXnEor/rjONWC4nweSSL6R/VBcAF
	 5mJa0dSS6F9CPFXZkVUorwwgB5vBkbPnWUaB2oT0XNj49xnr7jdWb01Q741ZAXGdAj
	 3/6pLqmSKsGKStGzT1wUjS8CvQbSU2e1ygYNyU7QE0OXS5WzS6ooEVthbW0Vd38yO0
	 Q6R8Wg/Lfrp4gwQcuXgQtyCOK2QSHl0VKz2RwlF6A2V38hc8d0qlEpXKfHf54LkKYu
	 xpSVKdQZQDQVW3jMZNYO3GD0TfCj/NtCajWzkWPKYqycIwkWXyyJxavtG5qnSRtX9f
	 NK7XrqsAtSIIA==
Date: Sat, 14 Nov 2026 09:58:44 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, Emfox Zhou <emfox@debian.org>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/6] platform/x86: int3472: Map the VD55G0 supplies to "vddio" and "vana"
Message-ID: <20261114095815.74012-4-lsa.uz@pm.me>
In-Reply-To: <20261114095815.74012-1-lsa.uz@pm.me>
References: <20261114095815.74012-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a2ff2bc566fb3a2b0d2a95a7a9c7d03d8c5d9b9b
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

The ST VD55G0 IR camera of the Surface Pro 8 and of the Surface Pro 11
with Intel (ACPI HID SMO55F0) is powered through two GPIOs of an INT3472
discrete device: the power enable, and AVDD. Which rail each one feeds
is not documented, and it cannot be measured here: the sensor answers on
I2C only with both on.

Map AVDD to "vana". The power enable takes "vddio"; whether it feeds
VDDIO or VCORE is not known either. VCORE is not described, so the
driver gets a dummy regulator for it. The vd55g0 driver enables all
three together, so the names do not change what the sensor gets.

Tested-by: Emfox Zhou <emfox@debian.org>
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v5: on media-committers next, where type 0x10 is INT3472_GPIO_TYPE_AVDD
(Hans de Goede's series), so the vana entry keys on it, and the message
no longer quotes Intel's name for it. Emfox's Tested-by, from the
Surface Pro 8, which this map covers as it stands.
New in v4, so that 2/6 uses the same supply names on DT and ACPI
(Sakari). 2/6 needs it on ACPI.

 drivers/platform/x86/intel/int3472/discrete.c | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platfo=
rm/x86/intel/int3472/discrete.c
index ff94dc2ad8a..abd20345f33 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -150,6 +150,16 @@ static const char * const power_enable_hids_vdda[] =3D=
 {
 =09NULL
 };
=20
+static const char * const power_enable_hids_vddio[] =3D {
+=09"SMO55F0", /* vd55g0 on Microsoft Surface Pro 8 and 11 */
+=09NULL
+};
+
+static const char * const avdd_hids_vana[] =3D {
+=09"SMO55F0", /* vd55g0 on Microsoft Surface Pro 8 and 11 */
+=09NULL
+};
+
 /**
  * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
  * sensor driver (as in DT bindings)
@@ -199,6 +209,20 @@ static const struct int3472_gpio_map int3472_gpio_map[=
] =3D {
 =09=09.con_id =3D "vana",
 =09=09.enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
 =09},
+=09{=09/* Sensors which expect "vddio" as con_id for power enable */
+=09=09.hids =3D power_enable_hids_vddio,
+=09=09.type_from =3D INT3472_GPIO_TYPE_POWER_ENABLE,
+=09=09.type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,
+=09=09.con_id =3D "vddio",
+=09=09.enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
+=09},
+=09{=09/* Sensors which expect "vana" as con_id for AVDD */
+=09=09.hids =3D avdd_hids_vana,
+=09=09.type_from =3D INT3472_GPIO_TYPE_AVDD,
+=09=09.type_to =3D INT3472_GPIO_TYPE_AVDD,
+=09=09.con_id =3D "vana",
+=09=09.enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
+=09},
 };
=20
 static bool int3472_gpio_map_hids_match(struct acpi_device *adev,
--=20
2.54.0


