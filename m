Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D997E2E62B3;
	Fri, 28 Nov 2025 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764327384; cv=none; b=I0G3wHPuZW7eC7VSZgr8sR3vK/BK25lnULkAu7m8Rvv0r7zpa0PFmk6JOFVDcSTUFHpNsnd0885AXGj6XzJOD/Mu/SATTkSTcUXUQyZJKTkTNvDkb+l+bzD1ZaNGWrZzX2vodpnzqQxLnjGio8Rvsw2uHq6ekdQVgVIvQc9hld8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764327384; c=relaxed/simple;
	bh=JmJXSGglcF86sw67FHnGvyeLGWyV3/VAN5HUS52VzKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VMLEQVj5X58P+APe2RC52jTll3c5/l+OCzFpLqBJXYNhSwe1RmyM/ordPlNPvciCSgyliNteU4XM2YrKD0eDw7rzq60BgIxo9IZq0AIMcfIGn22TlDUYLWPZsxXJeBFwE6bP/lFGtgrsTyei8dzcIKBDfkUwBO1Y94QSJc6GPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gl9f11hl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gl9f11hl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430C1C4CEF1;
	Fri, 28 Nov 2025 10:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764327384;
	bh=JmJXSGglcF86sw67FHnGvyeLGWyV3/VAN5HUS52VzKw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gl9f11hl3XFXvfPPLYQe8/EYlFc1sTWN7xSDA9BJuUKDYmFwAFshiZ8yZgMRhZGyO
	 cTkwM/oejp3cSEVIky40FqdV8FuFcUA8dQSuH17T2c7s8MUtVcWiZQZ/v4NDa8gunt
	 +nmBmh62SZ59DmyKlwiz/e+kQpBs0+4SyX66VybN4gEFOn7Llmi43n49MKqTOTx1Z9
	 c9V/GDc9AbgFQSaH0vmYMh/dG19+9OZxZBEFU7UMf9ZFRYakLozkSyJoiJLKoIsCws
	 b6oFPQaEFqV9ycstXUGSid3PAQf3j1oZOEVwe+1UcabWC64Y9CODIJrdN4ZAV3j0XT
	 y9tmVrqTBY4Fg==
Message-ID: <6475946d-f3a6-42b6-b88a-be28556e72d2@kernel.org>
Date: Fri, 28 Nov 2025 11:56:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/hid: Add Dell Pro Rugged 10/12 tablet
 to VGBS DMI quirks
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
 Alex Hung <alexhung@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251127070407.656463-1-acelan.kao@canonical.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251127070407.656463-1-acelan.kao@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-Nov-25 8:04 AM, Chia-Lin Kao (AceLan) wrote:
> Dell Pro Rugged 10/12 tablets has a reliable VGBS method.
> If VGBS is not called on boot, the on-screen keyboard won't appear if the
> device is booted without a keyboard.
> 
> Call VGBS on boot on thess devices to get the initial state of
> SW_TABLET_MODE in a reliable way.
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/platform/x86/intel/hid.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 9c07a7faf18f..560cc063198e 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -177,6 +177,18 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "HP Elite Dragonfly G2 Notebook PC"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Rugged 10 Tablet RA00260"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Rugged 12 Tablet RA02260"),
> +		},
> +	},
>  	{ }
>  };
>  

