Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAE1273D8D
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 22:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777846454; cv=none; b=dFcXW8foHmCNO4WSuZLLjhfZBUjFEUVmk6aR3k5U59rM3A0/2q9FBONUXmMs8Gn97kXwzU5JofcLCIQsQMYuy/g13vc22k9ZJ3go6zzBPiHwk83me06I3WT5+UX+6oeibMFwH6DiLYjyiqtHZC8XNIK/HMeO0ZrNvx8u3ZGp4xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777846454; c=relaxed/simple;
	bh=HjwHFxGcu8/7rRWiYOddktvoQEDTk+UlwUCJ/ilf8iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bd11MYOgk0m0ugV7cTRwxnZSvHGhSGLtLRnx1ph/Y6A/uW8K5ZqwhTHbG1RfFfphQWUn0AJ5BGbHrzibcr+gPG2w2DAXoExvyqhNG9bfve26V7B5xnEIYZBLn+3ygdUP6qLjqDHY9h42rwuylAz5OYlNYSATVmIW7ub+9vTae2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GQbaXXLt; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GQbaXXLt"
Message-ID: <6460ef7c-b4d9-4106-95cc-35710b4798bb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777846450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hdmCk1bI5zMjSNP1BA4Im5AlgYEGParDhws3/UDvYHI=;
	b=GQbaXXLtDAuP8vu2GEurxp+O8g4RpUTyPXh5PVCyIiAPwHa2NTrUGy5dV29DgZeUHFufsx
	vma3ADrXM6xY7YgtkGQdIs2XP10bk/1CYDL8cFVHrY1aQvtxkX7Y1n353e6J+TJx60JayN
	JCHXbSAHaT+FyOPkefYerr5MtY7CRHw=
Date: Mon, 4 May 2026 00:14:07 +0200
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
Maybe this is right to get downgraded, but still no debug: I think info is better,
but I would like to hear from Luke what this is about.

Denis
>  		return;
>  	}
>  
