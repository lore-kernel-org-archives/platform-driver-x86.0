Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8F02066DE;
	Wed, 26 Aug 2026 06:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787724481; cv=none; b=bK7/BDv+MEDGU4rKu1PqzdUkGCro2RHHI4+zOUQnwf0xvOs+FL9E6ZZ0IkWIhLVQbUwSsVJORrkycq48byVgnQHav412A3GtolSq0vPT70p8yoTyUftstfEKAZK3A0/aYRXLkb8Eb3x7RfilNFvkNgTevzem8BUUMUlOAtLyTUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787724481; c=relaxed/simple;
	bh=RD6QVBPnL95A2nbdXL1WmKm15P81+c+dUGy88c6tx90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOO+0vsEgtGnNfDQ9nauWzgxjmNhjrOYxz7fiDMvgAuD3mDfW+tBS1cRJBVsv9IST4RgSOLeJ9qquS9COnb6Tzij+rldB8XI9/d/vpwwUIKDHPfU+K2VDNB4qMzLuyXPKPyoNGBB5sG0hHBOqjxJh90F/QDcfviwzhx6Iq+V0Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3rrI2Zo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3rrI2Zo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A852A1F000E9;
	Wed, 26 Aug 2026 06:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787724480;
	bh=dFO/ykH2CGhqjy9gG6n+B+xyCQz/sDpwXbPuI04tWt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C3rrI2ZofAaYdWkBs7G0W1oare1gecw+He+jGZWXN1l8lqEkEtAoss2f4sxLsRToT
	 6X/SR+PhvxhGQrcHvY2f3TLRbtmk4+/x+jK8R3mAINbuaG0g1SUuSe4apwgJ/Zkyg6
	 tqzBXXf/pakbh+BW6zVDqm7fju9BToK8PoTSMPkQEQM7JIACkeHBfR1JKO19fKOYci
	 gSnsgHV96RyPtVIwm+ngBmEuRiQA0YvFe92oJ4KogpmOGe0hXf4HRDJJq53yZ80jD2
	 Fe2Hgq+MAIL9akH1Kg68TGP8jYZrMV+F8HxFqrPIP3gem+egqoCBlQOlRt7DKvNVY/
	 OGq164veYgG6Q==
Date: Wed, 26 Aug 2026 06:07:51 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Kees Cook <kees@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>
Subject: Re: [PATCH v13 RESEND 3/5] firmware: Rename google firmware
 directory to coreboot
Message-ID: <ao6Ct-x-vw_TkF5B@google.com>
References: <cover.1787584107.git.sean@starlabs.systems>
 <557d363a779c3c03bfe939dc2fefd6a4265fa7ad.1787584107.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <557d363a779c3c03bfe939dc2fefd6a4265fa7ad.1787584107.git.sean@starlabs.systems>

On Mon, Aug 24, 2026 at 04:09:00PM +0100, Sean Rhodes wrote:
> Most drivers in drivers/firmware/google are coreboot table drivers rather
> than Google-specific firmware drivers. Rename the directory to coreboot
> and update the Kconfig prompt, build path and maintainer entry.
...
>  drivers/gpu/drm/sysfb/Kconfig                 |  2 +-

The patch has no build-time dependency on other patches in the series.  I'm
happy to apply it once v7.3-rc1 is out to move this forward.

For the drivers/gpu/drm/sysfb/Kconfig change, could the DRM maintainers
please provide an Acked-by so this can go through the same tree?  Otherwise,
it needs to be separated before the patch can be applied.
