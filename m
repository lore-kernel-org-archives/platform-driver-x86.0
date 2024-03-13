Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD6EBE66
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Mar 2024 07:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710315901; cv=none; b=P9S3vwfkUE2JkI2x2b37sjtOOwuX9UCJVC/wuU6PZEA0kzxzz0aEU8BsEhGfo0tO3QlUx1X+JVmZQR0rCFdvZ7s4r2/Cam6j6uX7QJZ3iJ1m7HeKVr5Kago/VuSCLk5+X90VGakm6ovVDE8sv+WjS5zg3+7IJ42/FexxxIfr3BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710315901; c=relaxed/simple;
	bh=8anSx8q99+x/R1N4KLqO1nqPHUMqJRw5y6ZKWDoREsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aw7skH29wtjEmaO1BMZ5jv4Xvd87wjzD3nSfgN0Xt0y7HWywjs8QHBk9jeO9gQm5pIytHKETeHDfG9VIEt/DoceD6JVYiRpLVo1c7E/jn4okxc635LsPKfBhrtXCo1NaigxxEIjjmzSpNSyahHiA/fI+8gmp9S5Q0Va8D+LH8d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y9acsCeh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y9acsCeh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710315898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WGrURXceHY9m9JciYiADkX3iVVWUeKWeoiT1soRGRlo=;
	b=Y9acsCehkJwk6MLhfjKYpDKO5aRBX72yfggc4OIiYWuJFiovaQvlZMFvz2UsUIVWOBLgJ1
	8Eug5sF5vDrmNS21ZG4TS8RacZKb5CMPhWFAcTglJqCE3xf05KkOXKAZGYddLV+fsTzH41
	QLgoSyomw8Pv5yR0fKKQ2GmSYbfMeO8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-kVD_V_XxPvq3j_2qpBUMaA-1; Wed, 13 Mar 2024 03:44:57 -0400
X-MC-Unique: kVD_V_XxPvq3j_2qpBUMaA-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-29bd6f4329cso3418436a91.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Mar 2024 00:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710315896; x=1710920696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGrURXceHY9m9JciYiADkX3iVVWUeKWeoiT1soRGRlo=;
        b=a/QrBF+F7wiWpB1kpj+Ghd6m/cwVLkDih3PZ0xq+4phpPrOewjR+Wj6K504/UKEURy
         FS53fklppDW5AvlNQNDCgeTKJCty2sgyfJQNyg/k65CTVX0c48021/7dl+NmJe1wr8is
         qhWup9HbGzVD6TsNaZCVtjwut/N6RCT81t3HVxqJglNHSilwD7Ft3kfiF9RhAN57av6f
         SwIanT7QFhn2oBR/pomgRHSeG5+BImLUh9EEN3GcKYESwuj5BFL33m4rH2x2tJNhnIQb
         fNEdK9EyjyfA0EH2KCdYJ0kP6hu54X3am0McqScSLqTIh3u0mtcdqxWKdGbWGzaWdZyb
         ZDWA==
X-Forwarded-Encrypted: i=1; AJvYcCW+rvqlS744Y63lYbaLDhDoNy1Wq9lON7oVC4KdjS+1wl1JmZZsxnBwlGNR6uFW3PXzsVoeJ/XTcB+g7mvlr8dTPxQOcIsXOd9AVgxyvX+b4Nhk9Q==
X-Gm-Message-State: AOJu0Yyp8Hfj9iGPl5tPqjoWzGVWZTdGLRIG3cF1hqFyg1o6w/TkkGFo
	5W22/ltVJAulsfQu835JFaYWV9PX1H1E9Du3kQQp+1qgxyb3+QDgQtf8Fz0NzpVH9wuKGL8V/y/
	aYqbErAVpmj2yyRM0tqEK4tuqkLjQbFXY+SC/q4s0dtPLfR5+P8XdFut1ipVPcdsHSKvSyuvO92
	nKsQx3vz1Y+5++GdSwptzOg8KVNPT4v/E/n5/b/U0KHGVpsw==
X-Received: by 2002:a17:90a:6b0e:b0:29b:c17c:5fa6 with SMTP id v14-20020a17090a6b0e00b0029bc17c5fa6mr8532082pjj.33.1710315896301;
        Wed, 13 Mar 2024 00:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEnecfTlt1S5a/TCBvW3wjmZmuTlvFN/9s7nOHl7xM0rjUN5wKmXbKaRmsc/jVnIyYox8COM7YCe9OeUiPGHk=
X-Received: by 2002:a17:90a:6b0e:b0:29b:c17c:5fa6 with SMTP id
 v14-20020a17090a6b0e00b0029bc17c5fa6mr8532076pjj.33.1710315895932; Wed, 13
 Mar 2024 00:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306025801.8814-1-hpa@redhat.com> <20240306025801.8814-2-hpa@redhat.com>
 <Ze-I63bNzaMkHfgg@surfacebook.localdomain> <18ef7e97-db6e-2dc4-5728-5a539ae4c9bb@linux.intel.com>
In-Reply-To: <18ef7e97-db6e-2dc4-5728-5a539ae4c9bb@linux.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 13 Mar 2024 15:44:44 +0800
Message-ID: <CAEth8oHvgTzUhSrJUduS621J_1ow1dWySXTLX+mSwk3HHv25Vw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] platform: x86-android-tablets: other: Add swnode
 for Xiaomi pad2 indicator LED
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 6:35=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 12 Mar 2024, Andy Shevchenko wrote:
>
> > Wed, Mar 06, 2024 at 10:58:00AM +0800, Kate Hsuan kirjoitti:
> > > There is a KTD2026 LED controller to manage the indicator LED for Xia=
omi
> > > pad2. The ACPI for it is not properly made so the kernel can't get
> > > a correct description of it.
> > >
> > > This work add a description for this RGB LED controller and also set =
a
> > > trigger to indicate the chaging event (bq27520-0-charging). When it i=
s
> > > charging, the indicator LED will be turn on.
> >
> > Ilpo, Kate, please consider the following remarks.
> >
> > ...
> >
> > >  #include <linux/gpio/machine.h>
> > >  #include <linux/input.h>
> > >  #include <linux/platform_device.h>
> >
> > + Blank line?
> >
> > > +#include <dt-bindings/leds/common.h>
> >
> > Not sure where to place this, some drivers put it the first, some after=
 linux/*.
> >
> > ...
> >
> > > +/* main fwnode for ktd2026 */
> > > +static const struct software_node ktd2026_node =3D {
> >
> > No name?
> >
> > > +};
> > > +
> > > +static const struct property_entry ktd2026_rgb_led_props[] =3D {
> > > +   PROPERTY_ENTRY_U32("reg", 0),
> > > +   PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
> > > +   PROPERTY_ENTRY_STRING("function", "indicator"),
> >
> > > +   PROPERTY_ENTRY_STRING("linux,default-trigger",
> > > +                         "bq27520-0-charging"),
> >
> > It's less than 80, why not on a single line?
> >
> > > +
> >
> > Redundant blank line.
> >
> > > +   { }
> > > +};
> >
> > ...
> >
> > > +/* B */
> >
> > B for red?!
> >
> > > +static const struct property_entry ktd2026_red_led_props[] =3D {
> > > +   PROPERTY_ENTRY_U32("reg", 0),
> > > +   PROPERTY_ENTRY_U32("color", LED_COLOR_ID_BLUE),
> > > +   { }
> > > +};
>
> The name with "red" and LED_COLOR_ID_BLUE are also inconsistent.
>
> > ...
> >
> > > +/* R */
> >
> > R for blue?!
> >
> > > +static const struct property_entry ktd2026_blue_led_props[] =3D {
> > > +   PROPERTY_ENTRY_U32("reg", 2),
> > > +   PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RED),
> > > +   { }
> > > +};
>
> Here as well.
>
> I think it's better I drop this patch (it's only in review-ilpo) and wait
> for v5 version as there's some much still to correct.
>

Hi,

Thank you for reviewing it.
I'll propose the v5 patch to improve them :)

>
> --
>  i.
>


--=20
BR,
Kate

