From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Fri, 1 Jul 2011 13:50:20 +0100
Message-ID: <20110701125020.GA31697@srcf.ucam.org>
References: <20110604164021.GA12552@kamineko.org>
 <4DEA644D.3030109@absence.it>
 <20110605222401.GA26835@kamineko.org>
 <4DECD592.6000707@absence.it>
 <20110607142332.GA4087@kamineko.org>
 <4DEE4094.8040300@absence.it>
 <20110607162413.GC4087@kamineko.org>
 <4DEE66F5.1020406@absence.it>
 <4DFF50DB.30100@absence.it>
 <4E0DAB83.3070406@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:57032 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755080Ab1GAMu1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 08:50:27 -0400
Content-Disposition: inline
In-Reply-To: <4E0DAB83.3070406@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org

On Fri, Jul 01, 2011 at 01:12:03PM +0200, Marco Chiappero wrote:
> Il 20/06/2011 15:53, Marco Chiappero ha scritto:
> 
> >>In this case I can't see how consistency is relevant (especially if we
> >>think that it's a nonexistent layout!). Moreover every SNC equipped
> >>notebooks use the same map while SPIC related code is going to be
> >>deprecated.
> >
> >Mattia, what is your final decision about this topic? Would you like to
> >maintain the KEY_FN_F* mapping?
> 
> About the hotkeys, there is one more thing to deal with: the
> touchpad enable Fn-F1 combo. Now, the easy solution (I don't like)
> is to let acpid run some script that writes to the touchpad
> attribute to enable/disable the touchpad when the combo is pressed.
> Of course this requires acpid and the acpi bus notifications we are
> about to remove. I think that the driver should perform this change,
> when that combo is pressed and handle 0x0148 is present. Any
> thoughts on this? I think we can't avoid providing this feature.

We've standardised on doing this via the input layer.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
