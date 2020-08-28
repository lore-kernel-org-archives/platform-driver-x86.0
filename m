From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH V5 0/3] Intel Platform Monitoring Technology
Date: Fri, 28 Aug 2020 11:56:55 +0100
Message-ID: <20200828105655.GU1826686@dell>
References: <20200819180255.11770-1-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200819180255.11770-1-david.e.box@linux.intel.com>
Sender: linux-pci-owner@vger.kernel.org
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com, alexander.h.duyck@linux.intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 19 Aug 2020, David E. Box wrote:

[...]

> David E. Box (3):
>   PCI: Add defines for Designated Vendor-Specific Extended Capability
>   mfd: Intel Platform Monitoring Technology support
>   platform/x86: Intel PMT Telemetry capability driver
> 
>  .../ABI/testing/sysfs-class-pmt_telemetry     |  46 ++
>  MAINTAINERS                                   |   6 +
>  drivers/mfd/Kconfig                           |  10 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/intel_pmt.c                       | 220 +++++++++
>  drivers/platform/x86/Kconfig                  |  10 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/intel_pmt_telemetry.c    | 448 ++++++++++++++++++
>  include/uapi/linux/pci_regs.h                 |   5 +
>  9 files changed, 747 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-pmt_telemetry
>  create mode 100644 drivers/mfd/intel_pmt.c
>  create mode 100644 drivers/platform/x86/intel_pmt_telemetry.c

What's the plan for this set?

I'm happy to pick it up and take it through MFD if required.

If that's the route of choice, I'll pick it up in just over a week.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
