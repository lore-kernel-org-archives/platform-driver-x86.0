Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB7849CF3C
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595034; cv=pass; b=qGPmH7gYHJYIfHH2yoI9G0DtDzFt6uMUBgN2xYlWmOTU/bj8k0EKk/n7vpGaXD2pgyUwH2eraVecRoyjeHiYU+RMhfWoUI7NWsdY1xpODIhtGDkGuQtAppePYcBSX5IOwxHJtGrywx6za2/9QaLDaBK6b7D7wrAsPP0wXVboj5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595034; c=relaxed/simple;
	bh=AayDStxvWbgnmWnKvKHBN/OOsgvHcfSQuvWss2icNiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brbK0Bij+hrtU8wE9JNaEqvlL9sctg5lBW72TQf2uglxaoQEbtT+ys6p98rrxmfEvnFq7Dt4ifUBIN41Ej5PMNHngFoa9oNqwaedINJ5VnK/xYmJZzURf7xe36kyZbpyNVlrOZT8RS4TzZRELRqOGizTTbe2MnpKQ/fiqhy/rJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=dXbtpYXH; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="dXbtpYXH"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-87c938111a7so851227b3.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 14:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789595003; cv=none;
        d=google.com; s=arc-20260327;
        b=kS0TmfK7tYuTmOcXRv6MrrDVD9lqDNHETwwMZxe8TCSugkv/tEGW0w8OzOQHAs/QcU
         4+ZG0p8bEVc0GPjB7VgMMSV2kpgZyhCbp/wTXbErZBAnMYtJ0SEmRSwV95bak/t8wDsL
         XyFAbHz7E4TuhPR2lJS8ZauGT76W8NiIyG24NwEymmNP6H91ZVnsyc7oRjHgoGz5ILWE
         yh3YEPuDpeulIeQfnmAG4yyx7qljtADMQ04+IzkcdQlYQy3r/f3JcH7pAC4FrsGTU/PI
         xBLo/AiAjeWZ96Es1P7/0fkY5PpLkbM1PGqfCsEiYrdqL7pdA3Kl3Tzz6jefjT5XuJaj
         OpkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        fh=I/ctTGn+V8111rP18eaXpt0DxsKrq4bWF7s1QtLDk9M=;
        b=PIPLCjUaQqVqGvrxRur/yBaWDlNwhMLltFj9TB8MJkkFps8RbpVyOIlvMVhPxda2Wc
         XsjYRbpPlDRl2Zvq1Ds59Aht1rueK3gpwqKbZ5xrysJBwUv5JanVhyaBaNMcc5Y0iDiN
         0sX21aeKW+JeNv1ONQ8BGOx+xNiiqSG2Otl64EldMpicbFVk+4e1oBCqd82MMM+jRTM/
         k7Mdjjy7Fiphn/ORuoj+7qcbE5UUdG8ieeTq5vw3aUOscHcKZrTAvFCB3mqJajq/AkrS
         ScU4LJDN3bIjDG1swcfzwi3Lt3en7G/ob2FB394QI/dzQGs1cF8nzK2qfUmPLicscjW5
         Okcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789595003; x=1790199803; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        b=dXbtpYXHwQ9TyJdQPhosUApAyoV2HEIct/41EktUePE54v6smV7H3Q8v0nGzn/94sZ
         mZvMZpMe9XLxMfjWFpQCjrmqc+Z/HemExcC6X9QrSqUA7pGkQ+wvF/tUB5WDTqd9WyA3
         6NRc4Qghta+bqGxbrV3xAuDsbjgruHCwelrWGV/uun4TDBYo8wlUJmQlvTjTq+CDxZqI
         3PShdKMApdjlcHlbhuI06nwzjxqY0ek4e/frKxD5wuf3UcYu96nCIggxuvEn0gVBXjdI
         K6rHo/3zhRGvAdYVxFyd4ILb/btN+a72TV5ott64EfY0CNUPrbuyvg68cKEtwhHg+ct7
         Ytvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595003; x=1790199803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        b=h2xMdL51/vDoPWqZdNj9Qd7cCm8O941xd4Ofo7wjcZtyqLU+IzSFJdj9BFOSHBxrn3
         dXY7m+BHswIMkztAc9Exwq0gPLi+Z6hy7FOa7d6V4QMcP6UuCKBktL7zjUdA/6jDFyP7
         UIMNdJtDPHsgzld8dFDnIGA8Akn6lLWGQ046YZaLIlmkLLf5p15Y2T1iVoCjT7WjHcAA
         2GesIluiiErhXIUnNP49yCrbErDmvoos6fRreoLEpi3SPAxgJz0RPq810g+TFI+UdgE1
         pFo3yxhMuoS00UuV5vBljymoYLDRg2s5iz27LmF6NtbTHzhBto1w+5x3E21I+B9vYOq0
         rlCA==
X-Forwarded-Encrypted: i=1; AKwUvBxzZYk28+GIGnDFh+2HuYoZAbNeo2c2pOHS6X0FULozHPipdnZqUhQFpr7KbYZWFm0wC6PRpBa+MHVBkrjp4aQtmdNr@vger.kernel.org
X-Gm-Message-State: AFuF++k9nR4QhWI6otMkFTvtvAM5xinZRqw+vqUHjNuLnOcY5wC9Nx4f
	pUJ0SzHrjhLy3R5tsoQjZ49foJFWXv2oC4fSQ5OMZaQUgMfOfF+GN971p2/bOfo7u4iaUOYrDr0
	btEXNluo5CNZVQ2qIvgTXjDyW7YbhgxsX3C4uFm7P
X-Gm-Gg: AYBFou3w+ImI6ha5FBWmV5gvf0Y/iqi44p6S61Rz35HdnSX38cKCC5IUN8D2mK5Wjc1
	+6YDkfxZ1J48B2hqqisOJi5dPUNsTD07R5JhYcdrcxvmuHyQI/v+rcPERlFUsdcsMMLegw+lzU4
	VxZQgppLxf4plrE7D3H6Pet6SMGAe9a87R73dbW83rcfPPnJDY7Ys9XcSkEKrUjOURyMimpWzqO
	b4FfhOQFAo5QOAS0AL045YvU6BQnrb9W0AnFU+awSEsylwk15xSoCwUStSBKS5bPiLR2+bjq/HE
	0TvD8IpJVzv/EY+GNQD4bZKielJVDkHUe0pGUmFBSmuT1fZnOh97M7q824r3vWOXboeXzw6RqbU
	kg3FjTOGrDg==
X-Received: by 2002:a05:690c:7:b0:873:5c7b:c12d with SMTP id
 00721157ae682-8944596a1a4mr2540477b3.21.1789595003466; Wed, 16 Sep 2026
 14:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788284852.git.sean@starlabs.systems> <apfz3lf1RIfAkKYS@google.com>
 <CABtds-0w2b0P6SGoAZGHJe-4usmG6B8SUP1ufRQyp0+9UFcF3g@mail.gmail.com>
In-Reply-To: <CABtds-0w2b0P6SGoAZGHJe-4usmG6B8SUP1ufRQyp0+9UFcF3g@mail.gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 16 Sep 2026 22:43:10 +0100
X-Gm-Features: AcwNN1U8ZB3podUdFXiPZ834VqBifCusJKONnKfdetS9jbEaRFfMhwBYCh_JS1c
Message-ID: <CABtds-2srRmKDvNj7g_0C2w8L72WczLsA+Vc_Yg3KC4gvSJyqw@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/5] coreboot CFR firmware attributes
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Will Deacon <will@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Javier Martinez Canillas <javierm@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, 
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>, Yidi Lin <yidilin@google.com>, 
	Kees Cook <kees@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	chrome-platform@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Michal Simek <michal.simek@amd.com>, 
	Sven Peter <sven@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

How about patch 1 and 4?

Thanks

Sean

On Wed, 2 Sept 2026 at 11:01, Sean Rhodes <sean@starlabs.systems> wrote:
>
> Thank you :)
>
> On Wed, 2 Sept 2026 at 11:01, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Tue, Sep 01, 2026 at 06:48:01PM +0100, Sean Rhodes wrote:
> > > Move the firmware attributes class helper out of platform/x86, rename the
> > > coreboot-table firmware driver directory from google to coreboot, and add a
> > > coreboot CFR firmware attributes driver.
> > >
> > > Changes in v14:
> > > - Rebase on current upstream master after Linux 7.3-rc1, preserving the
> > >   intervening coreboot table bounds and CBMEM no-map changes.
> > > - Drop the standalone include-order cleanup. Replace the affected relative
> > >   includes directly in the firmware attributes helper move, as requested by
> > >   Tzung-Bi.
> > > - Split the DRM coreboot framebuffer dependency update from the firmware
> > >   directory and Kconfig rename so it can receive a DRM Acked-by separately.
> > > - Keep the CFR driver and its runtime behavior unchanged from v13.
> > >
> > > [...]
> >
> > Applied to
> >
> >     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next
> >
> > [2/5] firmware: Rename google firmware directory to coreboot
> >       commit: 44e33a5aaa2de3f5cf2701d6f4b0a7c63d4fe602
> >
> > Also created an immutable branch "ib-coreboot-rename-7.4"[1] for patch 3
> > and patch 5 which build-time depend on it.
> >
> > Thanks!
> >
> > [1] https://lore.kernel.org/all/apfyaxKEEJz20wRC@google.com
