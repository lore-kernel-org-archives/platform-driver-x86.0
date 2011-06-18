From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Sun, 19 Jun 2011 01:06:43 +0200
Message-ID: <4DFD2F83.40803@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE8FE7B.6090602@absence.it> <20110612222123.GB31095@kamineko.org> <4DF55356.9020405@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:50622 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753207Ab1FRXGq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 18 Jun 2011 19:06:46 -0400
In-Reply-To: <4DF55356.9020405@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 13/06/2011 02:01, Marco Chiappero ha scritto:
> Il 13/06/2011 00:21, Mattia Dongili ha scritto:
>>> +static int sony_nc_snc_setup(struct platform_device *pd)
>>
>> To be honest these sony_nc_snc_* functions are a bit poorly named.
>> sony_nc_ was already supposed to be a partial expansion of SNC so this
>> whole thing is a bit redundant now. what about
>> sony_nc_setup/sony_nc_cleanup?
>
> Yes I know but in the hurry I forgot to think about that, I will use
> this new naming schema.

I've been rethinking about this, I was rather unhappy with the 
sony_nc_snc_setup_handles and sony_nc_handles_setup names. I think that 
the best solution is:
- to rename sony_nc_handles_setup to sony_nc_handles_list_setup
- to include the sony_nc_setup_handles code back to sony_nc_snc_setup 
and to rename this last one sony_nc_handles_setup, that should now deal 
with the sole handles (and handles events) setup. The same goes for the 
sony_nc_snc_resume and sony_nc_snc_cleanup functions.
