From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 10/25] sony-laptop: keyboard backlight support extended
 to newer Vaios
Date: Mon, 06 Jun 2011 14:27:02 +0200
Message-ID: <4DECC796.5070500@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE9008D.7040504@absence.it> <20110604075815.GA7194@kamineko.org> <4DEA0954.6030709@absence.it> <20110604112358.GA11241@kamineko.org> <4DEA19EF.3000804@absence.it> <20110605223300.GB26835@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:54889 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755234Ab1FFM1N (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Jun 2011 08:27:13 -0400
In-Reply-To: <20110605223300.GB26835@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 06/06/2011 00:33, Mattia Dongili ha scritto:

>>> this is only going through the handles buffer and telling you that at
>>> 0x0d there is nothing.
>>
>> the calling code:
>>
>> ret = sony_call_snc_handle(0, 0,&result);
>>
>> it returns 0.
>
> this is easily fixed and should be fixed since 0x0 is not a valid
> handle.

I agree, but I'll wait for the fix to be posted before changing the patch.
