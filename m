From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Tue, 31 May 2011 14:02:46 +0800
Message-ID: <4DE48486.1050702@canonical.com>
References: <4DAB18C3.7010106@flanto.de> <4DAB9566.7010601@canonical.com> <4DB92866.4000008@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:35085 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751150Ab1EaGCx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 31 May 2011 02:02:53 -0400
In-Reply-To: <4DB92866.4000008@flanto.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Florian Heyer <heyho@flanto.de>
Cc: platform-driver-x86@vger.kernel.org

Hi Florian,

Sorry its being awhile. Thanks for your reply, the notify looks fine but after
reading the DSDT I find no hint how to fix it. :(

It looks like we need acer_wmi to unseal the wifi switch. I am thinking of
two solutions. The first one is to have a module parameter to avoid reading
switch status. The second one is to find out how to unseal the switch function
with wmi (maybe a worse idea).

First thing I need to ask is there any side effect to load acer-wmi on your
ideapad?



On 04/28/2011 04:42 PM, Florian Heyer wrote:
> On 18.04.2011 03:35, Ike Panhc wrote:
>> In the mean time. Some test is suggested.
>>
> [...]
>>  * Insert a printk in notify function like this
>>
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -449,6 +449,7 @@ static void ideapad_acpi_notify(struct acpi_device *adevice, u32 event)
>>         acpi_handle handle = adevice->handle;
>>         unsigned long vpc1, vpc2, vpc_bit;
>>  
>> +       pr_info("notified. event: 0x%X.\n", event);
>>         if (read_ec_data(handle, 0x10, &vpc1))
>>                 return;
>>         if (read_ec_data(handle, 0x1A, &vpc2))
>>
>>    and see if we have the acpi event on switch event.
> 
> Hello Ike,
> 
> i'm back at this problem.
> I have loaded module ideapad_laptop with modification as above.
> 
> On triggering the hardware wifi button on->off->on i get the following
> messages:
> 
> [  730.712030] usb 3-5: USB disconnect, device number 4
> [  730.713156] btusb_bulk_complete: hci0 urb ffff8801178d7b40 failed to
> resubmit (19)
> [  730.713183] btusb_intr_complete: hci0 urb ffff880115e6c780 failed to
> resubmit (19)
> [  730.713983] btusb_bulk_complete: hci0 urb ffff8801178d7000 failed to
> resubmit (19)
> [  730.714236] btusb_send_frame: hci0 urb ffff880114055600 submission failed
> [  730.715438] notified. event: 0x80.
> [  731.710317] hci_cmd_timer: hci0 command tx timeout
> [  732.008870] notified. event: 0x80.
> [  732.650384] usb 3-5: new full speed USB device number 5 using ohci_hcd
> 
> 
> Other function buttons (e.g. screen brightness adjustment) also produce
> messages as above "notified. event: 0x80."
> 
> 
> Regards
