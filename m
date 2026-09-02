Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4253C435516;
	Wed,  2 Sep 2026 10:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344083; cv=none; b=UBbLv4nldy5cq0pgZTHHK6PSbbZ5tKrduPMrMV7j1G45eiR+x5JLst+y33PaJ+0wEfHGfxWSnCyFqZJzUI4dlq1JfcP3/+3YGp5KvPCNtJ0MbT723byLF8CVNd8vvtv2P0qppbNsW5y8eXKxNQiR+AV3Eh2O1GFBPxBVz8muyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344083; c=relaxed/simple;
	bh=dctD5FDJKH/pZrhr+s7iGrUIk+VqdiGrL4P2Rzkz704=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HljwrzLgppwg/brnCcGoIyC8EBEDGyoht3sGcrpYTSivvGhmBfG9EM1oocs8eUlX59s1Zlili3yBIRjKrNr8TvtWG6srf9Dyrwo7W0UgrMMwjfa6QGs0iTHyqIvGg/a211Y2aRG/Jwy+Dec7m1Idw/5Lb07A0O1tmCSk0iXyiLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eht4oMsm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eht4oMsm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483121F000E9;
	Wed,  2 Sep 2026 10:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344076;
	bh=VpxOGqhu6BT68QZvzh8mq5HY8MM0YI0lYLQZVpH2D2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eht4oMsmuYUieCvLcJgWlQFWXKj6eMOlWkENmVJ7fz99d8cE5M/khxjI+kFRTKubI
	 vBrSQEahxQA0eK28x5qdSb0Il4pf/Q/2I0iT39aIhuADV2H3c1H8DS2xuOihKN10xg
	 6XStfrPYbj5HppVc/nuQtb1nD73AdFbUXLL1+0tThZfHrFxNJGaPF59jFytYkQ2/hl
	 k6kWHT4CFMXBjMoVPQAD/yyoYUHO+SiV1fX8cJI/uEW5/9br43XqOJ5H5Ky6aSIzxN
	 BAoDeUSkH+b/s0L5uLGxaN8WCyLPoo0oMwfqOERfu5PAdkpPD3I6Qp5uKB4gkjkTC7
	 KaeYHeBePhRDw==
Date: Wed, 2 Sep 2026 10:14:27 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	Will Deacon <will@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	Yidi Lin <yidilin@google.com>, Kees Cook <kees@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	chrome-platform@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Subject: Re: [PATCH v14 1/5] firmware: Move firmware attributes class helper
Message-ID: <apf3AwibD6RiYlwk@google.com>
References: <cover.1788284852.git.sean@starlabs.systems>
 <5682c2228fa4a784d3953664b56a06e0dd9ccdef.1788284852.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5682c2228fa4a784d3953664b56a06e0dd9ccdef.1788284852.git.sean@starlabs.systems>

On Tue, Sep 01, 2026 at 06:48:02PM +0100, Sean Rhodes wrote:
> Move the firmware attributes class helper from drivers/platform/x86 to
> drivers/firmware and expose its class declaration through a public Linux
> header.
> 
> The helper is not x86-specific. Keeping it in drivers/firmware lets
> coreboot firmware drivers use the standard firmware-attributes ABI without
> living under platform/x86.
> 
> Replace the affected drivers' relative helper includes directly with the
> new public header.
> 
> Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Tested-by: Oliver Lin <oliver@liuxiaozhen.dev>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>

LGTM,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
