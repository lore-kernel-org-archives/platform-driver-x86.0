From: joeyli <jlee@suse.com>
Subject: Re: [Fwd: Re: A problem about acer-wmi]
Date: Tue, 09 Aug 2011 10:14:56 +0800
Message-ID: <1312856096.24471.127.camel@linux-s257.site>
References: <4E25AFC7020000230002F7D1@novprvlin0050.provo.novell.com>
	 <CAMz9Wg9ZZvcb+USmPMqXZ3zFRct8qme=7C2UwxKThaANZ=PB6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:47884 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751611Ab1HICSO (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Mon, 8 Aug 2011 22:18:14 -0400
In-Reply-To: <CAMz9Wg9ZZvcb+USmPMqXZ3zFRct8qme=7C2UwxKThaANZ=PB6A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Joey Lee <jlee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-08-09 =E6=96=BC 10:05 +0800=EF=BC=8CAc=
eLan Kao =E6=8F=90=E5=88=B0=EF=BC=9A
> Dear Joey,
>=20
> Is there any progress of the acer-wmi patch?
>=20

Sorry for I am busy from last 2 weeks until now.

> I read the Acer WMI/SMBIOS Spec. and think we might need to create a
> new acer-wmi driver for the new machines and leave the original
> acer-wmi driver for the old ones.
> The GUID is changed and there are more functions be added in the spec=
=2E
> that the acer-wmi driver is hard to handle now.
> And I'm not sure if I can implement a open source wmi driver from the=
 spec.
> Please input more idea about this, thanks.
>=20
> Best regards,
> AceLan Kao.
>=20

I don't think we need a new acer-wmi driver to handle new machine,
because acer-wmi driver already support the following WMI methods:

#define WMID_GUID3              "61EF69EA-865C-4BC3-A502-A0DEBA0CB531"
#define ACERWMID_EVENT_GUID 	"676AA15E-6A47-4D9F-A2CC-1E6D18D14026"

I will find a bit time at this week to clear up acer-wmi driver.

Did you see any function key or new function didn't handle by current
acer-wmi driver?


Thank's
Joey Lee

> 2011/7/19 Joey Lee <jlee@novell.com>:
> > Cc. to platform driver mail
> >
> > Hi AceLan,
> >
> > In old acer machine supports both old WMI_GUID1 and new WMI_WMID3, =
but
> > more and more machines removed old WMI_GUID1 method and just suppor=
t new
> > one.
> >
> > I will spend a bit time to clear up acer-wmi driver, add support to
> > those new machines.
> > I will send out patches for review.
> >
> >
> >
> > Thank's a lot!
> > Joey Lee
> >
> >
> > -------- =E8=BD=89=E9=81=9E=E7=9A=84=E9=83=B5=E4=BB=B6 --------
> >> =E8=87=AA: AceLan Kao <acelan.kao@canonical.com>
> >> =E8=87=B3: Joey Lee <jlee@novell.com>
> >> =E4=B8=BB=E6=97=A8: Re: A problem about acer-wmi
> >> =E6=97=A5=E6=9C=9F: Tue, 19 Jul 2011 11:37:28 +0800
> >>
> >> Dear Joey,
> >>
> >> Thanks for your quick response.
> >> Here are the logs and it's good to discuss this issue on platform =
driver list.
> >> Thanks.
> >>
> >> Best regards,
> >> AceLan Kao.
> >>
> >> 2011/7/19 Joey Lee <jlee@novell.com>:
> >> > =E6=96=BC =E4=BA=8C=EF=BC=8C2011-07-19 =E6=96=BC 02:57 +0000=EF=BC=
=8Cjoeyli(Joey Lee) =E6=8F=90=E5=88=B0=EF=BC=9A
> >> >> Hi Kao,
> >> >>
> >> >> =E6=96=BC =E4=BA=8C=EF=BC=8C2011-07-19 =E6=96=BC 09:43 +0800=EF=
=BC=8CAceLan Kao =E6=8F=90=E5=88=B0=EF=BC=9A
> >> >> > Dear Joey,
> >> >> >
> >> >> > We have a new machine the model is Acer Aspire 4739Z
> >> >> > I tried to add it's model in acer_quirks struct, but in
> >> >> > acer_wmi_init(), it can't find it's interface.
> >> >> >        {
> >> >> >                .callback =3D dmi_matched,
> >> >> >                .ident =3D "Acer Aspire 4739Z",
> >> >> >                .matches =3D {
> >> >> >                        DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> >> >> >                        DMI_MATCH(DMI_PRODUCT_NAME, "AS4739Z")=
,
> >> >> >                },
> >> >> >                .driver_data =3D &quirk_acer_travelmate_2490,
> >> >> >        },
> >> >> >
> >> >> > wmi_has_guid(AMW0_GUID1), wmi_has_guid(WMID_GUID1), and
> >> >> > wmi_has_guid(WMID_GUID2) all return 0.
> >> >> > And, wmi_has_guid(WMID_GUID3) and wmi_has_guid(ACERWMID_EVENT=
_GUID) return 1.
> >> >> >
> >> >> > I don't understand the logic of those wmi_has_guid(), so I do=
n't know
> >> >> > how to modify them, I just assigned the interface as
> >> >> >   interface =3D &wmid_interface;
> >> >> > and that would make us capture the KEY_F22(Touch Pad On/Off) =
event and
> >> >> > get the OSD appeared.
> >> >> >
> >> >> > Please direct me how to add this h/w correctly into acer_wmi.=
c and
> >> >> > please let me know if I should provide any info you need.
> >> >> > Thanks.
> >> >> >
> >> >> > Best regards,
> >> >> > AceLan Kao.
> >> >> >
> >> >>
> >> >> Thank's for you pay attention to acer-wmi driver. Please attach=
ed the
> >> >> dmidecode log and acpidump on this mail to me.
> >> >> Then, I can trace the DSDT to find out good way.
> >> >>
> >> >
> >> > Forgot tell how to capture the log and DSDT:
> >> >  + dmidecode > dmidecode.log
> >> >  + acpidump > acpidump.dat
> >> >
> >> >
> >> > Thank's a lot!
> >> > Joey Lee
> >> >
> >> >> And,
> >> >> Do you mind if I forward this mail to platform driver group on =
kernel
> >> >> upstream?
> >> >> Then we can discuss on upstream, maybe have more experts can pr=
ovide
> >> >> commants to us.
> >> >>
> >> >>
> >> >> Thank's a lot!
> >> >> Joey Lee
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
