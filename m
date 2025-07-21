Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71281DB154
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Jul 2025 08:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753085716; cv=none; b=lSdYRpSs3B+5RLqM7IGl3dXszuHen93ws4nG88+DMxku15XCKwb2EXycpQN3tlzuxXjh2Xu6vBLWKQf6iHB/NIASh7ItPtOo0cyg40w3VfX462UuJH8/YqmykDvg1wILjkU0BhZdlAzo4TzuvT9iFJ0XAt2+FtEr4RZoxkrqLHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753085716; c=relaxed/simple;
	bh=TNqCr+3OGDTh77Vw9VxfvQ9/hNEjdSV0jSI1l8Nqefo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3/qb7szi+8rdd66FQJJNnAnKk6itqf86bTga9O+GM6QseRlGQDFBjzOkCnXEs+n8Pb/d5ITD89KJWdKe1Aiz7ZEYcn6Zhuzyn23YU3+2CPDxUsQ12iJ14m8LFxTN6FItivmH2CjGYY1SaCiy8LjMxaOK39P7mV3idBG34oGc5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVfz5xEP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVfz5xEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A82EC4CEED;
	Mon, 21 Jul 2025 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753085715;
	bh=TNqCr+3OGDTh77Vw9VxfvQ9/hNEjdSV0jSI1l8Nqefo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PVfz5xEPkgbFrAJWfq/rdCbBmeSrokAq95dXtsUze71+bI728U1Ahc76rq1IuL7Yn
	 xH+9jCJqHy3sIC5C0yAvNN3HO4nRCe26phvIfoWHjsmRqFiC8kmIWdLYUacs7cHNHq
	 eddOytfRj9Cp1HUUjtXawk/HFn1Q6RRFBWEhef1g1L9tlv1F11vsSbb+tKRj5hkrSZ
	 pDNwAaklQhuFItimkvvCaTWCZMrE36LY1bmjXN6SE/DT0VvQ16/gQGF9LYuoQhlvwk
	 5PD+LwKYEiw5Pk9A19nSEEBHllkYrR/Lkz+ap1Y/w/ASe38ANV9fmqHk9QDBG8MKy+
	 NVGT+isZiJEzw==
Message-ID: <ae7469bc-4f00-48e1-b8e5-5dee9273c3de@kernel.org>
Date: Mon, 21 Jul 2025 10:15:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: pmc: Add Lenovo Yoga 6 13ALC6 to pmc
 quirk list
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 Shyam-sundar.S-k@amd.com, ilpo.jarvinen@linux.intel.com
Cc: Adam Berglund <adam.f.berglund@hotmail.com>,
 platform-driver-x86@vger.kernel.org
References: <20250718172307.1928744-1-superm1@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250718172307.1928744-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Jul-25 7:23 PM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> The Lenovo Yoga 6 13ACL6 82ND has a similar BIOS problem as other Lenovo
> laptops from that vintage that causes a rather long resume from suspend.
> 
> Add it to the quirk list that manipulates the scratch register to avoid
> the issue.
> 
> Reported-by: Adam Berglund <adam.f.berglund@hotmail.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4434
> Tested-by: Adam Berglund <adam.f.berglund@hotmail.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans




> ---
>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index 131f10b683088..ded4c84f5ed14 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -190,6 +190,15 @@ static const struct dmi_system_id fwbug_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
>  		}
>  	},
> +	/* https://gitlab.freedesktop.org/drm/amd/-/issues/4434 */
> +	{
> +		.ident = "Lenovo Yoga 6 13ALC6",
> +		.driver_data = &quirk_s2idle_bug,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82ND"),
> +		}
> +	},
>  	/* https://gitlab.freedesktop.org/drm/amd/-/issues/2684 */
>  	{
>  		.ident = "HP Laptop 15s-eq2xxx",

