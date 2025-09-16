Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B18584E07
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028552; cv=none; b=AiS4sM3LoyEwXHcN1mPEyAzxGyu4YG4RJryHRZRjcotXUc+MHSo1wh2BKJ4QL6a+tFWWN4VZ8SKFCNRkW7DsPF6hVQ+l0iD8pBIeRozyd0dZpi21hKuJI/T4dG+Xr29Rqflz0++sqVNKutx53kWa62w3MMnL3PRP6g5djBhOvos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028552; c=relaxed/simple;
	bh=NQEJRwelctKlLZAsNK+8RP8WjLOkD6aKBW51bjbCe7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWFomkJem/ArQ+k8aOOhaJyejeG2gD/IQSD55s2Ki+jhBaIUJjw+KmzfXE9N6KFaINCScGVElspNmqyByvajibksZGwVGjxXPAxZEJuVY0fEGjIXr3P0F4CPmKY2FqlPEG9sUA8B/jytcb4z4uzkctvZo2usEA+cmoPf3rbge5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eG+ZgEd8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eG+ZgEd8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773DCC4CEF0;
	Tue, 16 Sep 2025 13:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758028552;
	bh=NQEJRwelctKlLZAsNK+8RP8WjLOkD6aKBW51bjbCe7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eG+ZgEd8+184j/P9PgtBqVOVFIxiTps7Y6Irur9Jd0iHXqvPf8Kq0X2MRKNNLcMnM
	 fsRRFfvzVvZ9Kz3EfXxwf6FY4qZekdbBXpWA8aXhIxhR9jrmlYDWAVlHGCImSjnyvV
	 x+F+aAsmqBC3FRF39oNqb7r8HUmBnzAtysRO7xBBJQtQ7pz/6jWjJjzArNRxI6Uekx
	 EvnO8UhfkB2/eL2T5iay/exlDFezE/V5Z9290exgFlylCy4lIid+FZLjJTgqqSiLFS
	 njYOAwTQ1dejSfL2gLs4i6xE8ET2zuwD0atZ2KpJLve+vHBaixxQGG8kqLcRE9jr2b
	 yr9XBl8mKVCFQ==
Message-ID: <907c1952-5aea-42f3-9a13-71e2044d406e@kernel.org>
Date: Tue, 16 Sep 2025 08:15:50 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/dell: Set USTT mode according to BIOS
 after reboot
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, lsanche@lyndeno.ca,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Yijun Shen <Yijun.Shen@Dell.com>
References: <20250916115142.188535-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250916115142.188535-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/25 6:51 AM, Shyam Sundar S K wrote:
> After a reboot, if the user changes the thermal setting in the BIOS, the
> BIOS applies this change. However, the current `dell-pc` driver does not
> recognize the updated USTT value, resulting in inconsistent thermal
> profiles between Windows and Linux.
> 
> To ensure alignment with Windows behavior, read the current USTT settings
> during driver initialization and update the dell-pc USTT profile
> accordingly whenever a change is detected.
> 
> Cc: Yijun Shen <Yijun.Shen@Dell.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/platform/x86/dell/dell-pc.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
> index 48cc7511905a..becdd9aaef29 100644
> --- a/drivers/platform/x86/dell/dell-pc.c
> +++ b/drivers/platform/x86/dell/dell-pc.c
> @@ -228,6 +228,8 @@ static int thermal_platform_profile_get(struct device *dev,
>   
>   static int thermal_platform_profile_probe(void *drvdata, unsigned long *choices)
>   {
> +	int current_mode;
> +
>   	if (supported_modes & DELL_QUIET)
>   		__set_bit(PLATFORM_PROFILE_QUIET, choices);
>   	if (supported_modes & DELL_COOL_BOTTOM)
> @@ -237,6 +239,13 @@ static int thermal_platform_profile_probe(void *drvdata, unsigned long *choices)
>   	if (supported_modes & DELL_PERFORMANCE)
>   		__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>   
> +	/* Make sure that ACPI is in sync with the profile set by USTT */
> +	current_mode = thermal_get_mode();
> +	if (current_mode < 0)
> +		return current_mode;
> +
> +	thermal_set_mode(current_mode);
> +
>   	return 0;
>   }
>   

