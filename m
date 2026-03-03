Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BA5381AE1
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 22:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772575721; cv=none; b=EQBv+QuiMKg+hR9WBUcDpqwq34+RpUSF7znIBM9C4rb+Msf3m3UuUkyHd7StKa+q4gpbF6gv47N++2bhoLF1QeC02CSdApP3pdzJstP9l6EahtNyNSG9iWJ3oUxXdyHjGiKmThcgguob+hFbopf3zh37KCLgIa9cDyTYBTW8KEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772575721; c=relaxed/simple;
	bh=7Gf4v8nppEOFWW3wsUie/eMUWORIkupC6eOGulIukCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFx5+15JoMyaj2X4ZG6wivi154cWKfclJs0NMwUs6+eNdyHZ+GxShB4uQIMz5gBiAf8IRtGswGDSE9JS6TInOGgaeNsQReisPcRaqsqwAWylyfCgbS8PDl3c+UfSYLcuWli5dJW4iQG9W9DOshNgp5VbyCBKW4NyDebTDlhLWys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=jmz4/ZA/; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="jmz4/ZA/"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 1AABF5E70B
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 00:08:39 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 40FD65E478
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 00:08:38 +0200 (EET)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 483251FD621
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 00:08:37 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772575717;
	bh=r5CAiufsoyiaeqSCdvJtblPRJfwNr8p2yv7RFZaZlB0=;
	h=Received:From:Subject:To;
	b=jmz4/ZA/+N+R3A91FLKZVell1/2Dj2CxavUoSG1wPjYMe+Sw1/HcG6RloIPbx+8jg
	 Tqc8RE+6O5t2a1RN/7fr7ukgqfVsX9+/iGzsFb2uigJm+lSmOb7SXMNU4vpETtU5aq
	 H4lzsPUu2IjvsEtFdPogcnSsh2zbMLrwUZ3oe3CzaQ1MHyXjQHEP+N2zf4sjAr6YR7
	 BoE/9OKOqBDTkIQk7+fcsPIsvSuC2PhYt27MnAyCldyULl64s2BHv5IJyEmp/88CbI
	 96JY5edKHYuE1rIICT/nC2KmwZcv9Qc7KaoLBldMFiyS8zbEjpUbx4b5kIIxTkLhco
	 lMS74Kg1lI6Ww==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f170.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-c6e734ba92bso2924380a12.3
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 03 Mar 2026 14:08:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWv8vT89cJWpXLE84HkjncXiqVIR53XCOMqIz9aEDXOAX21uzVuk27e9vrbBcBggUv8sPhmoUZt9NNH/O/hOsN55/rn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/70SC/YyoqoG+5mUmnq8lhVAsMiB0gARH4B0P0anl+IILp7FQ
	uLEaFmBfUPSFlnSig70Dz5VXAAUm8Cb15hVm2cYwVA8DvsZETYxcc5+ZCC1wWeIlzMMf6PQA7/p
	Fttcg9zuCuLOWNeowxnuiIT5IXBht+ho=
X-Received: by 2002:a17:903:1a07:b0:2ae:63bf:29a6 with SMTP id
 d9443c01a7336-2ae63bf2c33mr25273005ad.51.1772575716000; Tue, 03 Mar 2026
 14:08:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303181707.2920261-1-lkml@antheas.dev>
 <20260303181707.2920261-3-lkml@antheas.dev>
 <3057e55a-00f9-4da2-bc10-a6bc19716fdd@kernel.org>
 <CAGwozwFgaRh3m7qAEsvqhLLsbT3ky+4tneLmnz=dE8_UDqOFZA@mail.gmail.com>
 <ab11076f-daf0-4e10-8ae6-e91dfc612a96@kernel.org> <aadWVjqVHjyEx7TX@laps>
In-Reply-To: <aadWVjqVHjyEx7TX@laps>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 3 Mar 2026 23:08:24 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwETdXFJy37ogLPCs-kPWu7857SS8QzmDP2-Xhvk5XjJZg@mail.gmail.com>
X-Gm-Features: AaiRm52UkuJs3S_5Nc0AN_IJnF2FdtrqVf_RTMVWJz31-oU2TFG2lZGduStGzAw
Message-ID: 
 <CAGwozwETdXFJy37ogLPCs-kPWu7857SS8QzmDP2-Xhvk5XjJZg@mail.gmail.com>
Subject: Re: [RFC v1 2/2] platform/x86/amd: Add AMD DPTCi driver
To: Sasha Levin <sashal@kernel.org>
Cc: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177257571745.2341269.17438809028481684719@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 3 Mar 2026 at 22:45, Sasha Levin <sashal@kernel.org> wrote:
>
> On Tue, Mar 03, 2026 at 02:54:59PM -0600, Mario Limonciello (AMD) (kernel.org) wrote:
> >+ Sasha
> >
> >On 3/3/2026 2:40 PM, Antheas Kapenekakis wrote:
> >>On Tue, 3 Mar 2026 at 21:10, Mario Limonciello (AMD) (kernel.org)
> >><superm1@kernel.org> wrote:
> >>>
> >>>I'll preface this by saying - I don't have a problem with using an AI to
> >>>help write a driver, but please disclose that it was done and that in
> >>>this case even you haven't closely audited the results.
> >>>
> >>>I personally would never submit something generated by an LLM that I
> >>>didn't audit and add a S-o-b tag to it (asserting I am willing to stand
> >>>by the code).
> >>>
> >>>I'm glad that I found out it was AI written before I started to review
> >>>the code, I would have had a lot more candid comments for you.
> >>>
> >>>There is a lot of weird stuff in this driver that I'm not going to
> >>>comment on and nitpick, but I'll leave a few broad strokes things.
> >>
> >>Of course, to that end, feel free to skip a full review until I get to
> >>properly rewriting it.
> >>
> >>What is the current stance on Co-bys for that? I'm trying to follow
> >>the discussion but I missed the news. I can lint it properly next
> >>time.
> >>
> >> From my perspective, pouring a month into a driver like this without
> >>having a firm commitment that it will go somewhere is a bit hard to
> >>stomach.
> >
> >Sure.
> >
> >I don't need a dedicated tag telling me what tool you wrote it with.
> >I don't care if it was Opus, Gemini or Qwen3.5.  They all can make
> >mistakes that need to be audited.
> >
> >The most important part to me (or any reviewer) is a signal that I
> >shouldn't invest more effort reviewing this than you did writing it
> >and reviewing it.
> >
> >My feeling on this kind of RFC this is the most appropriate tag:
> >
> >Not-signed-off-by: Foo Bar <foo@bar.com>
>
> We have docs for this now :) Both in the README file as well as
> Documentation/process/coding-assistants.rst .
>
> In particular, you should be upfront about using AI to generate code, using the
> Assisted-by: tag, and definitely giving it a very careful review making sure
> you completely understand what the code does.
>
> As the README says:
>
>    The human submitter is responsible for:
>
>    * Reviewing all AI-generated code
>    * Ensuring compliance with licensing requirements
>    * Adding their own Signed-off-by tag to certify the DCO
>    * Taking full responsibility for the contribution

Ok, I will add the missing tag then :)

Assisted-by: Claude:claude-4.6-opus

I do stand by the code, as far as a V1 RFC is concerned at least. The
driver uses basic primitives, has correct functionality, and I
reviewed the code. Licensing is clean too. Comments need tweaking, but
that's always the case for a V1. I would spend some TLC before I
deploy it making sure it loads and unloads correctly and there are no
edge cases, but for that to happen, I need a stable ABI otherwise my
userspace will drift, and that's no different than not using AI
assistance.

Speaking of Nvidia and vibing, here is a complete OOT kernel driver
written by an LLM [1] that enables full TDP controls and hwmon
monitoring on a DGX spark using the Steam Deck ABI and its Mediatek
chipset. Sasha, you might be interested in it. Claude decoded the DSDT
tables, wrote the driver, and tested it. It wrote the readme too.
Yeah, sure its ABI choices were not the best, but that's nothing some
prompting can't fix. To be fair, it did not do everything, I tab
aligned the constants and tweaked the readme and some of the comments
:) Things are evolving rapidly to say the least.

Antheas

[1] https://github.com/antheas/spark_hwmon

> --
> Thanks,
> Sasha
>

