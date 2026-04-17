Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2E728751B;
	Fri, 17 Apr 2026 12:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776427309; cv=none; b=LaiGSk78LnH3SXWDjGL5hBFq1Ztrm98V7t2I/VQkCQK2fQYCMxU7z6e5DVl4ScDQGiEB65LcZjPfakBHPEXOnApULZ5dLfH8w1pqvRIVn26lXBzXUagSHnYZ8WXKAgqYr4ahMIYmA9n1X0pF1aEKRNxu4JFypW6L8zrSJDO9e2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776427309; c=relaxed/simple;
	bh=9kzoK89MQbjxjwiUeoRCkdxsSIg5Yv6mHb3S+ayQ+GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcutM9G+qOQu7NQWPAU/LcxTroV7/PwVRKnC1pOzOAjcenuHTlpHU3ahkOF87q256cMat0RZs/K1jMyjZ9OMH1FeEbqGmrMPBjodvys2/Ay4i4Ks09c4o7bMZJE3aosYRwDAGZBxqwtm8NjT7eEk6Gb9zweWr38t15RaM49VI30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=b2+KYp2o; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="b2+KYp2o"
Received: from [192.168.178.25] (i5C75F434.versanet.de [92.117.244.52])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 83EE82FC004D;
	Fri, 17 Apr 2026 14:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1776427295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3dLK4eU6z7vMEnuf0JobG3+6xOvM9azdxXLOsJHOqn4=;
	b=b2+KYp2oHakoO0FY7tqgIHj5P8qfU5WHE0XqJjRYPJK9PU2KbCa9J+dUiQBVqG9osx8wLc
	4ansnuhOti3Vn4zE1dx/bAV51HdJUR/lMnhXDQYkZCM8WLCH/F5x0CCUMvdQgXAmur3M1J
	rMVod5L8WJjv5pwYVHpIeN0YOAJvgv0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <94ea1b26-0d8a-446c-b7ae-5c31d5346076@tuxedocomputers.com>
Date: Fri, 17 Apr 2026 14:01:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] platform/x86: uniwill-laptop: Fix behavior of
 "force" module param
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260417050912.5582-1-W_Armin@gmx.de>
 <20260417050912.5582-4-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260417050912.5582-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Am 17.04.26 um 07:09 schrieb Armin Wolf:
> Users might want to force-enable all possible features even on
> machines with a valid device descriptor. Until now the "force"
> module param was ignored on such machines. Fix this to make
> it easier to test for support of new features.
>
> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 5551f193c2c1..7c7ea0e76966 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2481,8 +2481,6 @@ static int __init uniwill_init(void)
>   		if (!force)
>   			return -ENODEV;
>   
> -		/* Assume that the device supports all features */
> -		device_descriptor.features = UINT_MAX;
>   		pr_warn("Loading on a potentially unsupported device\n");
>   	} else {
>   		/*
> @@ -2500,6 +2498,12 @@ static int __init uniwill_init(void)
>   		device_descriptor = *descriptor;
>   	}
>   
> +	if (force) {
> +		/* Assume that the device supports all features */
> +		device_descriptor.features = UINT_MAX;
> +		pr_warn("Enabling potentially unsupported features\n");
> +	}
> +
>   	ret = platform_driver_register(&uniwill_driver);
>   	if (ret < 0)
>   		return ret;

looks good

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

