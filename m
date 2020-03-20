From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [patch 17/22] PCI: intel-mid: Convert to new X86 CPU match macros
Date: Fri, 20 Mar 2020 09:30:53 -0500
Message-ID: <20200320143053.GA187287@google.com>
References: <20200320131510.393113444@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200320131510.393113444@linutronix.de>
Sender: linux-hwmon-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, linux-pci@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 20, 2020 at 02:14:02PM +0100, Thomas Gleixner wrote:
> The new macro set has a consistent namespace and uses C99 initializers
> instead of the grufty C89 ones.
> 
> Get rid the of the local macro wrappers for consistency.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/pci-mid.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> --- a/drivers/pci/pci-mid.c
> +++ b/drivers/pci/pci-mid.c
> @@ -55,15 +55,13 @@ static const struct pci_platform_pm_ops
>  	.need_resume	= mid_pci_need_resume,
>  };
>  
> -#define ICPU(model)	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> -
>  /*
>   * This table should be in sync with the one in
>   * arch/x86/platform/intel-mid/pwr.c.
>   */
>  static const struct x86_cpu_id lpss_cpu_ids[] = {
> -	ICPU(INTEL_FAM6_ATOM_SALTWELL_MID),
> -	ICPU(INTEL_FAM6_ATOM_SILVERMONT_MID),
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SALTWELL_MID, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT_MID, NULL),
>  	{}
>  };
>  
> 
