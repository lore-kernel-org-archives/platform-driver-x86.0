Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC76D20DD51
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 12:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781440448; cv=none; b=COKjXco5zd/YkOe54quOyCBbW/w95c/T4dXc+kizxssqYHhLWsQLFv/6+Mv5jvrm2sLOofo9IQP5WVr1jj5y1O7pKVl5Vu2KYo/yI3BQBZ3xrFel4dHtHbKfM8pjdDamNvUBzzNys6YfJqKhD3RPFJ5mlvkoAhtlUrxBJszIR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781440448; c=relaxed/simple;
	bh=eeTQBexZMFEriKQRBUt0UdjKhevDmlufCyXn9I+nhNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMjuIVBVECBgPjlJaqVQA/1z9pvL1F9y5S0cfz7TU48DIw6kD4UE9cXsDGoECiM5ZBzTvnlaj0mZT1m6R1ht/fpPVKVN59BK9cjaEdhE9CXri8K6iTcKctAOC6cOE4RmahU1761Tpdvu0tweRjhBhbSm1aiC9A8zQgZVFYCK3uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QbuqxH1a; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QbuqxH1a"
Message-ID: <524bc16a-6a66-4b2f-8aa6-6a4b0bc31f09@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781440434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCRya8RJjD+FTD3xKv0GALIzWAmdXRDC7PQQUx6xNSU=;
	b=QbuqxH1a3cr2eBJnpARrCv6PqA1RJzJkH8d+/kyqFne1ie+46id/EbSVlzfYotIx+Vrpuz
	epHMe4lUGZOc+T01dF9/Lsp0M1+Swl077QNbosVwr4HHeFbfSCF6yZBU364PjNPoJfyniE
	tVp1F+ulqyoO+QFQ6KvJ5oz3e2kCkls=
Date: Sun, 14 Jun 2026 14:33:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] platform/x86: asus-armoury: add support for G614PR
To: Marco Scardovi <scardracs@disroot.org>, ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, hansg@kernel.org, linux-kernel@vger.kernel.org,
 luke@ljones.dev, platform-driver-x86@vger.kernel.org
References: <178119015973.12014.6231948241278781864.b4-ty@b4>
 <20260614084423.50723-1-scardracs@disroot.org>
 <20260614084423.50723-2-scardracs@disroot.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260614084423.50723-2-scardracs@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/14/26 10:44, Marco Scardovi wrote:
> Add TDP power limits and fan curve requirements for the ASUS ROG
> Strix G16 G614PR laptop model.
>
> Add the corresponding DMI board name matching entry ("G614PR") under
> the power_limits table in asus-armoury.h, populating the AC and DC limits
> based on the platform's hardware specification.
In general all these data have been posted in the ppt data collection thread
in form of screenshots (and I'd like to have yours too for future reference).

Your model isn't posted there, so I assumed these values were what is available
to you on the official windows app, if so the previous one has to be kept
unless you find an explanation of why what is see is different from
what you expect to see.
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/platform/x86/asus-armoury.h | 34 +++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index 692978b61959..c2df2381a260 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -1898,6 +1898,40 @@ static const struct dmi_system_id power_limits[] = {
>  			.requires_fan_curve = true,
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "G614PR"),
> +		},
> +		.driver_data = &(struct power_data) {
> +			.ac_data = &(struct power_limits) {
> +				.ppt_pl1_spl_min = 30,
> +				.ppt_pl1_spl_max = 120,
> +				.ppt_pl2_sppt_min = 65,
> +				.ppt_pl2_sppt_def = 140,
> +				.ppt_pl2_sppt_max = 145,
> +				.ppt_pl3_fppt_min = 65,
> +				.ppt_pl3_fppt_def = 140,
> +				.ppt_pl3_fppt_max = 145,
> +				.nv_temp_target_min = 75,
> +				.nv_temp_target_max = 87,
> +				.nv_dynamic_boost_min = 5,
> +				.nv_dynamic_boost_max = 25,
> +				.nv_tgp_min = 65,
> +				.nv_tgp_max = 115,
> +			},
> +			.dc_data = &(struct power_limits) {
> +				.ppt_pl1_spl_min = 25,
> +				.ppt_pl1_spl_max = 65,
> +				.ppt_pl2_sppt_min = 25,
> +				.ppt_pl2_sppt_max = 65,
> +				.ppt_pl3_fppt_min = 35,
> +				.ppt_pl3_fppt_max = 75,
> +				.nv_temp_target_min = 75,
> +				.nv_temp_target_max = 87,
> +			},
> +			.requires_fan_curve = true,
> +		},
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "G615LR"),
