Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DFD2C236B;
	Wed, 26 Nov 2025 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147935; cv=none; b=j420J9QHNMFbX6573T0o100T0cwgoUcCMnFvRFKK8hTZ3BQH7eymVXkaw+pysFxjPZ8xEsE2loE6K1n/MSuxkc+G4XD8wGmJsYhhIl33NBht6oNPtQoRH0Nov7di4NlCevrFkmHCW6Ltg9hb7WR6mAh5ERSz4qIlXzJ6Q+gWBts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147935; c=relaxed/simple;
	bh=4o77OKWbcP6woDhrfz9J5DQUS4w6IllxS0M8ItejPwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVYQdj+hJCfcCs8n2gJEYLfhpfMWmdB5uNjh/baH9WHctQZE89LL5W0P677qYQ8e7ae/oE9w7Wxip8AbHaFm8wYSjqyzIlJH0iNsjaW1xZCxDsM+VIuT447Fw/YfPYm7vbyj5hvrUe60iuLPMbnhZjPYNHTAGf+LGiTA2tJ6g0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2dNG9qU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2dNG9qU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88065C113D0;
	Wed, 26 Nov 2025 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764147934;
	bh=4o77OKWbcP6woDhrfz9J5DQUS4w6IllxS0M8ItejPwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s2dNG9qU1/HOUpSJ2Y8qbIP5tXCoY+uBg4SBnVa9bitaFkgWVugRh8Ul0w8vSBvT7
	 EHDsK051fZRUevgmikVbldiY2VfNyF4UZ4BtQgiMnj7700FS5oofPplM1UBnp4oHLB
	 ijm0s2b57vuO5rNN5hpBS0LWemHWZO0+Zuny4w2kerEEi/igMhfWGBK48csYX0TJst
	 IKNxv6C558HSt8czYPO9p+sIsFjs3m0JG9CZCQhaWybTfrilaE9BIVdF6nG2Xbp9ef
	 kfocFp0LAQrbRrclSD8nrDFAoGRzFpy1wMyUZs0UsnvUeCJPxksHlJwRAubnP3Q4vQ
	 mDwZ8ifJpI/ug==
Message-ID: <8af3d19b-a204-4120-bb08-3de21e6a60cb@kernel.org>
Date: Wed, 26 Nov 2025 10:05:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/1] platform/x86: serial-multi-instantiate: ACPI
 example code
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: ilpo.jarvinen@linux.intel.com, broonie@kernel.org,
 andriy.shevchenko@linux.intel.com, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, 13916275206@139.com,
 platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, letitia.tsai@hp.com
References: <20251126081741.10588-1-baojun.xu@ti.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251126081741.10588-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Baojun Xu,

On 26-Nov-25 9:17 AM, Baojun Xu wrote:
> The tas2781-hda supports multi-projects, In some projects,
> GpioInt was dropped due to no IRQ connection.
> See the example code below:
> 
> But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c),
> if looking for IRQ by smi_get_irq() fails, it will return an error,
> will not add new device, and cause smi_probe to fail.
> So need to add an exception case for these situations.
> BTW, this patch will take effect on both I2C and SPI devices.
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
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Thank you, the patch itself looks good, but the above information
from the cover-letter really should be in the commit message of
the patch itself.

Can you please send a v4 with this info added to the commit
message ?

Regards,

Hans




> 
> Baojun Xu (1):
>   platform/x86: serial-multi-instantiate: Add IRQ_RESOURCE_OPT for IRQ
>     missing projects
> 
>  drivers/platform/x86/serial-multi-instantiate.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 

