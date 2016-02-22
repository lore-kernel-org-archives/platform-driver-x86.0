From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 1/1] ideapad-laptop: Add ideapad Y700 (15) to the
 no_hw_rfkill DMI list
Date: Mon, 22 Feb 2016 14:14:16 -0800
Message-ID: <20160222221416.GD14101@dvhart-mobl5.amr.corp.intel.com>
References: <Pine.NEB.4.64.1602191918380.15324@faeroes.freeshell.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41939 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755475AbcBVWOS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 22 Feb 2016 17:14:18 -0500
Content-Disposition: inline
In-Reply-To: <Pine.NEB.4.64.1602191918380.15324@faeroes.freeshell.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: John Dahlstrom <jodarom@SDF.ORG>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 19, 2016 at 07:34:18PM -0600, John Dahlstrom wrote:
> Some Lenovo ideapad models lack a physical rfkill switch.
> On Lenovo models ideapad Y700 Touch-15ISK and ideapad Y700-15ISK,
> ideapad-laptop would wrongly report all radios as blocked by
> hardware which caused wireless network connections to fail.
> 
> Add these models without an rfkill switch to the no_hw_rfkill list.
> 
> Signed-off-by: John Dahlstrom <jodarom@sdf.org>
> Cc: <stable@vger.kernel.org> # 4.5.x
> Cc: <stable@vger.kernel.org> # 4.4.x
> Cc: <stable@vger.kernel.org> # 4.3.x
> Cc: <stable@vger.kernel.org> # 4.2.x
> Cc: <stable@vger.kernel.org> # 4.1.x
> Cc: <stable@vger.kernel.org> # 4.0.x
> Cc: <stable@vger.kernel.org> # 3.19.x
> Cc: <stable@vger.kernel.org> # 3.18.x
> Cc: <stable@vger.kernel.org> # 3.17.x
> Cc: <stable@vger.kernel.org> # 3.16.x

Unfortunately, backporting this to stable is not quite so simple.

First, 3.16 doesn't really work as between 3.16 and 3.17 the following patch
landed:

ce363c2 ideapad-laptop: Change Lenovo Yoga 2 series rfkill handling

Which changes the name of the dmi_system_id struct from rfkill_blacklist to
no_hw_rfkill_list.

Following that, there were several additions to the list which should be applied
before this patch to each stable kernel for which they haven't been picked up in
order for this one to apply cleanly. Several of those are included below:

$ git l v3.17.. drivers/platform/x86/ideapad-laptop.c
b7287f0 ideapad-laptop: Add ideapad Y700 (15) to the no_hw_rfkill DMI list
6b31de3 ideapad-laptop: Add Lenovo Yoga 700 to no_hw_rfkill dmi list
edde316 ideapad-laptop: Add Lenovo ideapad Y700-17ISK to no_hw_rfkill dmi list
f71c882 ideapad-laptop: Add Lenovo Yoga 900 to no_hw_rfkill dmi list
c789fff ideapad-laptop: include Yoga 3 1170 in add rfkill whitelist
74caab9 ideapad-laptop: add support for Yoga 3 ESC key
6d212b8 ideapad-laptop: add alternative representation for Yoga 2 to DMI table
fa92a31 ideapad-laptop: Add Lenovo Yoga 3 14 to no_hw_rfkill dmi list
05fde26 Merge tag 'platform-drivers-x86-v4.2-1' of
git://git.infradead.org/users/dvhart/linux-platform-drivers-x86
26bff5f ideapad-laptop: Port to new backlight interface selection API
4b200b4 ideapad: fix software rfkill setting
4fa9dab ideapad_laptop: Lenovo G50-30 fix rfkill reports wireless blocked
9b071a4 ideapad_laptop: Add Lenovo G40-30 to devices without radio switch
385336e Merge tag 'platform-drivers-x86-v3.19-1' of
git://git.infradead.org/users/dvhart/linux-platform-drivers-x86
e6b5be2 Merge tag 'driver-core-3.19-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
0098181 platform: x86: Deletion of checks before backlight_device_unregister()
725c7f6 quirk for Lenovo Yoga 3: no rfkill switch
3493f41 platform: x86: drop owner assignment from platform_drivers


If you are going to specify a kernel version, you should also include the
commits above necessary to make the patch apply cleanly. That would be a long
list as you would need many of these for each version.

What I'm going to do is include a single Cc to stable line without a kernel
version. The maintainers will pull that back as far as they can using their own
judgement. If you want this to go back earlier than they do on their own, you
should submit it to linux-stable directly and include the Cc lines for the
dependencies for each kernel you care to see this backported to. See the
stable-kernel-rules for the specific formatting to accomplish this.


> ---
>   Test configuration
>    Hardware: Lenovo ideapad Y700 Touch-15ISK
>    Kernel version: 4.4.2
> 
>   Patch changelog
>    v2 split patch between Touch and non-Touch devices
>    v3 undo patch split and limit summary to 72 characters
>    v4 include comprehensive list of patchable kernels in Cc
> 
>   drivers/platform/x86/ideapad-laptop.c |   14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> --- a/drivers/platform/x86/ideapad-laptop.c	2016-02-14 15:05:20.000000000 -0600
> +++ b/drivers/platform/x86/ideapad-laptop.c	2016-02-16 03:54:48.484423725 -0600
> @@ -864,4 +864,18 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G50-30"),
>  		},
> +	},
> +	{
> +		.ident = "Lenovo ideapad Y700-15ISK",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-15ISK"),
> +		},
> +	},
> +	{
> +		.ident = "Lenovo ideapad Y700 Touch-15ISK",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700 Touch-15ISK"),
> +		},
>  	},
>  	{
> 

-- 
Darren Hart
Intel Open Source Technology Center
