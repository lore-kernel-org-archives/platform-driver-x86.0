Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A983FE4;
	Thu,  2 Jan 2025 06:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735800675; cv=none; b=GjrLYN7qVllUz7VvIYnFPJB1G6QP8xGKtefXy9vd3580sbvyVPtaLCUGNrSsXlmyPr3Nr8BvkiGKYv5J9WKFAzyaYhuQ51RYHd7o49EO3R3G7K74p7i0CgNndpRGwq1viVKdhi7x5YGFybGvv93QkeWX5GafkD7XtxOdJlIV2S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735800675; c=relaxed/simple;
	bh=++p05xJbQjZOy4GU/6k5O8nzH1Lyc0G6VPaBmJXK9lo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKcJQb+8/ldQCKhW9GCm37SEz3tiecP5xCaaAddOA+rnosM5M2Z55g9OlK9XZx/6uuB6MXfL532k4U7dA/BIPDPhvIWds3fXiqPfb9M1lMqe195uX5YtyAECsxTo6OR2AzpMkEehodTalThH97qOOVVTDJmcOZL6bzWS/9dPVKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMy7HOd3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMy7HOd3"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so15312559a91.1;
        Wed, 01 Jan 2025 22:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735800673; x=1736405473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVWF9dMcrP9FxlFheYZb+jaFIxHvjimVGZjgokHjZnM=;
        b=NMy7HOd3Ju/bLWwqcW+k8Dgpn5jp1HF5DBnvywzJNb0MQmfgjW5bFi6ZyXFDS/68wW
         jKjVuWZobjrp9tF03AkqcCQ5Vnt1NnJJmQ5LogCBeXcEx0dqpOvHWeH7///ZE2lF9YWj
         zMhgV3Osmhgdi3b4jirdRjuefQE+bFhanTaixaNjTDfjvuS2p92dbDscJM82li3oJKS+
         RkG58GRhteC/SsYqQ7cduFG+MG3tln0fhZEhTuDiB4HERSDqSE7kbuG0B8bb51JVnvLk
         jWf40Sny7jOgRXDn6X4C1SVRO25qFMK3CWMG/Jnz5ArNtUn9KOALGO4C/OIbX77NJQ4E
         +DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735800673; x=1736405473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVWF9dMcrP9FxlFheYZb+jaFIxHvjimVGZjgokHjZnM=;
        b=Mw2DVyJbnKG31OH1VtQnzDyNFzMR6oZ5GzV0SoZ1YJEnPTP+dkwLzWOWw5iZtxSVZY
         0nRVltwhHKb29jqqe6ZFkXP1oQsSltmmJiWYCwGpHOqacRXAYvDdD5mTTpA3Vr+n5v/i
         oT953T2F1OdxL3bSmOrz4LZHP/fB52tU4GoYkN8wAqs0dZAyvrfgxbnUDDfONW4IL32R
         xPX6jEJE6KmnBrU9fR4gTE8BDollmlWYwPUxAgC6+MtBmdIouRD0XtQQA7SP7kxboQ/g
         aXjsVJS6lasIMk7RdPLqC08d7rM5qiVd5xd0uSynVLREoZWG5UocNmOamlFiZ7y5Jhys
         dh3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVL7zf5JHX2axIzAp0UFK2PwqaGveCsLK+sEafrfVReLVwjqHv66zpUS7m8TKOy5/ZP4x33uBl9nPkngCQ=@vger.kernel.org, AJvYcCW1T3UNhCXM/G4d8Mak81q6ShDoONLwUhEJIMax21kKy3lYm3mjS4bEZPG15LKVJ/ETD1UUt0/E7wAo3awnLn7/hL9lgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6gsdviKV9anK5x0ifGjbvy9w4SbwI8PBHV/F5jaXd0TnvaZKG
	Z9uUCcImUyLRfL288xDn2ysEfEJUpxgQhP4IkbbQ6iTVWQlOxksIV5uUIljIlhnTQoBnloUV5P0
	224/YrPhsBe8+pcJ/vMCVmlbY/WE=
X-Gm-Gg: ASbGncsVCzVuoKM/xMiS8tqh+KvPFzJ65atY16p+5zb61nz4lpR0+RhlM6Ko0ALREVP
	tfRCadBA5rQXmtdqzkHpgmMRNzDctGr2g9T7W7Ck=
X-Google-Smtp-Source: AGHT+IFyhJNq00elX67/fCO7IUY42h1ZfDldaAAkeQda2k7qeUzkrPIt4O3/yT5VJBRhJ+gKA/j7hv60eV9lMc0b48A=
X-Received: by 2002:a17:90a:f94d:b0:2ea:4a6b:79d1 with SMTP id
 98e67ed59e1d1-2f452e149bbmr65784485a91.11.1735800673487; Wed, 01 Jan 2025
 22:51:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231140442.10076-1-hridesh699@gmail.com> <12ce2a4d-6a27-471e-b330-996753ff1bfb@gmx.de>
In-Reply-To: <12ce2a4d-6a27-471e-b330-996753ff1bfb@gmx.de>
From: Hridesh MG <hridesh699@gmail.com>
Date: Thu, 2 Jan 2025 12:20:36 +0530
Message-ID: <CALiyAon3r=VXFNZw7is4VWZoRnFFbrUUvLB9XeW+xkMLjXDyRA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: improve platform profile handling
To: Armin Wolf <W_Armin@gmx.de>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, onenowy@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 2:28=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
> > @@ -1946,12 +2038,10 @@ static int acer_thermal_profile_change(void)
> >               u8 current_tp;
> >               int tp, err;
> >               u64 on_AC;
> > -             acpi_status status;
> > -
> > -             err =3D ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSE=
T,
> > -                           &current_tp);
> >
> > -             if (err < 0)
> > +             err =3D WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTI=
NG_PLATFORM_PROFILE,
> > +                                                &current_tp);
> > +             if (err)
> >                       return err;
> >
> >               /* Check power source */
> > @@ -1962,54 +2052,52 @@ static int acer_thermal_profile_change(void)
> >               switch (current_tp) {
> >               case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
> >                       if (!on_AC)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED;
> >                       else if (cycle_gaming_thermal_profile)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_E=
CO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_E=
CO;
> >                       else
> >                               tp =3D last_non_turbo_profile;
> >                       break;
> >               case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
> >                       if (!on_AC)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED;
> >                       else
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO;
> >                       break;
> >               case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
> >                       if (!on_AC)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_E=
CO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_E=
CO;
> >                       else if (cycle_gaming_thermal_profile)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_P=
ERFORMANCE_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_P=
ERFORMANCE;
> >                       else
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO;
> >                       break;
> >               case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
> >                       if (!on_AC)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED;
> >                       else if (cycle_gaming_thermal_profile)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED;
> >                       else
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO;
> >                       break;
> >               case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
> >                       if (!on_AC)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED;
> >                       else if (cycle_gaming_thermal_profile)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_Q=
UIET_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_Q=
UIET;
> >                       else
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO;
> >                       break;
> >               default:
> >                       return -EOPNOTSUPP;
> >               }
>
> This needs a bit more work, since you might accidentally select unsupport=
ed platform profiles this way.
>
> Using platform_profile_cycle() would make sense here, but we still need t=
o handle "on_AC". I however wonder
> if that is really necessary.
>
From my testing, what I've found out is that even if we don't handle
on_AC, the profile is still set but the hardware will not put the
changes into effect until we plug in AC.

I've incorporated the rest of the changes into v2, thanks for the feedback!

--
Thanks,
Hridesh MG
