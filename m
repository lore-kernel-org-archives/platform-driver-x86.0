Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B9155326;
	Wed, 15 Jan 2025 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736954629; cv=none; b=FQyn4ssdjgXRH9C476jJ3Xu5ZbX4XDOGaIRJ2Ng1jYl3mE2OmNCnlom1Xt8bNoSv7GAkV+kGVkWHttgIO0dQrK4XXUESTjK9vM0HNkjLKX5USo70mY+YInKEFrakTDBIaEiEjkytjPaZdz+iSSRe/FI3UUzILKXW5OufJHTcgEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736954629; c=relaxed/simple;
	bh=Do31sWZewofIFJU2pJ1q53U4JYY8LBw9SSAizI681Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDHjvN86LduR7f+nNPBj//Gmjf5n9DZm6Siz/Jf3Pr6wEZt0NnLlqkW3CP1EnApDZaMWQ/UKGugim2xvAPcZHSXcArG9x/kDGNE2Ff3V4FvbuqL9/wby0S9nSmR8K9f4qaqrMsmhre1xi0UvphhdQgAWG9CpFmCU37xLvNmLcuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq8dUml/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq8dUml/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso9130976a91.1;
        Wed, 15 Jan 2025 07:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736954627; x=1737559427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hEO6UhBtlpmC4r6WmrbHwwvy+4WrvtJ+CBJpUnXx8s=;
        b=Hq8dUml/QS4tWKsAbUMOrdE/gL50RBAPcUH9MfSaPDhYiCG5Mt+e3SIFL8/0VKlcZV
         XXv5S141ly1xiaMlJjJOIDdu7+1fyoJRT2Z3hf3AmWcEzp2Z6KhiKIfILlnYwXszP36C
         cbIX4V3WKs1muepFx7CkcG5EBOPKzDh5txGmBOudMU8jEpwp8J+WrUAmDcbZ2INOuITZ
         rSwdcM14gst2GLJsjf5ui0nF4jvwhqfvj+VKgv81K0Xf8r8mu0jlet5Dbwxc47vMReAr
         tmqhUaOCjTpLhzL3J4Uw82HhF/yqsvyGT5Z1fmAHTaODQrKW1U8mBCSRvoA1x49nNuSV
         LKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736954627; x=1737559427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hEO6UhBtlpmC4r6WmrbHwwvy+4WrvtJ+CBJpUnXx8s=;
        b=PUfC+pIbf6i0L2K1RW4/JWypPIxJiIYm784VXmMCVyx37GmOIfoElcC9mPxewPo8UH
         3CY/n2Wg91jtPG+XZPbW4Y0Fvg1VDzLjTbaiTLLUsV3wHAbynq9C904TebsH6QUjGrsQ
         M+9ShhBCBBO3Xuc0jYuludGxtbXe3UQXQQ/II2BIa47kvIIotd/njigjChvveCYPrZJi
         AQAg0m93ODpjYXnh3Pga+uVqDNvVwd89GwwCXstfLtuk8RxCpi3a9go0HlozaqexAIBT
         FgUfFp4tkyYhFTXFe9fpiLl0N+fcgCyC/RqAdWTSjq1kMsGEmYVUVo3lc4Q+89G1nN/b
         ln4A==
X-Forwarded-Encrypted: i=1; AJvYcCUcIaOl6RQNbboo8VzWOHXKZQnenb0vu0zgMlWIrgRKHnR21LM10++F1gY4YUqeIFI0AOE6+/TZIDc3MoXOiCSRp3nojA==@vger.kernel.org, AJvYcCWlnokyWMNKQ1Td+iEgPcEVCAMfMNVYUZsYxQnIGWZ7UbEmw2u/xW53eu097FNqfCN7szonYG9MZ6LHftc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Qqxeg/8tjtvmx0EdS4zL6hI1I/manhKS8gS+G0KVzK9Z5ovG
	GvxuTw7HGuiCIdKMRq+HKakllzgJ6DXRP2ZxwDCFQM/RMpQnLI6kH7AhL0gleR7OZVAKxl1ph4o
	NLByS1buFB8boTfCi/9es4qRursg=
X-Gm-Gg: ASbGncuaKdgXOfAvPkfPJASDgzasQ7ofbHQa96ArQQYQJeUX0f4Pq39jfe/ClgoKBRx
	DEiKJaRz4pOUrN/hlYERyOdvWshPTULZES8bTGlM=
X-Google-Smtp-Source: AGHT+IGxlAAtWQZ5eiG7FzK0qF5sTmYAei9PNxCeZfra4d5bVSE1VxKE199uSHWbnEvJZJnl6UFhgfpNB4eveHs/fA0=
X-Received: by 2002:a17:90b:3a43:b0:2ee:f22a:61dd with SMTP id
 98e67ed59e1d1-2f548f3dc5amr35630867a91.32.1736954627189; Wed, 15 Jan 2025
 07:23:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com> <173695186401.7584.2765000569734785177.b4-ty@linux.intel.com>
In-Reply-To: <173695186401.7584.2765000569734785177.b4-ty@linux.intel.com>
From: Hridesh MG <hridesh699@gmail.com>
Date: Wed, 15 Jan 2025 20:53:12 +0530
X-Gm-Features: AbW1kvY7hvcOJ2_Kl2BHJ94FvGMkByQY9qF16bWGxFttA2lx5n5lXA2ca-PxH3c
Message-ID: <CALiyAonhojK1-z6iZSkHW=pnNOo7WGf_3ekxHnabDX0B4=xsvA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] platform/x86 acer-wmi: Improve platform profile handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 8:07=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 13 Jan 2025 18:44:08 +0530, Hridesh MG wrote:
>
> > This patch improves the platform profile handling for laptops using the
> > Acer Predator interface by making the following changes -
> >
> > 1) Using WMI calls to fetch the current platform profile instead of
> >    directly accessing it from the EC. A new helper function is
> >    introduced for this purpose.
> > 2) Simplifying the cycling of platform profiles by making use of
> >    platform_profile_cycle()
> > 3) Using an ACPI bitmap to dynamically set platform_profile_choices to
> >    better reflect the supported profiles.
> >
> > [...]
>
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
> The list of commits applied:
> [1/5] platform/x86: acer-wmi: use WMI calls for platform profile handling
>       commit: 2d76708c2221dde33d86aeef19f6d7d5f62148b4
> [2/5] platform/x86: acer-wmi: use new helper function for setting overclo=
cks
>       commit: cd44e09bb89d4a33514b9ec3d972f0d2d13f5cfd
> [3/5] platform/x86: acer-wmi: simplify platform profile cycling
>       commit: 61c461a90fbfc038d9663713f293d60fcb58c41d
> [4/5] platform/x86: acer-wmi: use an ACPI bitmap to set the platform prof=
ile choices
>       commit: 191e21f1a4c3948957adc037734449f4a965dec5
> [5/5] platform/x86: acer-wmi: add support for Acer Nitro AN515-58
>       commit: 549fcf58cf5837d401d0de906093169b05365609
>
> --
>  i.
>
Awesome, thanks a lot! I would like to once again thank Armin Wolf and
Kurt Borja for their guidance and help in creating this patchset, this
is my first meaningful [ to me atleast :) ] contribution to the kernel
and I'm quite proud of it. Working on this issue was pretty fun and I
learnt a lot regarding different things, it really did make me
appreciate kernel developers even more.

--=20
Thanks,
Hridesh MG
