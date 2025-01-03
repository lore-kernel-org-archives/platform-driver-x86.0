Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D181F8F1E;
	Fri,  3 Jan 2025 19:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735930871; cv=none; b=UeQ66JKpwQF49BmJLW8IuoFDRVdYehQsNngqsifBgJrDbmH4CwKjTZ2YdlVPJYQDtz5vL7kXyVm/7MQZNeDAQpAeR2cTMAqGlJONSZy/6Xf1H6AVka8EOLCT+tGBfuBv+fcivkvoI8yn+WCZKNVvHq6tl1xjSkguDWt9hBQamBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735930871; c=relaxed/simple;
	bh=kKOEgHpfXlpIKO+40DTekGz6Wc3QokLuTbfQP47izoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWGasqnAMlhOtiAVY+qXJjxBXJRZncI+ViVxhI8jzMuudKIzO/k3UCMIM4BQJ27JwNsmkjWfxFF17sePHBkzybQ1+3umYDnjOZNqoENYRzYFZg4qUnZbnOJfdM5UM8pAMvkAuRzMkBoTE6XSCTJfp2vzTQ/usTSmCpLtjIEhlRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kx3LKX3m; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kx3LKX3m"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7ba0fa25f07so413974085a.2;
        Fri, 03 Jan 2025 11:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735930867; x=1736535667; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ge0dEthSfipJTkxG9tfzSC20xvoraRoCwjY41iv1t/E=;
        b=kx3LKX3m/o1bl17vYkp8EuxdxdV8OnFrvgWsxWl9kOVfeRKwHKM8fHeK4EVjZ7CmMW
         GOrKOavu3ryyrWANjjVoyLEE6nn2mc0UG6HMI/7x8AuULhhgGkf1BYghRQ5FhjU9Zquh
         z3jprmGHSPm5robrHnFHnb2sBZg4ArBaSBi8FBX/d3Of8bFpt324Q2OmAw4FXcErk1/2
         yEYTGv4dFd7obBKFCN7S6Qv4/U0rgoiOPr+EyMPq6necIL8Cask32npvarfDsWna2LLw
         hGp+HDS2W8VfQU/uaBwvS8OHa5HnFznF9Gms2HvT19Sf6Md8a/Wty1JtQ9AEYfzoO0Xk
         a6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735930867; x=1736535667;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ge0dEthSfipJTkxG9tfzSC20xvoraRoCwjY41iv1t/E=;
        b=VWTT54epY2u10CuUo8++knRYWm0uEAYxoX3xwb1HWrQy2NlrPh8Dpa0vR1jCD+/KIw
         rFjAEMlI2OmAfsfLZs5N8EYM/Q6OkGKm1YxD74JdZYsudmxHRItFVobYblC5RZMSkqVk
         HGzsRfN5X0MwEWO9YzGQvni4o5oE2Vh5Tjjctxjf54+nB5/OV4Sj3u6M2GupWFkhzxZh
         Buu8hmjs7I0ldDu4zjQcnqaxv/EuaiDVSYjQzC/I955Y9sqK9zIagj2RTWWcDZ2E2hgs
         aq3eByyDOZNhWKMge+1tPhOI5H/jhMBUzNgD20al6lafaZzAH55HzxdHACQMZ683muDG
         sRqA==
X-Forwarded-Encrypted: i=1; AJvYcCUuTSRGNKXJC2FVeC4sS0jOXvjKAp6vJhsgDRyrEI1HZodran7+eVVWrZEiEy9iqzhGgcQJTJ5/DNdvgYE=@vger.kernel.org, AJvYcCWZWaSw02OwxbMDzNNLeYU4jx7a3LMC/LhvJSGIo//pJWx3I1ay1DDWOw3M9wN+EjG1XxCyWxwsPG45Kn8f1mR6YoStXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeIngNpv9CRc0QrziiXIPU8w4BwPUl6YpgiOCtCsa0JyleW8FJ
	ToNSarVnwNirneIWUHeP/2OaMdEmqAykVXdyUS0KL3/SgQ8QCxOp
X-Gm-Gg: ASbGnctFqJb1wEYIz4lhivu1yDXOPGKBq4wBG+G6iFlGNYq+FWRMe9oErhnEf5yAGNr
	fZR0zrGf6Swn6CY005jCJ2fgp/uCZaQwRxI9IkekRvl9NJs7TGn8RzyTPZNiMu2iCHSaGCOTmy/
	XBBfSo/3IrRJnUnSAlHTzt8W1gww7oridVuOZqLw1tWXxsoHasYYLCbMaCi8n3AfuF4yPGEFa6V
	dEaLB0opRMhM12rEDSkvXWQgfbBnvCRyaFv8H3RttBrX/2Ok8vjOh6M
X-Google-Smtp-Source: AGHT+IF3aftxuDUTfYXpky/bk8JlhG6p4QTuZxaNiIZ6cq1ojMlAxlktCS4g6C80Te9GoEKTT8nJnA==
X-Received: by 2002:ac8:5f11:0:b0:460:a928:696f with SMTP id d75a77b69052e-46a4a8e7199mr843913651cf.29.1735930867405;
        Fri, 03 Jan 2025 11:01:07 -0800 (PST)
Received: from alphacentauri ([2800:bf0:179:113e:f067:4e25:4298:6451])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6a61cfsm148527631cf.44.2025.01.03.11.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 11:01:07 -0800 (PST)
Date: Fri, 3 Jan 2025 14:01:04 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, "Lee, Chun-Yi" <jlee@suse.com>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, onenowy@gmail.com
Subject: Re: [PATCH] platform/x86: acer-wmi: improve platform profile handling
Message-ID: <tftomtw456sevajiid76bgenmxl2s5ycv4sckfgl7mdjbs5hxb@5vs36lxjtaxc>
References: <20241231140442.10076-1-hridesh699@gmail.com>
 <12ce2a4d-6a27-471e-b330-996753ff1bfb@gmx.de>
 <CALiyAon3r=VXFNZw7is4VWZoRnFFbrUUvLB9XeW+xkMLjXDyRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALiyAon3r=VXFNZw7is4VWZoRnFFbrUUvLB9XeW+xkMLjXDyRA@mail.gmail.com>

On Thu, Jan 02, 2025 at 12:20:36PM +0530, Hridesh MG wrote:
> On Thu, Jan 2, 2025 at 2:28 AM Armin Wolf <W_Armin@gmx.de> wrote:
> > > @@ -1946,12 +2038,10 @@ static int acer_thermal_profile_change(void)
> > >               u8 current_tp;
> > >               int tp, err;
> > >               u64 on_AC;
> > > -             acpi_status status;
> > > -
> > > -             err = ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET,
> > > -                           &current_tp);
> > >
> > > -             if (err < 0)
> > > +             err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE,
> > > +                                                &current_tp);
> > > +             if (err)
> > >                       return err;
> > >
> > >               /* Check power source */
> > > @@ -1962,54 +2052,52 @@ static int acer_thermal_profile_change(void)
> > >               switch (current_tp) {
> > >               case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
> > >                       if (!on_AC)
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> > >                       else if (cycle_gaming_thermal_profile)
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
> > >                       else
> > >                               tp = last_non_turbo_profile;
> > >                       break;
> > >               case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
> > >                       if (!on_AC)
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> > >                       else
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> > >                       break;
> > >               case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
> > >                       if (!on_AC)
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
> > >                       else if (cycle_gaming_thermal_profile)
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
> > >                       else
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> > >                       break;
> > >               case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
> > >                       if (!on_AC)
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> > >                       else if (cycle_gaming_thermal_profile)
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> > >                       else
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> > >                       break;
> > >               case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
> > >                       if (!on_AC)
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> > >                       else if (cycle_gaming_thermal_profile)
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
> > >                       else
> > > -                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> > > +                             tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> > >                       break;
> > >               default:
> > >                       return -EOPNOTSUPP;
> > >               }
> >
> > This needs a bit more work, since you might accidentally select unsupported platform profiles this way.
> >
> > Using platform_profile_cycle() would make sense here, but we still need to handle "on_AC". I however wonder
> > if that is really necessary.
> >
> >From my testing, what I've found out is that even if we don't handle
> on_AC, the profile is still set but the hardware will not put the
> changes into effect until we plug in AC.

This is interesting.

Do you perhaps know if users expect a thermal profile change on AC
connect/disconnect events on Windows? This would solve this discussion
[1].

~ Kurt

[1] https://lore.kernel.org/platform-driver-x86/20241210001657.3362-6-W_Armin@gmx.de/

> 
> I've incorporated the rest of the changes into v2, thanks for the feedback!
> 
> --
> Thanks,
> Hridesh MG
