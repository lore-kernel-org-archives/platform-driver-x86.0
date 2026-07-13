Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D0345731;
	Mon, 13 Jul 2026 04:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917736; cv=none; b=kTqnMVGc3tRRc4RmuLOOD3YpNXEd7azFMemmZE/gfj6cw8lKQ/KidjXsqIbU0OCMyQSVINHNKWykq3Kx3bbdKWRuA0XA/XknR6atxcMiw25wiqV1qnOaTbhPo7AIcvJdSqoRreGG1L1WO+rAJUUKn/I1zWKI++Ha2BJ82AM8gAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917736; c=relaxed/simple;
	bh=0qM6TOq2Q6eMbKN9l998qkzrExTTGOP02hneV5TuAl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWPQpC2ncRsqYpjJcCa5zMUxfIK8/4pP8bTtJ7GrhfieIoPMUUwYXeXcsMM3TlRBeuWWwey1JE8dCcgik7gOPFDIZ+V99r7+N0QgYV6GN0dpzy2NjpOH4rEFlRuGP0E5jcq0dPmXUvAWY0sWKVqqhUG6zMCpLKZO2ox6aYKIVh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhYRyDOa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhYRyDOa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980ED1F000E9;
	Mon, 13 Jul 2026 04:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783917732;
	bh=7u9GMZSkBgHVLej6Lyyn/rxsdaHXgfpwafrr0NwU31w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fhYRyDOa7DOmlP/n5oQYRuE6s62+Dcxlm/FS5Ml4QEcdpFToV4uYGwt05NFY6SdFh
	 YvvblcoNdCemNG8lD3ttONbz8cFjNoxlfAxpeaAFrGZrCLmKd10MYzZT7Sv6GhPRKv
	 EmExM5JsfWYYDIR2n9M97uPIQcdOJAGvirXL6E4u9rOg+m+BDdAshfMLKaVQDdrY4E
	 mibNXm5U9eoHC5h++7lioFPgFFaXUTgizKtifHLBSsIqLyEKqH7ltu+iUwUZES8mqM
	 IZbuqv63xKQgQuXy3O3ZlSJirbsuFN/+V+Ag9mL9wNecI19GPvktzlfQoAzWoplly1
	 KSBv00HSpZzwQ==
Date: Mon, 13 Jul 2026 04:42:06 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Sean Rhodes <sean@starlabs.systems>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v4 3/3] firmware: coreboot: Add CFR firmware attributes
 driver
Message-ID: <alRsnvNAECpMu0Y7@google.com>
References: <CABtds-39j-1r+XOB9gZPXFuiBumL3PjEco+2OFzz3CfXJqDjQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtds-39j-1r+XOB9gZPXFuiBumL3PjEco+2OFzz3CfXJqDjQw@mail.gmail.com>

On Fri, Jul 10, 2026 at 11:40:24AM -0500, Sean Rhodes wrote:
> diff --git a/drivers/firmware/coreboot/coreboot-cfr.c
...
> +#include <linux/array_size.h>
> +#include <linux/bitops.h>
> +#include <linux/cleanup.h>
> +#include <linux/ctype.h>
> +#include <linux/efi.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kdev_t.h>
> +#include <linux/kobject.h>
> +#include <linux/limits.h>
> +#include <linux/list.h>
> +#include <linux/device-id/coreboot.h>

Keep the list sorted.

> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +
> +#include <linux/firmware_attributes.h>

Why this needs to be separated from the above list?

> +struct coreboot_cfr_drvdata {
> +	struct device *class_dev;
> +	struct kset *attrs_kset;
> +	struct list_head settings;
> +	/* Serializes EFI variable writes and the matching runtime apply hook. */
> +	struct mutex lock;
> +	bool pending_reboot;
> +};
> +
> +static struct coreboot_cfr_drvdata *coreboot_cfr_data;

Can't this be some drvdata so that it doesn't need to be global?

> +static char *coreboot_cfr_string_dup(const struct lb_cfr_varbinary *str)
> +{
> +	const char *data = (const char *)str + sizeof(*str);

(const char *)(str + 1)?  As the patch uses similar pattern otherwhere.
