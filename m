Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B48A198822
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Aug 2024 20:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724703026; cv=none; b=RMWgUdTM20pKleLPpCcjGLsVDf8cluhNNuFwK7Oo1pas0xwRBb5SiajC4p2v4j0mHbw+JizS6g1ov3wJ0jktCY9GT08mBdb/w97EiYBHVnHB0R3zULIUhOPZ0/Emkc9RyKwRPgcXMnDf/TAfeeFIsuloik/BAVdpWedlzFb8ISU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724703026; c=relaxed/simple;
	bh=RqbE9QGbEtJqDUvt75GdXXXPvCosssKO7h2S38yRu+I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tf/xCJ3xJpq5YjSD4pBFI6m5WFY2sZwtkvKR6sJWGjK/3vvK4utF3XTZozQwWej75RmClovcCMkLDSBiCOee9JnYVLzPm7MB/ZaszjMstCWxbkCda0MaYpECyjZt0+lp6WPIlps6y8Fg7elsYCTUEuviOwKVhEeezBQlhD6+gP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 35ec7754-63e7-11ef-823f-005056bdfda7;
	Mon, 26 Aug 2024 23:10:16 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 26 Aug 2024 23:10:16 +0300
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v2] platform/x86: serial-multi-instantiate: Don't require
 both I2C and SPI
Message-ID: <ZszhKCKYl9161RIP@surfacebook.localdomain>
References: <20240814132939.308696-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814132939.308696-1-rf@opensource.cirrus.com>

Wed, Aug 14, 2024 at 02:29:39PM +0100, Richard Fitzgerald kirjoitti:
> Change the Kconfig dependency so that it doesn't require both I2C and SPI
> subsystems to be built. Make a few small changes to the code so that the
> code for a bus is only called if the bus is being built.
> 
> When SPI support was added to serial-multi-instantiate it created a
> dependency that both CONFIG_I2C and CONFIG_SPI must be enabled.
> Typically they are, but there's no reason why this should be a
> requirement. A specific kernel build could have only I2C devices
> or only SPI devices. It should be possible to use serial-multi-instantiate
> if only I2C or only SPI is enabled.
> 
> The dependency formula used is:
> 
>   depends on (I2C && !SPI) || (!I2C && SPI) || (I2C && SPI)
> 
> The advantage of this approach is that if I2C=m or SPI=m then
> SERIAL_MULTI_INSTANTIATE is limited to n/m.

...

>  static void smi_devs_unregister(struct smi *smi)
>  {
> +#if IS_REACHABLE(CONFIG_I2C)

There is no explanation why ugly ifdeffery is used here, while normal
conditionals elsewhere.

>  	while (smi->i2c_num--)
>  		i2c_unregister_device(smi->i2c_devs[smi->i2c_num]);
> +#endif
>  
> -	while (smi->spi_num--)
> -		spi_unregister_device(smi->spi_devs[smi->spi_num]);
> +	if (IS_REACHABLE(CONFIG_SPI)) {
> +		while (smi->spi_num--)
> +			spi_unregister_device(smi->spi_devs[smi->spi_num]);
> +	}
>  }

There are ways to solve this:
1) add a stub for I2C=n for i2c_unregister_device();
2) resplit this driver to have several built modules:
   core, I2C parts, SPI parts.

-- 
With Best Regards,
Andy Shevchenko


