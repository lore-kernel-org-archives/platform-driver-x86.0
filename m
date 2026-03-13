Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DA7185B48
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 01:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363630; cv=none; b=i+odLYQV7klBtylc1lZyC5sO/GrLQpTGgIyj1XCZGaz9IlSywNYqXz4nCByrXj1+3Y4eUPMhY9fV9FrvMwLNaF7hwGneOHEIODhpvTZRMkz3d+RbTyKTdWzYdtMenpckMkdcxNJToO4+r/1/1tPrTq89w9UPmFEKcPMzM6Eg7/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363630; c=relaxed/simple;
	bh=nh/Rq4Ngk3bj3FxBubJPP5QDcTSM+xZkPq2cv2XG8hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcUk6zgZM2NflVWrSO/9aJBrW0gLxVc+DPxLOXv952tLQqZL/ol+gkplDL02gWmuaBwpgjJvXl2pIaoojTz1zLKYIjG63IfPLgq0G715hS+sHdzZT29iFNRBp87OU3oBkY92fSVZtz6mw2S3Cj4U05xVuMWddMjIKOteWZNRiVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vAkV1mkf; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vAkV1mkf"
Message-ID: <c6e2d0b7-6481-4205-981f-9dca19e53ce8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773363627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hu/+m1U3+g44cX/57a6NEFfZto2gnptAt5uCbpDCXrw=;
	b=vAkV1mkfT5+z7jZ50ihm0pHwQ+9HfXfPmo2h8z2Oq5JwLvPl68MC5QYClHoU5OLjCfqJB0
	M+VcN68UXg9nAWDmwq/F3MQ5pGXM7fSyUnXLtDKEMF51FsTP5OW1a0M3NG8hm5kpkadl/Y
	C+4mreee76EvGGgdl0yQI/UxtSRDkfw=
Date: Fri, 13 Mar 2026 02:00:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for GZ302EA and
 GZ302EAC
To: Matthew Schwartz <matthew.schwartz@linux.dev>,
 ilpo.jarvinen@linux.intel.com, Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260313004939.4103835-1-matthew.schwartz@linux.dev>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260313004939.4103835-1-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 3/13/26 01:49, Matthew Schwartz wrote:
> Add TDP data for tablet models GZ302EA and GZ302EAC.
Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> ---
>  drivers/platform/x86/asus-armoury.h | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index 208f6fe16168c..c8ef8a68ffcd0 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -1518,6 +1518,35 @@ static const struct dmi_system_id power_limits[] = {
>  			},
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "GZ302EA"),
> +		},
> +		.driver_data = &(struct power_data) {
> +			.ac_data = &(struct power_limits) {
> +				.ppt_pl1_spl_min = 28,
> +				.ppt_pl1_spl_def = 60,
> +				.ppt_pl1_spl_max = 80,
> +				.ppt_pl2_sppt_min = 32,
> +				.ppt_pl2_sppt_def = 75,
> +				.ppt_pl2_sppt_max = 92,
> +				.ppt_pl3_fppt_min = 45,
> +				.ppt_pl3_fppt_def = 86,
> +				.ppt_pl3_fppt_max = 93,
> +			},
> +			.dc_data = &(struct power_limits) {
> +				.ppt_pl1_spl_min = 28,
> +				.ppt_pl1_spl_def = 45,
> +				.ppt_pl1_spl_max = 80,
> +				.ppt_pl2_sppt_min = 32,
> +				.ppt_pl2_sppt_def = 52,
> +				.ppt_pl2_sppt_max = 92,
> +				.ppt_pl3_fppt_min = 45,
> +				.ppt_pl3_fppt_def = 71,
> +				.ppt_pl3_fppt_max = 93,
> +			},
> +		},
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "G513I"),
