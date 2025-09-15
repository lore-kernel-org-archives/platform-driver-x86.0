Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA8927FB26
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 19:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757962810; cv=none; b=Gktt5eKEotOsTL51a8v52HJcmMoSGXUz5dVb+x6yq4erWq0LESgH+lXvfQ6ZmhRmJENaaUE/QOIfPfAp4WKvtd/tinosdCSlTaBWS+2gbYOtD2XKkRPqqlgWGwUechBG1xPWmZ0lET3MNnM5o1PKjhLo592bUAIP7fg09lCkbKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757962810; c=relaxed/simple;
	bh=0UD6wTDYTpdc9UfblAwhnWUlWW2Y9Pu7He2P3JILyUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLnJYLOZI5EW02NZHAjn+gyT7uXboY5eTFmlCiT1xekUsZy0BJtjfQ9azGcIvRyD+S39zrB/vj+GCEa0dtTixBwzHRYJ6rTRO6JCnc9dJh0w0DKPtzLqoNXCpeyTOj30mblaMYlqs7xNivfaklGgFJ+FFiA154Qb+MTHm4coJ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNJakRy0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNJakRy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26861C4CEF1;
	Mon, 15 Sep 2025 19:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757962809;
	bh=0UD6wTDYTpdc9UfblAwhnWUlWW2Y9Pu7He2P3JILyUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UNJakRy0FI7ifq8wMYqR0jfcvmL5eSEhEhbZ0OSxrQASoHOdqIB8WSkCfgTrEKrpL
	 w8mAfnUat5Q9hIXWazbJZp5JT+7aTap1SytjVvoT3wbuTQndkLsj2aMZB8zFo+LWbM
	 mDB0iScfQt2J2lKZw/O+tCrRXkvTw4iTagQtjy0DSa6xT6QP6IdDZr1VGbeOvN4Y0f
	 h70swUt6zYe7IdE+P00kQkKjrQL/z8leHgtTtPZBiGoNfdBOjVFRSysH0bZdivFXf9
	 UPECedn/HNA0PElUeDH2QvcP8jDQVcDU5gJG0c6dydnw7sETN+QLMTaYAoIFbmsmNC
	 MtBAKc/slQSxw==
Message-ID: <9c25dc53-aff7-4ecb-b3cd-9ed9ed8cac23@kernel.org>
Date: Mon, 15 Sep 2025 14:00:08 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/dell: Set USTT mode according to BIOS after
 reboot
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, lsanche@lyndeno.ca,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Yijun Shen <Yijun.Shen@Dell.com>
References: <20250915094154.2765361-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250915094154.2765361-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/25 4:41 AM, Shyam Sundar S K wrote:
> After a reboot, if the user changes the thermal setting in the BIOS, the
> BIOS applies this change. However, the current `dell-pc` driver does not
> recognize the updated USTT value, resulting in inconsistent thermal
> profiles between Windows and Linux.
> 
> To ensure alignment with Windows behavior, the proposed change involves
> reading the current USTT setting during driver initialization and updating
> the dell-pc USTT profile accordingly whenever a change is detected.

No need to refer to "this change" or "proposed change" in a commit message.

> 
> Cc: Yijun Shen <Yijun.Shen@Dell.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/dell/dell-pc.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
> index 48cc7511905a..22248cfe21c5 100644
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
> @@ -237,6 +239,28 @@ static int thermal_platform_profile_probe(void *drvdata, unsigned long *choices)
>   	if (supported_modes & DELL_PERFORMANCE)
>   		__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>   
> +	/* Read current thermal mode from the BIOS and set the mode explicitly */

It's got to do with extra ACPI actions that happen "by the act" of 
setting a profile, right?

I think it's worth explaining in more detail in the comment /why/ this 
helps so it doesn't get removed some day in the future as part of an 
optimization.

> +	current_mode = thermal_get_mode();
> +	if (current_mode < 0)
> +		return current_mode;
> +
> +	switch (current_mode) {
> +	case DELL_BALANCED:
> +		thermal_set_mode(DELL_BALANCED);
> +		break;
> +	case DELL_PERFORMANCE:
> +		thermal_set_mode(DELL_PERFORMANCE);
> +		break;
> +	case DELL_COOL_BOTTOM:
> +		thermal_set_mode(DELL_COOL_BOTTOM);
> +		break;
> +	case DELL_QUIET:
> +		thermal_set_mode(DELL_QUIET);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +

Why even have the switch/case?  If thermal_get_mode() returns an invalid 
value you already will return current_mode.

IE I'd think it's as simple as:

/*
  * Make sure that ACPI is in sync with the profile set by USTT.
  */
current_mode = thermal_get_mode();
if (current_mode < 0)
	return current_mode;
thermal_set_mode(current_mode);

>   	return 0;
>   }
>   

