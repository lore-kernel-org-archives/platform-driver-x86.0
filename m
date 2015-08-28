From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] hp-wmi: limit hotkey enable
Date: Fri, 28 Aug 2015 11:42:28 -0700
Message-ID: <20150828184228.GA64484@vmdeb7>
References: <1438959360-20901-1-git-send-email-kvans32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53492 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751693AbbH1Smb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Aug 2015 14:42:31 -0400
Content-Disposition: inline
In-Reply-To: <1438959360-20901-1-git-send-email-kvans32@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kyle Evans <kvans32@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>, dvhart@infradead.org

On Fri, Aug 07, 2015 at 09:56:00AM -0500, Kyle Evans wrote:
> Do not attempt to initialize hotkeys if the query returns a value.
> Furthermore, do not write initialize magic on systems that do not have
> feature query 0xb. Fixes Bug #82451.
> 
> Signed-off-by: Kyle Evans <kvans32@gmail.com>

Hi Kyle,

Please always include the maintainer from MAINTAINERS on Cc when submitting
kernel patches. See Documentation/SubmittingPatches.

For example:

$ scripts/get_maintainer.pl -f drivers/platform/x86/hp-wmi.c
Darren Hart <dvhart@infradead.org> (maintainer:X86 PLATFORM DRIVERS)
platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
linux-kernel@vger.kernel.org (open list)

This will ensure a more timely response.

> ---
>  drivers/platform/x86/hp-wmi.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 0669731..557650f 100644
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
> +	int query = 0xff;
> +	int value = 0x6e;
>  
> -	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &query, sizeof(query),
> -				   0);
> +	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 0, &query,
> +				   0, sizeof(query));
> +
> +	if (!query) {

I suspect this should come after the test for ret. If there is a more
fundamental error, it would make sense to exit with -EINVAL first. Despite query
being initialized to 0xff, we have no guarantee the firmware won't set it to 0
and still return an error.

Rafael, would you agree?

And technically, EINVAL isn't the right error for a general error (but that's a
preexisting problem). You don't have to fix that to get this in.


> +		if (!hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, 0, &query,
> +					  0, sizeof(query)))
> +		    ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,

Careful with indentation, use tabs please. checkpatch.pl would have caught this.


> +					       sizeof(value), 0);
> +	}
>  
>  	if (ret)
>  		return -EINVAL;
> @@ -663,7 +672,7 @@ static int __init hp_wmi_input_setup(void)
>  			    hp_wmi_tablet_state());
>  	input_sync(hp_wmi_input_dev);
>  
> -	if (hp_wmi_bios_2009_later() == 4)
> +	if (hp_wmi_bios_2009_later() == HPWMI_RET_UNKNOWN_CMDTYPE)
>  		hp_wmi_enable_hotkeys();

This bit is fine, but no magic number cleanup is mentioned in the change log.
Was this change intentional?

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
