From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 2 13 to the no_hw_rfkill
 DMI list
Date: Tue, 13 Nov 2018 21:16:03 -0800
Message-ID: <20181114051603.GF7890@fedora.eng.vmware.com>
References: <20181114022245.5798-1-loic.wyn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181114022245.5798-1-loic.wyn@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loic WEI YU NENG <loic.wyn@gmail.com>
Cc: andy.shevchenko@gmail.com, ike.pan@canonical.com, andy@infradead.org, trivial@kernel.org, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 13, 2018 at 06:22:45PM -0800, Loic WEI YU NENG wrote:
> Some Lenovo ideapad models lack a physical rfkill switch.
> On Lenovo models Yoga 2 13, ideapad-laptop would wrongly report all
> radios as blocked by hardware which caused wireless network connections
> to fail.
> Add these models without an rfkill switch to the no_hw_rfkill list.
> 
> Signed-off-by: Loic WEI YU NENG <loic.wyn@gmail.com>

Thank you for the patch.

In the future, please be sure to check MAINTAINERS and include the
relevant lists, now Cc'd.

I see this in the context of your patch, but can you confirm the current
driver fails to match your system? It contains the following, which I
would expect to match:

               .ident = "Lenovo Yoga 2 11 / 13 / Pro",
                .matches = {
                        DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
                        DMI_MATCH(DMI_BOARD_NAME, "Yoga2"),
                },

If it doesn't match, what does dmidecode report for SYS_VENDOR and
BOARD_NAME on your system? Perhaps we need to make the above more
generic.

> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index b6489cba2985..1589dffab9fa 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1188,6 +1188,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>  			DMI_MATCH(DMI_BOARD_NAME, "Yoga2"),
>  		},
>  	},
> +	{
> +		.ident = "Lenovo Yoga 2 13",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Yoga 2 13"),
> +		},
> +	},
>  	{
>  		.ident = "Lenovo Yoga 3 1170 / 1470",
>  		.matches = {
> -- 
> 2.17.1
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
