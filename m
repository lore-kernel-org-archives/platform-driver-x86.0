From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Fri, 1 Jul 2011 15:09:15 +0100
Message-ID: <20110701140915.GA1363@srcf.ucam.org>
References: <20110605222401.GA26835@kamineko.org>
 <4DECD592.6000707@absence.it>
 <20110607142332.GA4087@kamineko.org>
 <4DEE4094.8040300@absence.it>
 <20110607162413.GC4087@kamineko.org>
 <4DEE66F5.1020406@absence.it>
 <4DFF50DB.30100@absence.it>
 <4E0DAB83.3070406@absence.it>
 <20110701125020.GA31697@srcf.ucam.org>
 <4E0DD3AE.1000908@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:42234 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756481Ab1GAOJV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 10:09:21 -0400
Content-Disposition: inline
In-Reply-To: <4E0DD3AE.1000908@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org

On Fri, Jul 01, 2011 at 04:03:26PM +0200, Marco Chiappero wrote:
> Il 01/07/2011 14:50, Matthew Garrett ha scritto:
> >We've standardised on doing this via the input layer.
> 
> Are you referring to
> KEY_TOUCHPAD_TOGGLE/KEY_TOUCHPAD_ON/KEY_TOUCHPAD_OFF? If so, we end
> up having two different unrelated controls.

That's what I'm referring to, yes. I don't understand what you mean by 
unrelated controls.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
