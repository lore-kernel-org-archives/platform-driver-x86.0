Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9463647729B;
	Mon, 28 Sep 2026 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591708; cv=none; b=OQKnqD+T37wPywu2eLdkeXEw7+7FifCyZgKMqIqQaB4Zxrhu4lgxn4aSDP92Se68WnFTt6pBOZh1R+2pUW/cReKzpl0Juf8u1lCU5bCTUamrR+oteops6J/ZnUEIkMRgKhU+RxI5RMxT827PdohtUnhV56MOPJJsgQjhHsb50BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591708; c=relaxed/simple;
	bh=f1L2zvaqU00VG4C9XQuzKTHqP0iA0spijFFOfh9O7+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aK7Ty71CuJbbGygSsoTHy/yJhld3scYKJitbvjnfPqNFs8dqsbzfO3yjKAkR9cbYrE4DSnOrCSGfBcisaqmLq6Sy+6D+ebqAhk1VmrJjTaJ1ivXS8FoZoh7YvSFS4h0w0zYscPXp+5PorLWOr/JopVzMqU+C4Yx982xx1xVeVgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhP/oQaQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhP/oQaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344AB1F000FF;
	Mon, 28 Sep 2026 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790591707;
	bh=SNs1MD8PLnFrjhsdxxRCKFaM+Li56vZt0Yc8Dkirilc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RhP/oQaQEbNFXE58+pfh5TeMbYxlqgW8QCokeNjd/Spmsf8EVE3RV+5ICTcWgrAmg
	 rKwFFMOc3QP1TnBsfmPOJ3jxDhEG5OkueBLicoyw+RWbAw4kYG4D7ClsG/Bzdv5p0k
	 rcObz7MmKIcPNNQ4tBkhe4/obnKKNfCLtR7ZFZa5MlzKD5/xLnQric7atR/4vwiqa3
	 uQWyD8D2V4RtlGhuLY7Kek4G9cCYflnby/R3T2DOvKmi209aSlCMO58+ArJ5YcyPFy
	 LrM3GQV7Qita6+V/kcweXdOxMD0ze9q6UBEO/QSsSalk6iX0SAU0GTVB1osm4j38bI
	 uMjobHntLVYaw==
Message-ID: <418bc18d-f6a4-4087-9e4a-5bb050bb91f4@kernel.org>
Date: Mon, 28 Sep 2026 12:35:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86: int3472: Add missing MSI Prestige 13
 IA+ Ukiyoe Edition
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20260927194345.1431026-1-sakari.ailus@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260927194345.1431026-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-Sep-26 21:43, Sakari Ailus wrote:
> Add an entry for the MSI Prestige 13 IA+ Ukiyoe Edition, which has the
> same camera configuration as the regular Prestige 13 AI+.
> 
> Fixes: 621e4f762ed6 ("platform/x86: int3472: Add more MSI AI evo laptops")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
> Compile tested only.
> 
>  drivers/platform/x86/intel/int3472/tps68470_board_data.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index c53542465fb4..466e949b1d14 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -506,6 +506,14 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  		},
>  		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 13 AI+ Ukiyoe Edition A2VMG"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-13Q3"),
> +		},
> +		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
> +	},
>  	{
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> 
> base-commit: c0a6d78dad3af1def80f04df82bfd70456ec406c

