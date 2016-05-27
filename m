From: Lukas Wunner <lukas@wunner.de>
Subject: Deadlock in 4.6 caused by 4eebd5a4e726 ("apple-gmux: lock iGP IO to
 protect from vgaarb changes")
Date: Fri, 27 May 2016 14:23:02 +0200
Message-ID: <20160527122302.GA7471@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:49784 "EHLO
	mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751978AbcE0MTg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 May 2016 08:19:36 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bruno Premont <bonbons@linux-vserver.org>, platform-driver-x86@vger.kernel.org
Cc: Wilfried Klaebe <linux-kernel@lebenslange-mailadresse.de>, dri-devel@lists.freedesktop.org

Hi Bruno,

Wilfried Klaebe has reported a deadlock in 4.6 which he bisected to
my commit 704ab614ec12 ("drm/i915: Defer probe if gmux is present but
its driver isn't"), but which is ultimately caused by your commit
4eebd5a4e726 ("apple-gmux: lock iGP IO to protect from vgaarb changes").

What's happening is that your commit calls vga_tryget() in apple-gmux,
which succeeds. When Xorg is launched, it opens /dev/vga_arbiter and
calls vga_get(), which deadlocks. See the attachments to this bugzilla
entry, in particular the stacktrace at the end of "kern.log / dmesg of
non-working Linux 4.6.0":
https://bugzilla.kernel.org/show_bug.cgi?id=88861#c11
https://bugzilla.kernel.org/attachment.cgi?id=217541

For some reason the deadlock only occurs if apple-gmux loads before
i915, so it seems there's a race condition in your commit. My commit
ensures that this is the case, because i915 cannot probe the panel's
EDID without gmux. (The panel is switched to the radeon GPU.)
Notably, your commit message says that: "It is expected to load/probe
gmux prior to graphics drivers." However your commit does not take any
precautions to actually ensure that. What's more, now that apple-gmux
*does* load before i915, your commit breaks.

I'm not really familiar with vgaarb, but grepping through the kernel
tree I can find only 2 drivers which use it, i915 and vfio. In both
cases, the kernel only briefly acquires a lock to write to VGA
registers, and immediately releases the lock afterwards. So it looks
to me like the intended usage is to not hold a lock over a prolonged
period of time. IIUC the proprietary nvidia driver is doing exactly
that, and you sought to work around this issue by also holding a lock
indefinitely in apple-gmux.c.

The proper way, at least from my point of view as a complete vgaarb
dimwit, seems to briefly acquire a lock whenever apple-gmux.c
accesses its registers in the 0x700 IO range. And likewise nvidia
ought to fix their driver to only acquire a lock whenever they
actually need it. It was noble that you tried to help the user
with the nvidia driver issue, but ultimately we can't workaround
nvidia's bugs if it causes breakage elsewhere. They need to fix
their closed source driver.

There's also this unresolved issue that your commit broke backlight
control on the MacBookPro11,3 and 11,5:
https://bugzilla.kernel.org/show_bug.cgi?id=105051

So what do we do? We need to do something because now we've got the
deadlock regression in 4.6 on top. :(

Thanks,

Lukas
