From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Fri, 01 Jul 2011 17:11:46 +0200
Message-ID: <4E0DE3B2.8090700@absence.it>
References: <20110607142332.GA4087@kamineko.org> <4DEE4094.8040300@absence.it> <20110607162413.GC4087@kamineko.org> <4DEE66F5.1020406@absence.it> <4DFF50DB.30100@absence.it> <4E0DAB83.3070406@absence.it> <20110701125020.GA31697@srcf.ucam.org> <4E0DD3AE.1000908@absence.it> <20110701140915.GA1363@srcf.ucam.org> <4E0DD796.1070600@absence.it> <20110701150639.GA2841@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:37807 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333Ab1GAPLt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 11:11:49 -0400
In-Reply-To: <20110701150639.GA2841@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org

Il 01/07/2011 17:06, Matthew Garrett ha scritto:
> On Fri, Jul 01, 2011 at 04:20:06PM +0200, Marco Chiappero wrote:
>> The hardware stored setting touchpad on/off. The KEY_TOUCHPAD_TOGGLE
>> input key can be used by userspace but how can userspace act on the
>> hardware setting? And if the touchpad is disabled via hardware,
>> pressing the combo will have no effect.
>
> That's why the touchpad power needs to be exported in a standardised way
> so the synaptics driver can use it.

I just wanted to point out this issue until everything is in place.
