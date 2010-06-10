From: Islam Amer <pharon@gmail.com>
Subject: Re: Dell Studio 1555 eject key does not work ( small patch to fix
	included )
Date: Fri, 11 Jun 2010 02:51:53 +0300
Message-ID: <AANLkTilT3KCeJUpG-APK0MFh2ChMlZ4qwVPhOJpHnPB9@mail.gmail.com>
References: <AANLkTinG3jv6o8T00mDTEP5uxf4tKqOwSPEDIUcv4kVG@mail.gmail.com>
	<20100602213429.GA14866@srcf.ucam.org> <57DF5FDC2DC0634FA2A310BC5B81A68D01DF4CD01E@AUSX7MCPC108.AMER.DELL.COM>
	<AANLkTimIl6UL0HQT1wxRgXuj_m0O3CwMHQIa1xNE1Ax9@mail.gmail.com>
	<AANLkTin0qht1XR2rUgIXMEeJNU_gb3IZWqSBJb7NXD8K@mail.gmail.com>
	<57DF5FDC2DC0634FA2A310BC5B81A68D01DFD57663@AUSX7MCPC108.AMER.DELL.COM>
	<20100610184023.GA17320@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100610184023.GA17320@srcf.ucam.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Rezwanul_Kabir@dell.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org
List-Id: platform-driver-x86.vger.kernel.org

Hello all,

My bios version is A08 , I see that A11 was recently released but the
changelog doesn't say much.

Which is better, upgrade and hope the problem goes away, or wait until
we have a fix that is agreed upon ?

Thanks.

On Thu, Jun 10, 2010 at 9:40 PM, Matthew Garrett <mjg59@srcf.ucam.org> =
wrote:
> On Thu, Jun 10, 2010 at 01:36:56PM -0500, Rezwanul_Kabir@Dell.com wro=
te:
>> Hi Islam Amer
>>
>> =A0 =A0I got report that "Ubuntu 10.04 + BIOS A11" was tested and th=
e "Eject CD" key is working
>> =A0 =A0as expected. Sorry, I couldn't find any Studio 1555 to test m=
yself and cannot provide you
>> =A0 =A0with more details.
>>
>> =A0 =A0 Also, you may try acpi_osi=3D"Windows 2009" kernel parameter=
 and see if there is any difference.
>
> That's the default on any kernel that has this support in dell-wmi. R=
ez,
> could you let me know if the proposed patch breaks the spec in ways t=
hat
> are likely to cause problems?
>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
>
