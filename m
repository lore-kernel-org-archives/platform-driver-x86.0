Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DCBBA39
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Mar 2024 05:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711086314; cv=none; b=p4POfEcyiLLvlqmQpBErwSuxBOoDiBvvozZ1XZAyWsynbnl57ylDih59itoFfEfDmYCwphHgpQuOUHBTy3rWgcZmj9TuXFGiBa9ZQjmfsdmyOG1rK7QF2upakBpdZ2xxrlC4PzzjUboMp5cM51azlkYy8VZZ73nU6v3Ng2e3iyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711086314; c=relaxed/simple;
	bh=b4UeU92r62bIY8HhL/ow3jMfrvwN8JSL7OEhfPL5vDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofEcBRitEH7L/Hw/pGn1dyOANEk7SMBQY6Sl0y0pfDKGzB9HxJqhptA0yEAIQmSnI4D2jvSAe1DcbArUObp+ZXdTbIjzlzp/nbkpsNf5pYynAH5tPOLqAaZtdptjvZr6rNqNZwBDsler89MqSbyDhk6iQwSn+g0fa1DgZzcVKkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gICQFT4v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gICQFT4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711086311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2v9+xfia68QeoWpLPgvZTLinBR+rs9FvXTVbndoolI0=;
	b=gICQFT4vleE7W+uRVvB/W/UyA4/Abc5bASUyoRczv8Eed0FYeTwbpqtaouaH/7HOZkDRNW
	0IYE8K33fXy1g8UOfjjXMTgegTiO/odnNPiJjalCeiIoxrKs+QLbbmSkLsthDSQojM9gVz
	U5OQRYtp2ZmiQh86mZsW5Q1Y0o8DejY=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-iocdtue0M92HBSMXktBs3Q-1; Fri, 22 Mar 2024 01:45:07 -0400
X-MC-Unique: iocdtue0M92HBSMXktBs3Q-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3c38d36262aso1603435b6e.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Mar 2024 22:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711086306; x=1711691106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v9+xfia68QeoWpLPgvZTLinBR+rs9FvXTVbndoolI0=;
        b=A/IHmogXfPyUS9UUU4VcwtIJAosbBLaWX6kYdengpyo+2BvDkP6UGKY0FIg4J78I5G
         zvS1r+3yzyig2OydDSKW2bxFhiTRRunN87XgN1sSgE+q8XAea3+/8iBonvrIEUt2gYBe
         N1gbEa8qK2CwgdxJyq3WxfqbRDeqOGJI6FFHdn7QLgtTCsGqJmHh5hCcAnzK4GWGcUxL
         4O9TjSxJrggk4Nb58bD1+oZimiMB+/ZLOgCT3+hEnFK3HI8lPHj5uQP13VYhckiNhKIC
         sDEvdN6zpIcHCoYWzak8JpZuVRrjabU+NBTCV0NAYg0jDGUqlH8MCo9w56YeTWiho9uY
         fNng==
X-Forwarded-Encrypted: i=1; AJvYcCXI1ybAWxi0zFOH5/yfVIfqoXnj7XFEr7FO7Orb69tkmtXY1lk+0tWQJ4SNuAfDsDWdtBgbmgeYY1Zxu34j0lcJeVf4AADgSvFmpFx7yUolLdGksA==
X-Gm-Message-State: AOJu0YxOpO67lF/W/aeH1XPDFi31SI7z1S2W38De3Y5YIFxjHX3zUYHz
	mL5rJ171OLPALjRAqjiGgB4aWu6HrB004ojJf9V91KwyKOMz9lT7a5+qneShTXYwh13flA8x4oe
	QOcTYRL4VOprGbdEr05ujyYYQkUF0cZf0RCSwxIsOgYkmiFRe6AQCbvpTvntPGcXYOv42Arl2Cp
	JsSbl3Wi3mdTM3xO1bAnVtlePE0QxEbrRMov+/GlLvXa6eCw==
X-Received: by 2002:a05:6808:16a2:b0:3c1:7eac:a8a8 with SMTP id bb34-20020a05680816a200b003c17eaca8a8mr1460921oib.26.1711086306411;
        Thu, 21 Mar 2024 22:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjP042aRQsdUdB9ehHITlv37xk5alHFWxpQm2MqNv8pk9MTzqxxtDhf60Pr2uz0kgKfHbuG+XxWZGNk/DWcmk=
X-Received: by 2002:a05:6808:16a2:b0:3c1:7eac:a8a8 with SMTP id
 bb34-20020a05680816a200b003c17eaca8a8mr1460912oib.26.1711086306145; Thu, 21
 Mar 2024 22:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306025801.8814-1-hpa@redhat.com> <20240306025801.8814-3-hpa@redhat.com>
 <Ze-N_y5Tbjc93aRp@surfacebook.localdomain>
In-Reply-To: <Ze-N_y5Tbjc93aRp@surfacebook.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 22 Mar 2024 13:44:54 +0800
Message-ID: <CAEth8oEdzomdn5avXf44HXpoMFDfGpOjjxPFtaGkh0EhfZsPMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] leds: rgb: leds-ktd202x: Get device properties
 through fwnode to support ACPI
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Thank you for reviewing.

On Tue, Mar 12, 2024 at 7:04=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Wed, Mar 06, 2024 at 10:58:01AM +0800, Kate Hsuan kirjoitti:
> > This LED controller also installed on a Xiaomi pad2 and it is a x86
> > platform. The original driver is based on device tree and can't be
> > used for this ACPI based system. This patch migrated the driver to
> > use fwnode to access the properties. Moreover, the fwnode API
> > supports device tree so this work won't effect the original
> > implementations.
>
> ...
>
> > +     fwnode_for_each_available_child_node(np, child) {
>
> Please, rename np to fwnode to avoid confusion.
>
> > +             num_channels++;
> > +     }
>
> ...
>
> > -     for_each_available_child_of_node(np, child) {
> > +     fwnode_for_each_available_child_node(np, child) {
> >               u32 mono_color;
> >               u32 reg;
> >               int ret;
> >
> > -             ret =3D of_property_read_u32(child, "reg", &reg);
> > +             ret =3D fwnode_property_read_u32(child, "reg", &reg);
> >               if (ret !=3D 0 || reg >=3D chip->num_leds) {
> >                       dev_err(chip->dev, "invalid 'reg' of %pOFn\n", ch=
ild);
>
> Must be %pfw now.
>
> > -                     of_node_put(child);
> > +                     fwnode_handle_put(child);
>
> >                       return -EINVAL;
>
> Side note: This shouldn't shadow error code when ret !=3D 0.
>
> >               }
>
> ...
>
> > -             ret =3D of_property_read_u32(child, "color", &mono_color)=
;
> > +             ret =3D fwnode_property_read_u32(child, "color", &mono_co=
lor);
> >               if (ret < 0 && ret !=3D -EINVAL) {
> >                       dev_err(chip->dev, "failed to parse 'color' of %p=
OF\n", child);
>
> Must be %pfw now.
>
> > -                     of_node_put(child);
> > +                     fwnode_handle_put(child);
> >                       return ret;
> >               }
>
> ...
>
> > -     ret =3D of_property_read_u32(np, "reg", &reg);
> > +     ret =3D fwnode_property_read_u32(np, "reg", &reg);
> >       if (ret !=3D 0 || reg >=3D chip->num_leds) {
> >               dev_err(chip->dev, "invalid 'reg' of %pOFn\n", np);
>
> Must be %pfw now.
>
> >               return -EINVAL;
>
> >       /* Color property is optional in single color case */
> > -     ret =3D of_property_read_u32(np, "color", &color);
> > +     ret =3D fwnode_property_read_u32(np, "color", &color);
> >       if (ret < 0 && ret !=3D -EINVAL) {
> >               dev_err(chip->dev, "failed to parse 'color' of %pOF\n", n=
p);
>
> Must be %pfw now.
>
> >               return ret;
> >       }
>
> ...
>
> > +     struct fwnode_handle *child, *np;
>
> Do not use np for sturct fwnode_handle. It will be quite confusing.
>
> ...
>
> > -     chip->num_leds =3D (int)(unsigned long)of_device_get_match_data(c=
hip->dev);
> > +     count =3D device_get_child_node_count(dev);
>
> >
>
> Redundant blank line.
>
> > -     count =3D of_get_available_child_count(np);
> >       if (!count || count > chip->num_leds)
> >               return -EINVAL;
>
> ...
>
> > +     chip->num_leds =3D (unsigned long)i2c_get_match_data(client);
>
> No warnings during compilation?
Yes, the compiler doesn't complain about it.

>
> ...
>
> > +static const struct i2c_device_id ktd202x_id[] =3D {
> > +     {"ktd2026", KTD2026_NUM_LEDS},
> > +     {"ktd2027", KTD2027_NUM_LEDS},
> > +     {},
>
> N ocomma for the terminator entry.
>
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ktd202x_id);
>
> ...
>
> > +#ifndef CONFIG_ACPI
>
> Please, no. Drop them.
Okay, I've dropped them in v5 patch.

>
> >  static const struct of_device_id ktd202x_match_table[] =3D {
> >       { .compatible =3D "kinetic,ktd2026", .data =3D (void *)KTD2026_NU=
M_LEDS },
> >       { .compatible =3D "kinetic,ktd2027", .data =3D (void *)KTD2027_NU=
M_LEDS },
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, ktd202x_match_table);
> > +#endif
> >
> >  static struct i2c_driver ktd202x_driver =3D {
> >       .driver =3D {
> >               .name =3D "leds-ktd202x",
> > +#ifndef CONFIG_ACPI
> >               .of_match_table =3D ktd202x_match_table,
> > +#endif
>
> This is quite unusual besides being ugly.
>
> >       },
> >       .probe =3D ktd202x_probe,
> >       .remove =3D ktd202x_remove,
> >       .shutdown =3D ktd202x_shutdown,
> > +     .id_table =3D ktd202x_id,
> >  };
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
BR,
Kate

