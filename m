From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 08/12] xhci: Add Intel extended cap / otg phy mux handling
Date: Fri, 16 Feb 2018 15:32:28 +0200
Message-ID: <20180216133228.GN1480@kuha.fi.intel.com>
References: <20180216104751.8371-1-hdegoede@redhat.com>
 <20180216104751.8371-9-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180216104751.8371-9-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 16, 2018 at 11:47:47AM +0100, Hans de Goede wrote:
> The xHCI controller on various Intel SoCs has an extended cap mmio-range
> which contains registers to control the muxing to the xHCI (host mode)
> or the dwc3 (device mode) and vbus-detection for the otg usb-phy.
> 
> Having a role-sw driver included in the xhci code (under drivers/usb/host)
> is not desirable. So this commit adds a simple handler for this extended
> capability, which creates a platform device with the caps mmio region as
> resource, this allows us to write a separate platform role-sw driver for
> the role-switch.
> 
> Note this commit adds a call to the new xhci_ext_cap_init() function
> to xhci_pci_probe(), it is added here because xhci_ext_cap_init() must
> be called only once. If in the future we also want to handle ext-caps
> on non pci xHCI HCDs from xhci_ext_cap_init() a call to it should also
> be added to other bus probe paths.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


Thanks,

-- 
heikki
