From: Islam Amer <pharon@gmail.com>
Subject: Re: Dell Studio 1555 eject key does not work ( small patch to fix
	included )
Date: Fri, 11 Jun 2010 16:28:28 +0300
Message-ID: <AANLkTinoWK4uSL2KOhgF-EVWuBhgCeAqWwL9cJKeGRD1@mail.gmail.com>
References: <AANLkTinG3jv6o8T00mDTEP5uxf4tKqOwSPEDIUcv4kVG@mail.gmail.com>
	<20100602213429.GA14866@srcf.ucam.org> <57DF5FDC2DC0634FA2A310BC5B81A68D01DF4CD01E@AUSX7MCPC108.AMER.DELL.COM>
	<AANLkTimIl6UL0HQT1wxRgXuj_m0O3CwMHQIa1xNE1Ax9@mail.gmail.com>
	<AANLkTin0qht1XR2rUgIXMEeJNU_gb3IZWqSBJb7NXD8K@mail.gmail.com>
	<57DF5FDC2DC0634FA2A310BC5B81A68D01DFD57663@AUSX7MCPC108.AMER.DELL.COM>
	<20100610184023.GA17320@srcf.ucam.org> <AANLkTilT3KCeJUpG-APK0MFh2ChMlZ4qwVPhOJpHnPB9@mail.gmail.com>
	<57DF5FDC2DC0634FA2A310BC5B81A68D01DFD5780A@AUSX7MCPC108.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:42278 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756272Ab0FKN2t convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Jun 2010 09:28:49 -0400
In-Reply-To: <57DF5FDC2DC0634FA2A310BC5B81A68D01DFD5780A@AUSX7MCPC108.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rezwanul_Kabir@dell.com
Cc: mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org

Rezwanul,

I've updated my bios to A11 and installed a new unmodified kernel. The
issue still persists that the eject key produces "dell-wmi: Unknown
key 0 pressed" in the dmesg output and it doesn't work.

It is possible that Ubuntu is including patches to fix stuff. The
latest patch for the Lucid kernel at
http://archive.ubuntu.com/ubuntu/pool/main/l/linux/linux_2.6.32-22.36.d=
iff.gz
does include patches that touch wmi and dell-wmi code, but I can't
find a specific change that would fix this issue.

I might try to selectively apply patches from it and see if it gets fix=
ed.

Thanks.


On Fri, Jun 11, 2010 at 3:15 AM,  <Rezwanul_Kabir@dell.com> wrote:
> Islam Amer
>
> =A0 Please try the new BIOS A11 and eliminate any potential BIOS issu=
es. The BIOS team confirmed that
> =A0 they weren't able to reproduce the issue with Ubuntu 10.04 and A1=
1.
>
> Thanks..
> =A0 --rez
>
>
>
>
> Rezwanul Kabir
> Dell Linux Development
> 512-725-0766
>
>
>>-----Original Message-----
>>From: Islam Amer [mailto:pharon@gmail.com]
>>Sent: Thursday, June 10, 2010 6:52 PM
>>To: Matthew Garrett
>>Cc: Kabir, Rezwanul; linux-kernel@vger.kernel.org;
>>platform-driver-x86@vger.kernel.org; akpm@linux-foundation.org
>>Subject: Re: Dell Studio 1555 eject key does not work ( small
>>patch to fix included )
>>
>>Hello all,
>>
>>My bios version is A08 , I see that A11 was recently released
>>but the changelog doesn't say much.
>>
>>Which is better, upgrade and hope the problem goes away, or
>>wait until we have a fix that is agreed upon ?
>>
>>Thanks.
>>
>>On Thu, Jun 10, 2010 at 9:40 PM, Matthew Garrett
>><mjg59@srcf.ucam.org> wrote:
>>> On Thu, Jun 10, 2010 at 01:36:56PM -0500,
>>Rezwanul_Kabir@Dell.com wrote:
>>>> Hi Islam Amer
>>>>
>>>> =A0 =A0I got report that "Ubuntu 10.04 + BIOS A11" was tested and =
the
>>>> "Eject CD" key is working
>>>> =A0 =A0as expected. Sorry, I couldn't find any Studio 1555 to
>>test myself
>>>> and cannot provide you
>>>> =A0 =A0with more details.
>>>>
>>>> =A0 =A0 Also, you may try acpi_osi=3D"Windows 2009" kernel
>>parameter and see if there is any difference.
>>>
>>> That's the default on any kernel that has this support in dell-wmi.
>>> Rez, could you let me know if the proposed patch breaks the spec in
>>> ways that are likely to cause problems?
>>>
>>> --
>>> Matthew Garrett | mjg59@srcf.ucam.org
>>>
>>
--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
