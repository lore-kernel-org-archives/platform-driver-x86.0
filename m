From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH -next] platform/x86: dell-laptop: make some local
 functions static
Date: Sat, 23 Dec 2017 09:33:57 +0100
Message-ID: <20171223083357.rkvvvlpwimndt7re@pali>
References: <1513994482-89811-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37843 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750792AbdLWIeA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 23 Dec 2017 03:34:00 -0500
Received: by mail-wm0-f68.google.com with SMTP id f140so25154750wmd.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 Dec 2017 00:34:00 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1513994482-89811-1-git-send-email-weiyongjun1@huawei.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, Mario Limonciello <mario.limonciello@dell.com>, quasisec@google.com, platform-driver-x86@vger.kernel.org

On Saturday 23 December 2017 02:01:22 Wei Yongjun wrote:
> Fixes the following sparse warnings:
> 
> drivers/platform/x86/dell-laptop.c:289:6: warning:
>  symbol 'dell_set_arguments' was not declared. Should it be static?
> drivers/platform/x86/dell-laptop.c:298:5: warning:
>  symbol 'dell_send_request' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/platform/x86/dell-laptop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index 629d960..a94936a 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -286,7 +286,7 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
>  	{ }
>  };
>  
> -void dell_set_arguments(u32 arg0, u32 arg1, u32 arg2, u32 arg3)
> +static void dell_set_arguments(u32 arg0, u32 arg1, u32 arg2, u32 arg3)
>  {
>  	memset(buffer, 0, sizeof(struct calling_interface_buffer));
>  	buffer->input[0] = arg0;
> @@ -295,7 +295,7 @@ void dell_set_arguments(u32 arg0, u32 arg1, u32 arg2, u32 arg3)
>  	buffer->input[3] = arg3;
>  }
>  
> -int dell_send_request(u16 class, u16 select)
> +static int dell_send_request(u16 class, u16 select)
>  {
>  	int ret;
> 

This is correct change, add my:

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

-- 
Pali Rohár
pali.rohar@gmail.com
