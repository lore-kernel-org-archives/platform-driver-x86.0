From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH V3 3/3] platform/x86: Intel PMT Telemetry capability
 driver
Date: Wed, 15 Jul 2020 19:57:46 -0700
Message-ID: <8b759604-428c-8df1-e3c2-d8fa2c5f796c@infradead.org>
References: <20200508021844.6911-1-david.e.box@linux.intel.com>
 <20200714062323.19990-4-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200714062323.19990-4-david.e.box@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org, dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com, alexander.h.duyck@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 7/13/20 11:23 PM, David E. Box wrote:
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0581a54cf562..5e1f7ce6e69f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1396,6 +1396,16 @@ config INTEL_TELEMETRY
>  	  directly via debugfs files. Various tools may use
>  	  this interface for SoC state monitoring.
>  
> +config INTEL_PMT_TELEMETRY
> +	tristate "Intel Platform Monitoring Technology (PMT) Telemetry driver"
> +	help
> +	 The Intel Platform Monitory Technology (PMT) Telemetry driver provides
> +	 access to hardware telemetry metrics on devices that support the
> +	 feature.
> +
> +	 For more information, see
> +	 <file:Documentation/ABI/testing/sysfs-class-intel_pmt_telem>
> +
>  endif # X86_PLATFORM_DEVICES
>  
>  config PMC_ATOM

The text under "help" should be indented with one tab + 2 spaces,
as is done in patch 2/3.

-- 
~Randy
