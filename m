Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD343991E
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533704; cv=pass; b=acv8hGJ9AHYWJJE+wD9p1qvMa3Uvh1s4w7FpSBdGtTMygOlTNkVd/0I3p7aRW2JEJuW2IezyhTxYjCbf0bCq9IvNWKOW+E4cGUqs0CZm554QMCL5HvHgxZM/z/kfcuRq7sMMNoB+u43izHW3355jmzbyyzuaMZiq2i17X2hDrq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533704; c=relaxed/simple;
	bh=d8OMuVdk0r9dpwaPWKglZ1cvqqrJm8kAL+SQS477dZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4qFF+n2E7A6p8BhaDTp/9VpfO7tzVFyea0o7A6Mwd0/VfCqPk8rgx9qUO5pmV5NiO0e8jcOCbFy8sMbOcYPCT2SfQY2Kdd223ihwfiU2WN3mTDV4CS1mMjndQRbeoEy+Agr3k85pHouH5DWg9b/Ga2qDwg4gN6KgPbpPWLPMH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ln0fOlFs; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ln0fOlFs"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c20ce3c118aso168280666b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 04:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786533700; cv=none;
        d=google.com; s=arc-20260327;
        b=Cx7WDz2HVLgI04PwFlC/wyGKqga2g8JM2OquTSc95d5u8vbiHPvdx4KIQXfOow/L5N
         xRw9syg9R1FpPX9lATBGE3IYc3qnPKD8gBOPv4S9VOBbNH1UElNL30YB1j5X8qXRW7ge
         M7azHJ1PilPEx5vueacRrUhExneAF8o4FQXpuVQgFzM0NPyziHjrB/H97r+3U5dtOHc/
         EN5zDd/3a2vGoziD7ZOU4zA4xw7+dj3q2v/qNXXbwOaR7cftV0vtwgVtY9HwNMgI/Bo6
         6MOsRwZcBYxJ+iotsRtYyL+JzSM9s82MoQlXcEMkFx5O0w8iqCm/Aztw1AfD65Fo1vz6
         N0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q95iQWLg8lpz2kL/XhUdkfxRGWb1NSXaxj6O/CdBLtE=;
        fh=lXjYBd+6+wLfqZeQUMnYHxhspxQW4nZcoWFS1lF2arw=;
        b=YMWckr9HxSmv8EdBeBhWOcMUZynSSankjcDtkD8ijnQVwpriA9kwNSqOdwKaNAKkp8
         VMxUAT/qnhLcKWx6oPhrsv/uCLynEutSGdbAYxXdCSfQ17tdU815wXuSON9D26HRp/7j
         I8atvgngtSToDQQ2Oxo3DGdy+nPzJk841I/4HeCd795R0kfJnWaKmdTBQfYO2QaiYYh4
         az+0g4ggNeg4NtCGGmcHrsDbWIAA+BmHK886O0HbZ7TLzwjcns/RRK8dUeqB1E2Zu4r1
         wZLz5BtCWL4gzWvZdurbs+hDKCsFdpYW4ppbIQzIroeDrW/LTUcccqbiSlMn850ra1s8
         S0JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533700; x=1787138500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q95iQWLg8lpz2kL/XhUdkfxRGWb1NSXaxj6O/CdBLtE=;
        b=ln0fOlFs6gh9GsJmcVGTyLWFgt8kbHdlsxz7oqAnVLdX0zm5E6edBoRPTENU58aZ8p
         26l1uvj6zw4724DIAnurJhKTskESQhwd3rpqvoZDSjbVy21SYkTzWlnUVE4QJn5R91i+
         E9cL0Ml4r8MMymok4mNabbSz4L1+lkDILE9H6X+EauYQxZ0EKH0eu6HUnzwPaDOTHTBJ
         NppVwBg+Qq9ujW5fsQT8y1Fa3GuiCRnD7tkeaF1+7Qp9bmfsIvXZHNDvNYUs52gUb9xl
         bZBWIwkPxl37e3yeYMGcxWPAludqr7P1m0uVJe2hvirJH4mgmOAcM549+kB6zjNR8AYC
         GDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533700; x=1787138500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q95iQWLg8lpz2kL/XhUdkfxRGWb1NSXaxj6O/CdBLtE=;
        b=gr1/Xm2iAfK17rii28CdStjMc8A7CKbmCgYVYfU7uaeNuo56TEfeIYhLTbfKE3SJBG
         I1yeoqibCaxA5Uh1q4eHmSkeLsrZF6mcvuQx9vMI44vXM3s1G8vv4pGFch8CWe3sVlT0
         TslrLwMIQbc46R0YNU1sB6ccphhJEQa+XlhOxQuI11m+VZm9SAxv4C0At0QdMVLnWjeC
         NkItTTLBF2GfJHcBwRoGg6FsNZT3Fba9USAhySf1Vs2Wcdh3Xx8sNLIW/bOUuSrtCvlq
         RoM3mhIxg9413Uy/bbzuT0X8CQUU/h23eEPHRhUIpGd4CGz4hDvSuHpZrbyU6Jvi0jm4
         WgOg==
X-Gm-Message-State: AOJu0YxC6u7UzmHBkecuKIxGKuw6vlAEXaj+ITtmn6X+zlmuurGuxUd3
	uAkpvOq8MdCVhrQ3F4mJ1VyZRGnsDPfJzHXy8g4YcfYki2rtT8VfxverMTO8VEweQRRXOCbQrHQ
	XDqkf5oSHi8agbBKf61dDwTFnIfZTHQw=
X-Gm-Gg: AR+sD102NB16qi2dJPYRNpEMK3BQZVjikoeZEEh12xc5Zqh5Swszd4F1qIzoNhMAg8A
	gMQjBMtsp0HbtRzlJZjoM+3BDjzLguECbMwXqt/SltmTFggHk4nhkBswpswkmyFcivXIoxug+mE
	VkMJ+vatkqPhP6NZBuM9zmMnFC1a5I13/ClWRh3OL3bN9QukOUaqRoB1CqQCHg+lAvSKt1c8Gh0
	1Wy6X3eATcFnC6KgN36ZPLsCaCMKngdBGfKOLnjROdO0DNPwGhAFlqnX/tkG0ZT4Dw6wcODEwsJ
	c3oCti1kZVDtyfTuIeKeDRfB7AR88Avn3Rc1/RfjDKWaWCvdYdEUWpe39BCAqUdIuwA4M5omqdi
	WFADVdiroLF0qc1/+B/uAghpt7K7m
X-Received: by 2002:a17:907:6b0e:b0:c15:a7b9:2ae1 with SMTP id
 a640c23a62f3a-c20f508161fmr181291166b.6.1786533700381; Wed, 12 Aug 2026
 04:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803143037.93105-1-meatuni001@gmail.com> <20260803143037.93105-12-meatuni001@gmail.com>
 <f337b075-fbb4-db20-8a94-b58b254fd864@linux.intel.com>
In-Reply-To: <f337b075-fbb4-db20-8a94-b58b254fd864@linux.intel.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Wed, 12 Aug 2026 16:21:27 +0500
X-Gm-Features: AUfX_mwD4GyioYavq-PD84tKtPvn5kK5hplSdml2BkhUvgSRy-L-eL2romBwA7M
Message-ID: <CADqcGBns4F5cwyowKAxhutxowM8i64936+2rq4uvNw6AZKCFOw@mail.gmail.com>
Subject: Re: [PATCH 11/13] platform/x86: hp-bioscfg: advance elem past
 consumed array elements in string-attributes
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, jorge.lopez2@hp.com, 
	Hans de Goede <hansg@kernel.org>, linux@weissschuh.net, 
	LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thanks a lot for reviewing the series!

I have posted v2 [1], where patches 9-13 from v1 are squashed into a
single patch (now patch 9/9) covering all five attribute parsers, as
you suggested.

Regarding the cleanup and consolidation of the attribute parsing functions
(e.g., hp_populate_integer_elements_from_package() and
hp_populate_string_elements_from_package()): I completely agree that
there is significant code duplication across these attribute-type files.
Once this bugfix series lands, I will take a look at consolidating those
common parsing parts into a shared helper/macro as you suggested.

[1] https://lore.kernel.org/all/20260812111829.172273-1-meatuni001@gmail.co=
m/

Thanks,
Muhammad


On Wed, Aug 12, 2026 at 3:41=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 3 Aug 2026, Muhammad Bilal wrote:
>
> > Same defect as the companion fix to enum-attributes.c in this series:
> > the PREREQUISITES case consumes "size" consecutive ACPI package
> > elements via elem + reqs, but the outer loop only advances "elem" by
> > one per iteration, causing the next iteration to misread a leftover
> > prerequisite entry as the next property and abort the parse with
> > -EIO on the resulting type mismatch.
> >
> > Fix by advancing "elem" by (size - 1) after the loop.
> >
> > Fixes: e6c7b3e15559 ("platform/x86: hp-bioscfg: string-attributes")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> > ---
> >  drivers/platform/x86/hp/hp-bioscfg/string-attributes.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/d=
rivers/platform/x86/hp/hp-bioscfg/string-attributes.c
> > index fe5a9a3a4ef1..5abec8995911 100644
> > --- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
> > +++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
> > @@ -233,6 +233,8 @@ static int hp_populate_string_elements_from_package=
(union acpi_object *string_ob
> >                               kfree(str_value);
> >                               str_value =3D NULL;
> >                       }
> > +                     if (size)
> > +                             elem +=3D size - 1;
> >                       break;
> >
> >               case SECURITY_LEVEL:
> >
>
> Hi,
>
> First of all, thanks for working with this driver.
>
> There's no need to do the same fix in n patches. If the problem is the
> same in multiple files, they can be in the same patch. You just need to
> generalize your shortlog prefix a bit when combining.
>
> I'll probably take this series once that is fixed (and after I do a
> deeper review on them changes) ...
>
> ... BUT,
>
> This entire driver was merged half-baked, with outstanding comments from
> me unaddressed. One of the most important unaddressed comment related to
> the massive use of copy-pasted code which leads to having the same bug in
> multiple places.
>
> Once this series is done, could you try to look into consolidating simila=
r
> parts in these attribute type files so that there would be a common
> function that is called by each of these attribute type files (and if a
> common function is not possible due to types, perhaps macro could be trie=
d
> instead)? I'd be very welcoming for such a cleanup to finally start
> cleaning up the mess this driver is.
>
> If you extract e.g. hp_populate_integer_elements_from_package() and
> hp_populate_string_elements_from_package() and diff those two functions,
> you'll see what I mean. A struct is even called "common" in the struct
> string/integer_data so I expect it could be parsed by a common function.
>
> --
>  i.
>
