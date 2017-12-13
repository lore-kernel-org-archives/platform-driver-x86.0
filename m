From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-smo8800: Possible unnecessary 'out of
 memory' message
Date: Wed, 13 Dec 2017 09:30:53 +0100
Message-ID: <20171213083053.mywa4bgv56daxud6@pali>
References: <20171213082354.23273-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:46765 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751880AbdLMIa4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 03:30:56 -0500
Content-Disposition: inline
In-Reply-To: <20171213082354.23273-1-dhaval.shah@softnautics.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dhaval Shah <dhaval.shah@softnautics.com>
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 13 December 2017 13:53:54 Dhaval Shah wrote:
> Removed Possible unnecessary 'out of memory' message checkpatch warnings.
> Issue found by checkpatch.
> 
> Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
> ---
>  drivers/platform/x86/dell-smo8800.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-smo8800.c b/drivers/platform/x86/dell-smo8800.c
> index 1d87237bc731..9590d5e7c5ca 100644
> --- a/drivers/platform/x86/dell-smo8800.c
> +++ b/drivers/platform/x86/dell-smo8800.c
> @@ -150,10 +150,8 @@ static int smo8800_add(struct acpi_device *device)
>  	struct smo8800_device *smo8800;
>  
>  	smo8800 = devm_kzalloc(&device->dev, sizeof(*smo8800), GFP_KERNEL);
> -	if (!smo8800) {
> -		dev_err(&device->dev, "failed to allocate device data\n");

Hi! Any particular reason for removing error message?

> +	if (!smo8800)
>  		return -ENOMEM;
> -	}
>  
>  	smo8800->dev = &device->dev;
>  	smo8800->miscdev.minor = MISC_DYNAMIC_MINOR;

-- 
Pali Rohár
pali.rohar@gmail.com
