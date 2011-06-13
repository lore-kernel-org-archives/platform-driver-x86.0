From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Mon, 13 Jun 2011 02:01:26 +0200
Message-ID: <4DF55356.9020405@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE8FE7B.6090602@absence.it> <20110612222123.GB31095@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:43480 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754234Ab1FMABv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Jun 2011 20:01:51 -0400
In-Reply-To: <20110612222123.GB31095@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 13/06/2011 00:21, Mattia Dongili ha scritto:
>> +static int sony_nc_snc_setup(struct platform_device *pd)
>
> To be honest these sony_nc_snc_* functions are a bit poorly named.
> sony_nc_ was already supposed to be a partial expansion of SNC so this
> whole thing is a bit redundant now. what about
> sony_nc_setup/sony_nc_cleanup?

Yes I know but in the hurry I forgot to think about that, I will use 
this new naming schema.

>> +{
>> +	unsigned int i, string[4], bitmask, result;
>> +
>> +	for (i = 0; i<  4; i++) {
>> +		if (acpi_callsetfunc(sony_nc_acpi_handle,
>> +				"SN00", i,&string[i]))
>> +			return -EIO;
>> +	}
>> +	if (strncmp("SncSupported", (char *) string, 0x10)) {
>> +		pr_info("SNC device present but not supported by hardware");
>> +		return -1;
>> +	}
>
> oh lord.

Could you please avoid pointless comments like the one above?

> For the record, this is:
> 	 Store (0x53636E53, Index (CFGI, Zero))
> 	 Store (0x6F707075, Index (CFGI, One))
> 	 Store (0x64657472, Index (CFGI, 0x02))

and Store (0x0100, Index (CFGI, 0x03))
It's a 16 bytes string.

> But does it ever happen that it's not supported?

Well, who knows, but I think it's there for a reason. I suppose that in 
the future the SNC can be removed or improved (eg. using more SN methods 
or more offsets), it might happen to see strings like "SncDeprecated" or 
"SncRevision2". Probably the error string I wrote is misleading.

> Also, not all models
> seem to have those fields with exactly that string.

For example? Let's find out their meaning (maybe "sncsupported" instead 
of "SncSupported"?) and have a better understanding, instead.

> I'd rather not have
> this check here.

Avoiding this check here seems a logical error to me: it's basically the 
entry point (and the first thing to look at when calling the setup 
method SN00), maybe revealing info about the device and the action to be 
taken about this device, I can't see why we'd better skip this step, 
that doesn't hurt, just because at the moment almost every notebook 
won't fail.
