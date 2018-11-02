From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 1/3] platform/x86: intel_pmc_core: Show Latency
 Tolerance info
Date: Fri, 2 Nov 2018 20:27:47 +0200
Message-ID: <CAHp75VcJDSM31JMzHnFcb=Rh9wOn+LJ-qKe7x-S8h3P9AQwcdQ@mail.gmail.com>
References: <20181102102703.21846-1-rajneesh.bhardwaj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181102102703.21846-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@linux.intel.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 2, 2018 at 12:29 PM Rajneesh Bhardwaj
<rajneesh.bhardwaj@linux.intel.com> wrote:
>
> This adds support to show the Latency Tolerance Reporting for the IPs on
> the PCH as reported by the PMC. The format shown here is raw LTR data
> payload that can further be decoded as per the PCI specification.
>
> This also fixes some minor alignment issues in the header file by
> removing spaces and converting to tabs at some places.

Thanks for the update, my comments below.

> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>

> [andy: fixed output to avoid LTR duplication and put space after colon]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

You incorporated changes I proposed =E2=80=94 good!
But please, don't do my job with signing stuff, etc. Just mention what
you did in the changelog.


> +static const struct pmc_bit_map spt_ltr_show_map[] =3D {
> +       {"SOUTHPORT_A",         SPT_PMC_LTR_SPA},
> +       {"SOUTHPORT_B",         SPT_PMC_LTR_SPB},
> +       {"SATA",                SPT_PMC_LTR_SATA},
> +       {"GIGABIT_ETHERNET",    SPT_PMC_LTR_GBE},
> +       {"XHCI",                SPT_PMC_LTR_XHCI},

> +       /* IP 5 is reserved */
Since we dropped explicit numbering, this line and similar sounds redundant=
.

> +       {"ME",                  SPT_PMC_LTR_ME},
> +       /* EVA is Enterprise Value Add, doesn't really exist on PCH */
> +       {"EVA",                 SPT_PMC_LTR_EVA},
> +       {"SOUTHPORT_C",         SPT_PMC_LTR_SPC},
> +       {"HD_AUDIO",            SPT_PMC_LTR_AZ},
> +       /* IP 10 is reserved */
> +       {"LPSS",                SPT_PMC_LTR_LPSS},
> +       {"SOUTHPORT_D",         SPT_PMC_LTR_SPD},
> +       {"SOUTHPORT_E",         SPT_PMC_LTR_SPE},
> +       {"CAMERA",              SPT_PMC_LTR_CAM},
> +       {"ESPI",                SPT_PMC_LTR_ESPI},
> +       {"SCC",                 SPT_PMC_LTR_SCC},
> +       {"ISH",                 SPT_PMC_LTR_ISH},
> +       /* Below two cannot be used for LTR_IGNORE */
> +       {"CURRENT_PLATFORM",    SPT_PMC_LTR_CUR_PLT},
> +       {"AGGREGATED_SYSTEM",   SPT_PMC_LTR_CUR_ASLT},
> +       {}
> +};

>  /* Cannonlake Power Management Controller register offsets */
> -#define CNP_PMC_SLP_S0_RES_COUNTER_OFFSET      0x193C
> -#define CNP_PMC_LTR_IGNORE_OFFSET              0x1B0C
> -#define CNP_PMC_PM_CFG_OFFSET                  0x1818
> +#define CNP_PMC_SLP_S0_RES_COUNTER_OFFSET      0x193C
> +#define CNP_PMC_LTR_IGNORE_OFFSET              0x1B0C
> +#define CNP_PMC_PM_CFG_OFFSET                  0x1818
>  #define CNP_PMC_SLPS0_DBG_OFFSET               0x10B4

Can we preserve ordering?

>  /* Cannonlake: PGD PFET Enable Ack Status Register(s) start */
> -#define CNP_PMC_HOST_PPFEAR0A                  0x1D90
> +#define CNP_PMC_HOST_PPFEAR0A                  0x1D90

What's wrong with this line? Why is it changed?

>
> -#define CNP_PMC_MMIO_REG_LEN                   0x2000
> -#define CNP_PPFEAR_NUM_ENTRIES                 8
> -#define CNP_PMC_READ_DISABLE_BIT               22
> +#define CNP_PMC_MMIO_REG_LEN                   0x2000
> +#define CNP_PPFEAR_NUM_ENTRIES                 8
> +#define CNP_PMC_READ_DISABLE_BIT               22

What happened to these lines?

>  #define CNP_PMC_LATCH_SLPS0_EVENTS             BIT(31)

Perhaps
 + blank line
here

> +#define CNP_PMC_LTR_CUR_PLT                    0x1B50
> +#define CNP_PMC_LTR_CUR_ASLT                   0x1B54
> +#define CNP_PMC_LTR_SPA                                0x1B60
> +#define CNP_PMC_LTR_SPB                                0x1B64
> +#define CNP_PMC_LTR_SATA                       0x1B68
> +#define CNP_PMC_LTR_GBE                                0x1B6C
> +#define CNP_PMC_LTR_XHCI                       0x1B70
> +#define CNP_PMC_LTR_ME                         0x1B78
> +#define CNP_PMC_LTR_EVA                                0x1B7C
> +#define CNP_PMC_LTR_SPC                                0x1B80
> +#define CNP_PMC_LTR_AZ                         0x1B84
> +#define CNP_PMC_LTR_LPSS                       0x1B8C
> +#define CNP_PMC_LTR_CAM                                0x1B90
> +#define CNP_PMC_LTR_SPD                                0x1B94
> +#define CNP_PMC_LTR_SPE                                0x1B98
> +#define CNP_PMC_LTR_ESPI                       0x1B9C
> +#define CNP_PMC_LTR_SCC                                0x1BA0
> +#define CNP_PMC_LTR_ISH                                0x1BA4
> +#define CNP_PMC_LTR_CNV                                0x1BF0
> +#define CNP_PMC_LTR_EMMC                       0x1BF4
> +#define CNP_PMC_LTR_UFSX2                      0x1BF8

--=20
With Best Regards,
Andy Shevchenko
