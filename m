From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Fri, 01 Jul 2011 18:12:21 +0200
Message-ID: <4E0DF1E5.3060404@absence.it>
References: <20110607162413.GC4087@kamineko.org> <4DEE66F5.1020406@absence.it> <4DFF50DB.30100@absence.it> <4E0DAB83.3070406@absence.it> <20110701125020.GA31697@srcf.ucam.org> <4E0DD3AE.1000908@absence.it> <20110701140915.GA1363@srcf.ucam.org> <4E0DD796.1070600@absence.it> <20110701150639.GA2841@srcf.ucam.org> <4E0DE3B2.8090700@absence.it> <20110701155311.GA4014@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:38184 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751870Ab1GAQMY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 12:12:24 -0400
In-Reply-To: <20110701155311.GA4014@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org

Il 01/07/2011 17:53, Matthew Garrett ha scritto:
> On Fri, Jul 01, 2011 at 05:11:46PM +0200, Marco Chiappero wrote:
>> Il 01/07/2011 17:06, Matthew Garrett ha scritto:
>>> That's why the touchpad power needs to be exported in a standardised way
>>> so the synaptics driver can use it.
>>
>> I just wanted to point out this issue until everything is in place.
>
> I'm not going to add any new acpi notifications. If you're ok with that
> then there's no problem - I just want it to be clear that we need a
> mechanism for doing this in a standardised way.

No doubt, don't get me wrong, I totally agree. I'm just saying I don't 
know how long it takes to have it implemented and I suppose that a user 
with the blue touchpad icon on the F1 key expects it to be working (more 
than owners of older models where there is no "hw" shortcut but only a 
software control), so I was just asking what to do in the meantime. Of 
course one possible way is to use acpid, not a good one though. So, we 
can change the hw state inside the driver when the combo is recognized 
and eventually move to a better solution later on. Or no support at all 
until we have that standard interface. The decision, of course, is up to 
you, I'm just posing the existence of this issue.
