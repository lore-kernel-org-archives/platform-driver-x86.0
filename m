From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] sony-laptop: Avoid oops on module unload for older
 laptops
Date: Tue, 22 Mar 2016 06:51:52 -0700
Message-ID: <20160322135151.GA11220@taihen.jp>
References: <56EFB466.60008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:33308 "EHLO
	mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758354AbcCVNvz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 22 Mar 2016 09:51:55 -0400
Received: by mail-pf0-f173.google.com with SMTP id 4so181616944pfd.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2016 06:51:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <56EFB466.60008@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lawrence Yiu <lawyiu.dev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Mar 21, 2016 at 01:44:22AM -0700, Lawrence Yiu wrote:
> Older VAIO laptops without the SN00 ACPI method will have the "handles"
> variable unset. Return early from sony_nc_function_cleanup when "handles"
> is null.
> 
> Signed-off-by: Lawrence Yiu <lawyiu.dev@gmail.com>

Acked-by: Mattia Dongili <malattia@linux.it>

> ---
>  drivers/platform/x86/sony-laptop.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index e9caa34..1dba359 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -1446,6 +1446,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
>  {
>  	unsigned int i, result, bitmask, handle;
>  
> +	if (!handles)
> +		return;
> +

Thank you, this is indeed necessary.

Given how long this sat around, it may be a good time to start
cleaning-up some legacy models support. Later anyway.
-- 
mattia
:wq!
