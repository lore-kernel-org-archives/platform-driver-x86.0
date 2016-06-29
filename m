From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH] platform/x86: Add IIO dependency to ACPI_TOSHIBA
Date: Tue, 28 Jun 2016 23:21:39 -0600
Message-ID: <CAGdLNWGPP1HsfCFP8GKUDR1_c1+yZ5BY_NPqfj4_6wvh+xOL1Q@mail.gmail.com>
References: <20160628195855.22199-1-coproscefalo@gmail.com> <20160629051634.GM3837@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f195.google.com ([209.85.214.195]:33422 "EHLO
	mail-ob0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756AbcF2FVl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jun 2016 01:21:41 -0400
In-Reply-To: <20160629051634.GM3837@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Jonathan Cameron <jic23@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2016-06-28 23:16 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Tue, Jun 28, 2016 at 01:58:55PM -0600, Azael Avalos wrote:
>> The toshiba_acpi driver added support to the accelerometer axis
>> via the IIO subsystem, but failed to add the dependency to the
>> Kconfig file, making the driver fail to compile if the IIO
>> subsystem is not selected.
>>
>> This patch adds a depedency to the IIO subsystem to the
>> ACPI_TOSHIBA entry in Kconfig to avoid such build failure.
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>> Darren, Jonathan:
>>  I just received a few mails from the kbuild test robot informing
>>  the build failure, as a fix for this I just added a hard dependency
>>  to IIO, but maybe Jonathan can weigh in and provide me with a better
>>  alternative (perhaps some ifdefs) as to the hard IIO dependency.
>
> Don't you just love the giant kernel builder in the sky?

I certainly do, the ever watching eye XD

>
> Rather than add this separately and leave a potential build failure in the
> kernel, I'll add this line to:
>
> toshiba_acpi: Add IIO interface for accelerometer axis data

Great :-)

>
>>
>>  drivers/platform/x86/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index c06bb85..633fc5c 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -669,6 +669,7 @@ config ACPI_TOSHIBA
>>       depends on SERIO_I8042 || SERIO_I8042 = n
>>       depends on ACPI_VIDEO || ACPI_VIDEO = n
>>       depends on RFKILL || RFKILL = n
>> +     depends on IIO
>>       select INPUT_POLLDEV
>>       select INPUT_SPARSEKMAP
>>       ---help---
>> --
>> 2.8.4
>>
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center



-- 
-- El mundo apesta y vosotros apestais tambien --
