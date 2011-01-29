From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] thinkpad-acpi: fn-f4 issues
Date: Sat, 29 Jan 2011 15:55:33 -0200
Message-ID: <20110129175533.GB26442@khazad-dum.debian.net>
References: <Pine.LNX.4.64.1101251740380.3737@boston.corp.fedex.com>
 <20110125151346.GB14803@khazad-dum.debian.net>
 <AANLkTim9cN8KXx5DVrH_nBzVjnmuYsxOHwP4msBKs=gS@mail.gmail.com>
 <20110126003034.GC25953@khazad-dum.debian.net>
 <AANLkTinazKxNF27m_PkE097hnfZtOqBuAmLZYXydWCpL@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1.smtp.messagingengine.com ([66.111.4.25]:57573 "EHLO
	out1.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754009Ab1A2Rzg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 29 Jan 2011 12:55:36 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTinazKxNF27m_PkE097hnfZtOqBuAmLZYXydWCpL@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jeff Chua <jeff.chua.linux@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Dominik Kopp <my@kabelfunk.de>, ibm-acpi-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Wed, 26 Jan 2011, Jeff Chua wrote:
> > requested, which includes Fn+F4.  When in doubt, please either run the
> > driver in debug mode, or check the hotkey_mask in sysfs.
> >
> > Please check with xev and something like input-events or some other
> > input-device snooper whether you get events when you press Fn+F4.  Maybe
> > userspace is ignoring it.
> 
> xev reported both up/down. I'm using mplayer and it doesn't see those
> events.

Now I am confused.  Did you get any xev events for Fn+F4?  Or do you mean
volume up/down?

> Mute is working fine.  And on a separate topic, I simply couldn't get the
> "mic" to work. Alsamixer reported these ...

I wouldn't know what to do about that, but I bet someone on the thinkpad-ml
does, so maybe you should ask there.  You did check that the mic-mute button
is not active, I assume?

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
