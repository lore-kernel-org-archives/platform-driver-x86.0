From: <Rezwanul_Kabir@Dell.com>
Subject: RE: Dell Studio 1555 eject key does not work ( small patch to fix
 	included )
Date: Tue, 8 Jun 2010 11:33:39 -0500
Message-ID: <57DF5FDC2DC0634FA2A310BC5B81A68D01DF54BF73@AUSX7MCPC108.AMER.DELL.COM>
References: <AANLkTinG3jv6o8T00mDTEP5uxf4tKqOwSPEDIUcv4kVG@mail.gmail.com>
 	<20100602213429.GA14866@srcf.ucam.org>
 <57DF5FDC2DC0634FA2A310BC5B81A68D01DF4CD01E@AUSX7MCPC108.AMER.DELL.COM>
 	<AANLkTimIl6UL0HQT1wxRgXuj_m0O3CwMHQIa1xNE1Ax9@mail.gmail.com>
 <AANLkTin0qht1XR2rUgIXMEeJNU_gb3IZWqSBJb7NXD8K@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxipps301.us.dell.com ([143.166.148.223]:62281 "EHLO
	ausxipps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755492Ab0FHQhb convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Jun 2010 12:37:31 -0400
In-Reply-To: <AANLkTin0qht1XR2rUgIXMEeJNU_gb3IZWqSBJb7NXD8K@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pharon@gmail.com
Cc: mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org

Hi Islam Amer

    I have asked feedback from the BIOS team and will update this threa=
d as soon as I get it.
    Thanks..
       --rez



Rezwanul Kabir
Dell Linux Development
512-725-0766
=20

>-----Original Message-----
>From: Islam Amer [mailto:pharon@gmail.com]=20
>Sent: Tuesday, June 08, 2010 5:58 AM
>To: Kabir, Rezwanul
>Cc: mjg59@srcf.ucam.org; linux-kernel@vger.kernel.org;=20
>platform-driver-x86@vger.kernel.org; akpm@linux-foundation.org
>Subject: Re: Dell Studio 1555 eject key does not work ( small=20
>patch to fix included )
>
>Dear Rezwanul,
>
>I have been using this fix for quite some time without any=20
>visible ill effects on the other keys or the system in general.
>Of course it would be necessary to get feedback from other dell users.
>
>Thanks.
>
>On Thu, Jun 3, 2010 at 11:16 PM, Islam Amer <pharon@gmail.com> wrote:
>> Hello,
>>
>> I suspected the same about dell_new_hk_type, but I am confused that=20
>> the rest of the fn keys work just fine out of the box. The=20
>only button=20
>> that didn't work was the eject key.
>>
>> Attached is the dmidecode output.
>>
>> Thanks
>>
>> On Thu, Jun 3, 2010 at 5:57 AM, =A0<Rezwanul_Kabir@dell.com> wrote:
>>>
>>>>Hi Rez,
>>>>
>>>>Any thoughts on this?
>>>>
>>>
>>>
>>> =A0From the discussion below, it seems that this system does not=20
>>> implement the new WMI scheme ( which is when=20
>dell_new_hk_type=3Dtrue is=20
>>> set). So, at issue here is the legacy code. Without knowing exactly=
=20
>>> why BIOS would behave differently in this particular case,=20
>the fix seems arbitrary. Let me see if I can get hold of the=20
>BIOS developer(if possible) and provide feedback in this thread.
>>>
>>> Islam Amer
>>>
>>> =A0 Can you attach dmidecode output from the system here?
>>>
>>> Thanks..
>>> =A0 --rez
>>>
>>>
>>>
>>>
>>>
>>>>On Thu, Jun 03, 2010 at 01:14:09AM +0400, Islam Amer wrote
>>>>> Hello,
>>>>>
>>>>> Pressing the eject key on my Dell Studio 1555 does not work
>>>>and dmesg
>>>>> produces this message :
>>>>> dell-wmi: Unknown key 0 pressed
>>>>>
>>>>> Adding a debugging printk in dell-wmi.c after line 222 like this =
:
>>>>>
>>>>> printk(KERN_INFO "dell:wmi 0x%x , 0x%x \n", buffer_entry[1],=20
>>>>> buffer_entry[2]);
>>>>>
>>>>> dmesg now shows :
>>>>>
>>>>> dell:wmi 0x0 , 0xe009
>>>>> dell-wmi: Unknown key 0 pressed
>>>>>
>>>>> So for some reason buffer_entry[1] is used although it is empty.
>>>>>
>>>>> Falling back to buffer_entry[2] in case buffer_entry[1] is 0x0=20
>>>>> makes the button work.
>>>>>
>>>>> I suspect it might be better to fix the "dell_new_hk_type" logic=20
>>>>> though
>>>>>
>>>>> I had submitted this as
>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=3D16075 but=20
>repeating the=20
>>>>> information and patch here as per Andrew Morton's suggestion.
>>>>>
>>>>>
>>>>> Thanks.
>>>>>
>>>>> ---
>>>>linux-sidux-2.6-2.6.34/drivers/platform/x86/dell-wmi.c.orig
>>>>2010-06-03
>>>>> 01:02:17.418824168 +0400
>>>>> +++ linux-sidux-2.6-2.6.34/drivers/platform/x86/dell-wmi.c
>>>>2010-06-03
>>>>> 01:01:40.641833249 +0400
>>>>> @@ -221,7 +221,7 @@ static void dell_wmi_notify(u32 value, v
>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>>>>
>>>>> - =A0 =A0 =A0 =A0 =A0 =A0if (dell_new_hk_type)
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0if (dell_new_hk_type || buffer_entry[1] =
=3D=3D 0x0)
>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reported_key =3D (int)=
buffer_entry[2];
>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0else
>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reported_key =3D (int)=
buffer_entry[1] & 0xffff;
>>>>>
>>>>--
>>>>Matthew Garrett | mjg59@srcf.ucam.org
>>>>
>>
>--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
