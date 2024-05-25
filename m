Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349A610E3
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 May 2024 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716646118; cv=none; b=P1UdaK+k5GwQQI3QMkVq4wshuFmkySPghGOXo9+UXWcREcU+ETKb/aAn6DdkRjUrfIHngnaP6nITKAr5wF4F3Ilfmtu1+CSv9uSuqXlW9ToX9Pgt07KJbXKot1aLX0pwDt1jVsqLuu+78NcprlQv1AXN7KUH7yh1+igmtuNt/eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716646118; c=relaxed/simple;
	bh=C3Qxhk4zL2ppmGowEwlPqQKeMa11jhzeeYYdM3LKjX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raY3YrVSnfYx4Oj5AzzhfI90Dhfvm5BY/ryqB4wQzzTJUYk6r8SbO4ypMGFZxuVNBiFgY84QPX8J3mzPZeATwR5wuqK0QApmsBlmFL6U0g+ArVkEi3FI/Ro9dcmP40JeCKGiMjBAvijrOAfMzIMB70TT5+g1p0m+GClzGV1CKYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJxd4kim; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJxd4kim"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52962423ed8so2011561e87.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 May 2024 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716646115; x=1717250915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0XLVXbRgK1HEyYIGx5pu2tryrkqz2xzrotiZJrBFNY=;
        b=aJxd4kimfywRoOtkPomb/61k0DPMzSXrHSInHS7lImW3Cnm1Er+pDTIeI1Mje2Nwvh
         Gjv/oW4QF90DZf3Ab2Lui9lUAHFuqOSCwj0ZhMRG1dQun0Kkvq3Ys7JXV2bw8e4V7vjP
         p4g8qav3+N+SBlVMl+BHLHsiN6Q6jNvGENN1jV2b5i++83VjPgn4G8VNBbDagg5baLAp
         MH5NUM0l8jClivbyK6Nhy0s8MYHc3RELpJjdkpMm/KvmALdYxCrw/JNK2WkR74sRpIOU
         oHctLkyG1gl3tonyYM20VzutKkB5W5yOHa9xK2+4TLpzJt/pazmdxt1bVYatHhbwp9N0
         WHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716646115; x=1717250915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0XLVXbRgK1HEyYIGx5pu2tryrkqz2xzrotiZJrBFNY=;
        b=GT0sxJFdIQzHUarA/ztTlUk735zFr0xRQr/loyFlUa99VGoR1SRqV4iK1Kzw3mOFNd
         5zuRNNvU1zQR6g2DXjx6BLOj6CxuSVBGcrEy3SQOCsVTxisZgiR6b5+ALaCZPSTmjnBr
         tDvyThzZ0ZpmclRxJySBxloL1gkFJQ0DHZIgYqcm5cqsa5PEcaS1WHdxFopGw34xUkKn
         Q32P8Rs7VCzEc6Bn2GoND0zq6I6uDVvQYlSiXCdInexIXiR+IEn1V3fHEE6zEsgcULZz
         h8KHu0CRtAVrxLZvXfVWMm12/dY3HZ8Dw6o8AwRhEvLlbbt5gMTUQ/LmdwumrBj0RY2Q
         pRfw==
X-Forwarded-Encrypted: i=1; AJvYcCXltiV+AdJBHkoL2gwfX8OMDHHkuMHUpFFvZQ4+P4dUhPC+OLVnbfk3kH9mrEJMAZPLOIcP2M99c9YHw7DVbejfuW58qKj1R4RZul+Oif9qIzFu+A==
X-Gm-Message-State: AOJu0Ywev2lRXOQZ1c49x6lV0015hdrC3Rl4Q3N6ux/Cr566lGB/pMHG
	8dDt/mXD6R9lsdLtaBEr214o6SlButFLBz7NBYJXawqXTbDDBA9Lbji9DGuMBfnqC+7C+yjTVQ4
	erICmPa9TM0tgL3KbiqdVu8Co2EZOELd1
X-Google-Smtp-Source: AGHT+IFgVVlVTmb2INBd2sJJe/Ib30SzPWSiclxXsAEi24bAl2478Ed4tjD/tVihBy4fP+fdu12xcJKjNSaMtpt3QWk=
X-Received: by 2002:a05:6512:526:b0:51b:567e:7ea4 with SMTP id
 2adb3069b0e04-52964bb2673mr2614900e87.26.1716646115101; Sat, 25 May 2024
 07:08:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522164807.28936-1-hdegoede@redhat.com> <Zk4pC0dkmTEcS_qA@smile.fi.intel.com>
 <4c14d61f-dc0c-4495-a74c-fa0cef4362d5@redhat.com> <CAHp75Vex78gE+e8kaUvvNjVUtkv-3GGgcMFZ3tFFqK49WRQDrA@mail.gmail.com>
 <376bd875-e4ab-403d-9265-e6833ccb31d9@redhat.com>
In-Reply-To: <376bd875-e4ab-403d-9265-e6833ccb31d9@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 25 May 2024 17:07:58 +0300
Message-ID: <CAHp75VdTJbZru5M4d81dU2Wbu4=G26OAgVksFF8H8vRBWHeDfw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 11:47=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:
> On 5/22/24 9:32 PM, Andy Shevchenko wrote:
> > On Wed, May 22, 2024 at 9:40=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:
> >> On 5/22/24 7:19 PM, Andy Shevchenko wrote:
> >>> On Wed, May 22, 2024 at 06:48:07PM +0200, Hans de Goede wrote:

...

> >>>> +    /*
> >>>> +     * str is part of the static_command_line from init/main.c and =
poking
> >>>> +     * holes in that by writing 0 to it is allowed, as is taking lo=
ng
> >>>> +     * lasting references to it.
> >>>> +     */
> >>>> +    ts_cmdline_data.acpi_name =3D strsep(&str, ",");
> >>>> +
> >>>> +    for (i =3D 0; i < MAX_CMDLINE_PROPS; i++) {
> >>>> +            name =3D strsep(&str, ",");
> >>>> +            if (!name)
> >>>> +                    break;
> >>>> +
> >>>> +            /* Replace '=3D' with 0 and make value point past '=3D'=
 or NULL */
> >>>> +            value =3D name;
> >>>> +            strsep(&value, "=3D");
> >>>> +            if (!value) {
> >>>> +                    ts_cmdline_props[i] =3D PROPERTY_ENTRY_BOOL(nam=
e);
> >>>> +            } else if (isdigit(value[0])) {
> >>>> +                    ret =3D kstrtou32(value, 10, &u32val);
> >>>> +                    if (ret)
> >>>> +                            return ret;
> >>>> +
> >>>> +                    ts_cmdline_props[i] =3D PROPERTY_ENTRY_U32(name=
, u32val);
> >>>> +            } else {
> >>>> +                    ts_cmdline_props[i] =3D PROPERTY_ENTRY_STRING(n=
ame, value);
> >>>> +            }
> >>>> +    }
> >>>
> >>> This reminds me a lot from the next_arg(), can we not reinvent a whee=
l?
> >>
> >> next_arg is meant for parsing different arguments on the kernel cmdlin=
e
> >> split by spaces. It has space as separator hardcoded so it cannot be
> >> used here.
> >
> > I believe it's not the first time I hear such an excuse for
> > duplicating Yet Another (Same) Parser.
> > If you think you really need another separator, we may patch
> > next_arg() or add next_arg_any(is_separator_fn *fn) and make
> > next_arg() to be a wrapper of the other one.
>
> The kernel already has a generic parser for most things in the form of
> include/linux/parser.h but that will not work here since that assumes
> a list of fixed keywords while in this case I want to allow any keyword
> and change it into a device-property with that name.

I know about that and that's why I haven't suggested it.

> Also the actual splitting into key=3Dvalue code here is maybe 5 lines,
> the whole patch itself is not that big and most of the parsing is
> figuring out if value represents a bool, uint or string.

Yeah, 5 strings here, 5 bugs there and duplicating all over in the
kernel in zillions copies. This is not good. We should not duplicate
things, we should deduplicate them. And as I said, your excuse is
being repeated not the first time. This is also not good.

> And the kind of refactoring of next_arg() you are asking for here
> is way out of scope,

Of course, of course, but why introduce Yet Another Parser to begin with?

> so sorry but I don't plan to change this part
> of the patch.

This is not good.
But I have no power to stop it, while being very sad about this attitude.


--=20
With Best Regards,
Andy Shevchenko
