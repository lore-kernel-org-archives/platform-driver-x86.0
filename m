From: <Rezwanul_Kabir@Dell.com>
Subject: RE: Dell Studio 1555 eject key does not work ( small patch to fix
 	included )
Date: Tue, 15 Jun 2010 12:23:57 -0500
Message-ID: <57DF5FDC2DC0634FA2A310BC5B81A68D01E06306A9@AUSX7MCPC108.AMER.DELL.COM>
References: <AANLkTinG3jv6o8T00mDTEP5uxf4tKqOwSPEDIUcv4kVG@mail.gmail.com>
 	<20100602213429.GA14866@srcf.ucam.org>
 <57DF5FDC2DC0634FA2A310BC5B81A68D01DF4CD01E@AUSX7MCPC108.AMER.DELL.COM>
 	<AANLkTimIl6UL0HQT1wxRgXuj_m0O3CwMHQIa1xNE1Ax9@mail.gmail.com>
 	<AANLkTin0qht1XR2rUgIXMEeJNU_gb3IZWqSBJb7NXD8K@mail.gmail.com>
 	<57DF5FDC2DC0634FA2A310BC5B81A68D01DFD57663@AUSX7MCPC108.AMER.DELL.COM>
 	<20100610184023.GA17320@srcf.ucam.org>
 <AANLkTilT3KCeJUpG-APK0MFh2ChMlZ4qwVPhOJpHnPB9@mail.gmail.com>
 	<57DF5FDC2DC0634FA2A310BC5B81A68D01DFD5780A@AUSX7MCPC108.AMER.DELL.COM>
 	<AANLkTinoWK4uSL2KOhgF-EVWuBhgCeAqWwL9cJKeGRD1@mail.gmail.com>
 	<4C124358.8020007@canonical.com>
 <AANLkTimxo3CeRR2YZptTL6RoEi8Q5sdnUEMIi9A5-KcA@mail.gmail.com>
 	<AANLkTilaoFJuT8d9iPWqDzyxBC8o4E1Vhh03ufiwLEk-@mail.gmail.com>
 	<4C128201.8020104@canonical.com>
 <AANLkTin1bEjYt08P923v1c0aSM1O6kYDwoaOYiFufGCd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxippc101.us.dell.com ([143.166.85.207]:1431 "EHLO
	ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758047Ab0FORYI convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Jun 2010 13:24:08 -0400
In-Reply-To: <AANLkTin1bEjYt08P923v1c0aSM1O6kYDwoaOYiFufGCd@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pharon@gmail.com, tim.gardner@canonical.com
Cc: mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org

Hi Matthew/Islam

   I don't know how Ubuntu 10.04 fixed the issue, but from my communica=
tions with the BIOS team, I think=20
 Islam's patch would be acceptable. "buffer_entry[1] =3D=3D 0x0" would =
indicate HotKey events on these platforms.

Thanks..
   --rez

=20

Rezwanul Kabir
Dell Linux Development
512-725-0766
=20

>-----Original Message-----
>From: Islam Amer [mailto:pharon@gmail.com]=20
>Sent: Friday, June 11, 2010 8:27 PM
>To: tim.gardner@canonical.com
>Cc: Kabir, Rezwanul; mjg59@srcf.ucam.org;=20
>linux-kernel@vger.kernel.org;=20
>platform-driver-x86@vger.kernel.org; akpm@linux-foundation.org
>Subject: Re: Dell Studio 1555 eject key does not work ( small=20
>patch to fix included )
>
>What would you like me to do now? I want to help :)
>
>Thanks.
>
>On Fri, Jun 11, 2010 at 9:35 PM, Tim Gardner=20
><tim.gardner@canonical.com> wrote:
>> The only difference between 2.6.32.15 and Ubuntu Lucid wrt=20
>dell-wmi.c=20
>> is
>> this:
>>
>> 43,46d42
>> < /* Temporary workaround until the WMI sysfs interface goes in.
>> < =A0 =A0Borrowed from acer-wmi */
>> < MODULE_ALIAS("dmi:*:*Dell*:*:");
>> <
>>
>> I wonder about input event filtering? There are substantial=20
>> differences in drivers/input/input.c.
>>
>> rtg
>>
>> On 06/11/2010 12:02 PM, Islam Amer wrote:
>>>
>>> Dear Tim,
>>>
>>> I tried the mainline kernel 2.6.32-0206321505-generic as you=20
>>> suggested and the eject key doesn't work but it also=20
>doesn't produce=20
>>> the error message in dmesg.
>>>
>>> I then tried the 2.6.32-22.36-generic from=20
>>>=20
>http://packages.ubuntu.com/lucid/linux-image-2.6.32-22-generic and I=20
>>> found the eject key working fine.
>>>
>>> So there is something in the ubuntu patchset that fixes this issue.
>>>
>>> On Fri, Jun 11, 2010 at 5:23 PM, Islam=20
>Amer<pharon@gmail.com> =A0wrote:
>>>>
>>>> Tim I am running debian,
>>>>
>>>> I think it's the other way round, the mainline kernel is borked (=20
>>>> regarding dell-wmi and eject key ) while the lucid patched kernel=20
>>>> works ( as reported by dell team ).
>>>>
>>>> I guess I could download a Lucid livecd and see if the eject key=20
>>>> works there ( event only as it won't eject the lived while it is=20
>>>> running :)
>>>> )
>>>>
>>>> On Fri, Jun 11, 2010 at 5:08 PM, Tim=20
>>>> Gardner<tim.gardner@canonical.com>
>>>> =A0wrote:
>>>>>
>>>>> Islam Amer,
>>>>>
>>>>> You could try a vanilla stable kernel from=20
>>>>> http://kernel.ubuntu.com/~kernel-ppa/mainline/v2.6.32.15.5-lucid/=
=20
>>>>> to see if we've borked the dell-wmi code.
>>>>>
>>>>> rtg
>>>>>
>>>>> On 06/11/2010 07:28 AM, Islam Amer wrote:
>>>>>>
>>>>>> Rezwanul,
>>>>>>
>>>>>> I've updated my bios to A11 and installed a new=20
>unmodified kernel.=20
>>>>>> The issue still persists that the eject key produces "dell-wmi:=20
>>>>>> Unknown key 0 pressed" in the dmesg output and it doesn't work.
>>>>>>
>>>>>> It is possible that Ubuntu is including patches to fix=20
>stuff. The=20
>>>>>> latest patch for the Lucid kernel at
>>>>>>
>>>>>>
>>>>>>=20
>http://archive.ubuntu.com/ubuntu/pool/main/l/linux/linux_2.6.32-22
>>>>>> .36.diff.gz does include patches that touch wmi and=20
>dell-wmi code,=20
>>>>>> but I can't find a specific change that would fix this issue.
>>>>>>
>>>>>> I might try to selectively apply patches from it and see if it=20
>>>>>> gets fixed.
>>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>>
>>>>>> On Fri, Jun 11, 2010 at 3:15=20
>AM,<Rezwanul_Kabir@dell.com> =A0 =A0wrote:
>>>>>>>
>>>>>>> Islam Amer
>>>>>>>
>>>>>>> =A0 Please try the new BIOS A11 and eliminate any=20
>potential BIOS issues.
>>>>>>> The BIOS team confirmed that
>>>>>>> =A0 they weren't able to reproduce the issue with Ubuntu=20
>10.04 and A11.
>>>>>>>
>>>>>>> Thanks..
>>>>>>> =A0 --rez
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Rezwanul Kabir
>>>>>>> Dell Linux Development
>>>>>>> 512-725-0766
>>>>>>>
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Islam Amer [mailto:pharon@gmail.com]
>>>>>>>> Sent: Thursday, June 10, 2010 6:52 PM
>>>>>>>> To: Matthew Garrett
>>>>>>>> Cc: Kabir, Rezwanul; linux-kernel@vger.kernel.org;=20
>>>>>>>> platform-driver-x86@vger.kernel.org; akpm@linux-foundation.org
>>>>>>>> Subject: Re: Dell Studio 1555 eject key does not work ( small=20
>>>>>>>> patch to fix included )
>>>>>>>>
>>>>>>>> Hello all,
>>>>>>>>
>>>>>>>> My bios version is A08 , I see that A11 was recently released=20
>>>>>>>> but the changelog doesn't say much.
>>>>>>>>
>>>>>>>> Which is better, upgrade and hope the problem goes=20
>away, or wait=20
>>>>>>>> until we have a fix that is agreed upon ?
>>>>>>>>
>>>>>>>> Thanks.
>>>>>>>>
>>>>>>>> On Thu, Jun 10, 2010 at 9:40 PM, Matthew Garrett=20
>>>>>>>> <mjg59@srcf.ucam.org> =A0 =A0wrote:
>>>>>>>>>
>>>>>>>>> On Thu, Jun 10, 2010 at 01:36:56PM -0500,
>>>>>>>>
>>>>>>>> Rezwanul_Kabir@Dell.com wrote:
>>>>>>>>>>
>>>>>>>>>> Hi Islam Amer
>>>>>>>>>>
>>>>>>>>>> =A0 =A0I got report that "Ubuntu 10.04 + BIOS A11" was=20
>tested and=20
>>>>>>>>>> the "Eject CD" key is working
>>>>>>>>>> =A0 =A0as expected. Sorry, I couldn't find any Studio 1555 t=
o
>>>>>>>>
>>>>>>>> test myself
>>>>>>>>>>
>>>>>>>>>> and cannot provide you
>>>>>>>>>> =A0 =A0with more details.
>>>>>>>>>>
>>>>>>>>>> =A0 =A0 Also, you may try acpi_osi=3D"Windows 2009" kernel
>>>>>>>>
>>>>>>>> parameter and see if there is any difference.
>>>>>>>>>
>>>>>>>>> That's the default on any kernel that has this=20
>support in dell-wmi.
>>>>>>>>> Rez, could you let me know if the proposed patch breaks the=20
>>>>>>>>> spec in ways that are likely to cause problems?
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> Matthew Garrett | mjg59@srcf.ucam.org
>>>>>>>>>
>>>>>>>>
>>>>>> --
>>>>>> To unsubscribe from this list: send the line=20
>"unsubscribe linux-kernel"
>>>>>> in
>>>>>> the body of a message to majordomo@vger.kernel.org More=20
>majordomo=20
>>>>>> info at =A0http://vger.kernel.org/majordomo-info.html
>>>>>> Please read the FAQ at =A0http://www.tux.org/lkml/
>>>>>
>>>>>
>>>>> --
>>>>> Tim Gardner tim.gardner@canonical.com
>>>>>
>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe=20
>>> linux-kernel" in the body of a message to majordomo@vger.kernel.org=
=20
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>> Please read the FAQ at =A0http://www.tux.org/lkml/
>>
>>
>> --
>> Tim Gardner tim.gardner@canonical.com
>>
>--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
