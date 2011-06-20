From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Mon, 20 Jun 2011 15:53:31 +0200
Message-ID: <4DFF50DB.30100@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE9012E.5040207@absence.it> <20110604080717.GC7194@kamineko.org> <4DEA4D67.8000009@absence.it> <20110604164021.GA12552@kamineko.org> <4DEA644D.3030109@absence.it> <20110605222401.GA26835@kamineko.org> <4DECD592.6000707@absence.it> <20110607142332.GA4087@kamineko.org> <4DEE4094.8040300@absence.it> <20110607162413.GC4087@kamineko.org> <4DEE66F5.1020406@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:56577 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753848Ab1FTNxe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Jun 2011 09:53:34 -0400
In-Reply-To: <4DEE66F5.1020406@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 07/06/2011 19:59, Marco Chiappero ha scritto:
> Il 07/06/2011 18:24, Mattia Dongili ha scritto:
>> On Tue, Jun 07, 2011 at 05:15:32PM +0200, Marco Chiappero wrote:
>>> Il 07/06/2011 16:23, Mattia Dongili ha scritto:
>> ...
>>>> lovely, does it make any difference if udev maps those keys and the
>>>> driver instead just sends FN_F* making old and new models send the same
>>>> keycodes and scancodes?
>>>
>>> Models equipped with the SNC device are already using the same
>>> scancodes, there is no need to translate them twice.
>>
>> having the translation layer makes them consistent with all the other
>> hotkeys on all vaios.
>
> In this case I can't see how consistency is relevant (especially if we
> think that it's a nonexistent layout!). Moreover every SNC equipped
> notebooks use the same map while SPIC related code is going to be
> deprecated.

Mattia, what is your final decision about this topic? Would you like to 
maintain the KEY_FN_F* mapping?
