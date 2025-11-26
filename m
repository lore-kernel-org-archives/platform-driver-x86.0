Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792BB32721F;
	Wed, 26 Nov 2025 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160140; cv=none; b=trbRfOOPer2KQS7HTY1e8m6rJFlatvXC45SuCCDv7hwms9j4glsIv/hgkyyYsAnW+kekch80R9M2BFe+0TcKY4ejWUke6jGMsTOirWRX2QQ/4ZJ8nMLIpWvSMVLWEHSM6oP4Rb98WetnOxEApUozV22nATCLPrPNNPsNgKMf6R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160140; c=relaxed/simple;
	bh=Ob6QmmWDh4oiB6gP8J9QjMFjK/AEovlZGaBM6iIehtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tXv+RrILHYCqZpGsMD/F2s1WuxddOzDlDbDWD6/4fRqL+Cpmh/g4QrFQjw655YZ8jqH+7hTpJA/cMjje4/dWHk8DrxVqkfaGe5JebJO6dTRz1dUqFGZEBapExvlQD4F89bWFLeztKZ2Tp4t0Wf+Kck4UMfuIEVQvYaWSS0IPnd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/HYW43V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/HYW43V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B93C113D0;
	Wed, 26 Nov 2025 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764160139;
	bh=Ob6QmmWDh4oiB6gP8J9QjMFjK/AEovlZGaBM6iIehtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r/HYW43V7mF+I82OwalGBXKAAsnW64//dqGt/1BpzVWUFDfgO+7pBsv8eCPQwA2zQ
	 o/u7y7tOv8l29xvXkz/+locaLv4m/7I4/AL++JDuSGiHPJyazLJUBqTqQ5CN/xb3gr
	 J+iSVztuF2t+I5m8i77tLnazWKpqsg/lsxKVqyXQfLaV6827TyPpI8Exz5/riOflo6
	 D26hKzwJtSy9xhapQ5sHF8/9ICfdO2a8oLvNCbw6lF75v+qZbwnCE5cXBruJWxUD7t
	 2mZrC7gUK2AYiq569njVzvzEi1DF74jmgkVJRJsYUXuRecj58NVTNVcYhFD7QgbPaP
	 JYiArrFV/E2cw==
Message-ID: <9b2dca55-1207-48a3-94b0-3efad1462d0f@kernel.org>
Date: Wed, 26 Nov 2025 13:28:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] platform/x86: serial-multi-instantiate: Add
 IRQ_RESOURCE_OPT for IRQ missing projects
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: ilpo.jarvinen@linux.intel.com, broonie@kernel.org,
 andriy.shevchenko@linux.intel.com, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, 13916275206@139.com,
 platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, letitia.tsai@hp.com
References: <20251126121911.10980-1-baojun.xu@ti.com>
 <20251126121911.10980-2-baojun.xu@ti.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251126121911.10980-2-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Nov-25 1:19 PM, Baojun Xu wrote:
> The tas2781-hda supports multi-projects. In some projects,
> GpioInt() was dropped due to no IRQ connection.

> See the example code in the cover letter.

Please don't do this, the example code is not that big, people
should not need to go and hunt down the example code, please just
add it to the commit message.

Also please use longer lines (wrap at 75 chars) for the commit msg
and please use empty lines between paragraphs to clearly separate
the paragraphs.

Regards,

Hans



> But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c),
> if looking for IRQ by smi_get_irq() fails, it will return an error,
> will not add new device, and cause smi_probe() to fail.
> So, we need to add an exception case for these situations.
> BTW, this patch will take effect on both I2C and SPI devices.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
> v4:
>  - Change the description for this patch.
> v3:
>  - Add IRQ_RESOURCE_OPT for IRQ missing cases.
> v2:
>  - Remove error ignore, change to AUTO compatible with NONE.
> ---
>  drivers/platform/x86/serial-multi-instantiate.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index db030b0f176a..1a369334f9cb 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -22,6 +22,7 @@
>  #define IRQ_RESOURCE_GPIO	1
>  #define IRQ_RESOURCE_APIC	2
>  #define IRQ_RESOURCE_AUTO   3
> +#define IRQ_RESOURCE_OPT	BIT(2)
>  
>  enum smi_bus_type {
>  	SMI_I2C,
> @@ -64,6 +65,10 @@ static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
>  			dev_dbg(&pdev->dev, "Using platform irq\n");
>  			break;
>  		}
> +		if (inst->flags & IRQ_RESOURCE_OPT) {
> +			dev_dbg(&pdev->dev, "No irq\n");
> +			return 0;
> +		}
>  		break;
>  	case IRQ_RESOURCE_GPIO:
>  		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
> @@ -386,10 +391,10 @@ static const struct smi_node cs35l57_hda = {
>  
>  static const struct smi_node tas2781_hda = {
>  	.instances = {
> -		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> -		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> -		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> -		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
>  		{}
>  	},
>  	.bus_type = SMI_AUTO_DETECT,

