From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Fri, 1 Jul 2011 16:06:39 +0100
Message-ID: <20110701150639.GA2841@srcf.ucam.org>
References: <20110607142332.GA4087@kamineko.org>
 <4DEE4094.8040300@absence.it>
 <20110607162413.GC4087@kamineko.org>
 <4DEE66F5.1020406@absence.it>
 <4DFF50DB.30100@absence.it>
 <4E0DAB83.3070406@absence.it>
 <20110701125020.GA31697@srcf.ucam.org>
 <4E0DD3AE.1000908@absence.it>
 <20110701140915.GA1363@srcf.ucam.org>
 <4E0DD796.1070600@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:43565 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751351Ab1GAPGo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 11:06:44 -0400
Content-Disposition: inline
In-Reply-To: <4E0DD796.1070600@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org

On Fri, Jul 01, 2011 at 04:20:06PM +0200, Marco Chiappero wrote:
> Il 01/07/2011 16:09, Matthew Garrett ha scritto:
> >That's what I'm referring to, yes. I don't understand what you mean by
> >unrelated controls.
> 
> The hardware stored setting touchpad on/off. The KEY_TOUCHPAD_TOGGLE
> input key can be used by userspace but how can userspace act on the
> hardware setting? And if the touchpad is disabled via hardware,
> pressing the combo will have no effect.

That's why the touchpad power needs to be exported in a standardised way 
so the synaptics driver can use it.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
