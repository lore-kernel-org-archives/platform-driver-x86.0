From: AceLan Kao <acelan@gmail.com>
Subject: Re: [Fwd: Re: A problem about acer-wmi]
Date: Tue, 9 Aug 2011 10:07:17 +0800
Message-ID: <CAMz9Wg8A2a2nqrsP2vXxx=BYSe7Bv9MKcEqfaJO1_4KEvjNqDg@mail.gmail.com>
References: <4E25AFC7020000230002F7D1@novprvlin0050.provo.novell.com>
	<CAMz9Wg9ZZvcb+USmPMqXZ3zFRct8qme=7C2UwxKThaANZ=PB6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:44557 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751604Ab1HICHS convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 8 Aug 2011 22:07:18 -0400
Received: by qwk3 with SMTP id 3so1060546qwk.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Aug 2011 19:07:17 -0700 (PDT)
In-Reply-To: <CAMz9Wg9ZZvcb+USmPMqXZ3zFRct8qme=7C2UwxKThaANZ=PB6A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: platform-driver-x86@vger.kernel.org

Resend from my gmail account

=A6b 2011=A6~8=A4=EB9=A4=E9=A4W=A4=C810:05=A1AAceLan Kao <acelan.kao@ca=
nonical.com> =BCg=B9D=A1G
> Dear Joey,
>
> Is there any progress of the acer-wmi patch?
>
> I read the Acer WMI/SMBIOS Spec. and think we might need to create a
> new acer-wmi driver for the new machines and leave the original
> acer-wmi driver for the old ones.
> The GUID is changed and there are more functions be added in the spec=
=2E
> that the acer-wmi driver is hard to handle now.
> And I'm not sure if I can implement a open source wmi driver from the=
 spec.
> Please input more idea about this, thanks.
>
> Best regards,
> AceLan Kao.
>
> 2011/7/19 Joey Lee <jlee@novell.com>:
>> Cc. to platform driver mail
>>
>> Hi AceLan,
>>
>> In old acer machine supports both old WMI_GUID1 and new WMI_WMID3, b=
ut
>> more and more machines removed old WMI_GUID1 method and just support=
 new
>> one.
>>
>> I will spend a bit time to clear up acer-wmi driver, add support to
>> those new machines.
>> I will send out patches for review.
>>
>>
>>
>> Thank's a lot!
>> Joey Lee
>>
>>
>> -------- =C2=E0=BB=BC=AA=BA=B6l=A5=F3 --------
>>> =A6=DB: AceLan Kao <acelan.kao@canonical.com>
>>> =A6=DC: Joey Lee <jlee@novell.com>
>>> =A5D=A6=AE: Re: A problem about acer-wmi
>>> =A4=E9=B4=C1: Tue, 19 Jul 2011 11:37:28 +0800
>>>
>>> Dear Joey,
>>>
>>> Thanks for your quick response.
>>> Here are the logs and it's good to discuss this issue on platform d=
river list.
>>> Thanks.
>>>
>>> Best regards,
>>> AceLan Kao.
>>>
>>> 2011/7/19 Joey Lee <jlee@novell.com>:
>>> > =A9=F3 =A4G=A1A2011-07-19 =A9=F3 02:57 +0000=A1Ajoeyli(Joey Lee) =
=B4=A3=A8=EC=A1G
>>> >> Hi Kao,
>>> >>
>>> >> =A9=F3 =A4G=A1A2011-07-19 =A9=F3 09:43 +0800=A1AAceLan Kao =B4=A3=
=A8=EC=A1G
>>> >> > Dear Joey,
>>> >> >
>>> >> > We have a new machine the model is Acer Aspire 4739Z
>>> >> > I tried to add it's model in acer_quirks struct, but in
>>> >> > acer_wmi_init(), it can't find it's interface.
>>> >> >        {
>>> >> >                .callback =3D dmi_matched,
>>> >> >                .ident =3D "Acer Aspire 4739Z",
>>> >> >                .matches =3D {
>>> >> >                        DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
>>> >> >                        DMI_MATCH(DMI_PRODUCT_NAME, "AS4739Z"),
>>> >> >                },
>>> >> >                .driver_data =3D &quirk_acer_travelmate_2490,
>>> >> >        },
>>> >> >
>>> >> > wmi_has_guid(AMW0_GUID1), wmi_has_guid(WMID_GUID1), and
>>> >> > wmi_has_guid(WMID_GUID2) all return 0.
>>> >> > And, wmi_has_guid(WMID_GUID3) and wmi_has_guid(ACERWMID_EVENT_=
GUID) return 1.
>>> >> >
>>> >> > I don't understand the logic of those wmi_has_guid(), so I don=
't know
>>> >> > how to modify them, I just assigned the interface as
>>> >> >   interface =3D &wmid_interface;
>>> >> > and that would make us capture the KEY_F22(Touch Pad On/Off) e=
vent and
>>> >> > get the OSD appeared.
>>> >> >
>>> >> > Please direct me how to add this h/w correctly into acer_wmi.c=
 and
>>> >> > please let me know if I should provide any info you need.
>>> >> > Thanks.
>>> >> >
>>> >> > Best regards,
>>> >> > AceLan Kao.
>>> >> >
>>> >>
>>> >> Thank's for you pay attention to acer-wmi driver. Please attache=
d the
>>> >> dmidecode log and acpidump on this mail to me.
>>> >> Then, I can trace the DSDT to find out good way.
>>> >>
>>> >
>>> > Forgot tell how to capture the log and DSDT:
>>> >  + dmidecode > dmidecode.log
>>> >  + acpidump > acpidump.dat
>>> >
>>> >
>>> > Thank's a lot!
>>> > Joey Lee
>>> >
>>> >> And,
>>> >> Do you mind if I forward this mail to platform driver group on k=
ernel
>>> >> upstream?
>>> >> Then we can discuss on upstream, maybe have more experts can pro=
vide
>>> >> commants to us.
>>> >>
>>> >>
>>> >> Thank's a lot!
>>> >> Joey Lee
>>> >
>>> >
>>> >
>>>
>>>
>>>
>>
>>
>>
>
>
>
> --
> Chia-Lin Kao(AceLan)
> http://blog.acelan.idv.tw/
> E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
>



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
