From: Islam Amer <pharon@gmail.com>
Subject: Re: Dell Studio 1555 eject key does not work ( small patch to fix
	included )
Date: Fri, 11 Jun 2010 21:02:10 +0300
Message-ID: <AANLkTilaoFJuT8d9iPWqDzyxBC8o4E1Vhh03ufiwLEk-@mail.gmail.com>
References: <AANLkTinG3jv6o8T00mDTEP5uxf4tKqOwSPEDIUcv4kVG@mail.gmail.com>
	<20100602213429.GA14866@srcf.ucam.org> <57DF5FDC2DC0634FA2A310BC5B81A68D01DF4CD01E@AUSX7MCPC108.AMER.DELL.COM>
	<AANLkTimIl6UL0HQT1wxRgXuj_m0O3CwMHQIa1xNE1Ax9@mail.gmail.com>
	<AANLkTin0qht1XR2rUgIXMEeJNU_gb3IZWqSBJb7NXD8K@mail.gmail.com>
	<57DF5FDC2DC0634FA2A310BC5B81A68D01DFD57663@AUSX7MCPC108.AMER.DELL.COM>
	<20100610184023.GA17320@srcf.ucam.org> <AANLkTilT3KCeJUpG-APK0MFh2ChMlZ4qwVPhOJpHnPB9@mail.gmail.com>
	<57DF5FDC2DC0634FA2A310BC5B81A68D01DFD5780A@AUSX7MCPC108.AMER.DELL.COM>
	<AANLkTinoWK4uSL2KOhgF-EVWuBhgCeAqWwL9cJKeGRD1@mail.gmail.com>
	<4C124358.8020007@canonical.com> <AANLkTimxo3CeRR2YZptTL6RoEi8Q5sdnUEMIi9A5-KcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:42127 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756628Ab0FKSCd convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Jun 2010 14:02:33 -0400
In-Reply-To: <AANLkTimxo3CeRR2YZptTL6RoEi8Q5sdnUEMIi9A5-KcA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: tim.gardner@canonical.com
Cc: Rezwanul_Kabir@dell.com, mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org

Dear Tim,

I tried the mainline kernel 2.6.32-0206321505-generic as you suggested
and the eject key doesn't work but it also doesn't produce the error
message in dmesg.

I then tried the 2.6.32-22.36-generic from
http://packages.ubuntu.com/lucid/linux-image-2.6.32-22-generic and I
found the eject key working fine.

So there is something in the ubuntu patchset that fixes this issue.

On Fri, Jun 11, 2010 at 5:23 PM, Islam Amer <pharon@gmail.com> wrote:
> Tim I am running debian,
>
> I think it's the other way round, the mainline kernel is borked (
> regarding dell-wmi and eject key ) while the lucid patched kernel
> works ( as reported by dell team ).
>
> I guess I could download a Lucid livecd and see if the eject key work=
s
> there ( event only as it won't eject the lived while it is running :)
> )
>
> On Fri, Jun 11, 2010 at 5:08 PM, Tim Gardner <tim.gardner@canonical.c=
om> wrote:
>> Islam Amer,
>>
>> You could try a vanilla stable kernel from
>> http://kernel.ubuntu.com/~kernel-ppa/mainline/v2.6.32.15.5-lucid/ to=
 see if
>> we've borked the dell-wmi code.
>>
>> rtg
>>
>> On 06/11/2010 07:28 AM, Islam Amer wrote:
>>>
>>> Rezwanul,
>>>
>>> I've updated my bios to A11 and installed a new unmodified kernel. =
The
>>> issue still persists that the eject key produces "dell-wmi: Unknown
>>> key 0 pressed" in the dmesg output and it doesn't work.
>>>
>>> It is possible that Ubuntu is including patches to fix stuff. The
>>> latest patch for the Lucid kernel at
>>>
>>> http://archive.ubuntu.com/ubuntu/pool/main/l/linux/linux_2.6.32-22.=
36.diff.gz
>>> does include patches that touch wmi and dell-wmi code, but I can't
>>> find a specific change that would fix this issue.
>>>
>>> I might try to selectively apply patches from it and see if it gets=
 fixed.
>>>
>>> Thanks.
>>>
>>>
>>> On Fri, Jun 11, 2010 at 3:15 AM,<Rezwanul_Kabir@dell.com> =A0wrote:
>>>>
>>>> Islam Amer
>>>>
>>>> =A0 Please try the new BIOS A11 and eliminate any potential BIOS i=
ssues.
>>>> The BIOS team confirmed that
>>>> =A0 they weren't able to reproduce the issue with Ubuntu 10.04 and=
 A11.
>>>>
>>>> Thanks..
>>>> =A0 --rez
>>>>
>>>>
>>>>
>>>>
>>>> Rezwanul Kabir
>>>> Dell Linux Development
>>>> 512-725-0766
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Islam Amer [mailto:pharon@gmail.com]
>>>>> Sent: Thursday, June 10, 2010 6:52 PM
>>>>> To: Matthew Garrett
>>>>> Cc: Kabir, Rezwanul; linux-kernel@vger.kernel.org;
>>>>> platform-driver-x86@vger.kernel.org; akpm@linux-foundation.org
>>>>> Subject: Re: Dell Studio 1555 eject key does not work ( small
>>>>> patch to fix included )
>>>>>
>>>>> Hello all,
>>>>>
>>>>> My bios version is A08 , I see that A11 was recently released
>>>>> but the changelog doesn't say much.
>>>>>
>>>>> Which is better, upgrade and hope the problem goes away, or
>>>>> wait until we have a fix that is agreed upon ?
>>>>>
>>>>> Thanks.
>>>>>
>>>>> On Thu, Jun 10, 2010 at 9:40 PM, Matthew Garrett
>>>>> <mjg59@srcf.ucam.org> =A0wrote:
>>>>>>
>>>>>> On Thu, Jun 10, 2010 at 01:36:56PM -0500,
>>>>>
>>>>> Rezwanul_Kabir@Dell.com wrote:
>>>>>>>
>>>>>>> Hi Islam Amer
>>>>>>>
>>>>>>> =A0 =A0I got report that "Ubuntu 10.04 + BIOS A11" was tested a=
nd the
>>>>>>> "Eject CD" key is working
>>>>>>> =A0 =A0as expected. Sorry, I couldn't find any Studio 1555 to
>>>>>
>>>>> test myself
>>>>>>>
>>>>>>> and cannot provide you
>>>>>>> =A0 =A0with more details.
>>>>>>>
>>>>>>> =A0 =A0 Also, you may try acpi_osi=3D"Windows 2009" kernel
>>>>>
>>>>> parameter and see if there is any difference.
>>>>>>
>>>>>> That's the default on any kernel that has this support in dell-w=
mi.
>>>>>> Rez, could you let me know if the proposed patch breaks the spec=
 in
>>>>>> ways that are likely to cause problems?
>>>>>>
>>>>>> --
>>>>>> Matthew Garrett | mjg59@srcf.ucam.org
>>>>>>
>>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-ker=
nel" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>> Please read the FAQ at =A0http://www.tux.org/lkml/
>>
>>
>> --
>> Tim Gardner tim.gardner@canonical.com
>>
>
--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
