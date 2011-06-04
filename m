From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 10/25] sony-laptop: keyboard backlight support extended
 to newer Vaios
Date: Sat, 04 Jun 2011 12:30:44 +0200
Message-ID: <4DEA0954.6030709@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE9008D.7040504@absence.it> <20110604075815.GA7194@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:50495 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755047Ab1FDKat (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Jun 2011 06:30:49 -0400
In-Reply-To: <20110604075815.GA7194@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 04/06/2011 09:58, Mattia Dongili wrote:

>> -static void sony_nc_kbd_backlight_resume(void);
>> -
>> -enum sony_nc_rfkill {
>> -	SONY_WIFI,
>> -	SONY_BLUETOOTH,
>> -	SONY_WWAN,
>> -	SONY_WIMAX,
>> -	N_SONY_RFKILL,
>> -};
>
> removing this enum seems superfluous (it's re-added some patches later)
> and breaks compilation at this point.

Sorry, I made a mistake, I'm going to fix and resend patches #10 and #11.

>>   static struct kbd_backlight *kbdbl_handle;
>> +static int sony_kbd_handle = -1;
>
> there seems to be no real point initializing this to -1.

Just for safety, since handle 0x0000 is a valid handle [1] it would be 
better to initialize it to an invalid value.

> Also, can it be
> made part of the struct above?

Sure


[1]
sony_laptop: found handle 0x0000 (offset: 0x0d)
sony_laptop: called SN07 with 0x000d (result: 0x0000)
