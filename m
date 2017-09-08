From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 04/11] usb: xhci: Add Intel cherrytrail extended cap /
 otg phy mux handling
Date: Fri, 8 Sep 2017 17:47:22 +0200
Message-ID: <354fbada-a1d7-5542-26a0-a10034f35d6a@axentia.se>
References: <20170905164221.11266-1-hdegoede@redhat.com>
 <20170905164221.11266-5-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170905164221.11266-5-hdegoede@redhat.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Hans de Goede <hdegoede@redhat.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On 2017-09-05 18:42, Hans de Goede wrote:
> The Intel cherrytrail xhci controller has an extended cap mmio-range
> which contains registers to control the muxing to the xhci (host mode)
> or the dwc3 (device mode) and vbus-detection for the otg usb-phy.
> 
> Having a mux driver included in the xhci code (or under drivers/usb/host)
> is not desirable. So this commit adds a simple handler for this extended
> capability, which creates a platform device with the caps mmio region as
> resource, this allows us to write a separate platform mux driver for the
> mux.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -Check xHCI controller PCI device-id instead of only checking for the
>  Intel Extended capability ID, as the Extended capability ID is used on
>  other model Intel xHCI controllers too
> ---
>  drivers/usb/host/Makefile            |  2 +-
>  drivers/usb/host/xhci-intel-quirks.c | 85 ++++++++++++++++++++++++++++++++++++
>  drivers/usb/host/xhci-pci.c          |  4 ++
>  drivers/usb/host/xhci.h              |  2 +
>  4 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/usb/host/xhci-intel-quirks.c
> 
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index cf2691fffcc0..441edf82eb1c 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -63,7 +63,7 @@ obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)	+= ohci-da8xx.o
>  obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
>  obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
>  obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
> -obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
> +obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o xhci-intel-quirks.o
>  obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
>  obj-$(CONFIG_USB_XHCI_MTK)	+= xhci-mtk.o
>  obj-$(CONFIG_USB_XHCI_TEGRA)	+= xhci-tegra.o
> diff --git a/drivers/usb/host/xhci-intel-quirks.c b/drivers/usb/host/xhci-intel-quirks.c
> new file mode 100644
> index 000000000000..819f5f9da9ee
> --- /dev/null
> +++ b/drivers/usb/host/xhci-intel-quirks.c
> @@ -0,0 +1,85 @@
> +/*
> + * Intel Vendor Defined XHCI extended capability handling
> + *
> + * Copyright (c) 2016) Hans de Goede <hdegoede@redhat.com>

2017? And drop the stray bracket.

Cheers,
Peter
