Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB723F9F4D
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 11:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150529; cv=pass; b=jT8xhejBu6SRq+94mJvjuykUtpPiJe+BPCHaM8NjAxeA2x+/tGR7F00ZlXtaz8iXXTlWuWJAkJpzOYDO0KaMd2OcKTQxX9YwbNUTM+HwdXXLyC5Aw+U24e8LZQ38Vyag3IZc7WUkLE4v6p7oAuBPvFnR0xrzUU4IZc5Nj8zQSGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150529; c=relaxed/simple;
	bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxMrZVy/L/bTkUDhG+eWxVPgHEXjp23ojZ7suFc3W0lXdI0Wx5G8CzmLeogLbOm8LPKAe1fMICf4fqA+iSkG2uJwIJUr3QvBvJkLCntVmuDHWrp8zT1Ns3bMoqET48KA6QQ169lfbzglNaL0uzp3zYJUVBsHYSNoYM/M1TrsVAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3mRoCn4; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3mRoCn4"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ea0b7d137so11680297b3.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 04:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785150525; cv=none;
        d=google.com; s=arc-20260327;
        b=KnDy1ubA1a7uBGx1uQ1tw52XJ2+ADvi6CJgY7XdLMBiggYUYJCDxFYvXW7jXgo7Yf/
         NYAwX33rFW1S3iiHVfUYxCJHStcmpgieb8ulHZ3fh9X6nu3vIXx4LW75loJxw1go+9/N
         MctOS/NpgMYluYsuXawOakywYYwERCScB0JFkwDs/iWg+ZCrm/LM6jDsRwMoZPNNb+gu
         OjM/8R0pK62BKwjcfearWVnxheT0hBUs1sXiRBVwHaXH+OQc/nQ34oNFf7hBp+XK8gzf
         LemhyIamLaJsJoT1/sDQrxaMgZCy3LCULzoCPLS+DlPrThV47yh6DFyl7fiNnzOMOGHm
         bpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
        fh=N5Yhj4AAoBxr5AzyLWx9rS7A+f8bz7baclansZXXeIg=;
        b=QjOQkwU/VEYJ0rEngAHs4ZeecGCUSRgZ/8yDMZN6w3oDdIC742bgP8nwA+4j5NtU+m
         VVVhmnMyq88RVDV00XfYYaxonn95sr9lzSgbB5AobUDO1nZmTNJrpGVH+s9698g/J4vH
         IFft3w+IssSPBcd5xF5UFHbDNbNuS5KXIYpTIP9wq+5jmmvLmY0wp0ZyM+GFZFhzhc0S
         L9JbcASJIWH3VIrvnzHkCM0HaxGJWeXMa07AVS6ECGNAtvtTYQLEEJmvoS4oBVm2wyfE
         LH8wQIfvwn/II8lyWvfxpIvh0V5VSmu/S8si9SPfPEKZ2kzTybiRrwQN9I9A3M/x1oa2
         oT6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785150525; x=1785755325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
        b=M3mRoCn4tl8RPjfQixKwIWWGSOwAsLGhmh+pOW5tV4opu6k/FIUqHgtBSUi/lYWXNo
         K98eF+P/A41j+K8iwFXw6liU49SqTYrvvms0nmGWFjNMcapwdxy/m16HBI26xKOSiPvw
         bHpYUNToOx9zQJmLUksPduoTCqqE2dSxgHeSldgGIbLqv2CWqoDhAou0N3efVhSwmwfM
         VQbpCmhybFLItirVtnzw4TnneJchaVYJVzYdQrFlaDO4vxp9qnK66elczaAbAPUjs+C1
         1bvSmITqLw2KhR3gNZaWHhZGr+7ZSQD962od3gweFtTkzKTtbvFjOOIGdEoRbtgOHS17
         oVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150525; x=1785755325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
        b=ZdKQ+R1o3rviQf5iWCJMTwged9jq9dHo6dM56aHsK/6aH/ruj62sKQkxH2gufkkx1q
         6mMpbVmiEGnTAoDMXtFxtk3yyqxMHWjXktEZKfqkg+xJcp1puNVd6LRGWX8ZLFA5mu0G
         SB8f568O3i4e8aP0U1+0mDmBvdO/Har18QhGi6mYqc36phxOc9bCCgDe7WYepq/4skeo
         RkJq8MT2vxdd0HTcg9WsShYNziLvmOKr+TPqbc3Y4tYdzasaGAujV2rxIOh9jBdRk08e
         wQk0jrrztrxDcduaQQ+aYrkmcPGVPCO+Iv9LNvWQrutWjFNdYXL3dIHpl0UhVlsQmp4L
         ROiA==
X-Forwarded-Encrypted: i=1; AHgh+Rqqv7u5X6ff9abhtHvR1hP1T4rPhV5Zu14DF3CEsFxmYTMb1I8K2vGm6b3CvmuU/v0MNHUAmOYaAfX7TtEl9PPWCJ6X@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6CMn89JM9/udjtGlGgRPJgPg/UXpNHxCX8y5B4Z3fUbU04oXp
	1TTMr9KA4NtTG7dIBKxJ3jSxP3xAmrhwQJGL11B5iLp02TA9nRFUsbor/32v4Sy9BXM5/Iht0Wb
	TTrOKxsbljsRrbgfFUfTHI8yC7vCCSuM=
X-Gm-Gg: AR+sD13ZC01XSzY5i8mWMa9ZVkqiHydC/HrvBwBx98AceM6louABJJb9+1lamHQqiVU
	DjjDhxf5NVETBNoDWrghmzl4+WHWwvj1emSHmKCfTbSKGGlE4eG4wacL1XgVa5CGmUrWwsEXcfA
	LMZL3Vx3W6ElGV8WlXBlGtDWUHyfT41bfhjTMnYEimQHiaeY8bpmcsdPNNoqTXTki2Xkbv0e/uf
	uTYfBbe9zQ24oHct87Ozx+q4ybKuQ1SIbw1CxJ+FLB3bzpSZZp2z98whv4=
X-Received: by 2002:a05:690c:3747:b0:809:86c6:ee18 with SMTP id
 00721157ae682-81f69e3978bmr27868337b3.37.1785150525277; Mon, 27 Jul 2026
 04:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260724144822.6af8213f@kernel.org> <0ee1ef4aa7daa908bf28397ccc639c89b6aabd9c@intel.com>
In-Reply-To: <0ee1ef4aa7daa908bf28397ccc639c89b6aabd9c@intel.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Mon, 27 Jul 2026 20:08:33 +0900
X-Gm-Features: AUfX_mzhfgKW48GB4CRuyNKliFu1x1EH8aDGDqYePXeE0rGOBX3Wid5IOU1hKpc
Message-ID: <CABFDxMFMOAZ_3kYxEGCutnGt1OSSmgvmwx-=M1RxGc3VGKORYQ@mail.gmail.com>
Subject: Re: [PATCH 00/36] treewide: remove conditional returns with no effect
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Julia.Lawall@inria.fr, 
	Alex Deucher <alexander.deucher@amd.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Borislav Petkov <bp@alien8.de>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, David Airlie <airlied@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jiri Pirko <jiri@resnulli.us>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Johan Hovold <johan@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Julian Anastasov <ja@ssi.bg>, 
	Leon Romanovsky <leon@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthew Sakai <msakai@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Mike Rapoport <rppt@kernel.org>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ping-Ke Shih <pkshih@realtek.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sebastian Reichel <sre@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Simon Horman <horms@verge.net.au>, Stephen Boyd <sboyd@kernel.org>, 
	Steve French <sfrench@samba.org>, Takashi Iwai <tiwai@suse.com>, Thomas Renninger <trenn@suse.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tony Luck <tony.luck@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, 
	Yazen Ghannam <Yazen.Ghannam@amd.com>, cocci@inria.fr, amd-gfx@lists.freedesktop.org, 
	dmaengine@vger.kernel.org, dm-devel@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, lvs-devel@vger.kernel.org, 
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jul 27, 2026 at 5:30=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 24 Jul 2026, Jakub Kicinski <kuba@kernel.org> wrote:
> > On Fri, 24 Jul 2026 03:45:02 +0900 Sang-Heon Jeon wrote:
> >> Patch 1 adds a Coccinelle script that matches the pattern, including
> >> negation and constant-comparison variants. Where a local variable is
> >> assigned right before the check, the assignment and the two returns
> >> turn into a single return of the assigned expression.
> >
> > Huh, I thought we already had such script. Various script children have
> > been sending such "cleanups" in the past.
>
> We did, and it was removed, I believe in 1a617a8475e8 ("coccinelle:
> misc: remove "complex return code" warnings"), because people just don't
> want this constant churn.
>
> It's perfectly fine to have the error case and happy day scenario
> separated.

Thanks for sharing the history.

I checked the mailing list. The removed script looks similar to the
new one, but it is different. The removed script reported a
conditional return followed by an explicit return 0, where the error
case and happy day scenario are separated as you mentioned, and Johan
also complained about this 10 years ago.

But the new script only reports when both branches return the same
variable, not the explicit 0. So, I think the new script is close to
the restricted version that Julia mentioned 10 years ago, and it
should be acceptable.

>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel

Best Regards,
Sang-Heon Jeon
