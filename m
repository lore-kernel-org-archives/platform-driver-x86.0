From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Mon, 13 Jun 2011 11:39:09 +0200
Message-ID: <4DF5DABD.50505@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE8FE7B.6090602@absence.it>    <20110612222123.GB31095@kamineko.org> <4DF55356.9020405@absence.it> <09bbad4b23cc0747ac2ab6dcd232c3d4.squirrel@picard.linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:37412 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826Ab1FMJjO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Jun 2011 05:39:14 -0400
In-Reply-To: <09bbad4b23cc0747ac2ab6dcd232c3d4.squirrel@picard.linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 13/06/2011 03:28, Mattia Dongili ha scritto:
> On Mon, June 13, 2011 2:01 am, Marco Chiappero wrote:
>> Il 13/06/2011 00:21, Mattia Dongili ha scritto:
> ...
>>>> +{
>>>> +	unsigned int i, string[4], bitmask, result;
>>>> +
>>>> +	for (i = 0; i<   4; i++) {
>>>> +		if (acpi_callsetfunc(sony_nc_acpi_handle,
>>>> +				"SN00", i,&string[i]))
>>>> +			return -EIO;
>>>> +	}
>>>> +	if (strncmp("SncSupported", (char *) string, 0x10)) {
>>>> +		pr_info("SNC device present but not supported by hardware");
>>>> +		return -1;
>>>> +	}
>>>
>>> oh lord.
>>
>> Could you please avoid pointless comments like the one above?
>
> no. But you're lucky, you are free to ignore what you think is pointless.
> And just because you seem to take things a bit too personally, the
> exclamation
> was aimed at whoever wrote that SncSupported string into the ACPI tables.

This way of writing is for me annoying, I don't care who you think is 
stupid here (or whatever that would mean), it's just not relevant, so 
avoid it. And no, I can't ignore it if I have to read the mail, you can 
instead avoid writing, it is not necessary for you to write everything 
you think.

>>> I'd rather not have
>>> this check here.
>>
>> Avoiding this check here seems a logical error to me: it's basically the
>> entry point (and the first thing to look at when calling the setup
>> method SN00), maybe revealing info about the device and the action to be
>> taken about this device, I can't see why we'd better skip this step,
>> that doesn't hurt, just because at the moment almost every notebook
>> won't fail.
>
> the string never changes and there seems to be no logic associated to it
> in the DSDT.

Well, maybe. Or maybe not. Every year lots of new models are launched, 
and every model comes with it... why should they bring a useless 
information? The fact that at the moment we have basically only one 
string it doesn't assure that there is no logic.

> If the string is changed in some bios revision or gets removed you have to
> change the driver.

Yes, it's surely the right thing to do:
- if it removed and nothing changes, well, we have the proof that this 
string is not relevant for Sony too, so it's likely to be useless (at 
least, today, maybe it was the past). As far as I can say every model 
I've seen do have this string, so it doesn't seem the case.
- if it changes we will immediately have the chance to find out if 
something else has changed too. But again, this change is likely to have 
a meaning that we should try to discover.

It is instead much less relevant the Vaio model information, that we 
should show only in debug mode, because it's currently used by the 
software for windows, but that allow us to look for a DSDT file just 
looking at that number.
