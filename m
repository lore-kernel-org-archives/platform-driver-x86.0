From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH 0/3] toshiba_acpi: Hotkey handling and keymap updates
Date: Fri, 6 Mar 2015 11:58:39 -0700
Message-ID: <CAGdLNWFqdAzt5pQuBd-6T5VwW7ugqvDX1Wk==xhx=qi=2-xdaQ@mail.gmail.com>
References: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
	<20150306183450.GK19001@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:37690 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932162AbbCFS6l (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Mar 2015 13:58:41 -0500
In-Reply-To: <20150306183450.GK19001@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-03-06 11:34 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> On Thu, Feb 26, 2015 at 10:57:11AM -0700, Azael Avalos wrote:
>> These patches add support to a new function that queries the supported Hotkey
>> Event Type, making the use of the DMI matching unnecessary and also fixes
>> the "Special Functions" mode on some laptops.
>>
>> Azael Avalos (3):
>>   toshiba_acpi: Add Hotkey Event Type function and definitions
>>   toshiba_acpi: Use the Hotkey Event Type function for keymap choosing
>>   toshiba_acpi: Fix the enabling of the Special Functions
>>
>>  drivers/platform/x86/toshiba_acpi.c | 97 ++++++++++++++++++++++++-------------
>>  1 file changed, 64 insertions(+), 33 deletions(-)
>>
>
> Would you also include a MAINTAINERS update, adding yourself as the
> thoshiba-acpi and possibly the toshiba-haps drivers? This helps ensure you get
> Cc'd. I'll also look for you to pre-screen any other submission to these drivers
> and provide your Reviewed-by before I merge them.

Sure, will do, I have a pending patch updating the *_notify events,
I will send a new patch alongside.

>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
