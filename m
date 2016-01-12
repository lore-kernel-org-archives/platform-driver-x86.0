From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Tue, 12 Jan 2016 08:59:19 -0800
Message-ID: <20160112165919.GA1989@malice.jf.intel.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160104201231.GB5847@amd>
 <1452361154.673684.487414482.6CCEAE4B@webmail.messagingengine.com>
 <1452361601.676356.487415834.4652D305@webmail.messagingengine.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40859 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752999AbcALQ7X (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Jan 2016 11:59:23 -0500
Content-Disposition: inline
In-Reply-To: <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Pavel Machek <pavel@ucw.cz>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Mon, Jan 11, 2016 at 05:28:00PM -0200, Henrique de Moraes Holschuh wrote:
 > 
> > Henrique, so are you taking back your Ack from 10 minutes prior?
> 
> Hmm? No, the ACK stands.
> 
> Pavel was talking about another feature altogether, apparently: older
> thinkpads did not have "keyboard backlight" (as in light from below the
> keys).  They had a "ThinkLight", which is an overhead light that shines
> down on the keyboard.
> 
> The two features are not the same (and are handled differently by the
> firmware, for whatever reason), although they do serve the same purpose.
>  I don't think a thinkpad will ever have both features at the same time,
> so I have no idea why they changed the firmware interface.
> 
> The patch adds support to the "keyboard backlight" feature, which was
> previously NOT supported.
> 
> > I've dropped this patch. Please let me know if I should pick it back up.
> 
> Please pick it back up.
> 

Gah, these two threads landed next to each other in my Inbox and I didn't pick
up the split. Apologies.

This is queued in testing (again).

-- 
Darren Hart
Intel Open Source Technology Center
