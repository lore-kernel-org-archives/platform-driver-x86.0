From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: intel_pmc_core: Show Latency Tolerance info
Date: Wed, 26 Sep 2018 16:48:18 +0300
Message-ID: <CAHp75Vesn4TrdF8tWLkU7nCRGp_o8fEK6gxpTkwM7E7zQo0qKg@mail.gmail.com>
References: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@linux.intel.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 3, 2018 at 9:06 PM Rajneesh Bhardwaj
<rajneesh.bhardwaj@linux.intel.com> wrote:
>
> This adds support to show the Latency Tolerance Reporting for the IPs on
> the PCH as reported by the PMC. The format shown here is raw LTR data
> payload that can further be decoded as per the PCI specification.
>
> This also fixes some minor alignment issues in the header file by
> removing spaces and converting to tabs at some places.

Thanks for the patch, my comments below.

> +static const struct pmc_bit_map spt_ltr_show_map[] = {
> +       {"IP 0  : LTR_SOUTHPORT_A",             SPT_PMC_LTR_SPA},
> +       {"IP 1  : LTR_SOUTHPORT_B",             SPT_PMC_LTR_SPB},
> +       {"IP 2  : LTR_SATA",                    SPT_PMC_LTR_SATA},
> +       {"IP 3  : LTR_GIGABIT_ETHERNET",        SPT_PMC_LTR_GBE},
> +       {"IP 4  : LTR_XHCI",                    SPT_PMC_LTR_XHCI},
> +       /* IP 5 is reserved */
> +       {"IP 6  : LTR_ME",                      SPT_PMC_LTR_ME},
> +       /* EVA is Enterprise Value Add, doesn't really exist on PCH */
> +       {"IP 7  : LTR_EVA",                     SPT_PMC_LTR_EVA},
> +       {"IP 8  : LTR_SOUTHPORT_C",             SPT_PMC_LTR_SPC},
> +       {"IP 9  : LTR_HD_AUDIO",                SPT_PMC_LTR_AZ},
> +       /* IP 10 is reserved */
> +       {"IP 11 : LTR_LPSS",                    SPT_PMC_LTR_LPSS},
> +       {"IP 12 : LTR_SOUTHPORT_D",             SPT_PMC_LTR_SPD},
> +       {"IP 13 : LTR_SOUTHPORT_E",             SPT_PMC_LTR_SPE},
> +       {"IP 14 : LTR_CAMERA",                  SPT_PMC_LTR_CAM},
> +       {"IP 15 : LTR_ESPI",                    SPT_PMC_LTR_ESPI},
> +       {"IP 16 : LTR_SCC",                     SPT_PMC_LTR_SCC},
> +       {"IP 17 : LTR_ISH",                     SPT_PMC_LTR_ISH},
> +       /* Below two cannot be for LTR_IGNORE */
> +       {"LTR_CURRENT_PLATFORM",                SPT_PMC_LTR_CUR_PLT},
> +       {"LTR_AGGREGATED_SYSTEM",               SPT_PMC_LTR_CUR_ASLT},

Before no map has this fancy "IP xx :" prefixes. Please, remove.

> +       {},

No need for comma

> +

Redundant.

> +};

> +static const struct pmc_bit_map cnp_ltr_show_map[] = {

Same comments as above.

> +};

> +       debugfs_create_file("ltr_show", 0644, dir, pmcdev,
> +                           &pmc_core_ltr_fops);

One line?

>  #define NUM_RETRIES                            100
>  #define NUM_IP_IGN_ALLOWED                     17

+ blank line here.

> +#define SPT_PMC_LTR_CUR_PLT                    0x350

-- 
With Best Regards,
Andy Shevchenko
