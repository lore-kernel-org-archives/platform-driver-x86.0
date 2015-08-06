From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH v3 4/5] toshiba_acpi: Remove unnecessary checks and
 returns in HCI/SCI functions
Date: Thu, 6 Aug 2015 10:21:15 -0600
Message-ID: <CAGdLNWGS-iQhkfMqzPrMAYw11XVYx_grobr53Qqa2-US4w3pTg@mail.gmail.com>
References: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
	<1438401496-27744-5-git-send-email-coproscefalo@gmail.com>
	<20150805202134.GB12131@vmdeb7>
	<CAGdLNWFwvVWdTuYfYKgEj7E_9H66ncGpkhQszif2vdVi75xcQQ@mail.gmail.com>
	<20150805232105.GC74817@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:38079 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753911AbbHFQVR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Aug 2015 12:21:17 -0400
In-Reply-To: <20150805232105.GC74817@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-08-05 17:21 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Wed, Aug 05, 2015 at 04:23:49PM -0600, Azael Avalos wrote:
>> Hi Darren,
>>
>> 2015-08-05 14:21 GMT-06:00 Darren Hart <dvhart@infradead.org>:
>> >> @@ -1131,14 +1055,10 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
>> >>
>> >>       result = sci_write(dev, SCI_USB_THREE, state);
>> >>       sci_close(dev);
>> >> -     if (result == TOS_FAILURE) {
>> >> +     if (result == TOS_FAILURE)
>> >>               pr_err("ACPI call to set USB 3 failed\n");
>> >> -             return -EIO;
>> >> -     } else if (result == TOS_NOT_SUPPORTED) {
>> >> +     else if (result == TOS_NOT_SUPPORTED)
>> >>               return -ENODEV;
>> >> -     } else if (result == TOS_INPUT_DATA_ERROR) {
>> >> -             return -EIO;
>> >> -     }
>> >>
>> >>       return (result == TOS_SUCCESS || result == TOS_SUCCESS2) 0 : -EIO;
>> >
>> > Hrm... the above line cause patch application failure via git (note the
>> > missing ? before the '0 : -EIO;'). This never existed upstream so far as
>> > I can determine.
>>
>> I've spotted that while compile-checking my changes locally, but I might
>> have sent you the wrong patch here, I'll double check in the future to avoid
>> these embarrassments :-(
>>
>> >
>> > It applied with some fuzz manually, but I'm concerned about how this
>> > happened.  Did you have a dirty tree when you prepared these patches
>> > perhaps?
>>
>> This is weird, all these patches applied cleanly on my local copy, I'll fetch
>> a new copy from your "for-next" tree and check w/ it.
>
> Please verify what I have in "testing", if that's right, then we're good. It has
> already passed my checks and 0day's.

I just checked it, and it's good, sorry for all the fuzz :-)

>
> --
> Darren Hart
> Intel Open Source Technology Center

Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
