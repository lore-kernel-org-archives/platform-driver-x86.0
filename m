From: joeyli <jlee@suse.com>
Subject: Re: acer-wmi auto-loaded on a Lenovo Thinkpad X1 Carbon 4th gen
Date: Tue, 19 Jul 2016 12:55:19 +0800
Message-ID: <20160719045518.GA26365@linux-rxt1.site>
References: <87vb07lx0s.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:53487 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751201AbcGSEzg (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Tue, 19 Jul 2016 00:55:36 -0400
Content-Disposition: inline
In-Reply-To: <87vb07lx0s.fsf@miraculix.mork.no>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: platform-driver-x86@vger.kernel.org

Hi Bj=F8rn,

On Thu, Jul 14, 2016 at 11:39:31PM +0200, Bj=F8rn Mork wrote:
> I recently got a new laptop.  And now I'm trying to figure out what a=
ll
> the stuff they put into it actually is :)
> .
> One thing that doesn't seem quite right is that the acer-wmi driver i=
s
> loaded and claims that this laptop has an "Acer BMA150 accelerometer"=
=2E
>=20
> It is true that there is a device there matching
>=20
>   #define AMW0_GUID1            "67C3371D-95A3-4C37-BB61-DD47B491DAAB=
"
>=20
> as can be seen:
>=20
>  bjorn@miraculix:~$ ls -l /sys/devices/virtual/wmi/67C3371D-95A3-4C37=
-BB61-DD47B491DAAB
>  total 0
>  -r--r--r-- 1 root root 4096 Jul 14 23:10 modalias
>  drwxr-xr-x 2 root root    0 Jul 14 23:10 power
>  lrwxrwxrwx 1 root root    0 Jul 14 23:10 subsystem -> ../../../../cl=
ass/wmi
>  -rw-r--r-- 1 root root 4096 Jul 14 23:10 uevent
>=20
>=20
> But I sort of doubt there is an Acer specific device here.  Maybe thi=
s
> is a generic accelerometer interface?  Or is there something else goi=
ng
> on?
>=20
> The input device created by the driver just just returns -EPERM when =
I
> try to open it, so I don't think this actually works as-is:
>=20
>  root@miraculix:/tmp# cat /dev/input/event8
>  cat: /dev/input/event8: Operation not permitted
>=20
>=20
> And it does seem a little weird that a Thinkpad should need an Acer
> specific platform driver anyway....  thinkpad_acpi is of course handl=
ing
> all(?) the Thinkpad specifics as expected.
>=20
>=20
> Bj=F8rn

Could you please check that what does the _HID of HKEY device in your D=
SDT?

or please attached your acpidump data to me:
 # acpidump > acpidump.raw

Then I want to add HID to the norfkill_ids list in acer-wmi to avoid th=
at
it loaded on your Lenovo machine like LEN0068.

Then, thinkpad_acpi needs to support this _HID.


Thanks a lot!
Joey Lee
