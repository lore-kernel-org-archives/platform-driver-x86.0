Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF723EAB0
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 21:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843428; cv=none; b=XWEdUaljWyie0iTSkxjRWcpt5BtxN12T/lWprHpucpaS0Q4r4OEAyHLZ8ckee3RE3KbNfIgvJDcESR1b+nZY6VPEXgzVxZ7w3MsWHR6AuKt4yvD0UYgiaW/I0Eff+Ck2SbKR3AX7IxIE1eaiFhrLo5Bsr357DORqiyiRlmoRUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843428; c=relaxed/simple;
	bh=q3HnlSljT1KCV9S+3RlpFqdso8EJ3o3rx7XgscrLDp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gW224fOYJS9Vjv74oN8IgSsqBNtaCKSW4Ouikf7svg82dr5oINACcag7B3Z17ZJFwdiXakHqI28LEHvdGMtgLk2HGmBDh+wqcGGXgIIl4xnrjQ4obyzjlqhArWvXZdxOcNvlyEDqxnRoysnMn0XFR5mDf7/163yN+7ESDx49V38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SzoVMtHl; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SzoVMtHl"
Message-ID: <93850129-bb0d-45e7-9708-2a84cd8037ea@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777843415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l+1q1hA2ospgMSihd1iMQ2V58g8S4yVx3dguQcD5l0Y=;
	b=SzoVMtHle1SBwakV84GoHIOqqP8OyyO3Ua7/6+whos6GllIw2C1r8V1ZUkzvVmSA7LfyjW
	QlC3xxvMyiTpKVpOcVvPoY7eWO5o714g0CXRxlCAw0Ul7+DJQ/L/EXNFgQzaGjJm0C7In4
	L0ViOPxDeAs6yxAZP0HmsosAa4krv7A=
Date: Sun, 3 May 2026 23:23:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-armoury: downgrade missing power
 limits warning to debug
To: Armandas Kvietkus <armundunelis@gmail.com>, luke@ljones.dev
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 fxzxaxon@outlook.com
References: <20260503175734.27795-1-armundunelis@gmail.com>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260503175734.27795-1-armundunelis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/3/26 19:57, Armandas Kvietkus wrote:
> When a system is not found in the power_limits DMI table,
> init_rog_tunables() emits a pr_warn() and returns. This is
> expected behaviour for hardware that does not support ROG
> power limit tunables, not an error condition.
>
> Downgrade to pr_debug() to avoid spurious boot noise on
> unsupported systems while preserving the message for debugging.
>
> Reported-by: fxzxaxon@outlook.com
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221441
> Signed-off-by: Armandas Kvietkus <armundunelis@gmail.com>
> ---
>  drivers/platform/x86/asus-armoury.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 5b0987ccc..c8e9ff89f 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -991,7 +991,7 @@ static void init_rog_tunables(void)
>  	/* Match the system against the power_limits table */
>  	dmi_id = dmi_first_match(power_limits);
>  	if (!dmi_id) {
> -		pr_warn("No matching power limits found for this system\n");
> +		pr_debug("No matching power limits found for this system\n");
I don't agree with this: most distro suppress debug and this warning is very handy to understand what's wrong when people report "missing sliders".
>  		return;
>  	}
>  
