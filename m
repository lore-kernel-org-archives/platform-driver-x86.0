Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65B4C70;
	Wed,  1 Jan 2025 05:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735708848; cv=none; b=d8JBEhJkWdHs0u/6LMw3p9q8jz6oLqpy3hiICcPUl8KXly9hF7kSi+li9iPuxrzy62D5oBpwFlkDy6nx5T0Ulmeb2dMqOYk2VMngq0o14Y8PoEivgy2Uigg4dgUHqlDTAFdgWGumT6FiXwygIJVZAVm4krRQzwbsZhjG6FziEo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735708848; c=relaxed/simple;
	bh=yinVdhSygilqmbZvAAouaveuwV8Doeyyezi+9or+W9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAvAieuwZrdHdg+1I4ABO6WNiDjnwQNUbZSUqH0vfMnpj8fOu5nR7ZGC1viY8TuFZEvcW1k+meyuBTArhACHO6yfJmN22aMkTFpdYm0o8dT+FgQzVWEM6P/2I3eZeJtbxpcG8qJkcZr5+45QqSDydYPJQo/eKMkLdib1tjRGoHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUhe3XW5; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUhe3XW5"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so12003607a91.0;
        Tue, 31 Dec 2024 21:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735708846; x=1736313646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjM1xgEseoYiLbQmCI7DmXZ4mrwpwY0zW3avXG2yBaQ=;
        b=PUhe3XW5bYEI58HO4hA3MbjiuW0z8qg6prjryR1+qB/FC32OjI6S+2gsfVYRDFfwcm
         /pxyYFF8Yr8825HGa3Nz2m2qW9t/KcdCXTJJMsqSGr/sNqIA0aJlD3cg7N38GQ92eazj
         jU6bGPlwVUqoqmItfvFpy4pW3p+fGqmJGGXVdhMbqhKAuZNlLZLnbkopZZWchej9+7Sy
         DSQVI7Z0Zc94UuijKYoSnjh2/uDWIR1AkYuhcQRt2+qoaFbCdKGPGwEJRQcELwxbhjBv
         SkBQwu5ECERWD8A8qqEkfm5hNDimeJvCvdsH6toSrhJL+gyrp+lPARuFybFxGMhZcOqX
         YgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735708846; x=1736313646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjM1xgEseoYiLbQmCI7DmXZ4mrwpwY0zW3avXG2yBaQ=;
        b=KrOrC/qyvYfCBf9NPqIMrTXItiF197/cnrqIdw2WfEb0+ocF467ztCPtbwSwZt+I1n
         2wtm3vWRO9lJmYFAmtXOrwmcKolqIA0bKNN4bP9neXYcVLX19kWXfONg7KLMvkSWOVxb
         +4khfFBpCCdP6UVd31qe88ovSg2yn5vCpStk7n2jFD57jWbwMvacdUdyiOVOAqlUlbdR
         l+uYTZSPCeBOpzAI+Swy6Y8m5MQBIV/GGaRLuhmiI2YrXZBpAuwmPuhXIpZmkpVK23LG
         FwMTaBP7qjq/pyRq/S4uFfeZsvpLqMlkzskX+xH649RpsutsLZLy+lALlhan6NNPV5d/
         iXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+eFRlaeWVBRBzl2jEYL1cOrp6qWgs3lFcz8CpQEeraqnzHdyTnff4d1O7GaZiwPubDDKheYgICbQt7rc=@vger.kernel.org, AJvYcCWTXi+iRHQYlL1kRC2mdGMeNT1E1dyh3Zs9uImnFTSz4p/kTnmmqPwV7qOGlH9UMVJIsg65meV6kdIVZ29TAyxFl0jD3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsB0wm0vortFu5TFQQ4WxRe3oolqNBYlR1etpfIDxwNC7j1dms
	QttG7niHVt9GyPAuyb8OeCfIQquw9CTCbqUIbKDvk4oW3Jzeq7yn9Amuj7J358nnkcJNK+2CnQA
	jpYtG0DDJX1qpEpJneS0ENupfmhA=
X-Gm-Gg: ASbGncuOwyWp4bqJZUXdX7JgL/Zx6RNLmRnhOoKC117FYiqXQDMSCKDFW5IjLpU66fy
	hV6BoV9V/axBgIVj4bpmT52lIiiYgGebNmiOXB/q4zWJVSenObVomUxTn3ck9bOu0kRM2L2YY
X-Google-Smtp-Source: AGHT+IEL8NCopJJ6pXPfFmgbUpNFqP2+7q5Bj14tGYC9XBhNTd+63FLF2XVR4wwI3/sCQSUkVnsSpmn0nJsU2s8tSZo=
X-Received: by 2002:a17:90b:548c:b0:2ef:e063:b3f8 with SMTP id
 98e67ed59e1d1-2f4435abac6mr75709760a91.7.1735708846462; Tue, 31 Dec 2024
 21:20:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231140442.10076-1-hridesh699@gmail.com> <punpa3ioslyennppscrbk3oj6xrnmrvcumk3jx3hbr47dsgar4@n3gs7ohlkbya>
In-Reply-To: <punpa3ioslyennppscrbk3oj6xrnmrvcumk3jx3hbr47dsgar4@n3gs7ohlkbya>
From: Hridesh MG <hridesh699@gmail.com>
Date: Wed, 1 Jan 2025 10:50:09 +0530
Message-ID: <CALiyAokZQojkLztzsRiVVk3qpr0JFHEQ9aScMOG2J1Chdn1++Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: improve platform profile handling
To: Kurt Borja <kuurtb@gmail.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2024 at 10:36=E2=80=AFPM Kurt Borja <kuurtb@gmail.com> wrot=
e:
>
> > +enum acer_wmi_gaming_misc_setting {
> > +     ACER_WMID_MISC_SETTING_OC_1                     =3D 0x0005,
> > +     ACER_WMID_MISC_SETTING_OC_2                     =3D 0x0007,
> > +     ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES       =3D 0x000A,
>
> Should this be GETTING?
No, the SETTING comes from the name of the WMI call (GamingMiscSetting)

>
> > +     ACER_WMID_MISC_SETTING_PLATFORM_PROFILE         =3D 0x000B,
> > +};
> > +
> >  static const struct key_entry acer_wmi_keymap[] __initconst =3D {
> >       {KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
> >       {KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
> > @@ -751,20 +762,12 @@ static bool platform_profile_support;
> >   */
> >  static int last_non_turbo_profile;
> >
> > -enum acer_predator_v4_thermal_profile_ec {
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_ECO =3D 0x04,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO =3D 0x03,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE =3D 0x02,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET =3D 0x01,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED =3D 0x00,
> > -};
> > -
> > -enum acer_predator_v4_thermal_profile_wmi {
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI =3D 0x060B,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI =3D 0x050B,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI =3D 0x040B,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI =3D 0x0B,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI =3D 0x010B,
> > +enum acer_predator_v4_thermal_profile {
> > +     ACER_PREDATOR_V4_THERMAL_PROFILE_ECO =3D 0x06,
> > +     ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO =3D 0x05,
> > +     ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE =3D 0x04,
> > +     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED =3D 0x01,
> > +     ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET =3D 0x00,
>
> I think it's better if you sort these from least to greatest.
Alright, makes sense.

> > @@ -1904,6 +1984,7 @@ static int acer_platform_profile_setup(struct pla=
tform_device *device)
> >  {
> >       if (quirks->predator_v4) {
> >               int err;
> > +             u8 supported_profiles;
> >
> >               platform_profile_handler.name =3D "acer-wmi";
> >               platform_profile_handler.dev =3D &device->dev;
> > @@ -1912,16 +1993,27 @@ static int acer_platform_profile_setup(struct p=
latform_device *device)
> >               platform_profile_handler.profile_set =3D
> >                       acer_predator_v4_platform_profile_set;
> >
> > -             set_bit(PLATFORM_PROFILE_PERFORMANCE,
> > -                     platform_profile_handler.choices);
> > -             set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> > -                     platform_profile_handler.choices);
> > -             set_bit(PLATFORM_PROFILE_BALANCED,
> > -                     platform_profile_handler.choices);
> > -             set_bit(PLATFORM_PROFILE_QUIET,
> > -                     platform_profile_handler.choices);
> > -             set_bit(PLATFORM_PROFILE_LOW_POWER,
> > -                     platform_profile_handler.choices);
> > +             err =3D WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTI=
NG_SUPPORTED_PROFILES,
> > +                                                &supported_profiles);
> > +             if (err)
> > +                     return err;
> > +
> > +             if (supported_profiles & 1 << 0)
> > +                     set_bit(PLATFORM_PROFILE_QUIET,
> > +                             platform_profile_handler.choices);
> > +             if (supported_profiles & 1 << 1)
> > +                     set_bit(PLATFORM_PROFILE_BALANCED,
> > +                             platform_profile_handler.choices);
> > +             if (supported_profiles & 1 << 4)
> > +                     set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> > +                             platform_profile_handler.choices);
> > +             if (supported_profiles & 1 << 5)
> > +                     set_bit(PLATFORM_PROFILE_PERFORMANCE,
> > +                             platform_profile_handler.choices);
> > +             if (supported_profiles & 1 << 6)
>
> Please, use test_bit() from <linux/bitops.h> in all of these conditions.
Will do, thanks for the feedback. I will make a v2 with the changes
(including the alignment one) and submit it in a few days.
