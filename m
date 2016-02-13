From: Lukas Wunner <lukas@wunner.de>
Subject: Re: Backlight control does not work on an Apple dual-GPU
 (intel/nvidia) system using nouveau
Date: Sun, 14 Feb 2016 00:39:12 +0100
Message-ID: <20160213233912.GA16687@wunner.de>
References: <56BF996F.3030503@guruburu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:38912 "EHLO
	mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751060AbcBMXiq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 13 Feb 2016 18:38:46 -0500
Content-Disposition: inline
In-Reply-To: <56BF996F.3030503@guruburu.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gaele Strootman <gaele@guruburu.com>
Cc: Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>, Bjorn Helgaas <bhelgaas@google.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Bruno Bierbaumer <bruno@bierbaumer.net>, Michael Marineau <mike@marineau.org>

Hi,

On Sat, Feb 13, 2016 at 10:00:31PM +0100, Gaele Strootman wrote:
> [1.]
> Backlight control does not work on an Apple dual-GPU (intel/nvidia)
> system using nouveau.
>=20
> [2.]
> This is a regression that first appeared in v4.1:
> The backlight control (keys F1 and F2) does not work on an Apple
> dual-GPU (MacBookPro11,3) system using nouveau.
> It does work while using the proprietary Nvidia driver.
>=20
> 4eebd5a4e72697aac25a8a57d3f888a9d5f80370 is the first bad commit

This is a known issue, see https://bugzilla.kernel.org/show_bug.cgi?id=3D=
105051

Executive summary:

On dual GPU MacBook Pros, brightness is controlled by gmux.
It is changed by writing to gmux' I/O port range, 0x700 - 0x7FF.
gmux is located on the LPC bus, i.e. behind the southbridge.

=46or communication with gmux to work, the above-mentioned I/O port
range needs to be routed to bus 00, where the LPC bus bridge is
located. Incidentally the integrated GPU is also located on that
same bus, whereas the discrete GPU is on a different bus. (It is
directly connected to the PCI Root Complex in the CPU.)

IIUC the proprietary Nvidia driver locks gmux' I/O range to the
discrete GPU, causing it to be routed to the wrong bus. Bruno Pr=E9mont
sought to fix this with 86fd887b7fe3 ("vgaarb: Don't default
exclusively to first video device with mem+io") and 4eebd5a4e726
("apple-gmux: lock iGP IO to protect from vgaarb changes").

On MacBookPro11,3 and newer, the integrated GPU is invisible unless
a patch is used which causes Linux to masquerade as OS X to EFI
(see https://github.com/0xbb/gpu-switch#macbook-pro-113-notes).

Thus Bruno Pr=E9mont's patch doesn't work, it cannot lock I/O to the
integrated GPU as it's invisible.

@Bjorn Helgaas: Do you think this masquerade patch would be eligible
for inclusion in the kernel or is this not in your department?
https://www.marc.info/?l=3Dgrub-deavel&m=3D141586614924917&w=3D2

Thanks,

Lukas
