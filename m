From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] hp-wmi: limit hotkey enable
Date: Tue, 8 Sep 2015 13:22:32 -0700
Message-ID: <20150908202232.GD90062@vmdeb7>
References: <1438959360-20901-1-git-send-email-kvans32@gmail.com>
 <20150828184228.GA64484@vmdeb7>
 <55E1CF30.10501@gmail.com>
 <20150906180339.GC90062@vmdeb7>
 <55EF2913.2090902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51545 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751862AbbIHUWg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Sep 2015 16:22:36 -0400
Content-Disposition: inline
In-Reply-To: <55EF2913.2090902@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kyle Evans <kvans32@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>

On Tue, Sep 08, 2015 at 01:29:39PM -0500, Kyle Evans wrote:
> From 7d11e942d2c84919ded37b46a72be59f34141c5d Mon Sep 17 00:00:00 2001
> From: Kyle Evans <kvans32@gmail.com>
> Date: Tue, 1 Sep 2015 18:50:45 -0500
> Subject: [PATCH] hp-wmi: limit hotkey enable

In the future, please submit as [PATCH v2] as a separate thread. This one took a
little bit of minor wrangling to apply coming in as it did.

> 
> Do not write initialize magic on systems that do not have
> feature query 0xb. Fixes Bug #82451.
> 
> Define a new feature query to differentiate older systems and rename
> FEATURE_QUERY, 0xd, to FEATURE2_QUERY for code consistency.
> Also, some return value magic number cleanup.
> ---

In the future, this is where you should include a changelog:

Since v1:
 - Refactored FEATURE2 test into separate function

Or similar. See Documentation/SubmittingPatches section 14.


>  drivers/platform/x86/hp-wmi.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 0669731..c0a7817 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -54,8 +54,9 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
>  #define HPWMI_HARDWARE_QUERY 0x4
>  #define HPWMI_WIRELESS_QUERY 0x5
>  #define HPWMI_BIOS_QUERY 0x9
> +#define HPWMI_FEATURE_QUERY 0xb
>  #define HPWMI_HOTKEY_QUERY 0xc
> -#define HPWMI_FEATURE_QUERY 0xd
> +#define HPWMI_FEATURE2_QUERY 0xd

I didn't understand why you renamed FEATURE to FEATURE2 and then used FEATURE
for the new one - rather than just adding FEATURE2. It seems like unecessary
churn.

>  #define HPWMI_WIRELESS2_QUERY 0x1b
>  #define HPWMI_POSTCODEERROR_QUERY 0x2a
> 
> @@ -295,7 +296,7 @@ static int hp_wmi_tablet_state(void)
>  	return (state & 0x4) ? 1 : 0;
>  }
> 
> -static int __init hp_wmi_bios_2009_later(void)
> +static int __init hp_wmi_bios_2008_later(void)
>  {
>  	int state = 0;
>  	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, 0, &state,
> @@ -306,14 +307,22 @@ static int __init hp_wmi_bios_2009_later(void)
>  	return (state & 0x10) ? 1 : 0;
>  }
> 
> -static int hp_wmi_enable_hotkeys(void)
> +static int __init hp_wmi_bios_2009_later(void)
>  {
> -	int ret;
> -	int query = 0x6e;
> +	int state = 0;
> +	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, 0, &state,
> +				       sizeof(state), sizeof(state));
> +	if (ret)
> +		return ret;
> 
> -	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &query, sizeof(query),
> -				   0);
> +	return (state & 0x10) ? 1 : 0;
> +}
> 
> +static int hp_wmi_enable_hotkeys(void)
> +{
> +	int value = 0x6e;
> +	int ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,
> +				       sizeof(value), 0);
>  	if (ret)
>  		return -EINVAL;
>  	return 0;
> @@ -663,8 +672,9 @@ static int __init hp_wmi_input_setup(void)
>  			    hp_wmi_tablet_state());
>  	input_sync(hp_wmi_input_dev);
> 
> -	if (hp_wmi_bios_2009_later() == 4)
> -		hp_wmi_enable_hotkeys();
> +	if (hp_wmi_bios_2009_later() == HPWMI_RET_UNKNOWN_CMDTYPE)
> +		if !(hp_wmi_2008_later() == HPWMI_RET_UNKNOWN_CMDTYPE)
> +			hp_wmi_enable_hotkeys();

I really don't like the semantics behind these hp_wmi_bios_200*_later() calls.
They read as though they should be boolean functions, but we test for bizarre
magic return codes, and are actually testing for a specific feature. For the
uninitiated, the above block is quite difficult to understand what it's testing
for. At the very least, it needs a comment describing what is going on.

I believe the logic we're looking for is:

if older than 2009 (doesn't have FEATURE 0xd)
	if newer than 2008 (does have FEATURE2 0xb)
		attempt BIOS_QUERY 0x9

Which one might expect to read as:

if (!hp_wmi_bios_2009_later() && hp_wmi_bios_2008_later())
	hp_wmi_enable_hotkeys();

Which would involve rewriting the 2009 function and the new 2008 function to
return 1 if later, 0 if not, or <0 on error. The ugly details of
HPWMI_RET_UNKNOWN_CMDTYPE can be contained within those wrappers, which is
arguably the point of a wrapper function - to abstract away things like that.

For the original use of hp_wmi_bios_2009_later, only the == 4 case would need to
be updated to deal with the boolean logic.

Perhaps I'm missing something about how these work, or some corner case, but the
above seems far cleaner to me.

Would you agree or not?

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
