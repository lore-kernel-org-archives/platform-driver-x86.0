From: "Mattia Dongili" <malattia@linux.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Mon, 13 Jun 2011 03:28:02 +0200 (CEST)
Message-ID: <09bbad4b23cc0747ac2ab6dcd232c3d4.squirrel@picard.linux.it>
References: <4DE8FC4A.9010401@absence.it> <4DE8FE7B.6090602@absence.it>
    <20110612222123.GB31095@kamineko.org> <4DF55356.9020405@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from picard.linux.it ([213.254.12.146]:49437 "EHLO picard.linux.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754286Ab1FMBgD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Jun 2011 21:36:03 -0400
In-Reply-To: <4DF55356.9020405@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Mattia Dongili <malattia@linux.it>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Mon, June 13, 2011 2:01 am, Marco Chiappero wrote:
> Il 13/06/2011 00:21, Mattia Dongili ha scritto:
...
>>> +{
>>> +	unsigned int i, string[4], bitmask, result;
>>> +
>>> +	for (i = 0; i<  4; i++) {
>>> +		if (acpi_callsetfunc(sony_nc_acpi_handle,
>>> +				"SN00", i,&string[i]))
>>> +			return -EIO;
>>> +	}
>>> +	if (strncmp("SncSupported", (char *) string, 0x10)) {
>>> +		pr_info("SNC device present but not supported by hardware");
>>> +		return -1;
>>> +	}
>>
>> oh lord.
>
> Could you please avoid pointless comments like the one above?

no. But you're lucky, you are free to ignore what you think is pointless.
And just because you seem to take things a bit too personally, the
exclamation
was aimed at whoever wrote that SncSupported string into the ACPI tables.

>> For the record, this is:
>> 	 Store (0x53636E53, Index (CFGI, Zero))
>> 	 Store (0x6F707075, Index (CFGI, One))
>> 	 Store (0x64657472, Index (CFGI, 0x02))
>
> and Store (0x0100, Index (CFGI, 0x03))
> It's a 16 bytes string.
>
>> But does it ever happen that it's not supported?
>
> Well, who knows, but I think it's there for a reason. I suppose that in
> the future the SNC can be removed or improved (eg. using more SN methods
> or more offsets), it might happen to see strings like "SncDeprecated" or
> "SncRevision2". Probably the error string I wrote is misleading.
>
>> Also, not all models
>> seem to have those fields with exactly that string.
>
> For example? Let's find out their meaning (maybe "sncsupported" instead
> of "SncSupported"?) and have a better understanding, instead.

I did a quick grep for 0x53636E53 and SN00 on the DSDTs I have at hand and
the
count didn't match. I can check more carefully later.

>> I'd rather not have
>> this check here.
>
> Avoiding this check here seems a logical error to me: it's basically the
> entry point (and the first thing to look at when calling the setup
> method SN00), maybe revealing info about the device and the action to be
> taken about this device, I can't see why we'd better skip this step,
> that doesn't hurt, just because at the moment almost every notebook
> won't fail.

the string never changes and there seems to be no logic associated to it
in the DSDT.
If the string is changed in some bios revision or gets removed you have to
change the driver.
We know what handles do and for now their behaviour is consistent
regardless of a meaningless string stored in the acpi tables. It's good to
know
the meaning of that part of the buffer but I see no reason why the driver
should
not initialize if the string is not there or doesn't match.

-- 
mattia
:wq!
