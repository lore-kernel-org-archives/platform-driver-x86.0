From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V5 2/3] mfd: Intel Platform Monitoring Technology support
Date: Fri, 28 Aug 2020 11:53:04 +0100
Message-ID: <20200828105304.GS1826686@dell>
References: <20200819180255.11770-1-david.e.box@linux.intel.com>
 <20200819180255.11770-3-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200819180255.11770-3-david.e.box@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com, alexander.h.duyck@linux.intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 19 Aug 2020, David E. Box wrote:

> Intel Platform Monitoring Technology (PMT) is an architecture for
> enumerating and accessing hardware monitoring facilities. PMT supports
> multiple types of monitoring capabilities. This driver creates platform
> devices for each type so that they may be managed by capability specific
> drivers (to be introduced). Capabilities are discovered using PCIe DVSEC
> ids. Support is included for the 3 current capability types, Telemetry,
> Watcher, and Crashlog. The features are available on new Intel platforms
> starting from Tiger Lake for which support is added.
> 
> Also add a quirk mechanism for several early hardware differences and bugs.
> For Tiger Lake, do not support Watcher and Crashlog capabilities since they
> will not be compatible with future product. Also, fix use a quirk to fix
> the discovery table offset.
> 
> Co-developed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  MAINTAINERS             |   5 +
>  drivers/mfd/Kconfig     |  10 ++
>  drivers/mfd/Makefile    |   1 +
>  drivers/mfd/intel_pmt.c | 220 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 236 insertions(+)
>  create mode 100644 drivers/mfd/intel_pmt.c

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
