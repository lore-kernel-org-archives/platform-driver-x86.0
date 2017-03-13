From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH] platform/x86: intel-hid: do not set parents of input
 devices explicitly
Date: Mon, 13 Mar 2017 18:37:34 +0800
Message-ID: <2e954caa-d531-3c82-023c-afb8aaf9f3d9@canonical.com>
References: <20170309093651.7824-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:36659 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751729AbdCMKhj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2017 06:37:39 -0400
Received: by mail-pg0-f45.google.com with SMTP id g2so44932745pge.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2017 03:37:38 -0700 (PDT)
In-Reply-To: <20170309093651.7824-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 2017-03-09 05:36 PM, Michał Kępień wrote:
> devm_input_allocate_device() already causes the supplied struct device
> to be set as the parent of the input device, so doing it again is
> redundant.
>
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>
> ---
> This patch needs my recent intel-hid cleanup series to apply cleanly.
> In other words, it should apply on top of testing, but not for-next.
>
>  drivers/platform/x86/intel-hid.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index 5eab31659cba..b40059aba856 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -152,7 +152,6 @@ static int intel_hid_input_setup(struct platform_device *device)
>  	if (ret)
>  		return ret;
>
> -	priv->input_dev->dev.parent = &device->dev;
>  	priv->input_dev->name = "Intel HID events";
>  	priv->input_dev->id.bustype = BUS_HOST;
>
> @@ -173,7 +172,6 @@ static int intel_button_array_input_setup(struct platform_device *device)
>  	if (ret)
>  		return ret;
>
> -	priv->array->dev.parent = &device->dev;
>  	priv->array->name = "Intel HID 5 button array";
>  	priv->array->id.bustype = BUS_HOST;
>
>


The patch, on top of previous patches, is tested on Latitude 7480

Reviewed-and-tested-by: Alex Hung <alex.hung@canonical.com>
