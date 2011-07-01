From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Fri, 1 Jul 2011 16:53:12 +0100
Message-ID: <20110701155311.GA4014@srcf.ucam.org>
References: <20110607162413.GC4087@kamineko.org>
 <4DEE66F5.1020406@absence.it>
 <4DFF50DB.30100@absence.it>
 <4E0DAB83.3070406@absence.it>
 <20110701125020.GA31697@srcf.ucam.org>
 <4E0DD3AE.1000908@absence.it>
 <20110701140915.GA1363@srcf.ucam.org>
 <4E0DD796.1070600@absence.it>
 <20110701150639.GA2841@srcf.ucam.org>
 <4E0DE3B2.8090700@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:57348 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756625Ab1GAPxR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 11:53:17 -0400
Content-Disposition: inline
In-Reply-To: <4E0DE3B2.8090700@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org

On Fri, Jul 01, 2011 at 05:11:46PM +0200, Marco Chiappero wrote:
> Il 01/07/2011 17:06, Matthew Garrett ha scritto:
> >That's why the touchpad power needs to be exported in a standardised way
> >so the synaptics driver can use it.
> 
> I just wanted to point out this issue until everything is in place.

I'm not going to add any new acpi notifications. If you're ok with that 
then there's no problem - I just want it to be clear that we need a 
mechanism for doing this in a standardised way.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
