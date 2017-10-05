From: Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v3 07/14] xhci: Add Intel cherrytrail extended cap / otg
 phy mux handling
Date: Thu, 5 Oct 2017 14:13:32 +0300
Message-ID: <59D613DC.5020906@intel.com>
References: <20170922183803.10701-1-hdegoede@redhat.com>
 <20170922183803.10701-7-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:57954 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751548AbdJELJp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 07:09:45 -0400
In-Reply-To: <20170922183803.10701-7-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org

On 22.09.2017 21:37, Hans de Goede wrote:
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
> Note this commit adds a call to the new xhci_ext_cap_init() function
> to xhci_pci_probe(), it is added here because xhci_ext_cap_init() must
> be called only once. If in the future we also want to handle ext-caps
> on non pci XHCI HCDs from xhci_ext_cap_init() a call to it should also
> be added to other bus probe paths.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -Check xHCI controller PCI device-id instead of only checking for the
>   Intel Extended capability ID, as the Extended capability ID is used on
>   other model Intel xHCI controllers too
>
> Changes in v3:
> -Add a new generic xhci_ext_cap_init() function and handle the new
>   XHCI_INTEL_CHT_USB_MUX quirk there.
> ---

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
