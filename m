From: AceLan Kao <acelan@gmail.com>
Subject: Re: [Fwd: Re: A problem about acer-wmi]
Date: Tue, 9 Aug 2011 14:33:41 +0800
Message-ID: <CAMz9Wg_RKGBYo+2ogamoVWscaXLx1=jX1ic+3uDqAYeovWx1tQ@mail.gmail.com>
References: <4E25AFC7020000230002F7D1@novprvlin0050.provo.novell.com>
	<CAMz9Wg9ZZvcb+USmPMqXZ3zFRct8qme=7C2UwxKThaANZ=PB6A@mail.gmail.com>
	<1312856096.24471.127.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:59046 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537Ab1HIGdn convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 9 Aug 2011 02:33:43 -0400
Received: by qyk34 with SMTP id 34so2135000qyk.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Aug 2011 23:33:43 -0700 (PDT)
In-Reply-To: <1312856096.24471.127.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: Joey Lee <jlee@novell.com>, platform-driver-x86@vger.kernel.org

Dear Joey,

The current project we have right now have to follow the Acer WMI to
handle the key events, that means no EC key event.
And we have 3 keys that are not working now, they are touchpad toggle,
brightness up, and brightness down.
The touchpad toggle function is a Hotkey Break Event(function number
0x2), and brightness key events are Brightness Change Event(function
number 0x4). But now acer-wmi driver only handles General Hotkey
Event(function number 0x1).

I just implemented those 3 key events, so I think maybe we don't have
to create a new acer-wmi driver.
I'm longing for your work to clear up the acer-wmi driver, so that I
can add the new machine id and send you the patch.
Thanks.

BTW, I'm available to help if you are too busy to do that.

Best regards,
AceLan Kao.

2011/8/9 joeyli <jlee@suse.com>:
> =A9=F3 =A4G=A1A2011-08-09 =A9=F3 10:05 +0800=A1AAceLan Kao =B4=A3=A8=EC=
=A1G
>> Dear Joey,
>>
>> Is there any progress of the acer-wmi patch?
>>
>
> Sorry for I am busy from last 2 weeks until now.
>
>> I read the Acer WMI/SMBIOS Spec. and think we might need to create a
>> new acer-wmi driver for the new machines and leave the original
>> acer-wmi driver for the old ones.
>> The GUID is changed and there are more functions be added in the spe=
c.
>> that the acer-wmi driver is hard to handle now.
>> And I'm not sure if I can implement a open source wmi driver from th=
e spec.
>> Please input more idea about this, thanks.
>>
>> Best regards,
>> AceLan Kao.
>>
>
> I don't think we need a new acer-wmi driver to handle new machine,
> because acer-wmi driver already support the following WMI methods:
>
> #define WMID_GUID3              "61EF69EA-865C-4BC3-A502-A0DEBA0CB531=
"
> #define ACERWMID_EVENT_GUID     "676AA15E-6A47-4D9F-A2CC-1E6D18D14026=
"
>
> I will find a bit time at this week to clear up acer-wmi driver.
>
> Did you see any function key or new function didn't handle by current
> acer-wmi driver?
>
>
> Thank's
> Joey Lee
>
>> 2011/7/19 Joey Lee <jlee@novell.com>:
>> > Cc. to platform driver mail
>> >
>> > Hi AceLan,
>> >
>> > In old acer machine supports both old WMI_GUID1 and new WMI_WMID3,=
 but
>> > more and more machines removed old WMI_GUID1 method and just suppo=
rt new
>> > one.
>> >
>> > I will spend a bit time to clear up acer-wmi driver, add support t=
o
>> > those new machines.
>> > I will send out patches for review.
>> >
>> >
>> >
>> > Thank's a lot!
>> > Joey Lee
>> >
>> >
>> > -------- =C2=E0=BB=BC=AA=BA=B6l=A5=F3 --------
>> >> =A6=DB: AceLan Kao <acelan.kao@canonical.com>
>> >> =A6=DC: Joey Lee <jlee@novell.com>
>> >> =A5D=A6=AE: Re: A problem about acer-wmi
>> >> =A4=E9=B4=C1: Tue, 19 Jul 2011 11:37:28 +0800
>> >>
>> >> Dear Joey,
>> >>
>> >> Thanks for your quick response.
>> >> Here are the logs and it's good to discuss this issue on platform=
 driver list.
>> >> Thanks.
>> >>
>> >> Best regards,
>> >> AceLan Kao.
>> >>
>> >> 2011/7/19 Joey Lee <jlee@novell.com>:
>> >> > =A9=F3 =A4G=A1A2011-07-19 =A9=F3 02:57 +0000=A1Ajoeyli(Joey Lee=
) =B4=A3=A8=EC=A1G
>> >> >> Hi Kao,
>> >> >>
>> >> >> =A9=F3 =A4G=A1A2011-07-19 =A9=F3 09:43 +0800=A1AAceLan Kao =B4=
=A3=A8=EC=A1G
>> >> >> > Dear Joey,
>> >> >> >
>> >> >> > We have a new machine the model is Acer Aspire 4739Z
>> >> >> > I tried to add it's model in acer_quirks struct, but in
>> >> >> > acer_wmi_init(), it can't find it's interface.
>> >> >> >        {
>> >> >> >                .callback =3D dmi_matched,
>> >> >> >                .ident =3D "Acer Aspire 4739Z",
>> >> >> >                .matches =3D {
>> >> >> >                        DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
>> >> >> >                        DMI_MATCH(DMI_PRODUCT_NAME, "AS4739Z"=
),
>> >> >> >                },
>> >> >> >                .driver_data =3D &quirk_acer_travelmate_2490,
>> >> >> >        },
>> >> >> >
>> >> >> > wmi_has_guid(AMW0_GUID1), wmi_has_guid(WMID_GUID1), and
>> >> >> > wmi_has_guid(WMID_GUID2) all return 0.
>> >> >> > And, wmi_has_guid(WMID_GUID3) and wmi_has_guid(ACERWMID_EVEN=
T_GUID) return 1.
>> >> >> >
>> >> >> > I don't understand the logic of those wmi_has_guid(), so I d=
on't know
>> >> >> > how to modify them, I just assigned the interface as
>> >> >> >   interface =3D &wmid_interface;
>> >> >> > and that would make us capture the KEY_F22(Touch Pad On/Off)=
 event and
>> >> >> > get the OSD appeared.
>> >> >> >
>> >> >> > Please direct me how to add this h/w correctly into acer_wmi=
=2Ec and
>> >> >> > please let me know if I should provide any info you need.
>> >> >> > Thanks.
>> >> >> >
>> >> >> > Best regards,
>> >> >> > AceLan Kao.
>> >> >> >
>> >> >>
>> >> >> Thank's for you pay attention to acer-wmi driver. Please attac=
hed the
>> >> >> dmidecode log and acpidump on this mail to me.
>> >> >> Then, I can trace the DSDT to find out good way.
>> >> >>
>> >> >
>> >> > Forgot tell how to capture the log and DSDT:
>> >> >  + dmidecode > dmidecode.log
>> >> >  + acpidump > acpidump.dat
>> >> >
>> >> >
>> >> > Thank's a lot!
>> >> > Joey Lee
>> >> >
>> >> >> And,
>> >> >> Do you mind if I forward this mail to platform driver group on=
 kernel
>> >> >> upstream?
>> >> >> Then we can discuss on upstream, maybe have more experts can p=
rovide
>> >> >> commants to us.
>> >> >>
>> >> >>
>> >> >> Thank's a lot!
>> >> >> Joey Lee
>> >> >
>> >> >
>> >> >
>> >>
>> >>
>> >>
>> >
>> >
>> >
>>
>>
>>
>
>
>



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
