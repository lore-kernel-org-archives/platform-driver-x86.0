From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2 3/3] dmi: Make dmi_walk and dmi_walk_early return
 real error codes
Date: Tue, 19 Jan 2016 08:54:26 +0100
Message-ID: <20160119085426.7d4b1f8b@endymion.delvare>
References: <cover.1453150613.git.luto@kernel.org>
	<9d1eb8634669ef09334c7e792eb21f20b320a07b.1453150613.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58736 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757285AbcASHy3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 02:54:29 -0500
In-Reply-To: <9d1eb8634669ef09334c7e792eb21f20b320a07b.1453150613.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andy,

On Mon, 18 Jan 2016 12:59:40 -0800, Andy Lutomirski wrote:
> Currently they return -1 on error, which will confuse callers if
> they try to interpret it as a normal negative error code.
> 
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>  drivers/firmware/dmi_scan.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index 0e08e665f715..451ac04ed18d 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -144,7 +144,7 @@ static int __init dmi_walk_early(void (*decode)(const struct dmi_header *,
>  
>  	buf = dmi_early_remap(dmi_base, orig_dmi_len);
>  	if (buf == NULL)
> -		return -1;
> +		return -ENOMEM;
>  
>  	dmi_decode_table(buf, decode, NULL);
>  
> @@ -978,11 +978,11 @@ int dmi_walk(void (*decode)(const struct dmi_header *, void *),
>  	u8 *buf;
>  
>  	if (!dmi_available)
> -		return -1;
> +		return -ENOENT;

-ENOSYS would seem more appropriate?

>  
>  	buf = dmi_remap(dmi_base, dmi_len);
>  	if (buf == NULL)
> -		return -1;
> +		return -ENOMEM;
>  
>  	dmi_decode_table(buf, decode, private_data);
>  

There is a formatted comment before dmi_walk, which says "Returns -1
when the DMI table can't be reached". This comment needs to be updated.

Please also update the dmi_walk stub in include/linux/dmi.h when
CONFIG_DMI isn't set.

I don't think this patch should be in this series, I'd rather take it
in my dmi tree and push it to Linus immediately.

-- 
Jean Delvare
SUSE L3 Support
