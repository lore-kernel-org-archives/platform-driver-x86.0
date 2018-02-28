From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v5 08/12] xhci: Add Intel extended cap / otg phy mux
 handling
Date: Wed, 28 Feb 2018 17:15:52 +0200
Message-ID: <20180228151552.GA5335@kuha.fi.intel.com>
References: <20180228150749.26831-1-hdegoede@redhat.com>
 <20180228150749.26831-9-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180228150749.26831-9-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 28, 2018 at 04:07:45PM +0100, Hans de Goede wrote:
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 96099a245c69..5917e3095e2a 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1825,6 +1825,7 @@ struct xhci_hcd {
>  /* Reserved. It was XHCI_U2_DISABLE_WAKE */
>  #define XHCI_ASMEDIA_MODIFY_FLOWCONTROL	(1 << 28)
>  #define XHCI_HW_LPM_DISABLE	(1 << 29)
> +#define XHCI_INTEL_USB_ROLE_SW	(1 << 30)

Did you rebased these on tope of the latest usb-next? This does not
apply cleanly on top of linux-next.


Thanks,

-- 
heikki
