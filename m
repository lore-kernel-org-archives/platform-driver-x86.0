From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH v5] thinkpad-acpi: Improve hardware
 volume controls
Date: Fri, 12 Sep 2014 20:32:31 -0300
Message-ID: <20140912233231.GA30851@khazad-dum.debian.net>
References: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
 <CAObL_7F-w3f8R039JcenMeGpWx3dXrb6V3tVgxny7SJy717NNQ@mail.gmail.com>
 <20140912230344.GA8502@khazad-dum.debian.net>
 <CAObL_7EiSuP=vYo7sFF-0UxuO37Q_pNV6g5P5cwUe9oZuuTiFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43812 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750899AbaILXco (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 12 Sep 2014 19:32:44 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by gateway2.nyi.internal (Postfix) with ESMTP id 98BA120C83
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Sep 2014 19:32:43 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <CAObL_7EiSuP=vYo7sFF-0UxuO37Q_pNV6g5P5cwUe9oZuuTiFg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Fri, 12 Sep 2014, Andrew Lutomirski wrote:
> I think that v5 doesn't change behavior anywhere except for fixing
> broken things.  I could easily be wrong, though.

Well, I can test it on a T43 (old-style hardware mixer), but not on anything
else.  I'll need to port the patch to 3.10 for that, though.

> I kind of suspect that all laptops that don't default to the "none"
> mode are at least a little bit broken, though.  Any laptop on which
> pressing mute mutes the hardware mixer *and* sends KEY_MUTE is going
> to screw up if any modern GUI volume manager is running.

Ideed.

> Do you mean getting rid of latch mode and only keeping "none" and
> "toggle"?  I don't think that would be much simpler.  The issue (from

Then let's not do it.  Latch mode is the sane one.

> So most of the complexity is in the code that eats KEY_MUTE events and
> does the right thing with them.  I think that this is needed to get
> "latch" and "toggle" right.

Well, code complexity _is_ an acceptable price to get those right if we can
manage it.

> TBH, anyone running newish userspace probably wants the completely
> non-magical "none" behavior.  PulseAudio seems to do the right thing
> if the mute button generates KEY_MUTE and does nothing else.  I'm not
> entirely convinced that there's any need to support the other modes,
> but maybe I'm missing something, or maybe there are users with no
> KEY_MUTE handler, or maybe there are users that just really like the
> latching behavior where pressing the mute button never unmutes.

Support for the other modes is optional, as long as the old thinkpads with
full EC-driven behaviour still keep working in latch mode (which is the only
one they support in firmware, anyway).

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
