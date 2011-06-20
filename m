From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Mon, 20 Jun 2011 15:49:41 +0200
Message-ID: <4DFF4FF5.1050308@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE8FE7B.6090602@absence.it> <20110612222123.GB31095@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:38503 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754364Ab1FTNto (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Jun 2011 09:49:44 -0400
In-Reply-To: <20110612222123.GB31095@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 13/06/2011 00:21, Mattia Dongili ha scritto:
> On Fri, Jun 03, 2011 at 05:32:11PM +0200, Marco Chiappero wrote:
>> +
>> +	/* retrieve the implemented offsets mask */
>> +	if (acpi_callsetfunc(sony_nc_acpi_handle, "SN00", 0x10,&bitmask))
>> +		return -EIO;
>
> not all models seem to have this bitmask either, default to 0xffff as is
> today if the call to SN00(0x10) returns an error please.

Are you sure about this? Not being present inside the DSDT doesn't 
necessarily mean that the this mask is not provided by the HW. I'm 
almost sure that the SN00 method has been designed at a certain point in 
time (the very beginning) and that is the same everywhere, for this reason.
