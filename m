From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Fri, 01 Jul 2011 16:03:26 +0200
Message-ID: <4E0DD3AE.1000908@absence.it>
References: <20110604164021.GA12552@kamineko.org> <4DEA644D.3030109@absence.it> <20110605222401.GA26835@kamineko.org> <4DECD592.6000707@absence.it> <20110607142332.GA4087@kamineko.org> <4DEE4094.8040300@absence.it> <20110607162413.GC4087@kamineko.org> <4DEE66F5.1020406@absence.it> <4DFF50DB.30100@absence.it> <4E0DAB83.3070406@absence.it> <20110701125020.GA31697@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:45121 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756598Ab1GAOD3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 10:03:29 -0400
In-Reply-To: <20110701125020.GA31697@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org

Il 01/07/2011 14:50, Matthew Garrett ha scritto:
> On Fri, Jul 01, 2011 at 01:12:03PM +0200, Marco Chiappero wrote:
>> About the hotkeys, there is one more thing to deal with: the
>> touchpad enable Fn-F1 combo. Now, the easy solution (I don't like)
>> is to let acpid run some script that writes to the touchpad
>> attribute to enable/disable the touchpad when the combo is pressed.
>> Of course this requires acpid and the acpi bus notifications we are
>> about to remove. I think that the driver should perform this change,
>> when that combo is pressed and handle 0x0148 is present. Any
>> thoughts on this? I think we can't avoid providing this feature.
>
> We've standardised on doing this via the input layer.

Are you referring to 
KEY_TOUCHPAD_TOGGLE/KEY_TOUCHPAD_ON/KEY_TOUCHPAD_OFF? If so, we end up 
having two different unrelated controls.
