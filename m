From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Fri, 18 Mar 2016 22:34:18 +1030
Message-ID: <20160318120418.GA29889@marvin.atrad.com.au>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:39773 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750772AbcCRMHP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Mar 2016 08:07:15 -0400
Content-Disposition: inline
In-Reply-To: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 16, 2016 at 12:28:07PM +0100, Micha?? K??pie?? wrote:
> Lifebook E734/E744/E754 has a LED which the manual calls "radio
> components indicator".  It should be lit when any radio transmitter is
> enabled.  Its state can be read and set using ACPI (FUNC interface,
> RFKILL method).
> 
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>

Wow, that is a comprehensive explanation.  In principle the patch looks
good, but I wonder whether the heuristics you have developed for button
detection needs wider testing.  I can test on my S7020 but only in a few
days time (this week is a very busy week) which would give us one more data
point.

> First of all, this patch raises a couple of checkpatch warnings.

The code on the whole reads well so I would be happy with it as is.  Making
it (and the existing code) fully compliant with checkpatch results in harder
to read code - at least that was the consensus when it was initially merged,
which is why it was left in the current state.  Darren may have an
alternative view on this though, in which case I'm happy to defer to his
preference.

> As for detecting whether the LED is present on a given machine, I had to
> resort to educated guesswork.  I assumed this LED is present on all
> devices which have a radio toggle button instead of a slider.  My
> Lifebook E744 holds 0x01010001 in BTNI.  By comparing the bits and
> buttons with those of a Lifebook E8420 (BTNI=0x000F0101, has a slider),
> I put my money on bit 24 as the indicator of the radio toggle button
> being present.

The other question is how consistent the bit layout is across all devices
which might make use of this driver.  The set of potential devices spans
nearly 10 years, and in many ways it would be surprising if the bit
definitions were kept the same over that time.  Testing would be the only
way to get a feeling for that.  If you could let me know how you went about
acquiring the values on your machine I could try the exact same steps on the
S7020 to see what we get.

> While it's not essential, it would be nice to initialize soft rfkill
> state of all radio transmitters to the value of RFSW upon boot.

I think this would only be necessary for those machines with the RF button
in place of the hard slider switch, right?

> One last remark is that I think this LED would best be driven by an
> inverted airplane mode LED trigger ...

In addition to the button interaction, presumedly.

> Perhaps it's a candidate for a follow-up patch in the future.

Could be.

> And finally, perhaps some of the remarks above belong in the commit
> message for future reference.  Please advise.

I think so - there's useful information in there which would be particularly
relevant if the button detection heuristics ever need to be revised.  Due to
the necessarily arbitrary feel of the detection logic a brief in-source
comment may be justified too.

Regards
  jonathan
