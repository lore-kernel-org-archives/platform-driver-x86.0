Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFF531F9B4
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782233625; cv=none; b=GeD1dKlA3gMdWSh0uGS2DYGkINvRTDNbQ7nRTgG4YjQXJt2xH6LDhrizsdTMQCSxtYWgrF9qKwxU/OOFGhXOyeDqjQgLHgdQ3AcMFrzzwOhESRHbWf3bPqjtAz27kitLZ5DpTyy16p84Xp6DvO8q+1KHmyDDKVCtHakp4UcJr4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782233625; c=relaxed/simple;
	bh=TxIbMd62RiplrQ94biGz9L2YHqAqWJezo2wIsYZ/WzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pni76Ep/Sd+wKN2nMGJBOxPKos620milwgqkl+GGfWE8XdZhV6zXikybIFoIqlQ9O84jsjCN/hPComu4XkE98KgrVdq9GVgd+pyvoaGFv8kG8i5G9m094QtgKzNYoi2We5d5qAp91dKwTrThqKMJWXci6KvfBFMcgvTHbaHievQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYEUb2Bl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYEUb2Bl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED7C1F00A3E
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782233624;
	bh=++aUa1syNMN1VBJTvoIJe2eHMcmeURvrTiSz9H2w2hs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JYEUb2BlyH63yjZjKdhqCHrtamnRyDnVOOqIALhbF3ZHpiV/rt5zWjI4uLPO0C8dV
	 fyEL1VJf26r0Tx8XilF9k2V940QUOhRYxWA9XvY1aGFLl255GguCz+InUSLIbXZ/O+
	 RBauntY81VwA3UoBbh7Gk1JmrwnWcn8bX9MA+Xi7GYcdB3jopqKq9OqISjTOFNwFJm
	 D+thGDLkM5o1rXYWSy/UrB35qgGA6SMp/YilnmrZEgdQwvCazSJ4APZ8loUK1Ux61g
	 JRiQCayRYN8Pa7uByxdWNdKDC9WJReZVJAEIm7Zig2SQO0Nlzs0ByxrOjeqhpj56T1
	 HzaibVUnsIr/g==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ad4f39064bso39415e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 09:53:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9U85TAp3LJUIJBFAEZEWtxdJOZ/y9h6BH/ASsJvUm8jziEH+09ZN5zBeXIq92hvOAc4xb/R7QEuZ2IJz2n1kvAeeK6@vger.kernel.org
X-Gm-Message-State: AOJu0YzUNTN+QrWvtin3CRun9O8uGY6c1dt4RqC9DxfhwlQMSzjR4mnz
	t6M+7gODyxIAxODWFJhkppG21/JcL/oTGvx7/5HJljypRP/BqC1LR9Odu7moo3K9QBgrlKrqFM1
	ch4FuhQQXKaw2AXfRD9dV/iCSUUrZhX8=
X-Received: by 2002:a05:6512:64ad:b0:5ad:67bf:f6e8 with SMTP id
 2adb3069b0e04-5ad67bff8b7mr2438813e87.39.1782233622535; Tue, 23 Jun 2026
 09:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pdx86-pr-20260622211510-2801419545@linux.intel.com> <CAHk-=wi=29jSstqyF8EqRFccWnA=1TfXW_jcURhSd4rJgkSxgQ@mail.gmail.com>
In-Reply-To: <CAHk-=wi=29jSstqyF8EqRFccWnA=1TfXW_jcURhSd4rJgkSxgQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 23 Jun 2026 18:53:29 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g8GUJxy3TPfXa=Hjwk2puYKUpAZzdbo35houPEBLs6cA@mail.gmail.com>
X-Gm-Features: AVVi8CddEEoDNkuuLL5qk4SSBjAfMpIkzmsFUpZJebaM20KjRqstWPa8CavwpjU
Message-ID: <CAJZ5v0g8GUJxy3TPfXa=Hjwk2puYKUpAZzdbo35houPEBLs6cA@mail.gmail.com>
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.2-1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Rafael Wysocki <rafael@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 5:37=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 22 Jun 2026 at 11:42, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > There is going to be a conflict with the commit 3570cb58e317 ("thermal/=
of:
> > Pass cdev_id and introduce devm registration helper") and a few other
> > commits that came from thermal tree effectively resulting in a change i=
n
> > devm_thermal_of_cooling_device_register() signature. It needs to be
> > addressed in the merge commit or the build will fail.
> >
> > Mark's linux-next discovery about the build failure:
> >
> >   https://lore.kernel.org/all/aibZy5rrdX3ltGpr@sirena.org.uk/
>
> That resolution makes absolutely no sense.
>
> Now that qcom_ec_probe() goes through all the work to create a name for t=
he fan:
>
>                 char name[EC_FAN_NAME_SIZE];
>
>                 scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
>
> but then the name is actually never *used* after the change.
>
> The *logical* resolution would be to make it use
>
>    devm_thermal_of_child_cooling_device_register()
>
> instead, which that function was renamed to in commit 8e1529e79385
> ("thermal/of: Rename the devm_thermal_of_cooling_device_register()
> function")
>
> I have done that resolution that at least makes sense.
>
> But honestly, this is all a complete mess.
>
> Why the hell was that function renamed, and then a new function
> created with the old name - when that new function then has exactly
> ZERO users?
>
> Renaming a function, and then re-using the old name immediately for
> something else is a BAD IDEA. It causes exactly this kind of horrible
> confusion. It's an even worse idea when there are exactly zero new
> users that make that confusion worthwhile.
>
> Thermal people - you effed up. Stop doing this kind of crap. This is insa=
nity.

Right, the new function should have been given a different name.

Sorry for letting this slip in.

Rafael
