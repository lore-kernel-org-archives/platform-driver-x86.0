Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48DBBA34;
	Wed, 26 Aug 2026 06:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787724443; cv=none; b=nGi5O9sE/GSmiCw5THyftDjrR7eOqvuT7IKaz5+vCzgluKQRnv5OnGVmHaUuxNrWCb37NovoHxUwcKNUWdxycSjlmDTpStp7rDyXDM3pcU/yn5A0J98RsjiQ26wnNKvFdspVxeMIAwNlcaB8rYIOHL387nY9w+1MyyKAJZSohnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787724443; c=relaxed/simple;
	bh=zW9f1bEvZ4x5bxZjWutNFk9gjYrZ540HG/0JamedKvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bApLVhy2kY0Bf8QgB0s3lY2Fmqx0CgBjBgfNvWdPThSAswYzNnA+z/dtnUekRBDmPJp4UqpfzzY89h8SX+Hp3b+ny+xGWMkydpuQ802/9f5XnGyeG+fZUeTKlt5aebV/h9zy3oUvOOWpgSxhs7fUyYKPiwGXfp3ivG78d5L3NzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ec8j9Kuu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ec8j9Kuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2787D1F000E9;
	Wed, 26 Aug 2026 06:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787724442;
	bh=Sz6PqnW19SjpOwoLfiJCtjkUAIIP+g2E+lZPpGrN7vE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ec8j9KuuhQ1aODrKh1IPPW+t5WNcQsJOuDmTb7EYk3BlxAjuBgWd1vM1s+lyrnECR
	 oEt2GQDNHfmzo5g7hXaH7L0douvY7fjdP0QkraRH3OHgMhBrmjArbgk4CZf7cnsNvn
	 aHTM7H8r5TPzyZvKI8A6uy7HJ/+Hc7T6p46c9yqWUM61UQih0nnbRAWnhdPCgVlijm
	 prY2wsx1oAKoWxEnzYNMYJrBZreDK3jZA48HXBYzJbpZLzqvMKyTPqwwGwBhQkAWux
	 mBj+1ZNWkXaWBrkUiQxOsV/dVnhzGDLA8nPR6+qiZEqgkywzF+VGu1B2tZcfDVjoNE
	 E4BFhWg9UIoGQ==
Date: Wed, 26 Aug 2026 06:07:14 +0000
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
Subject: Re: [PATCH v13 RESEND 1/5] platform/x86: Sort firmware attributes
 class includes
Message-ID: <ao6CkvFgrZeo-s8J@google.com>
References: <cover.1787584107.git.sean@starlabs.systems>
 <b967ec0f8adb69417a3d81ee5546e4a238e29e11.1787584107.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b967ec0f8adb69417a3d81ee5546e4a238e29e11.1787584107.git.sean@starlabs.systems>

On Mon, Aug 24, 2026 at 04:08:58PM +0100, Sean Rhodes wrote:
> Move firmware_attributes_class.h into the main include block and sort the
> affected includes. This lets the header move replace each include in place.
...
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 495dc1e31d40..f3d8c5a85762 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -20,6 +20,7 @@
>  #include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
> +#include "firmware_attributes_class.h"
>  #include <linux/fs.h>
>  #include <linux/kernel.h>
>  #include <linux/kmod.h>

I don't really follow why it is beneficial to make the
firmware_attributes_class.h replacement in-place.  Moving relative includes
like "firmware_attributes_class.h" into the <linux/...> block creates an
awkward intermediate state.  How about drop patch 1 and simply update the
includes directly in patch 2?
