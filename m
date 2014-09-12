From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH v5] thinkpad-acpi: Improve hardware
 volume controls
Date: Fri, 12 Sep 2014 20:03:44 -0300
Message-ID: <20140912230344.GA8502@khazad-dum.debian.net>
References: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
 <CAObL_7F-w3f8R039JcenMeGpWx3dXrb6V3tVgxny7SJy717NNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46014 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751399AbaILXEB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 12 Sep 2014 19:04:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by gateway2.nyi.internal (Postfix) with ESMTP id DE2CD20AE7
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Sep 2014 19:04:00 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <CAObL_7F-w3f8R039JcenMeGpWx3dXrb6V3tVgxny7SJy717NNQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On Fri, 12 Sep 2014, Andrew Lutomirski wrote:
> > This behavior is unfortunate, since modern userspace will also
> > handle the hotkeys and change the other mixer.  If the software
> > mixer is muted and the hardware mixer is unmuted and you push mute,
> > hilarity ensues as they both switch state.
> 
> This patch seems to have fallen into oblivion.  My X220s still has

Mostly because I was out of time to review it due to its size, and ended up
forgetting about it.  I am deeply sorry about that.

We can bring this patch back into the light, though.

> screwy mute controls.  (To reproduce in GNOME 3, get into an unmuted,
> nonzero volume state, then press volume down a bunch of times until a
> mute icon shows up, then press mute, then press volume up.  You are
> now have no sound until you fiddle with the hardware controls a bunch
> and undo it.)
> 
> I can rebase this to 3.17-whatever, but I'm also somewhat inclined to
> get rid of all the compatibility bits and just modify the driver to
> force all Thinkpads into nonmagical software-only mode.  The latter
> approach will be *much* simpler

Changing the behaviour on the newer ones is okay, but not the old ones
(where old == not broken).  That would be a regression.

Syncing the hardware and software mute gating is fine, though, as long as
they are always kept in sync.  If "toggle mode" is much easier to implement
than the v5 version of your patch, we could try that.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
