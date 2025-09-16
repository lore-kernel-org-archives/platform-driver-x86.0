Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B532E11B0
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758006362; cv=none; b=jmypBiXlC1qTRQ96x7B/jTJuBHgazhmJLQxefD/VA4Hyaf9Hi4lLmP95tFftZOS1c6lvaZE0s+1BLoxTHIi+JW2Gwvx/lTQpy7GUGZ6zNaTM+AERz2v43MTg1UjXtYZKq/mYOwGL6HDqJ7g9nZed6Hv2Yke4yw+1+tcXX+/muu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758006362; c=relaxed/simple;
	bh=zC+Cy1loZAofqlszKiSur3aH0PQsOt14L0JUv/v9u7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhNDfp07UiSNVvquXvhXYzv1tXboZkcDMyRASqq4SXhu+n5gc032YMDko528r6cDrW6QHtZsiAEQ5qeHryVf/0V0twinjW3qSGtGKEhQYQnN/LhE7UxXvHs4g9B8ayXC+dT+ZhcOaSs1blwhS/gv3szghkYae/tX1kCLoEV4Fkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=iIwAOKKh; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="iIwAOKKh"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id D24985E82A
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:58:09 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 1EC335E7FC
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:58:08 +0300 (EEST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 007EF1FF5F2
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:58:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1758005887;
	bh=BdAi/0dEt+rzuYowXxHic/GkYE7eBzO4IzyGrSziSRU=;
	h=Received:From:Subject:To;
	b=iIwAOKKhfFdC81+xxuMVjKr0ZfzbsMF6+0DhegdESjHnqKDllkNY2Z1Wp2pM85XEd
	 pzJx+T6H/qSh7hp8yCOaREoABGCfQHUB23XAWbYYh5HGPJrN+RUJGBLtLmBml9b4fN
	 uxOV8SNw+aqCkQDIetvzp3qJIO0SSh3TNx2ZlOknut024Wu4nR3si9TAboDH7YeJRg
	 Ucp6tXjA9hzPKjAIyU9K+ftlqLVmoyAsejONc2jccsTRcFgCmGP6PkrT8Jm+EHaI5u
	 VgX9Q1uMYcUR0X909E+6pEpLtyO3ldjbWP0clHK2A4tK4hBfHszlY0yFQ/hyk9H/BP
	 nel9AwEsEgDxw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-355739c7fc8so16981691fa.1
        for <platform-driver-x86@vger.kernel.org>;
 Mon, 15 Sep 2025 23:58:06 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz0J080fSE/6h1QhKtv74dW0D6N8JdFQOm4SuNqC5tU4TozJ5ds
	+4sf5emjfrVP/FxJhUQDELCODyIV1P2CVxCLKWGNUVFMmujbC+lObN70ITdNKFOsAvpM7drxew2
	Wa6ZQSLA27nlK9ooBPwhG/Cp8m09/kBw=
X-Google-Smtp-Source: 
 AGHT+IEOMVMvW91FEF/JLUM2cSJyAZY4wlzlxEHgzXCCrW78LkN1m6bMTr+lgGKKK/ChefPyqVMMtEuLiqZUe1yiJWw=
X-Received: by 2002:a05:651c:20cf:20b0:332:5fc0:24ae with SMTP id
 38308e7fff4ca-3513b19c4admr32479471fa.15.1758005886371; Mon, 15 Sep 2025
 23:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1e1-68c90780-93-13ea166@216760021>
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
 <1e1-68c90980-99-13ea166@216761407> <10020-68c90a00-7-4ac6c580@106289939>
In-Reply-To: <10020-68c90a00-7-4ac6c580@106289939>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 16 Sep 2025 08:57:55 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwF5zawoubpsa0qnSFUhmeUmqdKE+Qzv5dJ1Jzp8rNk0rA@mail.gmail.com>
X-Gm-Features: AS18NWCrCCaPMzxXgP2qVXb0-KKt90402DIRqJHUa6o4_y2DU73lITdfP04ZuZs
Message-ID: 
 <CAGwozwF5zawoubpsa0qnSFUhmeUmqdKE+Qzv5dJ1Jzp8rNk0rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: asus-wmi: Remove extra keys from
 ignore_key_wlan quirk
To: Rahul Chandra <rahul@chandra.net>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <175800588728.2717352.10231662886469395505@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 16 Sept 2025 at 08:56, Rahul Chandra <rahul@chandra.net> wrote:
>
> On Tuesday, September 16, 2025 02:54 EDT, "Rahul Chandra" <rahul@chandra.net> wrote:
>
> > On Tuesday, September 16, 2025 02:50 EDT, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >
> > > On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@chandra.net> wrote:
> > > >
> > > > Added some cc's
> > > >
> > > > *Note I have a UX8406CA (the 2025 Arrowlake model, I assume it is the same on the MA)
> > >
> > > I must have mistakenly thought that the important code on both devices
> > > is 0x5F. Perhaps on the duo is 0x5D instead or it emits events on
> > > both. Can you verify which codes are used on the Duo?
> > >
> > weird,
> > scankey -s reports
> > 0xe0 0x73  0xe0 0xf3, the 0xe0 is for the extended scancode set but I'm confused on the other 2 codes. the WLAN quirk definitely worked before (I submitted the patch for it for the CA)
>
> It's for keyboard detach/retach, both attaching and re-attaching report the same code.

Use evtest to find the MSC code that is used.

Antheas

>
> --
> Rahul
>
>

