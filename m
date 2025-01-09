Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F17219E86;
	Thu,  9 Jan 2025 15:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436884; cv=none; b=Z84eDcGk+llfdGTv4cXQ63OMTIaHmuGRTzRPMeCaQi8Dwq00MkygOuPmB11wrwmV/BYNV+1kx8YQWIbJh4SAWJBqotLReXblU/JcixRTaIhAJviZbyXT62tjAxg0SqlnhU7FPRHX+FgQKHtw7ZXySBbWn+gd4M4JioWTuYfefzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436884; c=relaxed/simple;
	bh=bdKRsYmuuXmMmMxFVeeErrNoZ16EZoRS1u+l14g3PIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nr463GZG2wgONiW/nEpXXHiXEVOGemE7DTsGKFAAxAUBqv/vGYbLrmLBBPi2VH6QkIlv+mIEVw4L8/VdgwthOvm3hMIOb80ndgaU68x3L5Y+hvfv9iB9ooMyA5ztUc5ad76HG6W5iat0bG5Y+tAi5weRe4rotsOuNy2zwedyyHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knGCRh0n; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knGCRh0n"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-46b1d40ac6bso7945641cf.0;
        Thu, 09 Jan 2025 07:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736436882; x=1737041682; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cymu88LvmmG+IEbUUucWpxsbyUrh1DqD7aBJhTbHrT8=;
        b=knGCRh0nnrd//KUeyuV7DGJZVY5R7/gukFo158YtoM5/W4TbvoY/3KgX7isXsYgcEI
         CEhUe+zSL+ekdpwEmK58fmTKIDNT+AbEtzH5bqf7DbWV9Jmu4TOCh/dGNp7ZNq6OHXyU
         Z8ZTuNJ3RdquzyhpRgf+Hp4QLGF/9wUH+cVeBmr0G2Jt2eBHRdE/8SFbC47BS6Nw6mbW
         aOBX5kFhlW/4ufzob2UM/OOxDEte94CPChnQ0ee+utzSaNuEAvV3A9nt+9wC+Ynm9bz7
         ZdZhM+YiwmrnKbZ3zVZG++Kfje42nrWB2kevEU0iAmazovUEA3iQhoc1ZJmN43xG+AcI
         K7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436882; x=1737041682;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cymu88LvmmG+IEbUUucWpxsbyUrh1DqD7aBJhTbHrT8=;
        b=tR3CiaYBE6iLSnNKCcLA5evltzTUQCYc/TBdqS6vhggCXLdPPspuge/G9krxGjU1C+
         5bYAMSmj1F2LXbWcjOzb5V604q0rQY9HaWe/dROR8W+nj1QliLw7/vZldPOetQImDAWA
         AO7wemANneKnuPcbymF1cw9X+7kcnIR7fEx2XPDFQvuUCSxmZjxYsSnO48lxQw5z60Gj
         AXJqt+6Q60EovyEn3xLmmqSlSS2ib8eW7ukMonTuQCbD4r5WmS41ESmkGmbn6fWfhkeY
         d5KgrDxzOm42xM1EZ2EVauouAdYpdgbyhJuVVUphtI558hVF1PFYIDrVEDLUqWJneQY1
         g4kw==
X-Forwarded-Encrypted: i=1; AJvYcCVqPMElmLvVSP1RMK510Uu8osKYuk9LSV231dmk1vGcH6DgUgOayH3dOxvzEWjLjXER+Bkl+i76Pmz0MXa1oSoUBAyZ6A==@vger.kernel.org, AJvYcCVzdAYVuUH6q9CInhkfa0ZHFxE0AditIlMypMbB8+9A1eRt/30jFKWrISyvYF/ata7OFxCMbMBtjq1A0e4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzUFxr58w+MNfPFO5yEFR9Mq08MgrLJpTcuu6qbu0FLdHectlL
	I61jOH7ABFIFpRJiuEHyNoCVnnUkgsJQOGA4akQbCmQBFwtiQWIhHWo3cA==
X-Gm-Gg: ASbGncvY2+T2WpMjXGpGk7t77/UuT3v53mPVvQ57NvFIivKLWHhTykdTaNP2oiGfuNy
	sBet0QH6nN27FNWC9E6p0JV7mo4LWFHUfvhx+J2oKNeG/und0gUe3J1Cza+RhXLcswI1TgrNTJt
	7v6LTAhulAaY211iskHH+/1MhRx9mnz69zvJYoc6Keepsoje00z86kuHfqy07Rb/dXzoKE8nhye
	e9/7x0EJv4bDdeebcnp8zjKNTZzXxewSLAzqJxQBEUYLDzFUJD0aQ==
X-Google-Smtp-Source: AGHT+IHpnZzYfOerbu014qN3kkUAmwCRErWTtaVYq3JzoIoeuRAc9a1gQ6XnKV7eEtdYhrjYREN26w==
X-Received: by 2002:ac8:58c2:0:b0:467:84a7:f312 with SMTP id d75a77b69052e-46c7b001a3emr59949631cf.11.1736436881967;
        Thu, 09 Jan 2025 07:34:41 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86231578d2bsm1082283241.29.2025.01.09.07.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:34:41 -0800 (PST)
Date: Thu, 9 Jan 2025 10:34:38 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 4/5] platform/x86: acer-wmi: use an ACPI bitmap to set
 the platform profile choices
Message-ID: <2hzdti3v4t65rxpaxofj35rdl6jbkymoc2txivjeddwr3a5nkz@ggltjtr7szty>
References: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
 <20250108-platform_profile-v3-4-ec3658d9be9c@gmail.com>
 <ntiwr3bxaf66eqe7upu2qk3wwkemqo5qft76g2ybqydbs7qqjv@2vyn36qayp6o>
 <CALiyAon=Ba37S2se92ckbOSTk6D5O6oykpHUbC_n64Gqy95pcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALiyAon=Ba37S2se92ckbOSTk6D5O6oykpHUbC_n64Gqy95pcg@mail.gmail.com>

On Thu, Jan 09, 2025 at 04:40:14PM +0530, Hridesh MG wrote:
> On Wed, Jan 8, 2025 at 7:21 PM Kurt Borja <kuurtb@gmail.com> wrote:
> >
> > On Wed, Jan 08, 2025 at 02:15:26PM +0530, Hridesh MG wrote:
> > > Currently the choices for the platform profile are hardcoded. There is
> > > an ACPI bitmap accessible via WMI that specifies the supported profiles,
> > > use this bitmap to dynamically set the choices for the platform profile.
> > >
> > > Link: https://lore.kernel.org/platform-driver-x86/ecb60ee5-3df7-4d7e-8ebf-8c162b339ade@gmx.de/
> > > Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> > > ---
> > >  drivers/platform/x86/acer-wmi.c | 55 +++++++++++++++++++++++++++++------------
> > >  1 file changed, 39 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> > > index 7968fe21507b1cf28fdc575139057c795e6a873b..6c98c1bb3bdce6a7c6559f6da4ff3c6ce56b60e3 100644
> > > --- a/drivers/platform/x86/acer-wmi.c
> > > +++ b/drivers/platform/x86/acer-wmi.c
> > > @@ -33,6 +33,7 @@
> > >  #include <linux/units.h>
> > >  #include <linux/unaligned.h>
> > >  #include <linux/bitfield.h>
> > > +#include <linux/bitmap.h>
> > >
> > >  MODULE_AUTHOR("Carlos Corbacho");
> > >  MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
> > > @@ -127,6 +128,7 @@ enum acer_wmi_predator_v4_oc {
> > >  enum acer_wmi_gaming_misc_setting {
> > >       ACER_WMID_MISC_SETTING_OC_1                     = 0x0005,
> > >       ACER_WMID_MISC_SETTING_OC_2                     = 0x0007,
> > > +     ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES       = 0x000A,
> > >       ACER_WMID_MISC_SETTING_PLATFORM_PROFILE         = 0x000B,
> > >  };
> > >
> > > @@ -1957,7 +1959,7 @@ static int
> > >  acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
> > >                                     enum platform_profile_option profile)
> > >  {
> > > -     int err, tp;
> > > +     int max_perf, err, tp;
> > >
> > >       switch (profile) {
> > >       case PLATFORM_PROFILE_PERFORMANCE:
> > > @@ -1983,7 +1985,10 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
> > >       if (err)
> > >               return err;
> > >
> > > -     if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> > > +     max_perf = find_last_bit(platform_profile_handler.choices,
> > > +                              PLATFORM_PROFILE_LAST);
> > > +
> > > +     if (tp != max_perf)
> >
> > You can't directly compare `tp` and `max_perf`. ACER_PREDATOR_V4 values
> > may not match PLATFORM_PROFILE ones.
> >
> > It does in the case of PERFORMANCE and TURBO, but it does not in the
> > case of QUIET and BALANCED.
> >
> > I suggest you store the actual ACER_PREDATOR_V4 max_perf when setting up
> > the platform_profile.
> Ah this was quite a stupid mistake. I'm not sure why I even assumed
> both were equivalent. I have one doubt though, if i set it during
> profile setup, the code becomes quite verbose -
> 
>         /* Iterate through supported profiles in order of increasing
> performance */
>         if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_ECO,
> &supported_profiles)) {
>             set_bit(PLATFORM_PROFILE_LOW_POWER,
>                 platform_profile_handler.choices);
>             max_perf = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
>         }
> 
>         if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET,
> &supported_profiles)) {
>             set_bit(PLATFORM_PROFILE_QUIET,
>                 platform_profile_handler.choices);
>             max_perf = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
>         }
> 
>         if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED,
> &supported_profiles)) {
>             set_bit(PLATFORM_PROFILE_BALANCED,
>                 platform_profile_handler.choices);
>             max_perf = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>         }
> 
>         if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE,
> &supported_profiles)) {
>             set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
>                 platform_profile_handler.choices);
>             max_perf = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
>         }
> 
>         if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO,
> &supported_profiles)) {
>             set_bit(PLATFORM_PROFILE_PERFORMANCE,
>                 platform_profile_handler.choices);
>             max_perf = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>         }

Hi Hridesh,

It looks a bit verbose, but for me it's fine, it even caches the value. 
If max_perf is a global variable now, rename it to something like 
acer_predator_v4_max_perf.

> 
> Is this fine? Maybe for readability's sake, I could lift it up into a
> different function, like what you did in the RFC patch. Btw, thanks a lot
> for the detailed reviews so far—they’ve been very helpful!

Glad I can help :)

~ Kurt

> 
> --
> Thanks,
> Hridesh MG
