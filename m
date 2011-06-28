From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Tue, 28 Jun 2011 12:04:30 +0200
Message-ID: <4E09A72E.5050903@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE8FE7B.6090602@absence.it> <20110612222123.GB31095@kamineko.org> <4DF55356.9020405@absence.it> <4DFD2F83.40803@absence.it> <cc703738-d0d7-4a07-8111-50bb7a1e1f24@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:44490 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756526Ab1F1KEg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2011 06:04:36 -0400
In-Reply-To: <cc703738-d0d7-4a07-8111-50bb7a1e1f24@email.android.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 28/06/2011 11:27, Mattia Dongili ha scritto:
>
>
> Marco Chiappero<marco@absence.it>  wrote:
>
>> Il 13/06/2011 02:01, Marco Chiappero ha scritto:
>>> Il 13/06/2011 00:21, Mattia Dongili ha scritto:
>>>>> +static int sony_nc_snc_setup(struct platform_device *pd)
>>>>
>>>> To be honest these sony_nc_snc_* functions are a bit poorly named.
>>>> sony_nc_ was already supposed to be a partial expansion of SNC so
>> this
>>>> whole thing is a bit redundant now. what about
>>>> sony_nc_setup/sony_nc_cleanup?
>>>
>>> Yes I know but in the hurry I forgot to think about that, I will use
>>> this new naming schema.
>>
>> I've been rethinking about this, I was rather unhappy with the
>> sony_nc_snc_setup_handles and sony_nc_handles_setup names. I think that
>>
>> the best solution is:
>> - to rename sony_nc_handles_setup to sony_nc_handles_list_setup
>
> This:
>> - to include the sony_nc_setup_handles code back to sony_nc_snc_setup
>
> should be enough to disambiguate without gratuitously renaming all the other functions.

Yeah, but there are two issues:
1) sony_nc_add/resume/remove/notify are the ACPI callbacks that deal 
with the whole SNC stuff, while the sony_nc_setup/cleanup functions deal 
with the sole handles init and cleanup stuff. IMHO, this adds confusion.
2) we need an handles resume function but sony_nc_resume is already present.

Moreover the sony_nc_handles_list_* schema is much better and meaningful 
since those functions are related to the handles list.

so:
1) sony_nc_handles_* to sony_nc_handles_list_* --> handles list stuff
2) sony_nc_handles_* --> functions dealing with the handles 
setup/cleanup/resume stuff called from sony_nc_add/remove/resume (ACPI 
callbacks)

To get a better idea, have a look at this modified source, using the 
naming schema I'm proposing: 
http://www.absence.it/vaio-acpi/source/sony-laptop_dev_28062011.c
Hope this helps.
