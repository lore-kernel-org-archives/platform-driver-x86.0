Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676502DF6F6
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 20:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771446089; cv=none; b=rsQrpigZ/St6XlbdVJvt5+79kvaBGdNZ6tJP6/3KPGiIToxN6i1HGVtDREHtDJpvPKRrI4AYE3mKEH/amTBtyvRwuRq1tOozv80t/W+u41alqUBA00NLMOPEMj2JTWys+V3snmscWC1/xN99HZJ/uRpCSrcP0B2c0C0mppRFYtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771446089; c=relaxed/simple;
	bh=c54sKX0Ba/Rbm5H0lVYNc8FfjUZyZetYxz9fBemIu3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxDgsxXd2bV9raPmIiMn+gVegpE1+Ee82jhYI79/DOJ4+yyROtqbOB7VY+nqQjJDGJvpLhQKgAHz/Ey61SPrtrNrHow6DSjNbd6iBMoY9lFhGtRKpvcXp+YNo6Jw5Rcmqca1C+HxJ2/9Hx1VBI1rLeShz7w9w5fdpo6zByFeX4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpGlx1m+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpGlx1m+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012F2C19423
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 20:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771446089;
	bh=c54sKX0Ba/Rbm5H0lVYNc8FfjUZyZetYxz9fBemIu3c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OpGlx1m+LTrCn3IXYG63TipSMs/ks1VG3ZzRZaC7ixXr8oZji1An7yJvlbEeQ+cpf
	 OsMRAjjtyf64TZj1FVR/LBI6XdQcARwi7PFOyNCMKCAPd/3z8ZBkV9X9lqMjsElme0
	 2DKmEqAHTsbeibeev1WsyaFJCI12uo9YDQlD3v9Vphkq21sGDn527wULBs4ECrQq0l
	 3KZzHk3CMp13X+XbOfPzfDoZ+OLmA/mBeZE03kbUI0REAOdnnvHHvC7DwynkUo5MNv
	 ugW1W+s4tV4s6rgAKtk8TemyV4AyIg3CSPba78ffdJZTLSZZKeSubLGm6IoUVzxG9C
	 R9WXjksfZqH0w==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-387097ae2e3so2550001fa.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 12:21:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjiEY8qZNLn37ZU1O5L0SgXXsU8R1wq7PATPqiwX98/uz59jNCBAXnMiegP+UG7hysLall9TqDQTCf+ioyZhv1YNd9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Tq6B+qvMM2l9Y4FzU8itTzndtXe5xqj5/2O694OdeFYvM7Pb
	XuvWVOKy2RMU6qedozsGov8TViYaeyStXMZP//Kq+rx9gVYFdS/R9gKiCcCCFbyxr4t4qUjSPLM
	JfVSn6fU1bXeiHGuKPHq0EOQsw0N9DKLHaIgfZ0/BhQ==
X-Received: by 2002:a05:651c:1988:b0:387:176e:68f4 with SMTP id
 38308e7fff4ca-3881b9a2558mr43425761fa.44.1771446087615; Wed, 18 Feb 2026
 12:21:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me>
 <ef96006e-ca94-4525-9727-4a6011fde7e1@kernel.org> <54082217-0eff-49f6-b4f1-0daed58c2568@proton.me>
 <aZSkqGTqMp_57qC7@google.com> <CAMRc=Mfd1dD7XL4smPtRTVD8vhGR=PmLLcNz2t1Q8+jwKbm5Mg@mail.gmail.com>
 <aZX0EynAKvqXWzq2@google.com>
In-Reply-To: <aZX0EynAKvqXWzq2@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Feb 2026 21:21:14 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md3kUVOEshvPiwv=xvRRNwQndcP=hsbyMOJn4c2=+CaiA@mail.gmail.com>
X-Gm-Features: AaiRm53FFX7xhATLtBiNhJUuaem1VvZB6egqhtvvKfYRgp4q-QicxWWcSil6WQQ
Message-ID: <CAMRc=Md3kUVOEshvPiwv=xvRRNwQndcP=hsbyMOJn4c2=+CaiA@mail.gmail.com>
Subject: Re: pcengines_apuv2: LEDs/Input fails since v6.18
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Tj <tj.iam.tj@proton.me>, 
	Hans de Goede <hansg@kernel.org>, metux IT consult <info@metux.net>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 6:25=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> > >
> > > I think the patch below should fix it.
> > >
> > > Bartosz, I think you should revert
> > > 86ef402d805d606a10e6da8e5a64a51f6f5fb7e2 until after you audit all
> > > existing gpio drivers. Breakign the kernel like that is not great.
> > >
> >
> > Hi Dmitry!
> >
> > This change has been upstream for close to a year - it first appeared
> > in v6.15-rc1. There have been very few reports (I think a couple
> > initially and then none for months) and fixing this is typically
> > trivial. It addressed an actual problem where these retvals would be
> > propagated to user-space and misinterpreted. I think we should fix
> > this driver and keep this change. "Auditing" typically means never
> > fixing things entirely.
>
> [+LinusW as co-maintainer]
>
> That's ... an interesting stance. You couldn't even bother going
> through your own subsystem before applying a change that could break
> user's systems.
>

My stance is that I don't want a knee-jerk reaction of reverting a
valid change after one report (with a fix queued) several months after
the change was made. If more people start complaining then I won't
oppose a revert.

> Here is your first approximation from gemini:
>
> Based on my analysis of the drivers in kernel/linux-next/drivers/gpio/, t=
he following drivers have GPIO line getters that return values outside
>   the expected [0, 1] range (when they should return normalized boolean v=
alues) or a negative error code:
>
>
>    1. `gpio-bd9571mwv.c`: bd9571mwv_gpio_get() returns val & BIT(offset),=
 which can be any power of 2 depending on the offset.
>    2. `gpio-cgbc.c`: cgbc_gpio_get() returns (int)(val & (u8)BIT(offset))=
, which is not normalized to 0 or 1.
>    3. `gpio-da9055.c`: da9055_gpio_get() returns ret & (1 << offset), whi=
ch is not normalized.
>    4. `gpio-lp873x.c`: lp873x_gpio_get() returns val & BIT(offset * BITS_=
PER_GPO), which is not normalized.
>    5. `gpio-stp-xway.c`: xway_stp_get() returns (xway_stp_r32(chip->virt,=
 XWAY_STP_CPU0) & BIT(gpio)), which is not normalized.
>    6. `gpio-tps65086.c`: tps65086_gpio_get() returns val & BIT(4 + offset=
), which is not normalized.
>    7. `gpio-viperboard.c`: vprbrd_gpiob_get() returns gpio->gpiob_val & (=
1 << offset) in the branch where the GPIO is configured as an output.
>

Touch=C3=A9. I will go through these and fix them instead of reverting the
patch, does it sound good?

Bartosz
