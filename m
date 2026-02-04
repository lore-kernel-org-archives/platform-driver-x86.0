Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DF6423162;
	Wed,  4 Feb 2026 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218411; cv=none; b=ecEuY2v2l4TRg7pddVcLmUyxJ311bhyxkaQ0YGccj185B5uSHKtZJ32jgEFUtiFKCzzCyxlfeJU5E4/IryAmyzCLrEH+Abvs/QYL1xJM7NTkCG+eEyxupVdJVw/6t2yf4R8WT8Fp04/TKINRuUJ4x8KH66AGtidGY0d/U9DFVEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218411; c=relaxed/simple;
	bh=TACv5gqlwHHbQ9papC74w7E0D5NZIue8d8VErNf8QX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtIanfMt9TedFGuRjUVsP2ZMvrAXaGWxL+HBmYcX7Q3Vr2x7VGooKpGcMROIsuzJg9TKs0nhr8ziIJm8SdwyP4MhH3qGIuoYXvuPnkvrPbZsW2oD3P1OkCgpZLLZIwz5cSDJ+Y0dwOde6d3bC4Z6p5iEAKchTuSiCWl9Ml0L7U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id CBD5F2C04008;
	Wed,  4 Feb 2026 16:20:01 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id C267D3E55F; Wed,  4 Feb 2026 16:20:01 +0100 (CET)
Date: Wed, 4 Feb 2026 16:20:01 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] apple-gmux: preserve brightness using EFI
Message-ID: <aYNjob2b9MTusPvO@wunner.de>
References: <20260203100700.2223-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203100700.2223-1-atharvatiwarilinuxdev@gmail.com>

On Tue, Feb 03, 2026 at 10:06:58AM +0000, Atharva Tiwari wrote:
> Make apple-gmux save the current backlight brightness to EFI on shutdown,
> so the brightness level is preserved across reboots.
[...]
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -1012,6 +1016,27 @@ static void gmux_remove(struct pnp_dev *pnp)
>  	kfree(gmux_data);
>  }
>  
> +static void gmux_shutdown(struct pnp_dev *pnp)
> +{
> +	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
> +	efi_status_t status = EFI_UNSUPPORTED;
> +	u32 efi_attr;
> +	u16 efi_data;
> +
> +	gmux_remove(pnp);
> +
> +	efi_data = (u16)gmux_get_brightness(gmux_data->bdev);
> +	efi_attr = EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS |
> +		EFI_VARIABLE_RUNTIME_ACCESS;
> +
> +	if (efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE))
> +		status = efi.set_variable(EFI_BRIGHTNESS_NAME, &EFI_BRIGHTNESS_GUID,
> +				efi_attr, sizeof(efi_data), &efi_data);
> +
> +	if (status != EFI_SUCCESS)
> +		pr_warn("Unable to save brightness to EFI: 0x%lx\n", status);
> +
> +}

Hm, isn't efivar_set_variable() the proper API to use?
Please cc linux-efi@vger.kernel.org on future submissions so that the
EFI maintainer gets a chance to look over your patch and confirm it's
using the right API.

Older Intel Macs with a gmux can be booted in CSM mode (bypassing EFI).
I'm wondering what happens on those with the above change?
Do they only get the warning or do they crash?
The warning is probably uncalled for on CSM-booted Macs.

CONFIG_EFI may not even be enabled, I suspect that apple-gmux.c does not
compile in that case with the above change.

On my MacBookPro9,1 (which does have a gmux), the backlight-level variable
has 6 bytes which currently contain (hexdump): 07 00 00 80 35 00
I guess this is actually a struct of a 32-bit and a 16-bit value
or alternatively three 16-bit values.  Yet you're only writing a
single 16-bit value to the variable.  How many bytes does the variable
have on your iMac and what are their contents?  I'm worried that
your change may not be compatible with all Macs which have this variable.

Instead of setting this variable only on shutdown, it may be better to
set it whenever brightness is changed.  That way, if the system isn't
properly shut down (runs out of battery or crashes), brightness is still
saved.  I'd introduce a work_struct which gets submitted with
queue_delayed_work() after, say, 300 msec whenever brightness is changed.
That way, multiple brightness changes are coalesced into a single
variable write.

Finally, there are Macs which don't have a gmux but which do have a
backlight.  They usually control brightness through i915 I think.
It would be nice to save brightness to the EFI variable on those as well.
Could probably be achieved by amending the backlight subsystem to
trigger the variable write if x86_apple_machine is true.
The variable write would then live in the backlight subsystem as an
x86-specific quirk, instead of in the gmux driver.  Perhaps the backlight
subsystem could be amended with a blocking notifier chain which is invoked
on brightness changes and the arch/x86 subsystem could then install a
notifier_block to trigger the variable write on x86_apple_machine systems
if EFI is enabled and used as boot mode.

Thanks,

Lukas
