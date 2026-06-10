Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E554F30DEA6
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114048; cv=none; b=EWcihj7w/KDn/MT3NpCKsT2JN2pwyse8Qv/CirG4qPmDprbeF/Vz7Wm9zO9nblrrBhrxiTV0UmG/6zB/eKleCBvfYVjxvz5WZlYggayhPs+Kfa9xUTQxdeD5CAoV/+80Ay2Pn/1Gtsjeej7GUITJjPaKfXZ3qatepnKHktTM0mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114048; c=relaxed/simple;
	bh=n9nskOzbK0URHlfNoKM4aLcXkgyIBP0i+L6iHtWJVNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTfrveMJiFhcQau43GIcf+tpDYaSWDgntvgxu6YesNVwipqShgHBfIYcG978/7qqF0mB0ehmExBvod+0zF+jf51erAsEqGQS7ViVodKxnKSXH7MlvMGpIpCeYKGCI6JfYRiDwBaBhDU1zpK3Ej5R61edMu0VwuNK7lhfrWzfzHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lhRlb+/G; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lhRlb+/G"
Message-ID: <e0c775f3-8eb7-41b8-a4c5-d5275a59a2eb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781114043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkq63pSL9qX9/FajbJ3bwK0H9uMytJC5Ee7L381CpUU=;
	b=lhRlb+/G2/u5yVxT6AkLUyCrE1LFecIN0q15tyvOf0yEB7ROEkGxHKyf2an/Xrj1d6TglM
	KnrIMguKaZAAtDW+4ljfc4jmVgOxBMsaN/33yfGORuDDYgW7Ye6W767CslkclM5xhoI7hS
	n/lF822vvHd//ZzebVVc5Mn38rgtmPM=
Date: Wed, 10 Jun 2026 19:54:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for G614PR
To: Marco Scardovi <scardracs@disroot.org>, "Luke D . Jones"
 <luke@ljones.dev>, Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610152130.25892-1-scardracs@disroot.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260610152130.25892-1-scardracs@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/10/26 17:21, Marco Scardovi wrote:
> Add TDP power limits and fan curve requirements for the ASUS ROG Strix
> G16 G614PR laptop model.
>
> The ASUS ROG Strix G16 G614PR requires specific AC/DC power limits
> (PPT PL1/PL2/PL3, dynamic boost, and NV TGP targets) to function
> correctly under various power profiles. Without these limits, the Asus
> Armoury driver cannot configure the correct power envelopes or enable custom
> fan curves, leading to suboptimal performance or noise management.
>
> This patch adds the corresponding DMI board name matching entry ("G614PR")
> under the power_limits table in asus-armoury.h, populating the AC and DC
> limits based on the platform's hardware specification.
Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/platform/x86/asus-armoury.h | 34 +++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index 692978b61959..5be34b6a92db 100644
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
> +				.ppt_pl1_spl_max = 90,
> +				.ppt_pl2_sppt_min = 65,
> +				.ppt_pl2_sppt_def = 110,
> +				.ppt_pl2_sppt_max = 125,
> +				.ppt_pl3_fppt_min = 65,
> +				.ppt_pl3_fppt_def = 110,
> +				.ppt_pl3_fppt_max = 125,
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
