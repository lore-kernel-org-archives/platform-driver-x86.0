Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53053542FA;
	Wed, 11 Feb 2026 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770814122; cv=none; b=CH9A1UxXPhNL/QU78HsX7duZLDWpLign8as0qA5D0zQlK7KHXZShWjsrQpftaPZccE0jkLMke2/1ZVG26XiEeYzG0Yy9eGyvOU6j3mFa3pICLwA2stYGKKEYhRtc9S/CPMF85ZElBS7CeQvuukzQ32uf5nLSzZZAQvdgMRi9N2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770814122; c=relaxed/simple;
	bh=PDlauqv//TSpFrzdLs1GawOFkZaiS1JkRXFER4lpuJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlLh1WEprHRy9tLt7jSteQe/+0KfPiLwcnXzvZ58S4RCl4xgOpeO3WnYvT4ZO3oAbxzVMZazWCWsPx3efb8EjQYjGLzByUf/PfC8wow33MzF38qJJ0dXG2A72QMGDKEa31P5a7SztSmxy9j7tX5Ux7rhHbgyXVCfWXRidsQNcvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 3DAD82009D28;
	Wed, 11 Feb 2026 13:48:33 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3A3381E6EF; Wed, 11 Feb 2026 13:48:33 +0100 (CET)
Date: Wed, 11 Feb 2026 13:48:33 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
Message-ID: <aYx6ocvaFHunfP5f@wunner.de>
References: <20260211092640.3231-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211092640.3231-1-atharvatiwarilinuxdev@gmail.com>

On Wed, Feb 11, 2026 at 02:56:38PM +0530, Atharva Tiwari wrote:
> Make apple-gmux save the current backlight brightness to EFI on shutdown,
> so the brightness level is preserved across reboots.

This version moves the EFI handling back to the gmux driver.  Why?

I found version 2 (which separated EFI handling into a separate component)
much better because it will allow other drivers such as i915 and amdgpu
to update the brightness if they're the ones driving the backlight,
instead of gmux.

> +static void gmux_shutdown(struct pnp_dev *pnp)
> +{
> +	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
> +	u16 brightness = (u16)gmux_get_brightness(gmux_data->bdev);
> +
> +#ifdef CONFIG_EFI
> +	if (gmux_data->efi_status == EFI_SUCCESS && gmux_data->efi_data != brightness) {
> +		gmux_data->efi_status = efivar_set_variable(EFI_BRIGHTNESS_NAME,

Per section 21 of Documentation/process/coding-style.rst, #ifdef inside
functions should be avoided.

Thanks,

Lukas
