From: Florian Heyer <heyho@flanto.de>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Thu, 28 Apr 2011 10:42:14 +0200
Message-ID: <4DB92866.4000008@flanto.de>
References: <4DAB18C3.7010106@flanto.de> <4DAB9566.7010601@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from melmac.flanto.de ([78.46.67.50]:51817 "EHLO melmac.flanto.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932124Ab1D1ImR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Apr 2011 04:42:17 -0400
In-Reply-To: <4DAB9566.7010601@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On 18.04.2011 03:35, Ike Panhc wrote:
> In the mean time. Some test is suggested.
> 
[...]
>  * Insert a printk in notify function like this
> 
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -449,6 +449,7 @@ static void ideapad_acpi_notify(struct acpi_device *adevice, u32 event)
>         acpi_handle handle = adevice->handle;
>         unsigned long vpc1, vpc2, vpc_bit;
>  
> +       pr_info("notified. event: 0x%X.\n", event);
>         if (read_ec_data(handle, 0x10, &vpc1))
>                 return;
>         if (read_ec_data(handle, 0x1A, &vpc2))
> 
>    and see if we have the acpi event on switch event.

Hello Ike,

i'm back at this problem.
I have loaded module ideapad_laptop with modification as above.

On triggering the hardware wifi button on->off->on i get the following
messages:

[  730.712030] usb 3-5: USB disconnect, device number 4
[  730.713156] btusb_bulk_complete: hci0 urb ffff8801178d7b40 failed to
resubmit (19)
[  730.713183] btusb_intr_complete: hci0 urb ffff880115e6c780 failed to
resubmit (19)
[  730.713983] btusb_bulk_complete: hci0 urb ffff8801178d7000 failed to
resubmit (19)
[  730.714236] btusb_send_frame: hci0 urb ffff880114055600 submission failed
[  730.715438] notified. event: 0x80.
[  731.710317] hci_cmd_timer: hci0 command tx timeout
[  732.008870] notified. event: 0x80.
[  732.650384] usb 3-5: new full speed USB device number 5 using ohci_hcd


Other function buttons (e.g. screen brightness adjustment) also produce
messages as above "notified. event: 0x80."


Regards
-- 
Florian Heyer - heyho@flanto.de
