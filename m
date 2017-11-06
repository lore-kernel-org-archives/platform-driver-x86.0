From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1] platform/x86: pmc_atom: Fix parent clocks
Date: Mon, 6 Nov 2017 10:59:41 -0600
Message-ID: <4e78970f-28b0-2357-b0ee-5bebc92856f1@linux.intel.com>
References: <20171106141752.11827-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:2354 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754283AbdKFQ7n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Nov 2017 11:59:43 -0500
In-Reply-To: <20171106141752.11827-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org



On 11/06/2017 08:17 AM, Andy Shevchenko wrote:
> PLL or XTAL is a choice of parents. They are not dependent to
> each other (direct citation):

On Baytrail the PLL takes the 25MHz xtal input and generates a 19.2 MHZ 
Mclk. they are related and completely dependent.

On Cherrytrail, the xtal is 19.2 MHz so there is no need for a PLL mode.

Not sure what you are trying to fix...

>
> 	The source of the frequencies can be XTAL or PLL, depending on
> 	the configuration. Any of the two available frequencies can be
> 	selected for each of the platform clocks.
>
> According to datasheet on hand CherryTrail has them, though they both
> provide 19.2MHz frequency.
>
> Fixes: 282a4e4ce5f9 ("platform/x86: Enable Atom PMC platform clocks")
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/platform/x86/pmc_atom.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index 77bac859342d..56734112e5fe 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -65,7 +65,7 @@ static const struct pmc_clk byt_clks[] = {
>   	{
>   		.name = "pll",
>   		.freq = 19200000,
> -		.parent_name = "xtal",
> +		.parent_name = NULL,
>   	},
>   	{},
>   };
> @@ -76,6 +76,11 @@ static const struct pmc_clk cht_clks[] = {
>   		.freq = 19200000,
>   		.parent_name = NULL,
>   	},
> +	{
> +		.name = "pll",
> +		.freq = 19200000,
> +		.parent_name = NULL,
> +	},
>   	{},
>   };
>   
