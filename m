Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52340207A38;
	Wed, 26 Nov 2025 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764177592; cv=none; b=tpp3A1UNgOkSLLmdKGCdbLS5YXovMcbf6SNQZ/asZrWBRx/vwlOIp2b1dc+m5J65kyKaj1+WnTsS1kQb/vwqiDAukkuIJquOfH3yjKhYGi7M5JZF4DHESHoCy32RPepIjaAfTpoG+Zjt3FmJb9Idkh931cBXAM3oJ2umI5aB/DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764177592; c=relaxed/simple;
	bh=MlT02GQ7CMP/AT621MdmGurXzngpl0+HfAiTojvD0xU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hq5U2KNIDcssGatByKijlykk85RNlloGG6dgqWw24oCCMhU0W0RFbHt50GQxsLm98Zcx+7ZR9aFlQVFMp95EypFptvb8JzjMtoc7fsF7QqKsrShDzBenpoC24w3PAh1Wmzb0uiunjaoeScoLcyCPYUSsaT5g499p6TGVAhCjzEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAd/IPow; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAd/IPow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E43C4CEF7;
	Wed, 26 Nov 2025 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764177591;
	bh=MlT02GQ7CMP/AT621MdmGurXzngpl0+HfAiTojvD0xU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JAd/IPow1Fd0Vgk7KF9I3UzSzT0YyvuNv9p3wHuS38yi0HfAlIObXhSiZ+Ud8Bn/e
	 9VZlnnRHaRgVQcUDiGHKr4Twk0ofqV5UDUqqmS4bEnv+ozAFT7cqclsskJypZUH7d4
	 KkQdkLUJBOZytPr3gbP3YQ6/VUblazCzMnUbU9orciz3fxK2J6pEAYpJU3qBKc/28b
	 CW1H8Hv1oa70zt/BK6evRR9yfZaul8Q5UOVuAjUVD5TWzuXaFdTFR9LGBDhIgBpnHf
	 N8fNxwqzKNx4VHEPUbBJo4/pUdz2jkbtEyKTY4S8h3cDsj3IkEpE0hD91/Bl6KvUFQ
	 LxdgaIMIHLqVA==
Message-ID: <ce56da25-e8cb-4438-b75b-1dd32df10d89@kernel.org>
Date: Wed, 26 Nov 2025 18:19:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: serial-multi-instantiate: Add
 IRQ_RESOURCE_OPT for IRQ missing projects
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: ilpo.jarvinen@linux.intel.com, broonie@kernel.org,
 andriy.shevchenko@linux.intel.com, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, 13916275206@139.com,
 platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, letitia.tsai@hp.com
References: <20251126141434.11110-1-baojun.xu@ti.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251126141434.11110-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Nov-25 3:14 PM, Baojun Xu wrote:
> The tas2781-hda supports multi-projects. In some projects, GpioInt() was
> dropped due to no IRQ connection. See the example code below:
> 
> Device (SPKR)
> {
>     Name (_ADR, One)
>     Name (_HID, "TXNW2781")
>     Method (_CRS, 0, NotSerialized)
>     {
>         Name (RBUF, ResourceTemplate ()
>         {
>             I2cSerialBusV2 (0x0038, ...)
>             I2cSerialBusV2 (0x0039, ...)
>             // GpioInt (Edge, ...) { 0x0000 }
>             //"GpioInt (...) {}" was commented out due to no IRQ connection.
>         })
>         Return (RBUF)
>     }
> }
> 
> But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c), if
> looking for IRQ by smi_get_irq() fails, it will return an error, will not add
> new device, and cause smi_probe() to fail:
> 
> [    2.356546] Serial bus multi instantiate pseudo device driver TXNW2781:00:
> error -ENXIO: IRQ index 0 not found
> [    2.356561] Serial bus multi instantiate pseudo device driver TXNW2781:00:
> error -ENXIO: Error requesting irq at index 0
> 
> So, we need to add an exception case for these situations. BTW, this patch
> will take effect on both I2C and SPI devices.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
> v5:
>  - Change the description for this patch, remove cover letter.
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

