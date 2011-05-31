From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Tue, 31 May 2011 00:28:08 -0600
Message-ID: <4DE51718020000230002D4CF@novprvlin0050.provo.novell.com>
References: <4DAB18C3.7010106@flanto.de> <4DAB9566.7010601@canonical.com>
 <4DB92866.4000008@flanto.de> <4DE48486.1050702@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <4DE48486.1050702@canonical.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com
Cc: heyho@flanto.de, platform-driver-x86@vger.kernel.org

Hi Ike,=20

Does there have any acpidump attached on any bug, then I can download
it?
Need my help to look at maybe acer-wmi can support this machine?


Thank's a lot!
Joey Lee

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-05-31 =E6=96=BC 14:02 +0800=EF=BC=8CIk=
e Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> Hi Florian,
>=20
> Sorry its being awhile. Thanks for your reply, the notify looks fine =
but after
> reading the DSDT I find no hint how to fix it. :(
>=20
> It looks like we need acer_wmi to unseal the wifi switch. I am thinki=
ng of
> two solutions. The first one is to have a module parameter to avoid r=
eading
> switch status. The second one is to find out how to unseal the switch=
 function
> with wmi (maybe a worse idea).
>=20
> First thing I need to ask is there any side effect to load acer-wmi o=
n your
> ideapad?
>=20
>=20
>=20
> On 04/28/2011 04:42 PM, Florian Heyer wrote:
> > On 18.04.2011 03:35, Ike Panhc wrote:
> >> In the mean time. Some test is suggested.
> >>
> > [...]
> >>  * Insert a printk in notify function like this
> >>
> >> --- a/drivers/platform/x86/ideapad-laptop.c
> >> +++ b/drivers/platform/x86/ideapad-laptop.c
> >> @@ -449,6 +449,7 @@ static void ideapad_acpi_notify(struct acpi_de=
vice *adevice, u32 event)
> >>         acpi_handle handle =3D adevice->handle;
> >>         unsigned long vpc1, vpc2, vpc_bit;
> >> =20
> >> +       pr_info("notified. event: 0x%X.\n", event);
> >>         if (read_ec_data(handle, 0x10, &vpc1))
> >>                 return;
> >>         if (read_ec_data(handle, 0x1A, &vpc2))
> >>
> >>    and see if we have the acpi event on switch event.
> >=20
> > Hello Ike,
> >=20
> > i'm back at this problem.
> > I have loaded module ideapad_laptop with modification as above.
> >=20
> > On triggering the hardware wifi button on->off->on i get the follow=
ing
> > messages:
> >=20
> > [  730.712030] usb 3-5: USB disconnect, device number 4
> > [  730.713156] btusb_bulk_complete: hci0 urb ffff8801178d7b40 faile=
d to
> > resubmit (19)
> > [  730.713183] btusb_intr_complete: hci0 urb ffff880115e6c780 faile=
d to
> > resubmit (19)
> > [  730.713983] btusb_bulk_complete: hci0 urb ffff8801178d7000 faile=
d to
> > resubmit (19)
> > [  730.714236] btusb_send_frame: hci0 urb ffff880114055600 submissi=
on failed
> > [  730.715438] notified. event: 0x80.
> > [  731.710317] hci_cmd_timer: hci0 command tx timeout
> > [  732.008870] notified. event: 0x80.
> > [  732.650384] usb 3-5: new full speed USB device number 5 using oh=
ci_hcd
> >=20
> >=20
> > Other function buttons (e.g. screen brightness adjustment) also pro=
duce
> > messages as above "notified. event: 0x80."
> >=20
> >=20
> > Regards
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
