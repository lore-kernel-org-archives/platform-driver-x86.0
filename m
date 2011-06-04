From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 10/25] sony-laptop: keyboard backlight support extended
 to newer Vaios
Date: Sat, 04 Jun 2011 13:41:35 +0200
Message-ID: <4DEA19EF.3000804@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE9008D.7040504@absence.it> <20110604075815.GA7194@kamineko.org> <4DEA0954.6030709@absence.it> <20110604112358.GA11241@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:57969 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752733Ab1FDLlj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Jun 2011 07:41:39 -0400
In-Reply-To: <20110604112358.GA11241@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 04/06/2011 13:23, Mattia Dongili ha scritto:
>> Just for safety, since handle 0x0000 is a valid handle [1] it would
>> be better to initialize it to an invalid value.
>
> 0x0 is not valid, it's just the lack of a value.

But you can use it. "Just for safety" we'd better set to an invalid 
value that cannot be used by the acpi methods.

>> [1]
>> sony_laptop: found handle 0x0000 (offset: 0x0d)
>> sony_laptop: called SN07 with 0x000d (result: 0x0000)
>
> this is only going through the handles buffer and telling you that at
> 0x0d there is nothing.

the calling code:

ret = sony_call_snc_handle(0, 0, &result);

it returns 0.

sony_find_snc_handle should return -1 when called with handle == -1, right?
