From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Tue, 31 May 2011 14:38:13 +0800
Message-ID: <4DE48CD5.1080008@canonical.com>
References: <4DAB18C3.7010106@flanto.de> <4DAB9566.7010601@canonical.com> <4DB92866.4000008@flanto.de> <4DE48486.1050702@canonical.com> <4DE51718020000230002D4CF@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:50888 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037Ab1EaGiU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 31 May 2011 02:38:20 -0400
In-Reply-To: <4DE51718020000230002D4CF@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: heyho@flanto.de, platform-driver-x86@vger.kernel.org

Hi Joey,

I put it at http://people.canonical.com/~ikepanhc/DSDTs/acpidump-ideapa=
d-s10-3t.dat

Thanks a lot.


On 05/31/2011 02:28 PM, Joey Lee wrote:
> Hi Ike,=20
>=20
> Does there have any acpidump attached on any bug, then I can download
> it?
> Need my help to look at maybe acer-wmi can support this machine?
>=20
>=20
> Thank's a lot!
> Joey Lee
>=20
> =E6=96=BC =E4=BA=8C=EF=BC=8C2011-05-31 =E6=96=BC 14:02 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
>> Hi Florian,
>>
>> Sorry its being awhile. Thanks for your reply, the notify looks fine=
 but after
>> reading the DSDT I find no hint how to fix it. :(
>>
>> It looks like we need acer_wmi to unseal the wifi switch. I am think=
ing of
>> two solutions. The first one is to have a module parameter to avoid =
reading
>> switch status. The second one is to find out how to unseal the switc=
h function
>> with wmi (maybe a worse idea).
>>
>> First thing I need to ask is there any side effect to load acer-wmi =
on your
>> ideapad?
>>
>>
>>
>> On 04/28/2011 04:42 PM, Florian Heyer wrote:
>>> On 18.04.2011 03:35, Ike Panhc wrote:
>>>> In the mean time. Some test is suggested.
>>>>
>>> [...]
>>>>  * Insert a printk in notify function like this
>>>>
>>>> --- a/drivers/platform/x86/ideapad-laptop.c
>>>> +++ b/drivers/platform/x86/ideapad-laptop.c
>>>> @@ -449,6 +449,7 @@ static void ideapad_acpi_notify(struct acpi_de=
vice *adevice, u32 event)
>>>>         acpi_handle handle =3D adevice->handle;
>>>>         unsigned long vpc1, vpc2, vpc_bit;
>>>> =20
>>>> +       pr_info("notified. event: 0x%X.\n", event);
>>>>         if (read_ec_data(handle, 0x10, &vpc1))
>>>>                 return;
>>>>         if (read_ec_data(handle, 0x1A, &vpc2))
>>>>
>>>>    and see if we have the acpi event on switch event.
>>>
>>> Hello Ike,
>>>
>>> i'm back at this problem.
>>> I have loaded module ideapad_laptop with modification as above.
>>>
>>> On triggering the hardware wifi button on->off->on i get the follow=
ing
>>> messages:
>>>
>>> [  730.712030] usb 3-5: USB disconnect, device number 4
>>> [  730.713156] btusb_bulk_complete: hci0 urb ffff8801178d7b40 faile=
d to
>>> resubmit (19)
>>> [  730.713183] btusb_intr_complete: hci0 urb ffff880115e6c780 faile=
d to
>>> resubmit (19)
>>> [  730.713983] btusb_bulk_complete: hci0 urb ffff8801178d7000 faile=
d to
>>> resubmit (19)
>>> [  730.714236] btusb_send_frame: hci0 urb ffff880114055600 submissi=
on failed
>>> [  730.715438] notified. event: 0x80.
>>> [  731.710317] hci_cmd_timer: hci0 command tx timeout
>>> [  732.008870] notified. event: 0x80.
>>> [  732.650384] usb 3-5: new full speed USB device number 5 using oh=
ci_hcd
>>>
>>>
>>> Other function buttons (e.g. screen brightness adjustment) also pro=
duce
>>> messages as above "notified. event: 0x80."
>>>
>>>
>>> Regards
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe platform-d=
river-x86" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
