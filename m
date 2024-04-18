Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEA353E3F
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 07:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713424999; cv=none; b=HrrBDcXwTAP8ct6KlGrqi37gCPYAz4eAcqoSskd/Us+6TO5KV3roMT/BVEGH8VaBpmS6p1BV64BK4+InfPxideXJcLwjijRa5y7UlOMEOwTMsX/wBDkex5LBXuBM1gkLYt7CfTiuayjwKV5Wf0Okroyu7abq9ubii4Tt9zQ6GmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713424999; c=relaxed/simple;
	bh=vgK0r6JlkgRyVng0vK7xeA2Mb4CDysk3xJwerY7ubwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HR5TD7+gCq2egvCNTCYEllcQeeOeaSyoDymoxuBMaUc484stj3SEtc6w7rpoq90Ry4RwAmBYndureeezZeBO4ePkHJTrdJtby8QyPaxNTCKPYPcaHRc5BcpZ5FA6DlH6S7Q8P0j1eFsw5MEzwHP9CFsN550Pmg09iKRsChRF3bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ree+GNpx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ree+GNpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713424996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVEgCUNH2+ucbxNW8o7LrLo4xbai7FQO2lfQoIgrFHE=;
	b=Ree+GNpxlyYuGul+c4N6gWpXRgFw2d8tO7MYqo+LVEI7KtNcrT3U/1vzDGTPynZNMWEYD/
	fo+/a5BngRis8xvs2ipRW+bu23HA9EdZY4XFsKH2IB5TNvRykc/R1Syy7LXpb2BAwfmxJu
	CXCRcg5s2wbqLUMEuDaWq7HpUXvpnpA=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-WjCNSn_sNBqy2BKX3g7KgQ-1; Thu, 18 Apr 2024 03:23:11 -0400
X-MC-Unique: WjCNSn_sNBqy2BKX3g7KgQ-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6ed5a1724b2so504231b3a.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 00:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713424990; x=1714029790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVEgCUNH2+ucbxNW8o7LrLo4xbai7FQO2lfQoIgrFHE=;
        b=N9WHBKfoHhWFSehj2vEjDIRhUDR9p7djAlDwD4K29WjjEQuY8GrIkRu2n1VfkR5cLa
         AbIv05/nlSAUiAibFGlljgMyUind98AZ15i1HsaER8L83Rt1ibRVDeMTvnhihS24cNyg
         ZOePNejmh5kuvFx1oJaa/YjsZ0iyjNBpPKQodJIkCX5Pu6f+AdJXtfFMbmrIdOwTgMRF
         BqcFwZ5s31ggAv62T1M15+iBsoLIYVMT8JywtIoiIKUU4HTbuTK+6o2r9Ygh94OHtoz9
         tW10YWEXrQFlodisBpl2ZW2aSBBrQ8fD0pzW+05OPBDbKpzTYAFAIYzhcalhnJaAUv4y
         d0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2O+3/HAFLmaCiKdlf3Q2xO/HRxvInW1l+jKa9nyro2oje8jzPmuXJbmN8qzIcnHo61ILvy0NjqJWzolJdWXCIMtbE1qg785Nx0/wj7rP+mWpbrw==
X-Gm-Message-State: AOJu0YxnQDCfIW5a4B6/+UFGIMC3wNjxwfJAzS7mitgE0hRumiD/DORC
	kOHWSojolNClbZ1t6UXCRb8gDeNLw5NKAeHVjibegTXu9l5/RlpnIEhER9z3IElw3sR5laitedo
	eLdQ6kYylzh4AyZ5UNXM6lRVVBbxKB4DB3khgZXVrkhitPw+qeuMTkQ4JpfGJ/ywjOlPjKG7KQ6
	ljYUXhQHtH7iDYzKarigM1HqBGcnWw8QnV3F91kX0hmpsx0Q==
X-Received: by 2002:a05:6a21:999b:b0:1aa:66ad:6094 with SMTP id ve27-20020a056a21999b00b001aa66ad6094mr2646447pzb.8.1713424990631;
        Thu, 18 Apr 2024 00:23:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb6KDSdMbWA5pEE2/RfPBEDrTWyeMJrakgp6Dj7adISR0wr3x3K1kxRaRUXVxLHPRcarcIGEu4VMy3oL4mikE=
X-Received: by 2002:a05:6a21:999b:b0:1aa:66ad:6094 with SMTP id
 ve27-20020a056a21999b00b001aa66ad6094mr2646428pzb.8.1713424990300; Thu, 18
 Apr 2024 00:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416053909.256319-1-hpa@redhat.com> <20240416053909.256319-3-hpa@redhat.com>
 <CAHp75Vdw6gCN=45iRdKcm=qT07Z90+z6Cw=inYR+C6+5gML+_Q@mail.gmail.com>
In-Reply-To: <CAHp75Vdw6gCN=45iRdKcm=qT07Z90+z6Cw=inYR+C6+5gML+_Q@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 18 Apr 2024 15:22:59 +0800
Message-ID: <CAEth8oHx66Q8esGNNgXnOOT2RJXTFMAo3RJPLHDYh9oewxJKxQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] leds: rgb: leds-ktd202x: Get device properties
 through fwnode to support ACPI
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for reviewing.

On Wed, Apr 17, 2024 at 1:29=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 16, 2024 at 8:39=E2=80=AFAM Kate Hsuan <hpa@redhat.com> wrote=
:
> >
> > This LED controller is installed on a Xiaomi pad2 and it is an x86
> > platform. The original driver is based on the device tree and can't be
> > used for this ACPI based system. This patch migrated the driver to use
> > fwnode to access the properties. Moreover, the fwnode API supports the
> > device tree so this work won't affect the original implementations.
>
> ...
>
> > -       int num_channels;
> > +       int num_channels =3D 0;
>
> Split this assignment, so...
>
> >         int i =3D 0;
>
> > -       num_channels =3D of_get_available_child_count(np);
>
> ...it become
>
>   num_channels =3D 0;
>
> here.
>
> > +       fwnode_for_each_available_child_node(fwnode, child)
> > +               num_channels++;
>

It will look like this:
       num_channels =3D 0;
       fwnode_for_each_available_child_node(fwnode, child)
              num_channels++;

> ...
>
> > -static int ktd202x_add_led(struct ktd202x *chip, struct device_node *n=
p, unsigned int index)
> > +static int ktd202x_add_led(struct ktd202x *chip,
> > +                          struct fwnode_handle *fwnode,
> > +                          unsigned int index)
>
> Why split over 3 lines? I believe it can be still two or one
> (depending if you use a relaxed limit).

Make it to be one line.

>
> ...
>
> >  static int ktd202x_probe_dt(struct ktd202x *chip)
>
> Perhaps you want to rename this to something like ktd202x_probe_fw().

Sounds good.

>
> ...
>
> > +       fwnode =3D dev_fwnode(dev);
>
> Will be no use if the bellow applied, right?

Right. It can be dropped.

>
> ...
>
> > -       for_each_available_child_of_node(np, child) {
> > +       fwnode_for_each_available_child_node(fwnode, child) {
>
> Use device_for_each_child_node() instead.

Okay.

>
> >         }
>
> ...
>
> > -       .shutdown =3D ktd202x_shutdown,
> > +       .shutdown =3D ktd202x_shutdown
>
> Stray change.

I know the reason  :)

>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
BR,
Kate

