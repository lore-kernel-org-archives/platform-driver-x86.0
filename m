From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH -next] platform/x86: dell-laptop: fix error return code
 in dell_init()
Date: Thu, 23 Nov 2017 10:03:19 +0100
Message-ID: <20171123090319.xx7kupy4aawx327h@pali>
References: <1510666813-173192-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:45700 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751790AbdKWJDW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Nov 2017 04:03:22 -0500
Received: by mail-wm0-f65.google.com with SMTP id 9so15212747wme.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Nov 2017 01:03:22 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1510666813-173192-1-git-send-email-weiyongjun1@huawei.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org

On Tuesday 14 November 2017 13:40:13 Wei Yongjun wrote:
> Fix to return error code -ENOMEM from the kzalloc() error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Looks good,

Reviewed-by: Pali Rohár <pali.rohar@gmai.com>

> ---
>  drivers/platform/x86/dell-laptop.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index c4903c5..0a8f359 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -2081,8 +2081,10 @@ static int __init dell_init(void)
>  	}
>  
>  	buffer = kzalloc(sizeof(struct calling_interface_buffer), GFP_KERNEL);
> -	if (!buffer)
> +	if (!buffer) {
> +		ret = -ENOMEM;
>  		goto fail_buffer;
> +	}
>  
>  	if (quirks && quirks->touchpad_led)
>  		touchpad_led_init(&platform_device->dev);
> 

-- 
Pali Rohár
pali.rohar@gmail.com
