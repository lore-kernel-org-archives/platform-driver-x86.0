Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794169161;
	b=bEHbg/7gfRJMZHpXVNddp15xL+0OpO10/6LnYcTeeblwxPmMGZjzL3+a5GfEhfJ93+50
	 FQzlJzfw7Vd+80JbzUyPja4UY6EsFErdEzyC5Ek8YWP5kM8Enn5JP1WS7KOQ4tLbB3hiS
	 Bj2nN/Z2sq8rv2UX6PtmeJuay7GIR/Bnjop6uVEAiIhpR2A/7EMTIdz69PyhHbozbyZqx
	 I3IOo8AYY/GRmglh+MhFnmdzCuPSd7izyyXyaCaZmIDwLUEre9/99XdNkDnLiJ+qVuKJ4
	 TtDN2f+ysO86YfuHcaN2mDk0ciko0iYQL3GZEtG+CiszOz3AgXQs7s8kY0Ati7EBZww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=dmRlkML0mYO/zvl9Gq6qNLyewxrO2RCCERSrCfMi++A=;
	b=Gvf90Ts61ic2FtxDqMzD8S3S91oTFxzuv6Wdf1aO+mDr0kzjalnJNnPXPBU9itSyAi7L
	 MnKgWqm/HuUd/QtdCS4FjYMGUxdpHjy9e0RYyBnrhuXt135UmtAgZBHyikOON0AudestY
	 sTpSktsTJdA6WKYl27Hho8u61HqTD2wK8bkfPoJQsDGos6xUGr3MYQkcXwbqv/FvjuSGA
	 9XC9vtO4T+nDdIkaTPl+AX9CgkYi8rI7+bBOT6rahAHSTAUBFagD376qGiJJdbC12czcW
	 q/wDEsrrQ2RdQRXDRJ6SdHriPvb/o0GwLW+gZ7X5+ttR+hzZ2CsqflSq+poZDveu6sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGsoKWST;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86826606A31C
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 20:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86826606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGsoKWST
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a06e79e152so88335b3a.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 12:19:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794169161; cv=none;
        d=google.com; s=arc-20260327;
        b=GeIcrCJQDQY2F3lXlxDZehcM8SekWGPzAUMKJAWVvKBJsG1rfTDuXBF6WvMtiww9pd
         GHtYiZ+p/9YXGkc3BD4pNA4HULtC7tGKm1trSaFd6FVFn1xvK+uKeammGKCaJCFt1psV
         GASGmJ/dShaG4EotxRUzBSecA1LEwUaAASvSyqNBkqkymJ9ifhdfPjIgCjx78hlglVfN
         OJjoSbbtcoyAkJTo4Eac2CQlDSE2jt5lubhZDnOBj6hrcCUnLneYuRLv5Wl8OqoFNi/l
         DWhmIVvMx5rEO2pxXZ0L5njCRn5IuvNllAvIXKidQc9oQCHyT7ckUKfRZ+Dn1vf86WNR
         ZQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dmRlkML0mYO/zvl9Gq6qNLyewxrO2RCCERSrCfMi++A=;
        fh=YLEoDtbKL1aLfhD5tMQScjkJvcBKCkJA6QKs6ZBCyX0=;
        b=fyD+3EjgTggFGt2g3obR6lKEEsBtBg8z2kCvCrvCvsbuJRM8Frhzv+WJFBK2Rh4kMU
         UVAtGzIkpbkLZH8KLd9IZdnvbPbjrrVQBdSNYAg8/hlzvpECD/qr973fciks6yfvAafV
         nGET6qKN70G7hQ3etMvSYqWy35hgBxs22o995DH/j/ILlexsjukZyDRnC1WEDQ1m6Jem
         tTwkVfYJwBZmk+ZcOjLvdV3n99tWvMRH54S+FhgoCEr+gwt5QAytucnoQTkqXEVnkRUk
         Eja8pOgMFjqbZZPxbZL1pIW88TR2lxa/bHvtJSGVodiJeynhBzS2u9sxGikrv9Zbk68N
         XihA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794169161; x=1794773961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dmRlkML0mYO/zvl9Gq6qNLyewxrO2RCCERSrCfMi++A=;
        b=jGsoKWSTyrYHMj8fCbS3a1LfcXHv1JwityuJJ2HF2HnXq96xPKGMzW0MKjuOcpJXgb
         PNQ5/++gG1x0Fy9v3fnkhReXDQFxPuNFKnSwXf7GQFvDP3VmPCUPl1FqnAPQv89/H8to
         k/lRagWWjejm0bIw0NrHtyYCGIJsPr9ca0PDuiVI2NTGOxIVUjE6Eh+CyPDyaJSlhEso
         8l3PhmqadzkkQly7BHhDqMYUScno7Est6loJAx5YzOe/yIdU1U8OIDwAU8IsWefbU/Ju
         pjSuGPApZlHlmyUIfaTTSW03YarRnk7xiwQ81VGarRKMszVWwhUfVzk90Pv/DyV8kiVd
         8XSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794169161; x=1794773961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmRlkML0mYO/zvl9Gq6qNLyewxrO2RCCERSrCfMi++A=;
        b=sMngcS0swU5kxpNGkXUoPexUFKsv4XJAdfdSCVvNpTUCLui8uRXPaz776gNmDdp7FU
         oNG3uqDaRUuLLSg74zGby9sEvSf0g1YIYtbMYETABDpBDzEwYnz64zQc2QZVDKKONkU/
         fp3Jeq4XGo9JphWvChvtjaj09N6nRxFCjk2WeDBC+OFd1RWbbD7PXnKyg5atddQfaywp
         pyxPcwMN8Mo7Fs15m5x2NVX+0tNelcELF0GhRAe41gMy6OYp3fM077DgwlYBYzlP8Cmi
         qF2hcNzcBjzNmnZ2uhqA3q3nokcH18EUwH8+FzpkylgLTOOZ+LirHvM6nhN/vze6n6cA
         UEeA==
X-Gm-Message-State: APuU4Z90rG76oKw9pa3PrVGMUhi225wJSjNeSWTuUGkGc1FgM5/Pwtl2
	iv9GGj9Eu+MXwFiI09ISRI4eK2cKXhfSleChPHBezXHEwkUgDHSr+8NZOFUPt9X9mL+dYyX10+e
	dY1sygqA318syyiQ1ozEMr5FcEqfgqevtmNC5ZCg=
X-Gm-Gg: AYBFou1+m6AO9NAV+tTc2asFg6rK4TRVzc/B+wG038xIQV09R17sAw03od9BFccFVsJ
	Y6VfttuaOuSMcQztiNhYlNvxRhR1Jks5SdESDJi5Vl0qQr13P7H+iLgZIKdPg6vRu682T77VYJM
	MjsUjNBqOx0SGv9+CquHsba2qaAs3IApUCkgAFTY6Nlj2Sx/k3RC0W5inyi9i1Oj69EyTJV/D13
	8bL09JoSCC4TjdXfl7T928pMNlQ9p/+qEcZBm9qw7lUEBMKZ3fnNn8UeHeZFgiVT1lVUNtGWt46
	GVzHSAiaDypI0qFdbMHnPJujdMRWcM4K+mkQH3KsdReUNvNCaxgh49N/bVPnld4LM/q6C0yYoJ8
	CEoLcHo6ODY+sKNjLXXWMO+axKUDfemK8b2xFjgCwM1xcRQYhJXy31Y1u1aqk
X-Received: by 2002:a05:6a00:8015:b0:8b6:5a07:7768 with SMTP id
 d2e1a72fcca58-8b66fc970a4mr1568295b3a.21.1794169160741; Sun, 08 Nov 2026
 12:19:20 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFbNUuJGjo5OW1JZhO=uXqk07fmzE8yo2Qibe5PoOtHCmoQXpQ@mail.gmail.com>
 <ccc319f4-24aa-496b-8366-fcfdbd5dbce6@gmail.com> <CAFbNUuKTvJXoNqf-5K7VykOHtFFVdVHTc50aYswC0if4eGQN8w@mail.gmail.com>
 <ecdecef6-b2da-4d3e-bb82-a22a15febaf6@gmail.com>
In-Reply-To: <ecdecef6-b2da-4d3e-bb82-a22a15febaf6@gmail.com>
From: okluar <okluar@gmail.com>
Date: Sun, 8 Nov 2026 23:19:08 +0300
X-Gm-Features: AclHuK86qY6A4zgnVFEkSSUFDrlV9DEZdARTMKmUCaJ22X5R0aMhYFrSn46aZ5o
Message-ID: <CAFbNUuLXaP4_257tWkr-09n9h9yZX_y772LMStPY8QuGOWAipQ@mail.gmail.com>
Subject: Re: [BUG] platform/x86: bitland-mifs-wmi: performance profile fails
 on TIMI A30 (USB-C only)
To: Mingyou Chen <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 5:53=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> w=
rote:

> Hi,
>
> Don't top post (reply at the bottom please).
>
> I think the .no_set profile entries are currently missing for your quirk
> (I missed them in the example quirk).
>
> Here are some methods to get them:
>
> - Reverse engineering the dsdt table (from your timi_a30_acpi.dat)
>
> - Or just simply print the values in the kernel code (add a dev_dbg
> statement in laptop_profile_get function)
>
>          dev_dbg(dev, "profile wmi_val=3D%d\n", result.data[0]);
>
>
> After acknowledging the values, just add the profile entries into
> timi_a30_profile_entries. For example,
>
> static const struct bitland_profile_entry timi_a30_profile_entries[] =3D =
{
>         /* Change this information if it doesn't match your device. */
>         { PLATFORM_PROFILE_LOW_POWER,   2 },
>         { PLATFORM_PROFILE_LOW_POWER,   <val>, .no_set =3D true },
>         { PLATFORM_PROFILE_BALANCED,    1 },
>         { PLATFORM_PROFILE_BALANCED,    <val>, .no_set =3D true },
>         { PLATFORM_PROFILE_PERFORMANCE, 0 },
>         { PLATFORM_PROFILE_PERFORMANCE, <val>, .no_set =3D true },
> };
>
> Fill <val> placeholder with the values you actual get.

Hi,

I added the debug print and got the following values:

   power-saver: 2
   balanced:    1
   performance: 0

So the values are the same as the ones in the quirk table.

After that, I added the ".no_set =3D true" entries to
"timi_a30_profile_entries", as in your example. However, it did not
fix the read issue. Here are the logs:

   RAW (call): rc=3D8000 data0=3D02
   bitland: wmi_call ret=3D-42, data[0]=3D0
   platform_profile: Failed to get profile for handler bitland-mifs-wmi
