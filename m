From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 09/12] usb: roles: Add Intel XHCI USB role switch driver
Date: Fri, 16 Feb 2018 15:38:50 +0200
Message-ID: <20180216133850.GO1480@kuha.fi.intel.com>
References: <20180216104751.8371-1-hdegoede@redhat.com>
 <20180216104751.8371-10-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180216104751.8371-10-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 16, 2018 at 11:47:48AM +0100, Hans de Goede wrote:
> diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
> index 060643a1b5c8..7d1b8c82b208 100644
> --- a/drivers/usb/Makefile
> +++ b/drivers/usb/Makefile
> @@ -65,3 +65,5 @@ obj-$(CONFIG_USB_COMMON)	+= common/
>  obj-$(CONFIG_USBIP_CORE)	+= usbip/
>  
>  obj-$(CONFIG_TYPEC)		+= typec/
> +
> +obj-$(CONFIG_USB_ROLE_SWITCH)	+= roles/
> diff --git a/drivers/usb/roles/Kconfig b/drivers/usb/roles/Kconfig
> new file mode 100644
> index 000000000000..e5c2bfaf8ba5
> --- /dev/null
> +++ b/drivers/usb/roles/Kconfig
> @@ -0,0 +1,14 @@
> +if USB_ROLE_SWITCH
> +
> +config USB_ROLES_INTEL_XHCI
> +	tristate "Intel XHCI USB Role Switch"
> +	depends on ACPI && X86 && EXTCON

Hold on... There is no dependency on extcon, or is there?


Thanks,

-- 
heikki
