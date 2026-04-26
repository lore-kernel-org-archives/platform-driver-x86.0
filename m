Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3AD17D6
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 15:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777216271; cv=pass; b=Vj4FONWsasdZiao68Z3rLQ55DW++fjM52fP0N1O404g0LSr790c+dQwPLO8msaaEvGxN5PbapgBujyG9H7mffT6gfgJxMrsIitOmnDziKIbUTrHjxXvUOZozUMXG2UfVwNjzV2y7SlOAo7upk3Q29oarPX4gs3nssZsj4Qkj/rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777216271; c=relaxed/simple;
	bh=OaEmFfUtSzpWQjiVbiHBpzjg6JDjLtZNVN0iKLBVm80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMMdYkVMZfhjoW4w2trCx2uwA8NcPRNZxx+fuxkwFV/vmM+OtS8TfGp3fqmz4OycQ5c2P/EcoDxWpFB9tmvn80erm/S5CibPC/xRv4knijxmkG7SwXTHE0d+D8IAHMMEZ0jAMYj1qeF+RPpoqRr5tXUHLGjsZitifWAzH1vB9aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgaW07yo; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgaW07yo"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50fb1932b62so49740741cf.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 08:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777216269; cv=none;
        d=google.com; s=arc-20240605;
        b=GEtVq5UwJftmw7v9/vn3lD+h5+7qJm+aiJOJilNgYPXXNcvTwldW61FzRhd55ABI1D
         fHkwftK2G4wGKZIJS+2L5DHbn3irUdAlgRFQ8w7z5+wCuw8xhng45+3GyXZ4SMPIdZ7y
         mo22Kz12Tk43nP6jKqZKnFcmxkKqQLeSuCUYiFDkMxakpfusghKEpk1qdFpMpQ1gYGvf
         F4DHW4PYJa4pJvEj3Oo3NKJajAFfCrlVhtDPk3ETrnSBksRRRvZr4s8bgRkbDCRm8KsT
         EqZU70yEXjJHrYlBWv4e1bkAjAA1FdUfSWWullAeuMbFdO3fpBddCfT8QIuch3Wjdpng
         yKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BRkk6hAS17i13qpkh/L+M+geKjwqUJ2F160u3RnT1R8=;
        fh=/3AOikGkqJIvwHOKi/ViA4Bh0qSqp9sqsX7QrCOdZVI=;
        b=jwgLuOjtn0WbIYWZB2E732VO9Dlw0aN7cR7W6Ac3GtLVuQTaEU5RS9aELiKPACdRJn
         gwhyl4g+AhR+GBqjMFCt3g7XLrrJxS8dIN6xtA90N+gSn2WwTVIYW4pQIARJ9ApetJdB
         0WtvS34C54Kmy1uDW2Nv67mQBlA2MQP2lvY9vQ2PB3/4pPo4p34+xyW0FoibxtOajzCP
         FxVPtIt7NWzEHGRbwrLCwDt59ne+jArCaUrB8+i0tnVRyVb5oIyYfNKDJCEoSX43lDzP
         LEnCQJPWA1eYvSMOCVHMwHzLxp3IUvSDnCHvpSJWbXt1ZeqkBlQsRmumSBX6dI4X9IAy
         WThg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777216269; x=1777821069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRkk6hAS17i13qpkh/L+M+geKjwqUJ2F160u3RnT1R8=;
        b=jgaW07yo4cxidVypzsrlWcAI1X88F/OsRvCiDo4LHkZtfT/rsEM1hyjEFMEG0+7GQw
         BoLDhl+H/nH0MlonRMLAls9okn8Dg0yPWQgW4XHeFdxYDb47PvYGsKy1msKdHuSm+ft/
         1s/9c7681x3d0IwZS1xb6D2mcaN/uBu5mVMvMwteZvTJg1h2P2bh2KCxV3Iy0fHDosVI
         yjOmR9Dr0H3fUakWNmQzvadngqwCdolzGdJiIUPLoDqp1waauSfj7a7tGliHBLM3LuiU
         FG2/dGqQO7ygnT45Nk/fSibwNLPW4Ocj49rBLGob9Wm3rcynVAdJqNZL2zxEgMeA/QBL
         HZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777216269; x=1777821069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BRkk6hAS17i13qpkh/L+M+geKjwqUJ2F160u3RnT1R8=;
        b=B9ahZS8NL2UtOUwTm8F2RFMlmisix9FrpKTv1rDA4+iS2d7yXMAjWAOkUExAc3MWhm
         EDxRXFgRTn8L7TADBAXuKCfNR3MRcF+eOHttFCEB3g/0Y4MdW17k2PmCPQE9Yu4hQsNH
         b34Y3+QIA1XK02k/qhFiUdegluD2ZeSLCrwTLBDwB8B7LCcMLr9ofvA253dDjA97WyZl
         jCwfkSmY0SUQmEoqE9FQ8kX5lVNpBW/Kue02GHkmb5ypua6ElWC/zWhp+wOxiH1w0GhK
         k5AaF2BPRqWP+6umyHYNeiGtc/1knT7gDqnFSygzBsW4JTfo6+Kr11uKCDx+gIPK1Ulq
         MQ5A==
X-Forwarded-Encrypted: i=1; AFNElJ+QDtPxu0tzH7FaKsi773xdELvkh68R/xFLsY0O2NKUR277mfofcGqIr1MAhzqyEHd9TKzPZv3AuR+VhlNXB3tfShPv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6GmVvzt6fdXIUnjcJ7eBdh5zhMnVLAdeUvUj+87SQ1Q7qNQM7
	tz4djsY5yLCOvLCAw4oE9MLIkZlfTwi8qdvnQ8V5Es8dH+QbUZ3Pu2RoAr4tkr359Y8k0vpppXP
	IA1GZhEwQ4STmL9V0l1W7BhWTOX7CG80MXx6jIdWN2A==
X-Gm-Gg: AeBDietzzGupw5OmJfTtm7KtkVejf06Zpbju3Lxqvrj/vc9yhPASB/LD2K+2hpBzcAB
	7I/y+O+pn+6tKfinzgB6/r11FNHpE8y/7wfYeQXwTb1BYc7CrWzhnxsJiViFcx9syuvvgjUcLsG
	CLdXapjO7pF07ftSpmdEZMc5YrIp76JHzGvXhdKWf3+vLavuijSdaKO/eV4fgcuc8iHTkKAu+L6
	JYtumjHyxVfPNsp3iRJv2O+BzWTTbw24Q8uTchlu1Fblw3XmKGqOGMWxaPQ/SPNheD9//tmyfEB
	yUTd1hbSaLDn0qy13E4=
X-Received: by 2002:a05:622a:164f:b0:50f:783f:31a8 with SMTP id
 d75a77b69052e-50f783f37dfmr362604631cf.28.1777216268830; Sun, 26 Apr 2026
 08:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426102725.3204-1-cd345al@gmail.com> <237b00349e3c1ffce21464cdd4301a8c017a2ba6.camel@rong.moe>
In-Reply-To: <237b00349e3c1ffce21464cdd4301a8c017a2ba6.camel@rong.moe>
From: no name <cd345al@gmail.com>
Date: Sun, 26 Apr 2026 23:10:58 +0800
X-Gm-Features: AQROBzDV34AXwnLtFOKL5Uzl7aXON0t6v8mwDIsQxGA7gRiAYjA-WiIKc1X_l74
Message-ID: <CALoEd=HzT5ho65xZN+VDpx8PZcerd6FeEyfEm+mfgw2tnc6pwQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: lenovo-wmi-other: fix uninitialized
 variable in lenovo wmi-other driver
To: Rong Zhang <i@rong.moe>, mpearson-lenovo@squebb.ca, 
	Derek John Clark <derekjohn.clark@gmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rong,

Thanks for your review, and I really appreciate your work.
I've rewritten the title and submitted the new patch.

Thanks,
Yufei


On Sun, Apr 26, 2026 at 8:50=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> Hi Yufei,
>
> The title is too verbose. No need to mention the driver's name twice.
>
> On Sun, 2026-04-26 at 18:27 +0800, Yufei CHENG wrote:
> > When the flag relax_fan_constraint is set, local variable 'raw'
> > is never assigned, and lwmi_om_hwmon_write() will pass uninitialized
> > value to lwmi_om_fan_get_set() resulting in undefined behavior.
> >
> > This flag allows user to bypass minimum fan RPM divisor rounding,
> > but assignment to 'raw' only happens in the non-relaxed path.
> > Fix by defaulting 'raw' to user provided 'val' in the else branch.
> >
> > Fixes: 51ed34282f63fab5b3996477cc56135eb4de5284
>
> Please run scripts/checkpatch.pl before submitting patches.
>
> > Signed-off-by: Yufei CHENG <cd345al@gmail.com>
> > ---
> >  drivers/platform/x86/lenovo/wmi-other.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index 6040f45aa..6c2febe1a 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -349,6 +349,8 @@ static int lwmi_om_hwmon_write(struct device *dev, =
enum hwmon_sensor_types type,
> >                        */
> >                       if (!relax_fan_constraint)
> >                               raw =3D val / LWMI_FAN_DIV * LWMI_FAN_DIV=
;
> > +                     else
> > +                             raw =3D val;
>
> What an embarrassing mistake! I missed that when I was adding the code
> path for rounding down. Thanks for fixing it.
>
> With formatting issues fixed:
>
> Reviewed-by: Rong Zhang <i@rong.moe>
>
> Thanks,
> Rong
>
> >
> >                       err =3D lwmi_om_fan_get_set(priv, channel, &raw, =
true);
> >                       if (err)
