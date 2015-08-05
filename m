From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH v3 2/5] toshiba_acpi: Remove "*not supported" feature prints
Date: Wed, 5 Aug 2015 16:15:13 -0600
Message-ID: <CAGdLNWG0HCsXivhQeWsNJfnSf0vNTiapf=XBOx2Mnezj8TgZpQ@mail.gmail.com>
References: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
	<1438401496-27744-3-git-send-email-coproscefalo@gmail.com>
	<20150805093800.GA12131@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:35969 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753847AbbHEWPO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Aug 2015 18:15:14 -0400
In-Reply-To: <20150805093800.GA12131@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-08-05 3:38 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Fri, Jul 31, 2015 at 09:58:13PM -0600, Azael Avalos wrote:
>> Currently the driver prints "*not supported" if any of the features
>> queried are in fact not supported, let us print the available
>> features instead.
>>
>> This patch removes all instances pr_info printing "*not supported",
>> and add a new function called "print_supported_features", which will
>> print the available laptop features.
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>>  drivers/platform/x86/toshiba_acpi.c | 72 +++++++++++++++++++++++--------------
>>  1 file changed, 46 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> index d983dc4..66b596a 100644
>> --- a/drivers/platform/x86/toshiba_acpi.c
>> +++ b/drivers/platform/x86/toshiba_acpi.c
>> @@ -459,7 +459,7 @@ static void toshiba_illumination_available(struct toshiba_acpi_dev *dev)
>>       if (ACPI_FAILURE(status))
>>               pr_err("ACPI call to query Illumination support failed\n");
>>       else if (out[0] == TOS_NOT_SUPPORTED)
>> -             pr_info("Illumination device not available\n");
>> +             return;
>>       else if (out[0] == TOS_SUCCESS)
>>               dev->illumination_supported = 1;
>>  }
>> @@ -483,7 +483,6 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
>>               pr_err("ACPI call for illumination failed\n");
>>               return;
>>       } else if (result == TOS_NOT_SUPPORTED) {
>> -             pr_info("Illumination not supported\n");
>>               return;
>>       }
>
> I mentioned this in the previous review. For several of these, we have an if
> statement that checks for a condition, and then returns, which is exactly what
> would happen if we didn't have the if statement at all.
>
> If the context is important, a comment should be sufficient. Is there a
> compelling reason to add the redundant check?

The "offending" lines are removed by patch 04, that's why I didn't included
a comment or removed the lines on this patch, as I was trying to "abstract"
what each patch do, which in this patch, only removes the pr_info.

>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
