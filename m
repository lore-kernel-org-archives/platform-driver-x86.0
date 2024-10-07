Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8512C1D958F
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Oct 2024 18:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325577; cv=none; b=V4L6nZmtU3ym3vQGV0LO4/Nr1mLS3XnqXK373KXQT8F4FU1ODovc/oMSrkB2daioGqsZTct+0V+K9611Naf6FsroUQdLOtZoY7ojVuRdLxoLluWF9r8j2F5pIngplbgJ7CZ35q71LvdGlPB11U65gPPDci0tQ8NaWBfg0fcQzXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325577; c=relaxed/simple;
	bh=iCR80LF1SKErs/2QgV/lJwxhT2ZmpU7o0BLmuE57/NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBmCY3LC0Rqmy/ijl/TDMum/VG8kYdpZxma3v79jTM6PE0yAzHomcuC3g3jq76HFCJ8BQ4cIM0BcbcLd0ROF08F7KLz0TWR7BZ72U4823a7U/ELyfBVKLonpfxo19+P3Ikquojoe4ex2h26egmCJCA0wp3cAwB5EySPxBAm3YK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjYqfUXJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjYqfUXJ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a995f56ea2dso129932666b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Oct 2024 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728325574; x=1728930374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA/+iSW0vVVFZpp20XhUygtEixwJMWt5I5lW8ycpbDA=;
        b=OjYqfUXJihXdeI3Qwsy0n73mqPx5vZNMtxyGso6/tdsRGddjyDlsyYF3JFvLpaL7Ea
         MbU2W6ka5Kydt6eeDmyOunl+eWwrFTDdWoobDoKsDbRdiJo8D31pv3zOTJAiyPYZBqln
         y8hExtrS77F5xHE7vyPk6ziiVcxNLPFPNPC1NIc4Qkou2NuQOJ0vY3OD847cb6KKQtWL
         ls4+j3IyobOIHVj7engOPCzuP7XdHmqPZJoClNElRiGbMBf7jpkqXZVXr4h1yua0tzH2
         MhEkdSKo1zDcidWhVuGu47gpQwccV2CidozmuDflBzhUfGtv8L40VGsciEg1WECsCZ7e
         CTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325574; x=1728930374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA/+iSW0vVVFZpp20XhUygtEixwJMWt5I5lW8ycpbDA=;
        b=sZ23kT5cejq42HdMq4sITyZGb0d54r7V8BRGlWpUdCKeDreBcNn6PmzbRSb8aHmYpV
         hMR+pMfVsLVnW6mkt55xmTHPg9kMRf9TnWNbO/Zcfx0BGX1tz4boEigecyUGT4N0l30y
         G8ZnjulNcBuDXjlvTzpXS5wOpLeDiT5lg5yavbsCehN6VQJ7hcBOdE08Mrx4oPsvqgrF
         gOhcXrBLS+lSKxnCBm0fKG5HeG9C3vDiaBZMATNLksA0+ku6jrSKQCk3LMsS9EYejZg3
         gFRIG9LIHx4BHm2KHaHe2jHdKnuzjT6xtjwNGNTCE8/ZtSHgLm5Lnuc4Q0G5szFBJQ7x
         EwaA==
X-Gm-Message-State: AOJu0YwJrrlCTu1FvpuZIzU2ax16QJsaAoYIUu+gsmOPZZdbWcT7ne2O
	KT4P01IgGyAOIDs9CeM7anHfRs2KPZMqbCTvj8Hv9GVQiQBfsfPAzjVGNlGJTtKD+zjI32ydPnx
	8B+th50UpBYjpVHmZlVYUn643lQ==
X-Google-Smtp-Source: AGHT+IGpG2K/8tC7W8Dm+Ge20RL5OZZM7Cw+aZ/Iz3vjdPcaFpwLZU0+jt1gKlzmhoSBxP+KjBZC6kMhIJR4FjInhNw=
X-Received: by 2002:a17:907:961d:b0:a8d:3085:a7b1 with SMTP id
 a640c23a62f3a-a991bd989e0mr1602813266b.38.1728325573502; Mon, 07 Oct 2024
 11:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908223505.21011-1-jerome.debretagne@gmail.com> <20240908223505.21011-4-jerome.debretagne@gmail.com>
In-Reply-To: <20240908223505.21011-4-jerome.debretagne@gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Mon, 7 Oct 2024 20:25:37 +0200
Message-ID: <CA+kEDGGJyHYy8T2GJgVA_t6BEqxdGCuovuu1aYuqQZz=Y4Cemw@mail.gmail.com>
Subject: Fwd: [PATCH v2 3/5] platform/surface: aggregator_registry: Add
 Surface Pro 9 5G
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I've not sent this specific patch to the correct recipients according
to get_maintainer.pl, here is the forward to include you, Hans and
Ilpo. Sorry for the mistake.

Regards,
J=C3=A9r=C3=B4me

---------- Forwarded message ---------
De : J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
Date: lun. 9 sept. 2024 =C3=A0 00:40
Subject: [PATCH v2 3/5] platform/surface: aggregator_registry: Add
Surface Pro 9 5G
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
<linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
<linux-kernel@vger.kernel.org>, Maximilian Luz
<luzmaximilian@gmail.com>


Add SAM client device nodes for the Surface Pro 9 5G, with the usual
battery/AC and HID nodes for keyboard and touchpad support.

Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
---
 .../surface/surface_aggregator_registry.c       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c
b/drivers/platform/surface/surface_aggregator_registry.c
index 25c8aa2131d6..8b34d7e465c2 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -390,6 +390,21 @@ static const struct software_node
*ssam_node_group_sp9[] =3D {
        NULL,
 };

+/* Devices for Surface Pro 9 5G. */
+static const struct software_node *ssam_node_group_sp9_5G[] =3D {
+       &ssam_node_root,
+       &ssam_node_hub_kip,
+       &ssam_node_bat_ac,
+       &ssam_node_bat_main,
+       &ssam_node_tmp_sensors,
+       &ssam_node_hid_kip_keyboard,
+       &ssam_node_hid_kip_penstash,
+       &ssam_node_hid_kip_touchpad,
+       &ssam_node_hid_kip_fwupd,
+       &ssam_node_hid_sam_sensors,
+       &ssam_node_kip_tablet_switch,
+       NULL,
+};

 /* -- SSAM platform/meta-hub driver.
---------------------------------------- */

@@ -462,6 +477,8 @@ static const struct acpi_device_id
ssam_platform_hub_acpi_match[] =3D {
 MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_acpi_match);

 static const struct of_device_id ssam_platform_hub_of_match[]
__maybe_unused =3D {
+       /* Surface Pro 9 5G */
+       { .compatible =3D "microsoft,arcata", (void *)ssam_node_group_sp9_5=
G },
        /* Surface Laptop 7 */
        { .compatible =3D "microsoft,romulus13", (void *)ssam_node_group_sl=
7 },
        { .compatible =3D "microsoft,romulus15", (void *)ssam_node_group_sl=
7 },
--
2.45.2
