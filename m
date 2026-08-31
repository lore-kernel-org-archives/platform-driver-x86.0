Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075B83B71DA;
	Mon, 31 Aug 2026 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169331; cv=none; b=DrUP1CtoCjWLP+JFnnt0LCl5R/YqouMDVi+sL9aiCVKCdcNPDfA8Wn5Rxu29LUZjFBIJHrL/kcBxcz218LPX7iuul4UeSc0yWzue+Szyor6EMf/9KAP7dr2/H/1svNf2AAMDckr++MLCStliE7QSYOat7B/2fIAhWGyII26rfGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169331; c=relaxed/simple;
	bh=FCmGq026rtVYOTQZ2B8sRaCYdFKH2T0zfF1EUXvU3Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AotM9x6+5tScdGAyTvNvqpOT8enyUI5ioBUGQituz4BE0IU5EDszkwFE43m12HmE8owhs8AqAWn8b8v19z9/CEHlz1FsF8/kWnaFox4+D3Yb1+GtTtiqJBYiAk+U2B4EMyEhUuXHxL/r4ERQ3dRyV99OtBjb0triObPZqKSZefo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkF32r1G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkF32r1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369071F000E9;
	Mon, 31 Aug 2026 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788169329;
	bh=auXQEE+ozaB4bDOg9epCQ1w0vy7CsLawV+yLEVzxVRQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FkF32r1G3bGyk88S2OgD7F6n948UgAqA3cts09TR0dvETeT9v4rbMOX2v/2vTGab9
	 t721Z3b1HNH5H0pje42hT1NH/rNrS8SpqDoL+whRsVI+5fj/D3uSw0JMkoyYwl1pgu
	 7Moj+E4fEBNUmJHYFPu6CQ8mxzBvM306Ai3zVJX1uQy67eI8BVVRbqKb1AbMBzYI+E
	 aO+MrDLm14Vl5XRu2ClDtZGJkHEq8hNhC2wgVwEpDsTObFrB+Vgqcs60OHQLMKq7IP
	 VNG8BxwaAjU1tI53UmyTKYC2Sx8CJg20EhrC9kDnIsaATB3HANFGU82UbCMvPwfo27
	 I91DAa7N31Wew==
Message-ID: <eadd7091-c61e-4fb7-b1a4-cf307108b199@kernel.org>
Date: Mon, 31 Aug 2026 11:42:06 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30-Aug-26 1:15 PM, Dmitry Torokhov wrote:
> When gpiolib dropped name-against-label matching in favor of firmware node
> identity mapping, lookups referencing unattached software nodes (such as
> arizona and gpio_crystalcove in x86-android-tablets) stopped working.
> 
> This series fixes the lookups and cleans up redundant software node
> registrations on Lenovo tablets:
> - Point Arizona GPIO property entries directly to the codec device software
>   node, which is attached to the parent device.
> - Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
>   during devres action teardown.
> - Generalize gpio_secondary_fwnode_init() to accept a node group argument
>   and use it to attach crystalcove_gpiochip_node as a secondary firmware
>   node to INT33FD:00 on Lenovo Yoga Tab 2 models.
> - Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
>   Yoga Tab 2 models where codec software nodes are already registered when
>   attached to their respective devices.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

So I've given this a test on a Yoga Tablet 3 (yt3) tablet yesterday and
there everything works.

Then I also tested this on a Lenovo Yoga Tablet 2 1380 since the YT3 does
not cover the crystal_cove GPIO case and there things do not work.

It seems that trying to get the crystal_cove GPIOs indefinetely returns
-EPROBE_DEFER. I'll try to debug thus further this evening.

Regards,

Hans



> ---
> Dmitry Torokhov (6):
>       platform/x86: x86-android-tablets: fix Arizona GPIO swnode references
>       platform/x86: x86-android-tablets: hold device reference for secondary fwnode teardown
>       platform/x86: x86-android-tablets: pass node group to gpio_secondary_fwnode_init()
>       platform/x86: x86-android-tablets: add Crystal Cove GPIO swnode support
>       platform/x86: x86-android-tablets: drop redundant swnode group on YT3
>       platform/x86: x86-android-tablets: use shared battery swnode group on Yoga Tab 2
> 
>  drivers/platform/x86/x86-android-tablets/core.c    | 35 +++++++++++++++-----
>  drivers/platform/x86/x86-android-tablets/lenovo.c  | 37 +++++++---------------
>  .../x86/x86-android-tablets/x86-android-tablets.h  |  2 ++
>  3 files changed, 40 insertions(+), 34 deletions(-)
> ---
> base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
> change-id: 20260829-x86-android-lenovo-swnode-785f4e165eb2
> 
> Thanks.
> 

