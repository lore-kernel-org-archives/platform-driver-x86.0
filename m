From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Fri, 01 Jul 2011 13:12:03 +0200
Message-ID: <4E0DAB83.3070406@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE9012E.5040207@absence.it> <20110604080717.GC7194@kamineko.org> <4DEA4D67.8000009@absence.it> <20110604164021.GA12552@kamineko.org> <4DEA644D.3030109@absence.it> <20110605222401.GA26835@kamineko.org> <4DECD592.6000707@absence.it> <20110607142332.GA4087@kamineko.org> <4DEE4094.8040300@absence.it> <20110607162413.GC4087@kamineko.org> <4DEE66F5.1020406@absence.it> <4DFF50DB.30100@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:38984 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754793Ab1GALMG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 07:12:06 -0400
In-Reply-To: <4DFF50DB.30100@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 20/06/2011 15:53, Marco Chiappero ha scritto:

>> In this case I can't see how consistency is relevant (especially if we
>> think that it's a nonexistent layout!). Moreover every SNC equipped
>> notebooks use the same map while SPIC related code is going to be
>> deprecated.
>
> Mattia, what is your final decision about this topic? Would you like to
> maintain the KEY_FN_F* mapping?

About the hotkeys, there is one more thing to deal with: the touchpad 
enable Fn-F1 combo. Now, the easy solution (I don't like) is to let 
acpid run some script that writes to the touchpad attribute to 
enable/disable the touchpad when the combo is pressed. Of course this 
requires acpid and the acpi bus notifications we are about to remove. I 
think that the driver should perform this change, when that combo is 
pressed and handle 0x0148 is present. Any thoughts on this? I think we 
can't avoid providing this feature.
