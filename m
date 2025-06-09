Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA4C2F37
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465500; cv=none; b=lKS6pHiKSyFggyaWmP0scITcp4H4I+Tnr2+9rL2O9vCmgqDaSmZFQuMJpi0X9QZagdepR0sl7Fp3/kLgxCtZknVdbeXurdFoAc0JVjATAohuZWhPvZagjyFFL+Z9YZa0xdgPF1SdOgUdsdVaKjVQN0AU6vc/5i85VLlKRm33o9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465500; c=relaxed/simple;
	bh=HJzpTOk30GLt01QZBk9QchykgtPdT0CrRDJWQzcHYag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=daLFX5WpUXF+BFNOrTrW5O9IvFY/AgWIvRN/GrUSp+aqTBKU3LuPj9p9u/xoxEmWE1F6Kj9qRbOWnSTOEmyYAYEeSVsU5edYKYdmibCodYX+Btq9RauDNjUNcMp2wNymzEuhywHBDVO7U5dxaWcyG7rILaaH05K+JixNiNUtn5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udypLYT4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udypLYT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D82C4CEEB;
	Mon,  9 Jun 2025 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749465498;
	bh=HJzpTOk30GLt01QZBk9QchykgtPdT0CrRDJWQzcHYag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=udypLYT44LAqrMrBqBCWMTIYe7V6OWnOtkdQShnwNnxoj7EXeukPL19IoO8YsFI9n
	 5zq4OfIeI3VZ6LarB79A8aydK+aeZ79+aYc7KNKLguArKshpytgmkWHiuxCj4OosMZ
	 A8CDOJjxeGZm7t5Kty4erjFU9Ckk48bGjHRldjy4bVfSgJREHAiZQmxU9cpOrFvTkM
	 Z+OfObUCRwtouDTBb7qPwY/3BljlybwbR9ylp2qp+NoPSlLfHaCM2km/km+BPnm6r6
	 wtYopj96OQYrxRK2KTTJDGCqV59RioZSMYpW/00DfhhCRWp5IgibY+pH/Ze5jL4Tj1
	 lRaC6ViXh9W8g==
Message-ID: <03f5964a-24ff-414c-b0d1-a7e940545ed5@kernel.org>
Date: Mon, 9 Jun 2025 12:38:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: fujitsu: clamp
 charge_control_end_threshold values to 50
To: Jelle van der Waa <jvanderwaa@redhat.com>,
 Jonathan Woithe <jwoithe@just42.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20250609102115.36936-1-jvanderwaa@redhat.com>
 <20250609102115.36936-3-jvanderwaa@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250609102115.36936-3-jvanderwaa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Jun-25 12:21 PM, Jelle van der Waa wrote:
> Follow the sysfs ABI documentation that drivers should round written
> values to the nearest supported value instead of returning an error.
> 
> Tested on a Fujitsu Lifebook U7720.
> 
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans




> ---
>  drivers/platform/x86/fujitsu-laptop.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index c8aeb28a783c..f6a4a02e8d44 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -187,9 +187,12 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	if (value < 50 || value > 100)
> +	if (value > 100)
>  		return -EINVAL;
>  
> +	if (value < 50)
> +		value = 50;
> +
>  	cc_end_value = value * 0x100 + 0x20;
>  	s006_cc_return = call_fext_func(fext, FUNC_S006_METHOD,
>  					CHARGE_CONTROL_RW, cc_end_value, 0x0);

