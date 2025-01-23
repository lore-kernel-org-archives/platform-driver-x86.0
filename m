Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3796847A7E;
	Thu, 23 Jan 2025 22:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737670227; cv=none; b=ZvLmRmwAa9jrxRAj1ajGrCsGWNb2D3vlCWOvVtKTUOP8SJ78wpzLCsAKoIcfZ2RUkZqbpuTDK60jYGa5ffZgkSqroTnKKSJ5n1BjrgSVVM8cBfmYcBFQf98d51jZcT4kPh7Xly3aGSlj+1Z/zxFeiPsG6HphvwQekdPRLNpSdpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737670227; c=relaxed/simple;
	bh=z4OGiv6okbVy3wpSugVEyHFOJxOs2stt2Xtg+paYMoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgYBEQg2UenDlXSCBgmPhKBZMmpvNTs0+szMgck57mgiSPJNadxiLwZ0aJcPdKbrv8zAYQrVFqJT42tsk8pPXIUd68+ilhw5P4R36/npNhEYF8lSUweVPjLc0htz6Oax6Fczl11VTnp4J4lrI6EK3s/00xaUnJqxK1PqN4CfuN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHKujRNq; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHKujRNq"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5f4c111991bso727675eaf.0;
        Thu, 23 Jan 2025 14:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737670225; x=1738275025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZW9qR6kqID7Bjo2YYz2/JOTvidK95dhPDAAb+hC+ZWM=;
        b=UHKujRNqDDi3K3egxU1lQed2hPdXLhFr7oQY2Q4qHfBtVElfWYW01zU1O+XbKbtME7
         YJTTF2mhCaS6YeM8T2yNSLTKvHocG+QNn6pQFvyDXz0hrUyJz1zPT/oVKg7gToNEypk/
         FZJ9mMUkb3exroUtfftM7PFUzH607vlETwphNQQsZI09LGf+zY0Gyiv9W/EgAjzjmweL
         Gu0C24N/R597FbLdDFWgxVVVSfWbtCqi7EDbgUKfREimunG9tDsEpRyvDDMMGa5vHl0L
         uzf8rFr7uCFo3t8hkRGkk3abvFfWN4sQVuXNj4ngsCZ+D1uF6INx31C5p1JTkptNL6Uu
         9TbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737670225; x=1738275025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZW9qR6kqID7Bjo2YYz2/JOTvidK95dhPDAAb+hC+ZWM=;
        b=eZwK8Iwl4qvAy1YT5DV9Mbx9zZDq25S2vc9dmIdhOEjbfogkt9iCFWHPJBLPRkyxUc
         aiJgjZAtJ39CSpJPKSEtj97qUmgLQwAWWoXj0yt/JZKg8XlVx3VVo10eznMbL7r56Ap3
         45d7wg8BE9v/hAd5I3796QfymeXPLHHD1JnadzHoHB4mLOU5RE8HXyXCIE9Gvt5at0dq
         ssGtkS9gCdSbUfQMg3iDdldk/oP8xApn4rOGenW/1qJAJv9FxLORHdXSoRXQlEKThAeR
         m67LlF9XBAPwKfN/0RveWI6tRcFt0Fpp+iF50ot3Tn4+kAmuflQlthDg52IGufDJ6ZMS
         fqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGITEaNw7ZIqKecc+cJ+gBOL8gxonHIyrieO3BTtV87kwPxgURhGtfbBhg83tvNsTZdLYCazW1J+yjYow=@vger.kernel.org, AJvYcCWZCLmpbKcrEPkpCc9XzZrSckHH7jPTsFAfVWL+Vs0ztNXhxF2cG85fNr+uoyWzQZuqDWcI0mbKDt/p70jhgJyH9m3VJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGaLeZOTOlGFdrw4WTwi0+lmkSOCI6lwT06FNQMl2kQ/fdvFol
	qaeAwrtCi8pKd9AubLpsH8EJUYH3WaGy57vD9MewaMmgg1e5rxuqn2EJXR3Wcb/gc1Z0yiArmrh
	hofoEAuKKHy2PJYi+tjPPu/LISYA=
X-Gm-Gg: ASbGncs6MXm0RknCLET5kUP69qrUusvXTfMTniAPrQOS3ropqRIIzCK4IOETM1WVjk3
	/GpBNQZsSZH3QCucnHiSjFByFJK/GEdNrLxTISZgr+BdgUCY1GLlQ9i33G/XWJA==
X-Google-Smtp-Source: AGHT+IFbrLJGhklTElLqfqsog1Z3vSNu8Ecyw0bWnJiX768HnMHREmHPczwlIzX1Uv9Qnftg3WGkYVphsn4IL1XkGJ0=
X-Received: by 2002:a05:6870:55c8:b0:29e:4b60:d992 with SMTP id
 586e51a60fabf-2b2913bda2fmr660763fac.13.1737670225253; Thu, 23 Jan 2025
 14:10:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123220739.68087-1-d.kandybka@gmail.com>
In-Reply-To: <20250123220739.68087-1-d.kandybka@gmail.com>
From: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Date: Thu, 23 Jan 2025 17:10:00 -0500
X-Gm-Features: AWEUYZn5_MPQly3G6n0we-l5egrVCSnepymuLQ2ksSt-V166t9W-_uLKmooAf6Q
Message-ID: <CAE2upjRezd+NWsT=PwObNoS56jJ5uBEnuzCgjBht_w2pQ1K0Xg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86/intel: pmc: fix ltr decode in pmc_core_ltr_show()
To: Dmitry Kandybka <d.kandybka@gmail.com>
Cc: David E Box <david.e.box@intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good to me.
Reviewed-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>

On Thu, Jan 23, 2025 at 5:07=E2=80=AFPM Dmitry Kandybka <d.kandybka@gmail.c=
om> wrote:
>
> In pmc_core_ltr_show(), promote 'val' to 'u64' to avoid possible integer
> overflow. Values (10 bit) are multiplied by the scale, the result of
> expression is in a range from 1 to 34,326,183,936 which is bigger then
> UINT32_MAX. Compile tested only.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Dmitry Kandybka <d.kandybka@gmail.com>
> ---
> v1 -> v2: 'val' variable declared as 'u64' instead of type casting
> at usage points
>
>  drivers/platform/x86/intel/pmc/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86=
/intel/pmc/core.c
> index 10f04b944117..1ee0fb5f8250 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -626,8 +626,8 @@ static u32 convert_ltr_scale(u32 val)
>  static int pmc_core_ltr_show(struct seq_file *s, void *unused)
>  {
>         struct pmc_dev *pmcdev =3D s->private;
> -       u64 decoded_snoop_ltr, decoded_non_snoop_ltr;
> -       u32 ltr_raw_data, scale, val;
> +       u64 decoded_snoop_ltr, decoded_non_snoop_ltr, val;
> +       u32 ltr_raw_data, scale;
>         u16 snoop_ltr, nonsnoop_ltr;
>         unsigned int i, index, ltr_index =3D 0;
>
> --
> 2.47.1
>


--=20
Thanks,
Rajneesh
