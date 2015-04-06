From: Marcus Pollice <marcus.pollice@gmail.com>
Subject: Re: [PATCH] hp-wmi: limit hotkey enable
Date: Mon, 06 Apr 2015 17:57:05 +0200
Message-ID: <5522ACD1.1070202@gmail.com>
References: <20150313053325.GA22984@aaronlu.sh.intel.com> <1427481191-4475-1-git-send-email-kvans32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:34188 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751100AbbDFP5J (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Apr 2015 11:57:09 -0400
Received: by widjs5 with SMTP id js5so24335642wid.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2015 08:57:08 -0700 (PDT)
In-Reply-To: <1427481191-4475-1-git-send-email-kvans32@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kyle Evans <kvans32@gmail.com>, Aaron Lu <aaron.lu@intel.com>, platform-driver-x86@vger.kernel.org, Bertrand Vieille <vieille.bertrand@free.Fr>

Patch tested successfully on a HP Compaq nx6310 with kernel 3.19, that
had the same issue introduced by the same commit.

I wonder what I did wrong when reporting the issue to this list almost 3
months prior to Bertrand. I went through the same bisection steps and
since he had another issue as well it would have saved him some time.
I'd like to know how I can improve reporting such issues in the future.

Marcus Pollice

On 27.03.2015 19:33, Kyle Evans wrote:
> Do not attempt to initialize hotkeys if the query returns a value.
> Furthermore, do not write initialize magic on systems that do not have
> feature query 0xb.
> 
> Signed-off-by: Kyle Evans <kvans32@gmail.com>
> ---
>  drivers/platform/x86/hp-wmi.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 0ab2b37..4a4d6e3 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -54,6 +54,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
>  #define HPWMI_HARDWARE_QUERY 0x4
>  #define HPWMI_WIRELESS_QUERY 0x5
>  #define HPWMI_BIOS_QUERY 0x9
> +#define HPWMI_FEATURE2_QUERY 0xb
>  #define HPWMI_HOTKEY_QUERY 0xc
>  #define HPWMI_FEATURE_QUERY 0xd
>  #define HPWMI_WIRELESS2_QUERY 0x1b
> @@ -309,10 +310,18 @@ static int __init hp_wmi_bios_2009_later(void)
>  static int hp_wmi_enable_hotkeys(void)
>  {
>  	int ret;
> -	int query = 0x6e;
> +	int query;
> +	int value = 0x6e;
>  
> -	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &query, sizeof(query),
> -				   0);
> +	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 0, &query,
> +				   0, sizeof(query));
> +
> +	if (!ret && !query) {
> +		if (!hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, 0, &query,
> +					  0, sizeof(query)))
> +		    ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,
> +					       sizeof(value), 0);
> +	}
>  
>  	if (ret)
>  		return -EINVAL;
> 
