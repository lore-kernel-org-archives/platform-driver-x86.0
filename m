From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: thinkpad_acpi: Lenovo ThinkPad Yoga 12 side lock button (0x6020)
Date: Sun, 11 Oct 2015 09:12:54 -0300
Message-ID: <20151011121254.GB32241@khazad-dum.debian.net>
References: <20151010215237.GB2958@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40546 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751226AbbJKMM6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 11 Oct 2015 08:12:58 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 9853A201A3
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2015 08:12:57 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20151010215237.GB2958@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Sat, 10 Oct 2015, Darren Hart wrote:
> The Lenovo ThinkPad Yogo 12 has a button on the side by the power and volume
> keys with a padlock icon on it, I presume intended to be used as Screenlock.
> 
> It emits 0x6020 which means it falls into the hotkey_notify_6xxx() block. It
> seems this should be handled similarly to the 0x1xxx events instead (as a
> hotkey).
> 
> Is this a keymap change candidate? If so, How do I map 0x6020 to a scancode?

We'd have to extend thinkpad-acpi to have sparse keymaps.  It is not a good
idea to intrude on the 0x1xxx range, as Lenovo can, and did, extend it at
least once already (adaptive keyboard).

We could, as a first step, map 0x6020 to a static keycode, as the padlock
symbol is pretty specific.

Extending thinkpad-acpi for sparse keymaps needs two steps:

1. Design the keymap, it will need a "vendor range", and a "driver range".
We should reserve 0x0000 to 0xffff as vendor range, and something higher for
driver and future use.

I think we could reserve bits 28-31 of the keymap "address" to select
"bank", and have 00 = vendor, 01 = driver, and the others as reserved.

Also, thinkpad-acpi may need to issue events that are not EV_KBD.  Do we
have a map that can do that sort of mapping?  Should we leave those out, as
special cases?

2. Implement the keymap, and decide what we do when someone maps an event
that is currently special-cased in thinkpad-acpi, or not something that
should be mapped to an external event in the first place.

Reject the attempt?  Override driver behavior?  Keep driver behavior _and_
issue the event?

E.g. allowing 0x6020 is a no-brainer: we should.  But what about 0x6030
(thermal table changed), or the battery alarms?  I'd say they should never
become keypresses: if anyone is doing that, they're abusing the input layer
for sure, and this _always_ comes back to bite us later.

I've had some bad experiences with this.  People creating feedback loops
into the driver, etc.  Some of this braindamage, introduced in userspace a
decade ago, is still limiting or discouraging feature implementation today.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
