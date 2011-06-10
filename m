From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 10/25] sony-laptop: keyboard backlight support extended
 to newer Vaios
Date: Fri, 10 Jun 2011 14:31:50 +0200
Message-ID: <4DF20EB6.2080803@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE9008D.7040504@absence.it> <20110604075815.GA7194@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:37342 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755770Ab1FJMb4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 10 Jun 2011 08:31:56 -0400
In-Reply-To: <20110604075815.GA7194@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 04/06/2011 09:58, Mattia Dongili ha scritto:

>>   struct kbd_backlight {
>> -	int mode;
>> -	int timeout;
>> +	unsigned int base;
>> +	unsigned int mode;
>> +	unsigned int timeout;
>>   	struct device_attribute mode_attr;
>>   	struct device_attribute timeout_attr;
>>   };
>> -
>>   static struct kbd_backlight *kbdbl_handle;
>> +static int sony_kbd_handle = -1;
>
> there seems to be no real point initializing this to -1. Also, can it be
> made part of the struct above?

I'm including these two changes in every patch that provides a new 
capability using different handles.
I need some more time to prepare the new patches, but before resending 
I'd like to hear some more feedbacks: removing any acpi notification in 
patch #8, do patches from 1 to 9 look fine? Is it possible to merge 
them, as they are, as soon as I repost them? If some changes are 
required please let me know. I've also posted a patch fixing the "0x0" 
handle issue ("fix potential improper handle usage"), I suppose it to be 
okay, can I include it in my original source file before creating the 
patches? Or should I include that patch in the patchset instead?

Thanks
