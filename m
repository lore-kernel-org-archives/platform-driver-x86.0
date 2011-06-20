From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 8/25] sony-laptop: sony_nc_notify rewritten and improved
Date: Mon, 20 Jun 2011 16:00:16 +0200
Message-ID: <4DFF5270.7050404@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE8FFE0.5070506@absence.it> <20110604084338.GD7194@kamineko.org> <4DEA1664.4090409@absence.it> <20110605223815.GC26835@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:56660 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754024Ab1FTOAT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Jun 2011 10:00:19 -0400
In-Reply-To: <20110605223815.GC26835@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 06/06/2011 00:38, Mattia Dongili ha scritto:
> On Sat, Jun 04, 2011 at 01:26:28PM +0200, Marco Chiappero wrote:
>> Il 04/06/2011 10:43, Mattia Dongili ha scritto:
>>> when sony_call_snc_handle(handle, 0x200,&result) fails above you will
>>> be reporting -1 via the acpi bus. The old code restored the event and
>>> reported the raw number instead.
>>
>> You are right, does the following sony_nc_notify modification look
>> fine to you?
>>
>> /* hotkey event, a key has been pressed, retrieve it */
>> value = sony_nc_hotkeys_decode(handle);
>> if (value>  0) /* known event */
>> 	sony_laptop_report_input_event(value);
>> else /* restore the original event */
>> 	value = event;
>
> it's a bit out of context but I guess it should work.

Two things I'd like to ask:
1) can I remove any acpi bus notification from this patch?
2) if so, do you prefer sony_nc_hotkeys_decode to forward decoded keys 
to the input core directly instead of returning the decoded value back 
to sony_nc_notify?
I'm not sure about what you meant with "out of context", is the above 
point #2?
