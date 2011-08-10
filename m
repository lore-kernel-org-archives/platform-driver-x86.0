From: joeyli <jlee@suse.com>
Subject: Re: [Fwd: Re: A problem about acer-wmi]
Date: Wed, 10 Aug 2011 10:13:48 +0800
Message-ID: <1312942428.24471.139.camel@linux-s257.site>
References: <4E25AFC7020000230002F7D1@novprvlin0050.provo.novell.com>
	 <CAMz9Wg9ZZvcb+USmPMqXZ3zFRct8qme=7C2UwxKThaANZ=PB6A@mail.gmail.com>
	 <1312856096.24471.127.camel@linux-s257.site>
	 <CAMz9Wg_RKGBYo+2ogamoVWscaXLx1=jX1ic+3uDqAYeovWx1tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:57881 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361Ab1HJCRM (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Tue, 9 Aug 2011 22:17:12 -0400
In-Reply-To: <CAMz9Wg_RKGBYo+2ogamoVWscaXLx1=jX1ic+3uDqAYeovWx1tQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan@gmail.com>
Cc: Joey Lee <jlee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-08-09 =E6=96=BC 14:33 +0800=EF=BC=8CAc=
eLan Kao =E6=8F=90=E5=88=B0=EF=BC=9A
> Dear Joey,
>=20
> The current project we have right now have to follow the Acer WMI to
> handle the key events, that means no EC key event.
> And we have 3 keys that are not working now, they are touchpad toggle=
,
> brightness up, and brightness down.
> The touchpad toggle function is a Hotkey Break Event(function number
> 0x2), and brightness key events are Brightness Change Event(function
> number 0x4). But now acer-wmi driver only handles General Hotkey
> Event(function number 0x1).
>=20

Yes, current acer-wmi only capture the event function number 0x1, you
can add those new function to acer_wmi_notify().

> I just implemented those 3 key events, so I think maybe we don't have
> to create a new acer-wmi driver.

Great! Welcome for you patches, I will also test it.

> I'm longing for your work to clear up the acer-wmi driver, so that I
> can add the new machine id and send you the patch.
> Thanks.
>=20
> BTW, I'm available to help if you are too busy to do that.
>=20
> Best regards,
> AceLan Kao.
>=20

I am doing the clear up, now, will send out patch (I hope today).


Thank's
Joey Lee

> 2011/8/9 joeyli <jlee@suse.com>:
> > =E6=96=BC =E4=BA=8C=EF=BC=8C2011-08-09 =E6=96=BC 10:05 +0800=EF=BC=8C=
AceLan Kao =E6=8F=90=E5=88=B0=EF=BC=9A
> >> Dear Joey,
> >>
> >> Is there any progress of the acer-wmi patch?
> >>
> >
> > Sorry for I am busy from last 2 weeks until now.
> >
> >> I read the Acer WMI/SMBIOS Spec. and think we might need to create=
 a
> >> new acer-wmi driver for the new machines and leave the original
> >> acer-wmi driver for the old ones.
> >> The GUID is changed and there are more functions be added in the s=
pec.
> >> that the acer-wmi driver is hard to handle now.
> >> And I'm not sure if I can implement a open source wmi driver from =
the spec.
> >> Please input more idea about this, thanks.
> >>
> >> Best regards,
> >> AceLan Kao.
> >>
> >
> > I don't think we need a new acer-wmi driver to handle new machine,
> > because acer-wmi driver already support the following WMI methods:
> >
> > #define WMID_GUID3              "61EF69EA-865C-4BC3-A502-A0DEBA0CB5=
31"
> > #define ACERWMID_EVENT_GUID     "676AA15E-6A47-4D9F-A2CC-1E6D18D140=
26"
> >
> > I will find a bit time at this week to clear up acer-wmi driver.
> >
> > Did you see any function key or new function didn't handle by curre=
nt
> > acer-wmi driver?
> >
> >
> > Thank's
> > Joey Lee
> >
> >> 2011/7/19 Joey Lee <jlee@novell.com>:
> >> > Cc. to platform driver mail
> >> >
> >> > Hi AceLan,
> >> >
> >> > In old acer machine supports both old WMI_GUID1 and new WMI_WMID=
3, but
> >> > more and more machines removed old WMI_GUID1 method and just sup=
port new
> >> > one.
> >> >
> >> > I will spend a bit time to clear up acer-wmi driver, add support=
 to
> >> > those new machines.
> >> > I will send out patches for review.
> >> >
> >> >
> >> >
> >> > Thank's a lot!
> >> > Joey Lee
> >> >
> >> >
> >> > -------- =E8=BD=89=E9=81=9E=E7=9A=84=E9=83=B5=E4=BB=B6 --------
> >> >> =E8=87=AA: AceLan Kao <acelan.kao@canonical.com>
> >> >> =E8=87=B3: Joey Lee <jlee@novell.com>
> >> >> =E4=B8=BB=E6=97=A8: Re: A problem about acer-wmi
> >> >> =E6=97=A5=E6=9C=9F: Tue, 19 Jul 2011 11:37:28 +0800
> >> >>
> >> >> Dear Joey,
> >> >>
> >> >> Thanks for your quick response.
> >> >> Here are the logs and it's good to discuss this issue on platfo=
rm driver list.
> >> >> Thanks.
> >> >>
> >> >> Best regards,
> >> >> AceLan Kao.
> >> >>
> >> >> 2011/7/19 Joey Lee <jlee@novell.com>:
> >> >> > =E6=96=BC =E4=BA=8C=EF=BC=8C2011-07-19 =E6=96=BC 02:57 +0000=EF=
=BC=8Cjoeyli(Joey Lee) =E6=8F=90=E5=88=B0=EF=BC=9A
> >> >> >> Hi Kao,
> >> >> >>
> >> >> >> =E6=96=BC =E4=BA=8C=EF=BC=8C2011-07-19 =E6=96=BC 09:43 +0800=
=EF=BC=8CAceLan Kao =E6=8F=90=E5=88=B0=EF=BC=9A
> >> >> >> > Dear Joey,
> >> >> >> >
> >> >> >> > We have a new machine the model is Acer Aspire 4739Z
> >> >> >> > I tried to add it's model in acer_quirks struct, but in
> >> >> >> > acer_wmi_init(), it can't find it's interface.
> >> >> >> >        {
> >> >> >> >                .callback =3D dmi_matched,
> >> >> >> >                .ident =3D "Acer Aspire 4739Z",
> >> >> >> >                .matches =3D {
> >> >> >> >                        DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> >> >> >> >                        DMI_MATCH(DMI_PRODUCT_NAME, "AS4739=
Z"),
> >> >> >> >                },
> >> >> >> >                .driver_data =3D &quirk_acer_travelmate_249=
0,
> >> >> >> >        },
> >> >> >> >
> >> >> >> > wmi_has_guid(AMW0_GUID1), wmi_has_guid(WMID_GUID1), and
> >> >> >> > wmi_has_guid(WMID_GUID2) all return 0.
> >> >> >> > And, wmi_has_guid(WMID_GUID3) and wmi_has_guid(ACERWMID_EV=
ENT_GUID) return 1.
> >> >> >> >
> >> >> >> > I don't understand the logic of those wmi_has_guid(), so I=
 don't know
> >> >> >> > how to modify them, I just assigned the interface as
> >> >> >> >   interface =3D &wmid_interface;
> >> >> >> > and that would make us capture the KEY_F22(Touch Pad On/Of=
f) event and
> >> >> >> > get the OSD appeared.
> >> >> >> >
> >> >> >> > Please direct me how to add this h/w correctly into acer_w=
mi.c and
> >> >> >> > please let me know if I should provide any info you need.
> >> >> >> > Thanks.
> >> >> >> >
> >> >> >> > Best regards,
> >> >> >> > AceLan Kao.
> >> >> >> >
> >> >> >>
> >> >> >> Thank's for you pay attention to acer-wmi driver. Please att=
ached the
> >> >> >> dmidecode log and acpidump on this mail to me.
> >> >> >> Then, I can trace the DSDT to find out good way.
> >> >> >>
> >> >> >
> >> >> > Forgot tell how to capture the log and DSDT:
> >> >> >  + dmidecode > dmidecode.log
> >> >> >  + acpidump > acpidump.dat
> >> >> >
> >> >> >
> >> >> > Thank's a lot!
> >> >> > Joey Lee
> >> >> >
> >> >> >> And,
> >> >> >> Do you mind if I forward this mail to platform driver group =
on kernel
> >> >> >> upstream?
> >> >> >> Then we can discuss on upstream, maybe have more experts can=
 provide
> >> >> >> commants to us.
> >> >> >>
> >> >> >>
> >> >> >> Thank's a lot!
> >> >> >> Joey Lee
> >> >> >
> >> >> >
> >> >> >
> >> >>
> >> >>
> >> >>
> >> >
> >> >
> >> >
> >>
> >>
> >>
> >
> >
> >
>=20
>=20
>=20
