From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 1/1] Introduce Intel RAPL cooling device driver
Date: Tue, 09 Apr 2013 17:01:17 -0700
Message-ID: <1365552077.18072.28.camel@joe-AO722>
References: <1365551209-14392-1-git-send-email-jacob.jun.pan@linux.intel.com>
	 <1365551209-14392-2-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1365551209-14392-2-git-send-email-jacob.jun.pan@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2013-04-09 at 16:46 -0700, Jacob Pan wrote:
> RAPL(Running Average Power Limit) interface provides platform software
> with the ability to monitor, control, and get notifications on SOC
> power consumptions.

yet more trivia and style quibbles.

> diff --git a/drivers/platform/x86/intel_rapl.c b/drivers/platform/x86/intel_rapl.c
[]
> +static int rapl_get_max_state(struct thermal_cooling_device *cdev,
> +			unsigned long *state)
> +{
> +	int ret;
> +	u64 val;
> +
> +	struct rapl_domain *rd = (struct rapl_domain *)cdev->devdata;

Don't need to cast void *

	struct rapl_domain *rd = cdev->devdata;

is just fine.

> +static int rapl_get_cur_state(struct thermal_cooling_device *cdev, unsigned long
> +			     *state)
> +{
> +	struct rapl_domain *rd = (struct rapl_domain *)cdev->devdata;

etc

> +static void set_pkg_thermal_irq(bool enable)
> +{
[]
> +	if (boot_cpu_has(X86_FEATURE_PTS))
> +		rdmsr(MSR_IA32_PACKAGE_THERM_INTERRUPT, l, h);
> +	else
> +		return;

	if (!boot_cpu_has(X86_FEATURE_PTS))
		return;

	rdmsc(etc...)

> +
> +	if (enable == false)

Don't test for == false

> +		l &= ~PACKAGE_THERM_INT_PLN_ENABLE;
> +	else
> +		l |= PACKAGE_THERM_INT_PLN_ENABLE;
> +
> +	if (boot_cpu_has(X86_FEATURE_PLN))
> +		wrmsr(MSR_IA32_PACKAGE_THERM_INTERRUPT, l, h);

	if (boot_cpu_has(X86_FEATURE_PTS)) {
		if (enable)
			l |= PACKAGE_THERM_INT_PLN_ENABLE;
		else
			l &= ~PACKAGE_THERM_INT_PLN_ENABLE;
		wrmsr(MSR_IA32_PACKAGE_THERM_INTERRUPT, l, h);
	}
