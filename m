From: Lukas Wunner <lukas@wunner.de>
Subject: Re: Deadlock in 4.6 caused by 4eebd5a4e726 ("apple-gmux: lock iGP IO
 to protect from vgaarb changes")
Date: Mon, 30 May 2016 12:24:46 +0200
Message-ID: <20160530102446.GA13170@wunner.de>
References: <20160527122302.GA7471@wunner.de>
 <20160530110753.61846b70@pluto.restena.lu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout3.hostsharing.net ([176.9.242.54]:55105 "EHLO
	mailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751137AbcE3KVP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 30 May 2016 06:21:15 -0400
Content-Disposition: inline
In-Reply-To: <20160530110753.61846b70@pluto.restena.lu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>
Cc: platform-driver-x86@vger.kernel.org, Wilfried Klaebe <linux-kernel@lebenslange-mailadresse.de>, dri-devel@lists.freedesktop.org, Tiago Vignatti <tiago.vignatti@intel.com>

On Mon, May 30, 2016 at 11:07:53AM +0200, Bruno Pr=E9mont wrote:
> On Fri, 27 May 2016 14:23:02 +0200 Lukas Wunner wrote:
> > Wilfried Klaebe has reported a deadlock in 4.6 which he bisected to
> > my commit 704ab614ec12 ("drm/i915: Defer probe if gmux is present b=
ut
> > its driver isn't"), but which is ultimately caused by your commit
> > 4eebd5a4e726 ("apple-gmux: lock iGP IO to protect from vgaarb chang=
es").
> >=20
> > What's happening is that your commit calls vga_tryget() in apple-gm=
ux,
> > which succeeds. When Xorg is launched, it opens /dev/vga_arbiter an=
d
> > calls vga_get(), which deadlocks. See the attachments to this bugzi=
lla
> > entry, in particular the stacktrace at the end of "kern.log / dmesg=
 of
> > non-working Linux 4.6.0":
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D88861#c11
> > https://bugzilla.kernel.org/attachment.cgi?id=3D217541
>=20
> Looks like here the two GPUs are visible and the right one is being
> selected.
> So your patch to allow including ISA devices in vga arbitration would
> not change anything here.
>=20
> Is it known at what time the lockup happens?
> From the kernel trace the lockup only happens during write() and not
> already at open time. Thus the command written to /dev/vga_arbiter wo=
uld
> be helpful for proper understanding.
> From kernel side code I think it's a call related to radeon and not
> intel in Xorg that calls out to vga_arbiter, but please provide
> more details (either strace&/backtrace on Xorg or kernel with pr_debu=
g
> active for vgaargb and corresponding kernel log).

When Xorg starts up, it calls xf86VGAarbiterLock() a couple of times
from InitOutput():
https://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/common/xf86In=
it.c#n569

This calls pci_device_vgaarb_lock():
https://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/common/xf86VG=
Aarbiter.c#n88

And this writes to /dev/vga_arbiter:
https://cgit.freedesktop.org/xorg/lib/libpciaccess/tree/src/common_vgaa=
rb.c#n287

Adding Tiago Vignatti to cc: who wrote much of this code.


> From the bug report, comment #11 I don't understand this part:
>   I boot Linux directly via rEFInd. I got the radeon xorg drivers
>   installed, but neither intel nor fbdev or kms.
>=20
> Does this mean that neither Intel KMS nor Radeon KMS are able to
> initialize, nor simplefb's fbdev?
> The kernel log though reports proper startup of radeon (KMS) and i915
> (KMS) so only userspace gets caught...
> So details on the userspace stack (xf86-video-intel and libdrm versio=
ns)
> would be helpful as well.

The kernel modules apple-gmux, i915 and radeon are present and loaded,
but the user space Xorg driver for i915 is not installed, only radeon.

But we (one the kernel side) cannot force people to have specific
userland drivers installed to avoid deadlocks in the kernel.


> > For some reason the deadlock only occurs if apple-gmux loads before
> > i915, so it seems there's a race condition in your commit. My commi=
t
> > ensures that this is the case, because i915 cannot probe the panel'=
s
> > EDID without gmux. (The panel is switched to the radeon GPU.)
> > Notably, your commit message says that: "It is expected to load/pro=
be
> > gmux prior to graphics drivers." However your commit does not take =
any
> > precautions to actually ensure that. What's more, now that apple-gm=
ux
> > *does* load before i915, your commit breaks.
>=20
> I think here userspace and kernel-side parts are getting mixed-up.
>=20
> From the failing kernel log, both i915 and radeon are loaded long bef=
ore
> the lock happens (with vgaarb being loaded yet earlier).
>=20
> The only one having trouble is Xorg (would it be possible to get a
> backtrace of Xorg to know what code called/triggered /dev/vga_arbiter
> and what it intends to do?).
>=20
> > I'm not really familiar with vgaarb, but grepping through the kerne=
l
> > tree I can find only 2 drivers which use it, i915 and vfio. In both
> > cases, the kernel only briefly acquires a lock to write to VGA
> > registers, and immediately releases the lock afterwards. So it look=
s
> > to me like the intended usage is to not hold a lock over a prolonge=
d
> > period of time. IIUC the proprietary nvidia driver is doing exactly
> > that, and you sought to work around this issue by also holding a lo=
ck
> > indefinitely in apple-gmux.c.
> >=20
> > The proper way, at least from my point of view as a complete vgaarb
> > dimwit, seems to briefly acquire a lock whenever apple-gmux.c
> > accesses its registers in the 0x700 IO range. And likewise nvidia
> > ought to fix their driver to only acquire a lock whenever they
> > actually need it. It was noble that you tried to help the user
> > with the nvidia driver issue, but ultimately we can't workaround
> > nvidia's bugs if it causes breakage elsewhere. They need to fix
> > their closed source driver.
> >=20
> > There's also this unresolved issue that your commit broke backlight
> > control on the MacBookPro11,3 and 11,5:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D105051
>=20
> You had a patch allowing registering ISA devices to vgaarb (for when
> Intel GPU is hidden), did anything happen with that one?

That patch was only half serious.

As said, based on my limited understanding of vgaarb.c, the intended
usage seems not to be that a lock is acquired and kept indefinitely,
but only for the brief period of time when I/O is accessed.

So what Nvidia is doing is plain wrong and people have tried to
convince them to fix their driver time and again in this forum
thread:
https://devtalk.nvidia.com/default/topic/545560/vfio-vga-arbitration-lo=
ck/

You were correct in that you noticed that I/O needs to be locked to
a device on the root bus for gmux to be accessible. However the lock
shouldn't be held indefinitely, but only briefly in the gmux_read*(),
gmux_write*() and gmux_is_indexed() functions. So my suggestion would
be to revert 4eebd5a4e726, replace it with a new patch that locks IO
only when needed, and get nvidia to do the same in their driver.

Thanks,

Lukas

>=20
> > So what do we do? We need to do something because now we've got the
> > deadlock regression in 4.6 on top. :(
> >=20
> > Thanks,
> >=20
> > Lukas
>=20
> Bruno
