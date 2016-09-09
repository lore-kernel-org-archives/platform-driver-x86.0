From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-wmi: Set specified XUSB2PR value for X550LB
Date: Fri, 9 Sep 2016 09:58:20 -0700
Message-ID: <20160909165820.GB17607@f23x64.localdomain>
References: <1472745355-13428-1-git-send-email-kai.chiuan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38483 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752975AbcIIQ6W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Sep 2016 12:58:22 -0400
Content-Disposition: inline
In-Reply-To: <1472745355-13428-1-git-send-email-kai.chiuan@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kai-Chuan Hsieh <kai.chiuan@gmail.com>
Cc: corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org

On Thu, Sep 01, 2016 at 11:55:55PM +0800, Kai-Chuan Hsieh wrote:
> The bluetooth adapter Atheros AR3012 can't be enumerated
> and make the bluetooth function broken.
> 
> T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=02 Dev#=  5 Spd=12  MxCh= 0
> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=13d3 ProdID=3362 Rev=00.02
> S:  Manufacturer=Atheros Communications
> S:  Product=Bluetooth USB Host Controller
> S:  SerialNumber=Alaska Day 2006
> C:  #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
> I:  If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> I:  If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> 
> The error is:
> 
>  usb 2-6: device not accepting address 7, error -62
>  usb usb2-port6: unable to enumerate USB device
> 
> It is caused by adapter's connected port is mapped to xHC
> controller, but the xHCI is not supported by the usb device.
> 
> The output of 'sudo lspci -nnxxx -s 00:14.0':
> 
>  00:14.0 USB controller [0c03]: Intel Corporation 8 Series USB xHCI HC [8086:9c31] (rev 04)
>  00: 86 80 31 9c 06 04 90 02 04 30 03 0c 00 00 00 00
>  10: 04 00 a0 f7 00 00 00 00 00 00 00 00 00 00 00 00
>  20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 1f 20
>  30: 00 00 00 00 70 00 00 00 00 00 00 00 0b 01 00 00
>  40: fd 01 36 80 89 c6 0f 80 00 00 00 00 00 00 00 00
>  50: 5f 2e ce 0f 00 00 00 00 00 00 00 00 00 00 00 00
>  60: 30 20 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  70: 01 80 c2 c1 08 00 00 00 00 00 00 00 00 00 00 00
>  80: 05 00 87 00 0c a0 e0 fe 00 00 00 00 a1 41 00 00
>  90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  a0: 00 01 04 00 00 00 00 00 00 00 00 00 00 00 00 00
>  b0: 0f 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00
>  c0: 03 c0 30 00 00 00 00 00 03 0c 00 00 00 00 00 00
>  d0: f9 01 00 00 f9 01 00 00 0f 00 00 00 0f 00 00 00
>  e0: 00 08 00 00 00 00 00 00 00 00 00 00 d8 d8 00 00
>  f0: 00 00 00 00 00 00 00 00 b1 0f 04 08 00 00 00 00
> 
> By referencing Intel Platform Controller Hub(PCH) datasheet,
> the xHC USB 2.0 Port Routing(XUSB2PR) at offset 0xD0-0xD3h
> decides the setting of mapping the port to EHCI controller or
> xHC controller. And the port mapped to xHC will enable xHCI
> during bus resume.
> 
> The setting of disabling bluetooth adapter's connected port is
> 0x000001D9. The value can be obtained by few times 1 bit flip
> operation. The suited configuration should have the 'lsusb -t'
> result with bluetooth using ehci:
> 
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/9p, 480M
>     |__ Port 5: Dev 2, If 0, Class=Video, Driver=uvcvideo, 480M
>     |__ Port 5: Dev 2, If 1, Class=Video, Driver=uvcvideo, 480M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M
>         |__ Port 6: Dev 3, If 0, Class=Wireless, Driver=btusb, 12M
>         |__ Port 6: Dev 3, If 1, Class=Wireless, Driver=btusb, 12M
> 
> Signed-off-by: Kai-Chuan Hsieh <kai.chiuan@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
>  drivers/platform/x86/asus-wmi.c    | 29 +++++++++++++++++++++++++++++
>  drivers/platform/x86/asus-wmi.h    |  1 +
>  3 files changed, 43 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index adecc1c..b64dc16 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -87,6 +87,10 @@ static struct quirk_entry quirk_no_rfkill_wapf4 = {
>  	.no_rfkill = true,
>  };
>  
> +static struct quirk_entry quirk_asus_x550lb = {
> +	.xusb2pr = 0x01D9,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>  	quirks = dmi->driver_data;
> @@ -351,6 +355,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_no_rfkill,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUSTeK COMPUTER INC. X550LB",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "X550LB"),
> +		},
> +		.driver_data = &quirk_asus_x550lb,
> +	},
>  	{},
>  };
>  
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 7c093a0..8cd689a 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -156,6 +156,9 @@ MODULE_LICENSE("GPL");
>  #define ASUS_FAN_CTRL_MANUAL		1
>  #define ASUS_FAN_CTRL_AUTO		2
>  
> +#define USB_INTEL_XUSB2PR		0xD0
> +#define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
> +
>  struct bios_args {
>  	u32 arg0;
>  	u32 arg1;
> @@ -1080,6 +1083,29 @@ exit:
>  	return result;
>  }
>  
> +static void asus_wmi_set_xusb2pr(struct asus_wmi *asus)
> +{
> +	struct pci_dev *xhci_pdev;
> +	u32 orig_ports_available;
> +	u32 ports_available = asus->driver->quirks->xusb2pr;
> +
> +	xhci_pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
> +			PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI,
> +			NULL);
> +
> +	if (!xhci_pdev)
> +		return;
> +
> +	pci_read_config_dword(xhci_pdev, USB_INTEL_XUSB2PR,
> +				&orig_ports_available);
> +
> +	pci_write_config_dword(xhci_pdev, USB_INTEL_XUSB2PR,
> +				cpu_to_le32(ports_available));
> +
> +	pr_info("set USB_INTEL_XUSB2PR old: 0x%04x, new: 0x%04x\n",
> +			orig_ports_available, ports_available);
> +}

These seems more appropriate as a debug statement than an info statement to me.
This certainly isn't at the level a user would need to see.

Otherwise, this looks good to me.

Corentin, any other concerns?

> +
>  /*
>   * Hwmon device
>   */
> @@ -2084,6 +2110,9 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (asus->driver->quirks->wmi_backlight_power)
>  		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
>  
> +	if (asus->driver->quirks->xusb2pr)
> +		asus_wmi_set_xusb2pr(asus);
> +
>  	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
>  		err = asus_wmi_backlight_init(asus);
>  		if (err && err != -ENODEV)
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> index 5de1df5..cd6b108 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -51,6 +51,7 @@ struct quirk_entry {
>  	 * and let the ACPI interrupt to send out the key event.
>  	 */
>  	int no_display_toggle;
> +	u32 xusb2pr;
>  };
>  
>  struct asus_wmi_driver {
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
