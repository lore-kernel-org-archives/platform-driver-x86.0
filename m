Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C0745D5C5
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Aug 2026 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842692; cv=pass; b=iF/873Ff+E5LTsAc4JqfBJWyRznAYmX511nvN1rtbwgazdweBdaM1lRa0tchk2kpdSUiWj+5FiPsNd4J/GtURTp4KrbZ7XewXyEUELIIKa6Ctkl1jYKh1c7VpICmo6iMYPDMglLSzBCQ5tPW0T9DSE5Fa3QX9M67v3bkR0VG/xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842692; c=relaxed/simple;
	bh=fIZ9xajQHzdj3VcK38Twv4uzZUBktgP6diHpCXIYbsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0vAZLY158oCJzWijUvdpi2kZsqDTAyGlvr1UTUiqWzn+Z0qhp9Fm6GUdOM8+qGuo+tIHcE/m556NKs8miJoDWmvcobTo0PGY53hnc7knipPIeJNOVtmEktyScLTz0Wmg9oJfod38rQi7clbUeW1mrsSy7u/TI6r4kdfqV2cc9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=g4ctfbJa; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="g4ctfbJa"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664e3ed58bcso1300618d50.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 04:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785842687; cv=none;
        d=google.com; s=arc-20260327;
        b=d25OXY2IyNvCjuP1TezBdCSPOCh1K5moHg75PDrfoJbGo3AYLwxS5jbGZTs48qjivn
         FAcdnGF/MzoCMUohbBq3qMX4k8LFUzkXAeLrEo+g8RSLJtLqAGO22TszC71rWdlXuVz7
         h3c7MTcXhzPX5TTW5nzh5QfZkCjZ96XfuUE4zKE1UofTfMuB1i9bVylBUEHm8GtA5QbD
         gsbJAEybFp1rBykGVXS1Bj/0EabWiWs+6B+isbCQLsuHeK/IhbBlgEUqYgW1ISXpb4Sa
         BJIKV08qudvyU42P5JYTHmUJgAoii0D3ggto8BtSXM0blkjRt2yRSixdX5SF+AiDs7UI
         7X/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uEVKlwbWy5DXWZajPw8ll3lGkPxZtANhBjPjY4Q6jfY=;
        fh=5igIpP9UmiC7voL3b8h5gNTnT9jKd6cvTiwrXDSLjPI=;
        b=fw0LMOTmGXYZgP62S8z2Bkl4fi0KsPXdoKkwrliy7gO/kml91oqO2OgS9TJNRaSlbJ
         pp4cdKr2iYHfLvXT+9mlLB6ibwNJTM4HNUJqxp4NhScUVX+k+X14/0NGkalUqIFKXuIu
         DzVn2UwMwTAH5RApGJ3vdNX7X38M3Hx0/6W0XD/7T8V7lSA221jWuEhjU1qMa9ZUTihC
         IhwYZ1FD4I+QP/jajH2hMFXfd8L7PiCzEVwR/oTTlPoFZ3Bd6oVmY4VX2a2KXLYAC/v4
         fp5eB+k8RXEGMjyicXO3SO/vaJBcI8YGKNC4eMhBdZl4b39bw/idDxMhM7uVwCWgc4EY
         xM9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785842687; x=1786447487; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEVKlwbWy5DXWZajPw8ll3lGkPxZtANhBjPjY4Q6jfY=;
        b=g4ctfbJa/rytlIUz4rTnXdm5+ct0Xg87xzRL6OCc3Yl7FUCmx4wHje5ubsGgvCompY
         PndWKX30qGmlVfWeTpLgy9F1z7VbwMw3yJ2lv0E7LMaTyS7Ae3EI8EPQTe3jwzwCOkJq
         i42BYGXg0rUqxLMz+hwM/Zcm7Orqvkd4GR6WOm3HeNnumSJJq3gnDPrynpfBYs5uhlqk
         X2d8lAJYAuLTg4OGGy9+sa/u+9WJBf/C0P/vz43O3zSgVrFMF9+r+SanwYDjjjiBXmn2
         wc4bkqbzYpSb42dxJY3Wg4vZa03Akn2RhUgI4MezolL3BE8I8Ni4U3hVL2ySR6noJe7s
         C7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842687; x=1786447487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uEVKlwbWy5DXWZajPw8ll3lGkPxZtANhBjPjY4Q6jfY=;
        b=ZO6TX7GPKSTWmw0cj4U5UJqUc4Comonq8EVxZoTfl2qpNMXnYq/lyxNNDjOJsrnxR2
         jTo+uefl7h9tj9Ase9VYqKFQYLDGuUrJaq303SxfZi5GU6h27Z/SNksWmzHh+cMCAPN1
         0Rn1gBARgxLH2sr1yjDN1cut6Ob69Q/Xf8CWMRMBw5SDOblbyyyS4yibzlnUHiczWxEn
         /n84CXEqthQGIALzeN0yKV8NZebjGaJM871rWeDQvU/ZuipNNKP3qaeVHk7WhVKg2N28
         XXEvniQO6LDkFCKOYDTCc1VTMvkK8vYVIvZIF5fRo2xrWVYXvkKgb8TEk2EWsunSauSH
         Zo2g==
X-Forwarded-Encrypted: i=1; AHgh+Rr7TqdngaeLuhrmqYuIizyP3bjsW5DQtQWPFVo4DbgINRJpk3GRgyveLsP80uoTLBx7U58CbFn3zr54iOc0iTV3OvF/@vger.kernel.org
X-Gm-Message-State: AOJu0YwrkiQ9lHAQDip1ErW49W5DYKTmkBqSep8fvUhboWZyiurRWoKl
	ggFrt/VqFJuMRTl1F3VmIFoo+giGmSdrjqk+kDlDQwYwhVSIG3gwNEgltYPabgWx61CbMZBA1TP
	28g5L7sqGfh8ESg4XbLSusPOoHC2fT7KwPhgxeNDm
X-Gm-Gg: AR+sD13s8m9Zkn9SjPAq5GO2JKTCF+3Z+07sFZhZ6/IbZ3Gdwj78H/Tiy7MreX/x+0R
	33DXD6k0uXYSSyoyy0WezYnZI/46C5ziQFu8McczyJ220n3EZEkI8jqph4wuL61pOVimMlUGyfE
	SRWpquvqF2Dgf/XaYl3Ws+JLB8EdV3auYFFu4FEGauPa7QgicPn818vsav3awhGX/YIJbpYXzYh
	0GggFiexuNAOPtGITG7V651oRUa0L1JxcmjJY1nwVjSvH5gaM5+fL/fmruzf8gSYLl47w9eub/f
	7s7ZSQV9w3XWBnvRwPOQwPXcZhyWrBUHpRHVPsSaw/cPNywBPLhPO2jKqqGSLeYGvJqo4soK7Ni
	Pwhu7UqPle7c=
X-Received: by 2002:a53:e809:0:b0:668:894e:4bf with SMTP id
 956f58d0204a3-66985b8b487mr2701317d50.13.1785842686824; Tue, 04 Aug 2026
 04:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785838269.git.sean@starlabs.systems> <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
 <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com> <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
In-Reply-To: <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Tue, 4 Aug 2026 12:24:35 +0100
X-Gm-Features: AUfX_mwh-6pbB3G3eHLoi8Syc4jiVFprtmWw6VDhCY8_98Qp6PgmXdAIR53yGtM
Message-ID: <CABtds-35m_cfT=Vm4MZkJYRe=dOPAKR6HYO_fu3SnwkdVQE0nQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to coreboot
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: chrome-platform@lists.linux.dev, Corentin Chary <corentin.chary@gmail.com>, 
	"Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Huacai Chen <chenhuacai@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Eric Biggers <ebiggers@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, Kees Cook <kees@kernel.org>, 
	dri-devel@lists.freedesktop.org, Oliver Lin <oliver@liuxiaozhen.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Aug 2026 at 12:05, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 04/08/2026 13:02, Krzysztof Kozlowski wrote:
> > On 04/08/2026 12:13, Sean Rhodes wrote:
> >> rename to drivers/firmware/coreboot/Kconfig
> >> index b78c644fa253..d273bd836245 100644
> >> --- a/drivers/firmware/google/Kconfig
> >> +++ b/drivers/firmware/coreboot/Kconfig
> >> @@ -1,13 +1,16 @@
> >>  # SPDX-License-Identifier: GPL-2.0-only
> >> -menuconfig GOOGLE_FIRMWARE
> >> -    bool "Google Firmware Drivers"
> >> +menuconfig COREBOOT_FIRMWARE
> >
> > As pointed out by defconfig change, which is supposed to be separate
> > commit, this will affect users of the kernel for no real gain.
> >
> > Do not change this.
>
> I am surprised that such change appeared at v10.
>
> Changelog is quite incomplete and I do not see any explanation for this.

Sorry, don't follow - so put the names back, or split it into its own patch?

>
> Best regards,
> Krzysztof
