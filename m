Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAD63115B5
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562657; cv=none; b=kz+nux9JFJTBKvkbZUwu/ClhDyilKAfR6eAlas07MGjn5h6HJJxQaNbBBW0lx0tHR5XEX1594gP5v7LXsNNm6QfYJI1abFp2mOdkGAFbP3ktLtAm8qF51hzcTDIhPfcz0AXOtjrImXCHIH5fiD3nSBe/Hg7/nfuZeAYqZNCRA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562657; c=relaxed/simple;
	bh=Bq8/fRw639rCW6+eWu07+5vIGdWIO8XkjEf6OgncttQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPOgA/ShqO4H9ABOSyivKqpSQp20+fo7TTIlk44vnx7bSm55DstikzNb7QRsFsRi5fBEO0F8AQLp34BhjKQve/tvzYrytZfI2Kmekaed3JsVh1GLtzJutfg2KzlPcm6qiRrLb7Jfiy6zk2Yy0Ba2xaEOKcy1rOC9y0fjRNC+9OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GE9x2nWM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GE9x2nWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4834C2BC87;
	Wed, 19 Nov 2025 14:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562656;
	bh=Bq8/fRw639rCW6+eWu07+5vIGdWIO8XkjEf6OgncttQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GE9x2nWMXMkAr0T05p+7XJT0afLlZK2QZTG59TS5wdV3D79Tn+wACmT0SXA/ofUPb
	 2pk3/sbqWwe5z9MDSyqzMm2BmMjf+jP6UzQdfBjnUh/HsyEjUxY5R/0au9q7UBux9T
	 TxtdIQCKx9tkygIUOgYY0v4csB7Af2sTxCp/T/6DE4RXwTl43L24aAOemAg1tgGSlx
	 U+n675gV97q2j2gRTnQDZHdN6vKIAVUL/kEL1WIq31bxCxacH7oGfYrT823i5OwnJU
	 KW0iZsUarSDDGAM1+wbUW5/S8kzcWm3sHIGkYdScpZT69xluvfvIK5MAd3NMpFJaNA
	 nOZD4TkHmbjaw==
Message-ID: <59882570-5aa8-42cd-8821-87aba696e3e9@kernel.org>
Date: Wed, 19 Nov 2025 08:30:54 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] platform/x86/amd/pmf: Use devm_mutex_init() for
 mutex initialization
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20251119085813.546813-1-Shyam-sundar.S-k@amd.com>
 <20251119085813.546813-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251119085813.546813-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 2:58 AM, Shyam Sundar S K wrote:
> Replace mutex_init() with the devm_mutex_init(), to ensure proper mutex
> cleanup during probe failure and driver removal.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
> v4:
>   - New patch spinned off from v3
> 
>   drivers/platform/x86/amd/pmf/core.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index bc544a4a5266..2ec4cb92e34f 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -465,9 +465,17 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   	if (!dev->regbase)
>   		return -ENOMEM;
>   
> -	mutex_init(&dev->lock);
> -	mutex_init(&dev->update_mutex);
> -	mutex_init(&dev->cb_mutex);
> +	err = devm_mutex_init(dev->dev, &dev->lock);
> +	if (err)
> +		return err;
> +
> +	err = devm_mutex_init(dev->dev, &dev->update_mutex);
> +	if (err)
> +		return err;
> +
> +	err = devm_mutex_init(dev->dev, &dev->cb_mutex);
> +	if (err)
> +		return err;
>   
>   	apmf_acpi_init(dev);
>   	platform_set_drvdata(pdev, dev);
> @@ -491,9 +499,6 @@ static void amd_pmf_remove(struct platform_device *pdev)
>   		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
>   	apmf_acpi_deinit(dev);
>   	amd_pmf_dbgfs_unregister(dev);
> -	mutex_destroy(&dev->lock);
> -	mutex_destroy(&dev->update_mutex);
> -	mutex_destroy(&dev->cb_mutex);
>   }
>   
>   static const struct attribute_group *amd_pmf_driver_groups[] = {

