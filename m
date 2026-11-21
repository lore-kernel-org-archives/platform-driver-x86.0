Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795221519;
	b=nW9E9mNxQMBjIuZtALUoY4+5+CMF3I6Q1bZqLqo0k83Q8HiGF+LCsFUwxG0S3GMSYADQ
	 NIFYsi+5shIDccC5fWfHVEHWk9mCu8El+GX3YhPO8WdQJdsjxIRXuzo8mVkcIdpW1hoZg
	 ABJbsPE1s9keEQQoOy9AJSN5FFJC2Ale1lqKmJa7HEwaZgj93OumzhdMEfl2fysjqArSK
	 uvZk/9QI/WpghferCvP4qkNMMQ/EpH/mQr/RdR1IaVryyFkOmh/bnUTqbAZ57OocGhaKp
	 +KDrpsVonUxX6qef0aCg4/QLiWmasWFoQw3sc6O46VX3JSPdY5+l+iYF2CKLsDJoOIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221519;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=QV8D7ilUELbg/fg6EIzobLLMXxhaxLG1vZzySCiqx3s=;
	b=w6h+13VmtxCHWUxp85vIry80dShvQL6zqVZgG0DPrFV4j9+86I9aoIp4c39NI6FogRrJ
	 0lhFD+8gzYeI2Dhr5skS/YWg8HhhpDF+kcpjjBggr1F4MMTLUmjM7H0S477pzwKaLAjjP
	 7cNg89e7v8q5XzrwgQDliJx3XTwP/3PwWvo7zUvES0HUnW1+dHoxbsgTzbDsz5rSpT2xb
	 y/TiSYE1k35oLMbgG9Fs44IcESY+TpkNhlm6B7hWd/Ooj5qF91RrpRb+MdJ0TftNWANbX
	 sdkoLIet0x93QWTGI2Xsct2vl+8gpxh/FBXnimnpRnxgGRQyt3q+jUCuc1fnFB+KiRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IalQirY3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B41606A6B9;
	Sat, 21 Nov 2026 00:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IalQirY3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9631F000C0;
	Sat, 21 Nov 2026 00:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795221518;
	bh=QV8D7ilUELbg/fg6EIzobLLMXxhaxLG1vZzySCiqx3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IalQirY3i3ZnT1uQl8cusJxa9oyi8QWJr3n7xNa9xVMtvl882mORIfuEm7GpMncNB
	 986MKFLgh8xXQ5KTId7d070QIjTQVGO7owjQZcplyKTJD2k+YSe1qRf8ww3LKM0+It
	 QVjbPn5TE/UPkrk7EiHdaAhZmzEnc5Ffb3HiCYNWHOuxbG/2kn8kSxZsOlq1KXFmdd
	 ngjWxrO5rGkLunabeJm3vaz16qzC63rWtSyVnT7rHknojWHeXHQ7LBFnPMKztxiXae
	 ocUcCAHUoOT901armeduxP5ErR3OLdr9lOfosFWnq9/hZfRvLQqzHIcHS9V2W23+0b
	 eAVwlosEUqMmA==
Received: by pali.im (Postfix)
	id 82C3F4A0; Sat, 21 Nov 2026 01:38:35 +0100 (CET)
Date: Sat, 21 Nov 2026 01:38:35 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Brian Mak <bmak@nvidia.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>, Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional
 calling interface
Message-ID: <20261121003835.uemb2uaqm6enjqrq@pali>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-7-bmak@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121000556.173028-7-bmak@nvidia.com>
User-Agent: NeoMutt/20180716

On Friday 20 November 2026 16:05:52 Brian Mak wrote:
> On Dell RTX Spark laptops, the SMBIOS calling interface completes every
> request with an all-zero buffer, even for requests that should fail.
> Drivers that rely on it, such as dell-laptop and dell-pc, end up
> reporting bogus state, like battery charge modes and thermal modes.

Hello, is Dell aware of this firmware issue? And it is going to be fixed?

> Add a DMI quirk list for platforms with a non-functional calling
> interface, and export dell_smbios_calls_functional() so that consumers
> can avoid loading on them. dell-smbios itself still loads, as dell-wmi
> depends on it.
> 
> Signed-off-by: Brian Mak <bmak@nvidia.com>
> ---
>  drivers/platform/dell/dell-smbios-base.c | 22 ++++++++++++++++++++++
>  drivers/platform/dell/dell-smbios.h      |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/platform/dell/dell-smbios-base.c b/drivers/platform/dell/dell-smbios-base.c
> index c8e93c12c445..e07cbb0e8a6a 100644
> --- a/drivers/platform/dell/dell-smbios-base.c
> +++ b/drivers/platform/dell/dell-smbios-base.c
> @@ -390,6 +390,28 @@ bool dell_smbios_class_is_supported(u16 class)
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_class_is_supported);
>  
> +/*
> + * Some Dell firmware completes its proprietary SMBIOS calls with all zeroes,
> + * so any value read through it (tokens, battery and thermal modes)
> + * is invalid.
> + */
> +static const struct dmi_system_id dell_smbios_calls_broken_list[] = {
> +	{
> +		.ident = "Dell XPS 16 DX16263",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 16 DX16263"),
> +		},
> +	},
> +	{ }
> +};
> +
> +bool dell_smbios_calls_functional(void)
> +{
> +	return !dmi_check_system(dell_smbios_calls_broken_list);
> +}
> +EXPORT_SYMBOL_GPL(dell_smbios_calls_functional);
> +
>  static void __init parse_da_table(const struct dmi_header *dm)
>  {
>  	/* Final token is a terminator, so we don't want to copy it */
> diff --git a/drivers/platform/dell/dell-smbios.h b/drivers/platform/dell/dell-smbios.h
> index 1e64803bc00d..26f54364ffde 100644
> --- a/drivers/platform/dell/dell-smbios.h
> +++ b/drivers/platform/dell/dell-smbios.h
> @@ -89,6 +89,7 @@ int dell_laptop_register_notifier(struct notifier_block *nb);
>  int dell_laptop_unregister_notifier(struct notifier_block *nb);
>  void dell_laptop_call_notifier(unsigned long action, void *data);
>  bool dell_smbios_class_is_supported(u16 class);
> +bool dell_smbios_calls_functional(void);
>  
>  /* for the supported backends */
>  #ifdef CONFIG_DELL_SMBIOS_WMI
> -- 
> 2.53.0
> 
