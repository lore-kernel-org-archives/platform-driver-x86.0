Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613D51A072A
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843058; cv=none; b=AeYqWGLCDau3RqFmkFfcjUuIXrOmAF5hPjKKJykCprA3Pm901mzRDzQH8LWerHwjMwCU23L2sVNJFJFG7z82muh9f/BNDQhPfy+VZqSCcLUmT5bRr53v01a+J+LG4OsZYiJpUo4wZ9zHbO8c+lbGw/ONV8u5ADGegSWcgqsHZAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843058; c=relaxed/simple;
	bh=xhnkrYYCqabhGZqcGli4C8rBM7Ubk96d48zAG40tm4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwCLqJzgVxWACr9eYvyanEBw43HmBQMyicANS1M7gaV6BsJQotEDC0ADqRTYSR3CKR8E7SUxc6lJGnEA9JKyLygLhnOWZqAmXEonJDiJnv4ieUFC1ZmfUGSJi8w4IbMND0fYF6S7mRPc/tbZtfDp46wpMDqSMY+xEKatniG/3uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A63vAESk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A63vAESk"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2161eb95317so38462865ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 07:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733843056; x=1734447856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LMUIHazDL7O2Lxpf+U9W4NEwMXJCS/AYu9zoqCrZI0=;
        b=A63vAESkU03pRbiqBRu1od8/UQHmpQOnX+JXLR33o2UfT4/Fq3EjFeH+Q2k/F4F4Zz
         /3bpCCoVl34rn192nW81lwASsLpM4OizdDghhOhFGJBlZqQDxexF5xHshS9BmRrO8Z3N
         IVTC6mfNwEKn1u+gPmD4jP5F3o6vw0nYJcn6pAMyI1biT0YG1KLb/6QA8utIykvAyxhw
         8VtRrJt3jNfJOp0hjZ+/5zixCm+o77JLtV42pDZ4GY9ZExFddSucq6kdnDPL30wkK9Qq
         24DCAGaCXE9aHPi3d78ZrDHs4mQbkK+DaHiwFrWmoOfTMY9WMQ2GDLAedrqkeJtPGTUT
         mw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843056; x=1734447856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LMUIHazDL7O2Lxpf+U9W4NEwMXJCS/AYu9zoqCrZI0=;
        b=LazKu7I8bgVbhXTs8SzrW4QO7hEIOYp2jGKtY5E28HkWrEUEjq/DKK7yUk7q9Y+9Ms
         SqccVY7cBveLrtPHCRti+PdY9Gsx1ewVLP7iAUklDQLVBNygQ72RMWRj8WFRSgCYMlKb
         ZPEiQk9w35ytEmBdKkQRucam1bSTUystpNnnO99uhTC6HBb+4Ghzmd+XfzKAwh7ASEUu
         NjoAgiLQeiBWbJxUcvygqIIIv9jWhc/uTSveWxx7fFaTQn9XColtf3lfrvxbz/XFIyc8
         63O5IVIZlR28M29VYs6nvoSuIPTdY3HIIoFTibrKMoZU9Q64F9BXl6e3nJrMcU11bvaT
         LSbQ==
X-Gm-Message-State: AOJu0YyaHWqvWlTExnm0oPp8i6IcB6mvzbiUFIXkkPrkOJvHy4SC3Nfp
	0iqwjkw4wEuJfqmS++nScdcf4jTvYBdorAwJy0S4VNYIHUNXly4DxPEuJq7u
X-Gm-Gg: ASbGncssQW9yvsgrG0x5YFI4Qw1T682O9f+pm1Ir9lMTANjA/dc33+3n4XYzxX/Qj+K
	b87nFmEFGxOKasRJ+2NwekBFkhtAn4IU83yoswLMWVjhAiIeacPbdUMbG5PlgXOSzA6Wd7Oe90A
	QIJzUhGYqC8qEk9svJh3zXzhj/C+oCjlfDyMjrFZItZr/fKzpUJLIh/9MslWGWYFfwH4D/V2pec
	dIyGvuWKqEqoxO2SEEPF/T5LlricZ+ycD0vZ8J1HVhS2ueB/kOYdMQIgi22ufs3eVzkBlEZA5E=
X-Google-Smtp-Source: AGHT+IFykLANv/vSwSUUhArQyw38zCPm58hMAHorFKjvYnu/TI7xI1niciJn6IYcIa9Trb11eFZI5g==
X-Received: by 2002:a17:90b:1e46:b0:2ee:c91a:ad05 with SMTP id 98e67ed59e1d1-2efcf110192mr7060903a91.3.1733843056384;
        Tue, 10 Dec 2024 07:04:16 -0800 (PST)
Received: from hmarchlinux-thinkpad.localnet ([27.73.98.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef9641d147sm5076015a91.27.2024.12.10.07.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:04:15 -0800 (PST)
From: Huy Minh <buingoc67@gmail.com>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject:
 Re: [PATCH] platform/x86: touchscreen_dmi: Add info for SARY Tab 3 tablet
Date: Tue, 10 Dec 2024 22:04:12 +0700
Message-ID: <4961546.GXAFRqVoOG@hmarchlinux-thinkpad>
In-Reply-To: <07b324aa-8d32-55e6-3200-0e846ccbf127@linux.intel.com>
References:
 <20241202221802.9711-1-buingoc67@gmail.com>
 <07b324aa-8d32-55e6-3200-0e846ccbf127@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, December 10, 2024 9:31:37=E2=80=AFPM Indochina Time Ilpo J=C3=
=A4rvinen wrote:
> On Tue, 3 Dec 2024, buingoc67@gmail.com wrote:
> > From: hmtheboy154 <buingoc67@gmail.com>
> >=20
> > There's no info about the OEM behind the tablet, only online stores
> > listing. This tablet uses an Intel Atom x5-Z8300, 4GB of RAM & 64GB
> > of storage.
> >=20
> > Signed-off-by: hmtheboy154 <buingoc67@gmail.com>
>=20
> Hi,
>=20
> Thank you for the patch.
>=20
> We need to have your proper name in From and Signed-off-by tag before a
> patch can be accepted. Please send a v2 with that fixed, thanks.
>=20
> --
>  i.
>=20

Thank you. I'll send a new patch. I thought I can keep this as I used to se=
nd=20
patches with the same name to Hans de Goede.=20


> > ---
> >=20
> >  drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/touchscreen_dmi.c
> > b/drivers/platform/x86/touchscreen_dmi.c index 0a39f68c641d..bdc19cd8d3=
ed
> > 100644
> > --- a/drivers/platform/x86/touchscreen_dmi.c
> > +++ b/drivers/platform/x86/touchscreen_dmi.c
> > @@ -855,6 +855,23 @@ static const struct ts_dmi_data rwc_nanote_next_da=
ta
> > =3D {>=20
> >  	.properties =3D rwc_nanote_next_props,
> > =20
> >  };
> >=20
> > +static const struct property_entry sary_tab_3_props[] =3D {
> > +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1730),
> > +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1151),
> > +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
> > +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> > +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> > +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-sary-tab-3.fw"),
> > +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> > +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> > +	{ }
> > +};
> > +
> > +static const struct ts_dmi_data sary_tab_3_data =3D {
> > +	.acpi_name	=3D "MSSL1680:00",
> > +	.properties	=3D sary_tab_3_props,
> > +};
> > +
> >=20
> >  static const struct property_entry schneider_sct101ctm_props[] =3D {
> > =20
> >  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
> >  	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> >=20
> > @@ -1615,6 +1632,15 @@ const struct dmi_system_id touchscreen_dmi_table=
[]
> > =3D {>=20
> >  			DMI_MATCH(DMI_BIOS_VERSION, "S8A70R100-
V005"),
> >  	=09
> >  		},
> >  =09
> >  	},
> >=20
> > +	{
> > +		/* SARY Tab 3 */
> > +		.driver_data =3D (void *)&sary_tab_3_data,
> > +		.matches =3D {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "SARY"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "C210C"),
> > +			DMI_MATCH(DMI_PRODUCT_SKU, "TAB3"),
> > +		},
> > +	},
> >=20
> >  	{
> >  =09
> >  		/* Schneider SCT101CTM */
> >  		.driver_data =3D (void *)&schneider_sct101ctm_data,




