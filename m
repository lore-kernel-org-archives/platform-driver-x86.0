From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: pmc_atom: Add Lex 2I385SW to
 critclk_systems DMI table
Date: Mon, 3 Feb 2020 22:17:53 +0100
Message-ID: <466fff4c-eb61-7fd5-1442-54499c3db645@redhat.com>
References: <20200203201105.11659-1-georgmueller@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200203201105.11659-1-georgmueller@gmx.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Georg_M=c3=bcller?= <georgmueller@gmx.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 03-02-2020 21:11, Georg Müller wrote:
> The Lex 2I385SW board has two Intel I211 ethernet controllers. Without
> this patch, only the first port is usable. The second port fails to
> start with the following message:
> 
>      igb: probe of 0000:02:00.0 failed with error -2
> 
> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> Tested-by: Georg Müller <georgmueller@gmx.net>
> Signed-off-by: Georg Müller <georgmueller@gmx.net>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/platform/x86/pmc_atom.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index 3e3c66dfec2e..ca684ed760d1 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -383,6 +383,14 @@ static const struct dmi_system_id critclk_systems[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
>   		},
>   	},
> +	{
> +		/* pmc_plt_clk* - are used for ethernet controllers */
> +		.ident = "Lex 2I385SW",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "2I385SW"),
> +		},
> +	},
>   	{
>   		/* pmc_plt_clk* - are used for ethernet controllers */
>   		.ident = "Beckhoff CB3163",
> --
> 2.24.1
> 
