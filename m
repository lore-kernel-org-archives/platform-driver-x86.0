Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792865169;
	b=RkxHK5oJi7LsensjY1qngf8fdmVg0WTvs0lNEPSJiA3btioZiVGcB4+isdnffYv1hrIc
	 H6zD09Y7bZ2d6dc0cXRdkSvSObPwoPbJDj9Fhk1tL/QB8CJRDpFZEM1XIcn8QRgh4AE3t
	 Lz/hmFEVXX62eZRQzCbZsDuPi7SWJsYUIdJhIAZi2LUNzbFnVwrFEDSNdCFVRbhSze6a3
	 eO43HUp57S0nfoiFsMKSE5T3n3qz2rdv7IgyTPMMcpG28LRuaJ4LFTSw5F3up90tOpekR
	 NZBGhoaaP69smZXHR3Z79RRxJ/D1JRm7Cv7nYGmweiZ/VpgdAWKxPUDvbQ8XWCiwpjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792865169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lPG44ydHfbZv48mg+W6n0PmTi2ySUzCmeSRTbHzbT3k=;
	b=nwuE87zg/Wg9X32pyJyrqVFGyyaN+3NSqCCsXxzjkRhlQuWPBAWm2hoF7sizBScu0iJF
	 Fk0r/zqIuOc5lIt9fE5XNdlP7kh77R3kzTgPReF8BLWeu0UUXFTOSUAazTgxnPbAyfZfL
	 0GdgX8zr7tzOLe2BgAflJUXsm/c15p6AEuhZBrJFAEEd230ePHaxio6bHJFc2kIbUhtU3
	 LO9lagtsn/kfcQKuep67Dy1ARhdbtBQEUdRdB9HQV7joO/qB81cvV9gPUSRils/K3z3AF
	 zESIQpEdVod8X6UuUX56EWJHNcTiwM8dHrkacucn3vG1Vgp/uAbn6oiKGSZEo099Tyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hJyH0Pvu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69A2606A31B
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 18:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C69A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hJyH0Pvu
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso2700231a12.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 11:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792865167; cv=none;
        d=google.com; s=arc-20260327;
        b=Tya9vlCp3TJp1dlaW9QFlzNeXNq2+8yVNoBJv36ZMCXAofuZVOTswAXkgxFFY6+nuM
         Py6eTkSdxE9U1JuXPfw2niokKM+fObe4QTkkhh27+epDa48vjb5T7TpWGe634qAmKRSd
         AASCNyLaQ+hz3guXVWjCrD/unwR8OnNJqkoPRB7ez9ppJnOYuiDOjFdSBdL2hPrfUBLI
         xGotsFq7In8kOxjSSuax6tR46V8TQ6revC7/pmNuh40kO4EbpplWx/yd6qTkDAXz8Zbp
         6AskHvGLe22ymi+1pnN3uuAH/Fu1l8AdV3jrDFHVXTerogBjLfa+OD98JgD0Q3NhWuxJ
         ipOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lPG44ydHfbZv48mg+W6n0PmTi2ySUzCmeSRTbHzbT3k=;
        fh=u4RrklZeBcYdlSSqVm/NfG12r/dGU5ykX1qWewq/x+4=;
        b=Qt5MMtVuqJ+9HSmYdWriKDFtmlKnpIIyEuGLLvVWeJeqgiQccqyPkbAViXarFQP/Gd
         s8lvmflcEVe8yijJ6FhQPAFTDGRH2JKDi9o7f23/PzZ4z60pFlEmADx9xzqUXqNXZwn6
         S4W1GhzRlgO4nIx09Pvd+fm2oFQu4dwFn4x9mdqY8iomnFZaOZ0DqeWda353hHTvxgkd
         xXlSTNFRBOzlOopeNkBWfUPNmJ1erNWR4UzLHey5mI1L7srNOOuOk44u5ISc8gFAqhMu
         bKtmBhsudhb1Evv/WUjbxA8I+oHb0+RmdE6ZXceVIXEbV/wAv9NSRb4du3fVD5P7nGLC
         UJQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792865167; x=1793469967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lPG44ydHfbZv48mg+W6n0PmTi2ySUzCmeSRTbHzbT3k=;
        b=hJyH0PvugVb7vJNbOSoFSxa6zVPMprVBIUroubynC1lIsGBcHVYPmYXpKw9GJoaTJb
         g847IYIRZ/pK0cA7eYB69sD5X45yHth7cFTNFYMF2JM2zOQ019bLsbhwuL4gl5TJcPMY
         x4FSpwugGRe6ubcc+x6Toe45ev5Lc7N4n7QdbJWt1RrKyC5Fvf2EP3MDDoyDI57xCFwA
         UV5joMBqyHXnnlBrUyBoAMF97kQv+iYCK94YJnm+4LlAofRAUesdapcWJ7NAX5qB7L3E
         0n9o22HF72igY+teSD7fAxBSGcL1UM0XwTEFbev0a7xV2QAcPIbzL2Uo50V4FicGysab
         6qDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792865167; x=1793469967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPG44ydHfbZv48mg+W6n0PmTi2ySUzCmeSRTbHzbT3k=;
        b=cIO2XVagM5hv5A10jVwd8qKBoy/zM/KOmeAkld5MXL1cjvBoseLbFoMeuZ7vfXHT5x
         VEbwCRxGtn9K0rrYsCZKoLQzl3qkdFPwahasj3ibqTfLUbkQQ3leYgTGcw+JtDn7Zrt+
         +lbmrJihm/rUjhh1Vrd/D1OQhxQ71tNJBF1M22/jGJWJCqcpodqCwW/sKr02YpUo74Y+
         c9L3VzLZDgHJWyUo6Pr6zvuwphtwPLn36RE9zi9/ydUQXgbyoZViRAeuBQtyt/uYGGf0
         2WKb2FS++gTmcjSH1ucvNZiRDKZXl6/mxr4/EHHK69lebWGh6unuNZMjMFriSN3ofnnb
         dkKg==
X-Forwarded-Encrypted: i=1; AKwUvByKMNPV8H5Tx05rCNc741nFlftm6M406G38JSp0vPTj/RtNsXN95iArN4jToJXrs7vAhQg7z14JeZfB1mGy9AeqAcIB@vger.kernel.org
X-Gm-Message-State: AFq9FYI0j/768/3uAcX0gXFfBsS7v6Rq8jGIbuiESg+v1hp/+Fzwmqcb
	Lkx6ENxeLBGPF50USoNRGPDQ2pU3/EqdYirDNGiR8M71m03bQzSsU2ie7kFygifngUY26ZyqK4/
	jFIXLxMSdXvh174tDBY57KAh95hw/oys=
X-Gm-Gg: AYBFou1AcGmyfMMM/umQLbtRAjVxMv3qSkov0cIZXfjgzsBb/T9hDpI2kka0TXyUX1w
	brh8IOP99stA+XIy/lET/8BcrIa6WqtBBI/UINC4pSf7nTUU/CIgIhhcOEJjhd6mS30pBwJ0VKh
	PXg5VPum1PAnOqJCyOTHFFnbXb3KOJz83tb/Tow++FTtJ5PNxOm20cn7OuWMps9rxCQFyXkjIfA
	7sdRswMCKJf2Wp/tza7zeONtZolh+0ut1BA7KTXi4d2/ieeb8THSEyhDWD7uZDRmsrGtDiSKAOz
	RfE1nO9WPuKnmDkwQJt/gdEA2UlLQp5xLBvGDCQd/aqsv83DqdCkxwxL+XOFzW1AhHHvs2za8wS
	3hZSwsY6qRHazlEswfcivGpiBY5Hauj2arPNccDZKfP/5FVuK70TThI3lD4plNLv/RuusoCA0jZ
	pXE9RcVe2aXy5miP5oeWOo
X-Received: by 2002:a17:907:3da0:b0:c3f:98d4:dfe2 with SMTP id
 a640c23a62f3a-c46bde25765mr313652666b.18.1792865166843; Sat, 24 Oct 2026
 11:06:06 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016025352.230535-1-meatuni001@gmail.com> <29c3e4a2-9d6a-60cf-d06d-85152a40a703@linux.intel.com>
 <CADqcGBkV4iE_0j6usv6TvV3K9XGUa0L9J-ebUkTLsB0NBYzTHA@mail.gmail.com>
 <a905f45d-aec8-569f-d5bc-718896f7c9c9@linux.intel.com> <273be4cc-ad7d-cdcd-de25-8d1439bed3e3@linux.intel.com>
In-Reply-To: <273be4cc-ad7d-cdcd-de25-8d1439bed3e3@linux.intel.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Sat, 24 Oct 2026 23:05:54 +0500
X-Gm-Features: AclHuK8PFwnTEGocukzPDuOlDq-fzoGEr02g0x88KN8IXdmfzdiI_JHU5c7rfq4
Message-ID: <CADqcGB=z3_mQ77Wk3E9tWMYyCaQ2hCno99kgPKH8ZrP9EFKY5Q@mail.gmail.com>
Subject: Re: [PATCH v6] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy, Ilpo,

Thanks for the review. I switched to strnchrnul() as Andy suggested and
posted v7:
https://lore.kernel.org/all/20261024172641.19424-1-meatuni001@gmail.com/

Thanks
Muhammad

On Wed, Oct 21, 2026 at 2:41=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 21 Oct 2026, Ilpo J=C3=A4rvinen wrote:
>
> > On Wed, 21 Oct 2026, Muhammad Bilal wrote:
> >
> > > Hi Ilpo,
> > >
> > > > Why use n variant?
> > > strnlen() keeps the read within count, which is the size of buf as fa=
r
> > > as this helper knows, so it does not depend on the caller NUL
> > > terminating the buffer. Both current callers pass a kstrdup() copy, s=
o
> > > strlen() works too. I can switch to it in v7 if you prefer.
> >
> > As the contract here is the input must be a string, I don't see any nee=
d
> > to limit the length with n variant so I do prefer strlen(). Also, we kn=
ow
> > that it should not be longer than count anyway.
>
> I only now notice Andy's comments which seem better suggestion in general=
.
>
> --
>  i.
