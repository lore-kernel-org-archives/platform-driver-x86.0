From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH v2] toshiba_acpi: Make toshiba_eco_mode_available more robust
Date: Mon, 9 Feb 2015 21:59:09 -0700
Message-ID: <CAGdLNWEhM=m9cEpuXkwPTdVEsMBbja3fxCV-MUDHkyE9NdF05A@mail.gmail.com>
References: <1423540502-3214-1-git-send-email-coproscefalo@gmail.com>
	<20150210042237.GD37927@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:49041 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750860AbbBJE7L (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Feb 2015 23:59:11 -0500
In-Reply-To: <20150210042237.GD37927@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-02-09 21:22 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> On Mon, Feb 09, 2015 at 08:55:02PM -0700, Azael Avalos wrote:
>> Some Toshiba laptops do not come with the ECO led installed, however,
>> the driver is registering support for it when it should not.
>>
>> This patch makes the toshiba_eco_mode_available function more robust
>> in detecting ECO led capabilities, not registering the led on laptops
>> that do not support it and registering the led when it really does.
>>
>> The ECO led function now returns 0x8e00 (Not Installed) by querying
>> with in[3] = 0, whenever theres no physical LED installed, and
>> returning 0x8300 (Input Data Error) when it is, however, there are
>> some BIOSes that have stub function calls not returning anything and
>> and the LED device was being registered too, hence the change of the
>> default return value from 1 to 0.
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>
> Careful with whitespace errors caught by checkpatch. Fixed that and corrected a minor
> grammatical issue in the comment block - since I was late in reviewing ;-)

Apologies for that, between my bit of dyslexia (I tend to switch
numbers and letters)
and my bad English...

Good thing I'm not working at a bank or stock exchange ;-)

>
> Applied and queued, thanks.
>
> --
> Darren Hart
> Intel Open Source Technology Center

Cheers
Azael

-- 
-- El mundo apesta y vosotros apestais tambien --
