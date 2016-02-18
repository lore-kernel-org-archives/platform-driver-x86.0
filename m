From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][RESEND] ideapad-laptop: Add Lenovo ideapad Y700
 Touch-15ISK and Lenovo ideapad Y700-15ISK to the no_hw_rfkill DMI list
Date: Wed, 17 Feb 2016 21:31:17 -0800
Message-ID: <20160218053117.GE18421@dvhart-mobl5.amr.corp.intel.com>
References: <Pine.NEB.4.64.1602170529490.2123@faeroes.freeshell.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.NEB.4.64.1602170529490.2123@faeroes.freeshell.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Dahlstrom <jodarom@SDF.ORG>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 17, 2016 at 05:55:49AM -0600, John Dahlstrom wrote:

Hi John,

Why the RESEND?

Please update your subject to be less than 72 characters or so. It needs to
display completely with git log on an 80 char terminal without getting
truncated. Anything you can't fit there, please add to the changelog below.


> Some Lenovo ideapad models lack a physical rfkill switch.
> On Lenovo models ideapad Y700 Touch-15ISK and ideapad Y700-15ISK,
> ideapad-laptop would wrongly report all radios as blocked by
> hardware which caused wireless network connections to fail.
> 
> Add these models without an rfkill switch to the no_hw_rfkill list.
> 
> Relevant kernel versions: 4.5-rc4, 4.4.1, 4.3.5, 4.1.18, 3.18.27

Please read Documentation/stable-kernel-rules.txt for how to submit changes to
the stable kernels.

> 
> Tested-by: John Dahlstrom <jodarom@sdf.org>
> Signed-off-by: John Dahlstrom <jodarom@sdf.org>

Generally speaking, if you wrote it, I expect you have tested it :-) This isn't
bad, but not really necessary. It would be more useful to include a cover letter
with more verbage on what specifically you tested. Both Lenovo laptops listed
below? Any others to ensure no regressions? Etc. This is a trivial patch, so I'm
not particularly concerned, just as an example.

Please correct the commit message and resubmit as v2.

> ---
> 
> --- a/drivers/platform/x86/ideapad-laptop.c	2016-02-14 15:05:20.000000000 -0600
> +++ b/drivers/platform/x86/ideapad-laptop.c	2016-02-16 03:54:48.484423725 -0600
> @@ -864,4 +864,18 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
> 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G50-30"),
> 		},
> + 	},
> + 	{
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
> 	},
> 	{
> 

-- 
Darren Hart
Intel Open Source Technology Center
