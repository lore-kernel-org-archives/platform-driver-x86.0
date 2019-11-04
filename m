From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [PATCH v2] platform/x86: pmc_atom: Add Siemens SIMATIC IPC227E to
 critclk_systems DMI table
Date: Mon, 4 Nov 2019 17:20:18 +0100
Message-ID: <16119dad-9597-ecdc-a0e7-e386030659ce@siemens.com>
References: <c090302a-da38-5764-2a84-399ed6b333f5@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c090302a-da38-5764-2a84-399ed6b333f5@siemens.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>, Henning Schild <henning.schild@siemens.com>
List-Id: platform-driver-x86.vger.kernel.org

On 04.09.19 08:42, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> The SIMATIC IPC227E uses the PMC clock for on-board components and gets
> stuck during boot if the clock is disabled. Therefore, add this device
> to the critical systems list.
> 
> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> 
> Changes in v2:
>  - fixed cut-off subject line (local tooling bug...)
> 
> Should go into stable as well, down to 4.19.

This one is in 5.4-rc now (as ad0d315b4d4e). Is it also queued somewhere
for stable kernels? IIRC, it's generally the privilege of the subsystem
maintainer to propose formally to stable.

I've received reports from users down at 4.14 with the need for it (4.9
is unaffected). And the same applies to f110d252ae79 ("platform/x86:
pmc_atom: Add Siemens SIMATIC IPC277E to critclk_systems DMI table").

TIA!
Jan

> 
>  drivers/platform/x86/pmc_atom.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index aa53648a2214..9aca5e7ce6d0 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -415,6 +415,13 @@ static const struct dmi_system_id critclk_systems[] = {
>  			DMI_MATCH(DMI_BOARD_NAME, "CB6363"),
>  		},
>  	},
> +	{
> +		.ident = "SIMATIC IPC227E",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "6ES7647-8B"),
> +		},
> +	},
>  	{ /*sentinel*/ }
>  };
>  
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
