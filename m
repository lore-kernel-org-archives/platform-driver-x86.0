From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Mon, 18 Jul 2011 16:49:08 +0200
Message-ID: <4E2447E4.8080108@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE8FE7B.6090602@absence.it> <20110612222123.GB31095@kamineko.org> <4DF55356.9020405@absence.it> <4DFD2F83.40803@absence.it> <cc703738-d0d7-4a07-8111-50bb7a1e1f24@email.android.com> <4E09A72E.5050903@absence.it> <4E0DA75D.2090801@absence.it> <4E1E19DD.6050401@absence.it> <20110714220515.GB7586@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:45397 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752450Ab1GROtS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Jul 2011 10:49:18 -0400
In-Reply-To: <20110714220515.GB7586@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 15/07/2011 00:05, Mattia Dongili ha scritto:

>>> I recently uploaded the first part (new features excluded) of my v2
>>> patches at http://www.absence.it/vaio-acpi/source/patches/patchset-v2/
>>> to help you and receive new feedbacks.
>>
>> Still no feedbacks...
>
> still not much time. what I noticed so far:
> - patches are 14 instead of 25, any reason?

Because writing patches is time consuming. The first 14 patches include 
code cleaning/reorganization and improvements that can be merged 
immediately (if they look fine now), while the new features are a bit 
more problematic. Please, just review these 14 patches at the moment.

> - still stopping handlers evaluation if the magi SncSupported string is
>    not present

I do believe it's a good thing to have it. Do you prefer to drop the 
while patch #14 or just to change that check?

> - the function naming in patch 5 looks ok.

Do you wish to include the change from

	struct sony_nc_handles {
		u16 cap[0x10];
		struct device_attribute devattr;
	};

	static struct sony_nc_handles *handles;

to

	struct sony_nc_handles_list {
		u16 cap[0x10];
		struct device_attribute devattr;
	};

	static struct sony_nc_handles_list *handles;

as well?

> Once again, post the patches here with proper description, it's easier
> for everyone to review and comment the changes.

I'm still waiting for a few replies [1], I'd rather avoid spending time 
to send the patches twice. As soon as everything look fine (we are 
close) I will send the patches again.


[1]
http://www.spinics.net/lists/platform-driver-x86/msg02214.html
http://www.spinics.net/lists/platform-driver-x86/msg02213.html
(and possibly 
http://www.spinics.net/lists/platform-driver-x86/msg02216.html)
