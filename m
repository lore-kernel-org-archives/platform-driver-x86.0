Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B671922C6;
	Mon, 20 Jan 2025 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737361270; cv=none; b=Xxwkc+OKo3oA3yul/r10JQTqLx1v6g08sla8kKkbPUMv6esRpC3PFUs8dsN4pHOfHAF2iIGV+H/lxhJ+tHnuIvqGECGaX2Uma0kkaa3FnNMLOhm5S05Q/pYHKNzR0NftVt62odkTzy0ak5yzEOt+RL04GaHxekbtb7iR5qSJIeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737361270; c=relaxed/simple;
	bh=w8n35gyfRLxmD0AwpASPpZgxzZsA/nq4XNJonc70+7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXsB4cTBViu1c8F5LPbz9iMIMUmVj23naoRl2WAKakdz8xjEZw2E8aJAcnp5bJx2Pa/4OnGqsFyf1gQwvvvxhGZUYZZoWZYx2d2+n2Pktjp02xsuuWUQZSES9zCdrtO1C3HRtB8gPJ9U0chI98WZ5+JEqEFgwm0j7jeE+O4V6Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buCTFDKi; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buCTFDKi"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f441904a42so7588693a91.1;
        Mon, 20 Jan 2025 00:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737361268; x=1737966068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt57REWUOOsYiSCseFJcIu7S7YcugYrrajy12q8luhk=;
        b=buCTFDKiaZx1GagahTSk3EmTgT+V3+XOg2Jdt30gfdp6sSpOLKd3ckPf633F1gogyO
         ie4N5tn6junyt4535P+o0LCJkXXP67rpxnrkusCyDgSIH1+0czjKzTmBbIdHf8Kvehns
         mX3NoGFrxY3A3+Ye6ibRWoCmAtUYT6bvtp79X9+dcq5X+jugHZ0L/Y+5456jScHdxalc
         L3kveoTaH/EXwJ3ZehwSwVYaLslLDL4XnWW6z9vEOu0g2FMfFwnaQCDKNu6iJS3Emzq4
         J0fwjmked+t3RGeEo5AcP5g/dDdsARhmW0dFSd0zx0xHgtzqIM4mMxvXEWZ7nxPfyFZl
         CcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737361268; x=1737966068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nt57REWUOOsYiSCseFJcIu7S7YcugYrrajy12q8luhk=;
        b=xTygm1ZS++GHneA4NsCNYYRD9vKCvmEVXuuG2nbHsO6azx5dd+imwUR1VJRtceSD7w
         Y1sBdZH8uXlCcA5Y/DzUOee2Yu39Obo79YDfxO4DkmODsoDUtouj3RCh8xsBiFLNWczA
         +y69vIO4LwQhsozQzpLyMmrPJ3btAOwWuao2SjhT5P6SGm4zn0O9+D/iRwP/EE41yGBc
         fWd31yAPTie8sBqCsA0CJDBoKo4+L8Tyfn4qdAv6CFAGLeq4URxhde2NOlCSfpKBDpHy
         bx0wxQDahEAGc8xGyVD5mYScaDMcBMcYZEny0lAcDQjAyO4IM2S1rHAIgXXy70BZJ23J
         sRwA==
X-Forwarded-Encrypted: i=1; AJvYcCVD9ObdzDpbb6u6Hd7OJkMMQKERY4X+OfGC3DkA510EVq90KxoI9syc5CXCCw0ff9vsd5ACY5Vbsi7/ypM=@vger.kernel.org, AJvYcCVwCU7up/ivd0+wyv/ZHMuhpC2QWS5L1BuEI8hYRLiRArxjbez2ySLxmsAtVDbNHo6GEpFw/I92UbDQZU4hGILNeyZBBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYUg3GOArkFhMqD582CYW2D9ocYNZPG3aS0xsaq0k66q2IcLIy
	8svxvX1LEqcIpKWnfKBqaWSfk5pif5+t+0JKqNSKugOOlKK/qZ1EWQMOGM+qmNoM9redPwon5HD
	V2MVIrHvAKf04Y6P1J25ZqVH0yKY=
X-Gm-Gg: ASbGncvzh5htRFru/X3ThYFPT3st0xRMk1i94CCXVLxrmIwKH1Vzc30dIdoNjsEf9K4
	vwjull/gmj8rbUIy9dRSgAOhNEBg/CmEfngwH/c/1kpjhVLU=
X-Google-Smtp-Source: AGHT+IFXY1EF6AIKFQAw3m+3jwFkyAktS7aR/8td4IoNbe4TI+eCBjOfu4kfD0QF81PSjVSoDMv5fQsfkwICyQ0iM2s=
X-Received: by 2002:a17:90b:48c9:b0:2ee:f1e3:fd21 with SMTP id
 98e67ed59e1d1-2f782d4ed53mr17274708a91.25.1737361267767; Mon, 20 Jan 2025
 00:21:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119201723.11102-1-W_Armin@gmx.de> <20250119201723.11102-3-W_Armin@gmx.de>
In-Reply-To: <20250119201723.11102-3-W_Armin@gmx.de>
From: Hridesh MG <hridesh699@gmail.com>
Date: Mon, 20 Jan 2025 13:50:31 +0530
X-Gm-Features: AbW1kvZZ-LmkSVSY_fJXiF5jZ7RXDwOvfnaxFLe35Am72GtUQiX-0clDriGbmY4
Message-ID: <CALiyAonASsOg1Ybnhez8HGO1fezDKHhe1jdsbQmdjb0GuWCHTQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: acer-wmi: Fix initialization of last_non_turbo_profile
To: Armin Wolf <W_Armin@gmx.de>
Cc: farhan.anwar8@gmail.com, rayanmargham4@gmail.com, jlee@suse.com, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 1:47=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
> On machines that do not support the balanced profile the value of
> last_non_turbo_profile is invalid after initialization which might
> cause the driver to switch to an unsupported platform profile later.
Hello Armin, while I think it's unlikely that Acer would release a
gaming laptop which has support for quiet and eco but not balanced
mode, more robust error handling is always nice to have.

> Fix this by only setting last_non_turbo_profile to supported platform
> profile values.
>
> Fixes: 191e21f1a4c3 ("platform/x86: acer-wmi: use an ACPI bitmap to set t=
he platform profile choices")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Tested-by: Hridesh MG <hridesh699@gmail.com>
Reviewed-by: Hridesh MG <hridesh699@gmail.com>

> ---
>  drivers/platform/x86/acer-wmi.c | 41 +++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-=
wmi.c
> index a85c881d1f24..69336bd778ee 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -792,7 +792,7 @@ static bool platform_profile_support;
>   * The profile used before turbo mode. This variable is needed for
>   * returning from turbo mode when the mode key is in toggle mode.
>   */
> -static int last_non_turbo_profile;
> +static int last_non_turbo_profile =3D INT_MIN;
>
>  /* The most performant supported profile */
>  static int acer_predator_v4_max_perf;
> @@ -2034,32 +2034,43 @@ acer_predator_v4_platform_profile_probe(void *drv=
data, unsigned long *choices)
>         /* Iterate through supported profiles in order of increasing perf=
ormance */
>         if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_ECO, &supported_pro=
files)) {
>                 set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> -               acer_predator_v4_max_perf =3D
> -                       ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
> +               acer_predator_v4_max_perf =3D ACER_PREDATOR_V4_THERMAL_PR=
OFILE_ECO;
> +               last_non_turbo_profile =3D ACER_PREDATOR_V4_THERMAL_PROFI=
LE_ECO;
>         }
>
>         if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET, &supported_p=
rofiles)) {
>                 set_bit(PLATFORM_PROFILE_QUIET, choices);
> -               acer_predator_v4_max_perf =3D
> -                       ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
> +               acer_predator_v4_max_perf =3D ACER_PREDATOR_V4_THERMAL_PR=
OFILE_QUIET;
> +               last_non_turbo_profile =3D ACER_PREDATOR_V4_THERMAL_PROFI=
LE_QUIET;
>         }
>
>         if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED, &supporte=
d_profiles)) {
>                 set_bit(PLATFORM_PROFILE_BALANCED, choices);
> -               acer_predator_v4_max_perf =3D
> -                       ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> +               acer_predator_v4_max_perf =3D ACER_PREDATOR_V4_THERMAL_PR=
OFILE_BALANCED;
> +               last_non_turbo_profile =3D ACER_PREDATOR_V4_THERMAL_PROFI=
LE_BALANCED;
>         }
>
>         if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE, &suppo=
rted_profiles)) {
>                 set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> -               acer_predator_v4_max_perf =3D
> -                       ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
> +               acer_predator_v4_max_perf =3D ACER_PREDATOR_V4_THERMAL_PR=
OFILE_PERFORMANCE;
> +
> +               /* We only use this profile as a fallback option in case =
no prior
> +                * profile is supported.
> +                */
> +               if (last_non_turbo_profile < 0)
> +                       last_non_turbo_profile =3D ACER_PREDATOR_V4_THERM=
AL_PROFILE_PERFORMANCE;
>         }
>
>         if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO, &supported_p=
rofiles)) {
>                 set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> -               acer_predator_v4_max_perf =3D
> -                       ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> +               acer_predator_v4_max_perf =3D ACER_PREDATOR_V4_THERMAL_PR=
OFILE_TURBO;
> +
> +               /* We need to handle the hypothetical case where only the=
 turbo profile
> +                * is supported. In this case the turbo toggle will essen=
tially be a
> +                * no-op.
> +                */
> +               if (last_non_turbo_profile < 0)
> +                       last_non_turbo_profile =3D ACER_PREDATOR_V4_THERM=
AL_PROFILE_TURBO;
>         }
>
>         return 0;
> @@ -2080,10 +2091,6 @@ static int acer_platform_profile_setup(struct plat=
form_device *device)
>                         return PTR_ERR(platform_profile_device);
>
>                 platform_profile_support =3D true;
> -
> -               /* Set default non-turbo profile  */
> -               last_non_turbo_profile =3D
> -                       ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>         }
>         return 0;
>  }
> @@ -2101,6 +2108,10 @@ static int acer_thermal_profile_change(void)
>                 if (cycle_gaming_thermal_profile) {
>                         platform_profile_cycle();
>                 } else {
> +                       /* Do nothing if no suitable platform profiles wh=
ere found */
> +                       if (last_non_turbo_profile < 0)
> +                               return 0;
> +
>                         err =3D WMID_gaming_get_misc_setting(
>                                 ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, =
&current_tp);
>                         if (err)
> --
> 2.39.5
>


--
Thanks,
Hridesh MG
