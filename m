Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340539;
	b=zGvuuTLJ4l8awCLk/6KuHQQyYvE7wjTJwKlWoubkqHbIetS+RYjEmXFkGD8zgeyDbJ/U
	 lqsb1vZbMP6/F0zMEEZ3tm4TCGpyjac+nW+Keyp2UcjtNBl4wSEdxr7nBeDrmA3kDFsC/
	 ssZdU31Exqs5jtoAg9wnfuUbnCRVLd4S/e2ksLdITeIQLWFZB7/jQQbeUfICvw6dUt2U1
	 u7cFkuJe48EpabRc8ylZXnDxUSRGJDVPKmUZkQ/Gt136i8fWTD43EGR+l5MNq6nLi3W0H
	 SZO+y6bjdMr5VYU6WhsUbrIf0oDTavlfcDNnT5sxPHgcLSJfalXDBNi7zwZyIUyez5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340539;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=uIoaKU+WhtDOPDavT0BYjCyVI+GSt2myqJ5MXDT+xj0=;
	b=EpBdjsCb1X4jjY/Vmx3ME1m4ZYhKY1Syuj3V/6UIl6QvcgRvEqGePXPkt9BaaD8PtGWw
	 8G7WWPpwajSnEWKb0011exshEWZjk85rOdg81lvhvLUYYEKHZBEfo5X52oLdN1DGl4gxn
	 8GLaIUmUd7qXxwerQrPcx1S7itm/HpJygl9y/PV3XteMYYlZO1QWSCF+T4nmsH0C2yhX0
	 McVzibnqI7+F12GxW/dO1MLQEFr+krX5NB1xan/Z+0OsXKz35Hw5GNAyLVBpZ+MEJs/8K
	 SmHC3bohKfSyW+5n5USlXlUghSGpMPKS8pYX9Tf5KbPfwB7aCnHRJNtNrwV9KFjW6Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=MYlOm5Xe;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0783B60A2611;
	Tue, 10 Nov 2026 19:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0783B60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=MYlOm5Xe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794340530; x=1794599730;
	bh=uIoaKU+WhtDOPDavT0BYjCyVI+GSt2myqJ5MXDT+xj0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MYlOm5XeW63YR0Dp/nE1+ESRez6OEdqAMyeqJ0fblpXUOiLET4QdR/3qxOJUNG58Q
	 DyDir8Q3Z4ROGm6YHBcZSKEGQQplryu4WutYxlr6VdqH3QsjSDgKnaDbSr1YEIJuqd
	 ebbFIEcxPst7pwYgX0Yp7oIAqM16P/5AmT1oyE1w4OnYQyMYqczAEYhOK/XrOwQH2R
	 1u7JkWrNzLfWtzNCvjKNAIXOdPULvS+8w80Q/Gc0UeASDvfugREP/0x0e+2gbAwiQq
	 mPiZNR48TIK8SZZpUg2H061bNLzks0/9kMjnj6sCyNcWOE1ZtwMVvXwzwduCsGlTbz
	 W8DLUmNnyg/tA==
Date: Tue, 10 Nov 2026 19:55:26 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] platform/x86: int3472: Map the VD55G0 supplies to "vddio" and "vana"
Message-ID: <20261110195454.48176-4-lsa.uz@pm.me>
In-Reply-To: <20261110195454.48176-1-lsa.uz@pm.me>
References: <20261110195454.48176-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 291a552148be829449acf60710b5f33d7346ce95
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

The ST VD55G0 IR camera of the Surface Pro 11 with Intel (ACPI HID
SMO55F0) is powered through two GPIOs of an INT3472 discrete device: the
power enable, and type 0x10, which int3472 calls DOVDD. Which rail each
one feeds is not documented, and it cannot be measured here: the sensor
answers on I2C only with both on.

Intel's own control logic driver names type 0x10 Avdd, so map it to
"vana". The power enable takes "vddio"; whether it feeds VDDIO or VCORE
is not known either. VCORE is not described, so the driver gets a dummy
regulator for it. The vd55g0 driver enables all three together, so the
names do not change what the sensor gets.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
New in v4, so that 2/6 uses the same supply names on DT and ACPI
(Sakari). 2/6 needs it on ACPI.

 drivers/platform/x86/intel/int3472/discrete.c | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platfo=
rm/x86/intel/int3472/discrete.c
index b19ea6ee337..a7098b08f8b 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -150,6 +150,17 @@ static const char * const power_enable_hids_vdda[] =3D=
 {
 =09NULL
 };
=20
+static const char * const power_enable_hids_vddio[] =3D {
+=09"SMO55F0", /* vd55g0 on Microsoft Surface Pro 11 */
+=09NULL
+};
+
+/* Intel's own name for type 0x10 is Avdd */
+static const char * const dovdd_hids_vana[] =3D {
+=09"SMO55F0", /* vd55g0 on Microsoft Surface Pro 11 */
+=09NULL
+};
+
 /**
  * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
  * sensor driver (as in DT bindings)
@@ -199,6 +210,20 @@ static const struct int3472_gpio_map int3472_gpio_map[=
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
+=09{=09/* Sensors which expect "vana" as con_id for DOVDD */
+=09=09.hids =3D dovdd_hids_vana,
+=09=09.type_from =3D INT3472_GPIO_TYPE_DOVDD,
+=09=09.type_to =3D INT3472_GPIO_TYPE_DOVDD,
+=09=09.con_id =3D "vana",
+=09=09.enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
+=09},
 };
=20
 static bool int3472_gpio_map_hids_match(struct acpi_device *adev,
--=20
2.54.0


