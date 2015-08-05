From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH v3 4/5] toshiba_acpi: Remove unnecessary checks and
 returns in HCI/SCI functions
Date: Wed, 5 Aug 2015 16:23:49 -0600
Message-ID: <CAGdLNWFwvVWdTuYfYKgEj7E_9H66ncGpkhQszif2vdVi75xcQQ@mail.gmail.com>
References: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
	<1438401496-27744-5-git-send-email-coproscefalo@gmail.com>
	<20150805202134.GB12131@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150805202134.GB12131@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren,

2015-08-05 14:21 GMT-06:00 Darren Hart <dvhart@infradead.org>:
>> @@ -1131,14 +1055,10 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
>>
>>       result = sci_write(dev, SCI_USB_THREE, state);
>>       sci_close(dev);
>> -     if (result == TOS_FAILURE) {
>> +     if (result == TOS_FAILURE)
>>               pr_err("ACPI call to set USB 3 failed\n");
>> -             return -EIO;
>> -     } else if (result == TOS_NOT_SUPPORTED) {
>> +     else if (result == TOS_NOT_SUPPORTED)
>>               return -ENODEV;
>> -     } else if (result == TOS_INPUT_DATA_ERROR) {
>> -             return -EIO;
>> -     }
>>
>>       return (result == TOS_SUCCESS || result == TOS_SUCCESS2) 0 : -EIO;
>
> Hrm... the above line cause patch application failure via git (note the
> missing ? before the '0 : -EIO;'). This never existed upstream so far as
> I can determine.

I've spotted that while compile-checking my changes locally, but I might
have sent you the wrong patch here, I'll double check in the future to avoid
these embarrassments :-(

>
> It applied with some fuzz manually, but I'm concerned about how this
> happened.  Did you have a dirty tree when you prepared these patches
> perhaps?

This is weird, all these patches applied cleanly on my local copy, I'll fetch
a new copy from your "for-next" tree and check w/ it.

In the mean time, thanks for your observations, I'll try to keep a closer look
on future patches.

>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael

-- 
-- El mundo apesta y vosotros apestais tambien --
