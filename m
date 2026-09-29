Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F31F51B175
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 17:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702321; cv=none; b=r4Xj8iTG/i3JDMCLiGNp7u4GODJ91vHIp7pmL00f36LnHR9gkqZYij+Zu7NBzyEme1+DXSPEAqmK1edobjduzOOeyT+vPi6VKlRWIaV03/H0K5I+Fy5wUXoJTu+Zs7IyxIZr8j0tsbQmgT2E0Um/r3IPyZa1r5qsNqtyxNIH0rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702321; c=relaxed/simple;
	bh=bahBCdmRp5pzwdp6FV8ToqSY38MRO0WP0xbAwQnNCp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RP4IfZ8UfEMplkwfmxHEWsjmva7+CH+XTIjY5nfOIG8ulAZmpZ4NgRH1coqW+E9SKNYMWBO//CtnCVB0x/aVSUV8WtpUbflMoadNltbZyZkJooKymOWVNB7WSbh/owMgcfWUC06W9063myMO20H3+9ZFV4lFLbhpo4gmr1/3iHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6pG8FME; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6pG8FME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2CA1F000FF;
	Tue, 29 Sep 2026 17:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790702317;
	bh=6njapJfiBGQFAp/HEiwS44Gw3B2avqLUEi3fgOLp4VE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Z6pG8FMErEaTEvMveUS9SlkOnpAEpsFQGpBiBgwnFX0tXPvboITp9sl3MY0/g5LdK
	 TGbRbSaucGM55XsI91ALFmmJaA4yj+ZN9PdEc0uZA9eAYkgeUr6wqwrEipUGccgj1N
	 DrwX9O7O1Ihys8ESbHT63FKkKwe5ZX57UeCQ4DME06/KlX1PqvvD/RbniSUgmqrof8
	 Acf7wgfD6c6a43CCogDpwYRr/Q8S4WDldVC8FvRduwFob8ZbJbEdt2Q0b7BJlWxOud
	 4/pHuRDHjkt7MaBvNDRRxSyzm8jb6PCVJosC/L/Gd80D+B1Ehre57PxfEE9aA8tFM2
	 ofEOOw+piF5UA==
Message-ID: <1fdc7d18-7776-442e-94c1-d86e24382fb2@kernel.org>
Date: Tue, 29 Sep 2026 12:18:35 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: clear devm-managed pointers on
 remove to prevent stale reuse
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20260929155609.1712638-1-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260929155609.1712638-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/26 10:56, Shyam Sundar S K wrote:
> The driver stores its state in a single file-scope static struct
> amd_pmc_dev, which is reused on every bind. Its regbase, smu_virt_addr,
> stb_virt_addr and fch_virt_addr members are MMIO mappings created with
> devm_ioremap().
> 
> On unbind the driver core unmaps these mappings, but it does not clear
> the pointers in the static struct. Since the struct is not freed, the
> members keep pointing at the now-unmapped addresses.
> 
> On the next bind, the probe path re-maps a region only when its pointer
> is still NULL, so the stale pointer is reused and the following
> memcpy_fromio()/ioread32() touches freed MMIO, causing use-after-unmap
> crash. Clear these pointers in amd_pmc_remove() so the next probe re-maps
> them instead of reusing stale ones.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Arguably this should go back to stable; it really fixes a problem that 
should have been there for a long time.

Fixes: 156ec4731cb22b ("platform/x86: amd-pmc: Add AMD platform support 
for S2Idle")


>   drivers/platform/x86/amd/pmc/pmc.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 7ccc2caa0f2c..8c66425d4ec7 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -958,6 +958,10 @@ static void amd_pmc_remove(struct platform_device *pdev)
>   	pci_dev_put(dev->rdev);
>   	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>   		amd_mp2_stb_deinit(dev);
> +	dev->regbase = NULL;
> +	dev->smu_virt_addr = NULL;
> +	dev->stb_virt_addr = NULL;
> +	dev->fch_virt_addr = NULL;
>   }
>   
>   static const struct acpi_device_id amd_pmc_acpi_ids[] = {

