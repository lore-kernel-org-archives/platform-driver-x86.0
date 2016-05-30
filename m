From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
Subject: Re: Deadlock in 4.6 caused by 4eebd5a4e726 ("apple-gmux: lock iGP
 IO to protect from vgaarb changes")
Date: Mon, 30 May 2016 11:07:53 +0200
Message-ID: <20160530110753.61846b70@pluto.restena.lu>
References: <20160527122302.GA7471@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay.restena.lu ([158.64.1.62]:35100 "EHLO
	smtprelay.restena.lu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752561AbcE3JOb convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 30 May 2016 05:14:31 -0400
In-Reply-To: <20160527122302.GA7471@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: platform-driver-x86@vger.kernel.org, Wilfried Klaebe <linux-kernel@lebenslange-mailadresse.de>, dri-devel@lists.freedesktop.org

Hi Lucas,

On Fri, 27 May 2016 14:23:02 +0200 Lukas Wunner wrote:
> Hi Bruno,
> 
> Wilfried Klaebe has reported a deadlock in 4.6 which he bisected to
> my commit 704ab614ec12 ("drm/i915: Defer probe if gmux is present but
> its driver isn't"), but which is ultimately caused by your commit
> 4eebd5a4e726 ("apple-gmux: lock iGP IO to protect from vgaarb changes").
> 
> What's happening is that your commit calls vga_tryget() in apple-gmux,
> which succeeds. When Xorg is launched, it opens /dev/vga_arbiter and
> calls vga_get(), which deadlocks. See the attachments to this bugzilla
> entry, in particular the stacktrace at the end of "kern.log / dmesg of
> non-working Linux 4.6.0":
> https://bugzilla.kernel.org/show_bug.cgi?id=88861#c11
> https://bugzilla.kernel.org/attachment.cgi?id=217541

Looks like here the two GPUs are visible and the right one is being
selected.
So your patch to allow including ISA devices in vga arbitration would
not change anything here.

Is it known at what time the lockup happens?
From the kernel trace the lockup only happens during write() and not
already at open time. Thus the command written to /dev/vga_arbiter would
be helpful for proper understanding.
From kernel side code I think it's a call related to radeon and not
intel in Xorg that calls out to vga_arbiter, but please provide
more details (either strace&/backtrace on Xorg or kernel with pr_debug
active for vgaargb and corresponding kernel log).


From the bug report, comment #11 I don't understand this part:
  I boot Linux directly via rEFInd. I got the radeon xorg drivers
  installed, but neither intel nor fbdev or kms.

Does this mean that neither Intel KMS nor Radeon KMS are able to
initialize, nor simplefb's fbdev?
The kernel log though reports proper startup of radeon (KMS) and i915
(KMS) so only userspace gets caught...
So details on the userspace stack (xf86-video-intel and libdrm versions)
would be helpful as well.

> For some reason the deadlock only occurs if apple-gmux loads before
> i915, so it seems there's a race condition in your commit. My commit
> ensures that this is the case, because i915 cannot probe the panel's
> EDID without gmux. (The panel is switched to the radeon GPU.)
> Notably, your commit message says that: "It is expected to load/probe
> gmux prior to graphics drivers." However your commit does not take any
> precautions to actually ensure that. What's more, now that apple-gmux
> *does* load before i915, your commit breaks.

I think here userspace and kernel-side parts are getting mixed-up.

From the failing kernel log, both i915 and radeon are loaded long before
the lock happens (with vgaarb being loaded yet earlier).

The only one having trouble is Xorg (would it be possible to get a
backtrace of Xorg to know what code called/triggered /dev/vga_arbiter
and what it intends to do?).

> I'm not really familiar with vgaarb, but grepping through the kernel
> tree I can find only 2 drivers which use it, i915 and vfio. In both
> cases, the kernel only briefly acquires a lock to write to VGA
> registers, and immediately releases the lock afterwards. So it looks
> to me like the intended usage is to not hold a lock over a prolonged
> period of time. IIUC the proprietary nvidia driver is doing exactly
> that, and you sought to work around this issue by also holding a lock
> indefinitely in apple-gmux.c.
> 
> The proper way, at least from my point of view as a complete vgaarb
> dimwit, seems to briefly acquire a lock whenever apple-gmux.c
> accesses its registers in the 0x700 IO range. And likewise nvidia
> ought to fix their driver to only acquire a lock whenever they
> actually need it. It was noble that you tried to help the user
> with the nvidia driver issue, but ultimately we can't workaround
> nvidia's bugs if it causes breakage elsewhere. They need to fix
> their closed source driver.
> 
> There's also this unresolved issue that your commit broke backlight
> control on the MacBookPro11,3 and 11,5:
> https://bugzilla.kernel.org/show_bug.cgi?id=105051

You had a patch allowing registering ISA devices to vgaarb (for when
Intel GPU is hidden), did anything happen with that one?

> So what do we do? We need to do something because now we've got the
> deadlock regression in 4.6 on top. :(
> 
> Thanks,
> 
> Lukas

Bruno
