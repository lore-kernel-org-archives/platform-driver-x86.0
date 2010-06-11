From: <Rezwanul_Kabir@Dell.com>
Subject: RE: Dell Studio 1555 eject key does not work ( small patch to fix
 	included )
Date: Thu, 10 Jun 2010 19:15:47 -0500
Message-ID: <57DF5FDC2DC0634FA2A310BC5B81A68D01DFD5780A@AUSX7MCPC108.AMER.DELL.COM>
References: <AANLkTinG3jv6o8T00mDTEP5uxf4tKqOwSPEDIUcv4kVG@mail.gmail.com>
 	<20100602213429.GA14866@srcf.ucam.org>
 <57DF5FDC2DC0634FA2A310BC5B81A68D01DF4CD01E@AUSX7MCPC108.AMER.DELL.COM>
 	<AANLkTimIl6UL0HQT1wxRgXuj_m0O3CwMHQIa1xNE1Ax9@mail.gmail.com>
 	<AANLkTin0qht1XR2rUgIXMEeJNU_gb3IZWqSBJb7NXD8K@mail.gmail.com>
 	<57DF5FDC2DC0634FA2A310BC5B81A68D01DFD57663@AUSX7MCPC108.AMER.DELL.COM>
 	<20100610184023.GA17320@srcf.ucam.org>
 <AANLkTilT3KCeJUpG-APK0MFh2ChMlZ4qwVPhOJpHnPB9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60pc101.us.dell.com ([143.166.85.206]:8227 "EHLO
	ausc60pc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754083Ab0FKAPz convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Jun 2010 20:15:55 -0400
In-Reply-To: <AANLkTilT3KCeJUpG-APK0MFh2ChMlZ4qwVPhOJpHnPB9@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pharon@gmail.com, mjg59@srcf.ucam.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org

Islam Amer

   Please try the new BIOS A11 and eliminate any potential BIOS issues.=
 The BIOS team confirmed that
   they weren't able to reproduce the issue with Ubuntu 10.04 and A11.

Thanks..
   --rez




Rezwanul Kabir
Dell Linux Development
512-725-0766
=20

>-----Original Message-----
>From: Islam Amer [mailto:pharon@gmail.com]=20
>Sent: Thursday, June 10, 2010 6:52 PM
>To: Matthew Garrett
>Cc: Kabir, Rezwanul; linux-kernel@vger.kernel.org;=20
>platform-driver-x86@vger.kernel.org; akpm@linux-foundation.org
>Subject: Re: Dell Studio 1555 eject key does not work ( small=20
>patch to fix included )
>
>Hello all,
>
>My bios version is A08 , I see that A11 was recently released=20
>but the changelog doesn't say much.
>
>Which is better, upgrade and hope the problem goes away, or=20
>wait until we have a fix that is agreed upon ?
>
>Thanks.
>
>On Thu, Jun 10, 2010 at 9:40 PM, Matthew Garrett=20
><mjg59@srcf.ucam.org> wrote:
>> On Thu, Jun 10, 2010 at 01:36:56PM -0500,=20
>Rezwanul_Kabir@Dell.com wrote:
>>> Hi Islam Amer
>>>
>>> =A0 =A0I got report that "Ubuntu 10.04 + BIOS A11" was tested and t=
he=20
>>> "Eject CD" key is working
>>> =A0 =A0as expected. Sorry, I couldn't find any Studio 1555 to=20
>test myself=20
>>> and cannot provide you
>>> =A0 =A0with more details.
>>>
>>> =A0 =A0 Also, you may try acpi_osi=3D"Windows 2009" kernel=20
>parameter and see if there is any difference.
>>
>> That's the default on any kernel that has this support in dell-wmi.=20
>> Rez, could you let me know if the proposed patch breaks the spec in=20
>> ways that are likely to cause problems?
>>
>> --
>> Matthew Garrett | mjg59@srcf.ucam.org
>>
>--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
