From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH 2/3] toshiba_acpi: Fix typos in pr_* messages from USB
 Fleep Functions
Date: Sun, 29 Mar 2015 18:19:05 -0600
Message-ID: <CAGdLNWFALE02rENjRUC-UMhY6G+QFDRFf7gqnpzvVkUrz9XA9A@mail.gmail.com>
References: <1427490565-6363-1-git-send-email-coproscefalo@gmail.com>
	<1427490565-6363-3-git-send-email-coproscefalo@gmail.com>
	<20150328025855.GB37152@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:37397 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751750AbbC3ATH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 29 Mar 2015 20:19:07 -0400
In-Reply-To: <20150328025855.GB37152@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-03-27 20:58 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Fri, Mar 27, 2015 at 03:09:25PM -0600, Azael Avalos wrote:
>> This patch fixes typos in the pr_* messages from the USB Sleep
>> Functions.
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>>  drivers/platform/x86/toshiba_acpi.c | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> index 595f12c..3bb456c 100644
>> --- a/drivers/platform/x86/toshiba_acpi.c
>> +++ b/drivers/platform/x86/toshiba_acpi.c
>> @@ -955,11 +955,11 @@ static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
>>       status = tci_raw(dev, in, out);
>>       sci_close(dev);
>>       if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
>> -             pr_err("ACPI call to get USB S&C battery level failed\n");
>> +             pr_err("ACPI call to get USB Rapid Charge failed\n");
>>               return -EIO;
>>       } else if (out[0] == TOS_NOT_SUPPORTED ||
>>                  out[0] == TOS_INPUT_DATA_ERROR) {
>> -             pr_info("USB Sleep and Charge not supported\n");
>> +             pr_info("USB Rapid Charge not supported\n");
>
> This is a name change, not a typo fix. You added a comment in 1/3 using Sleep
> and Charge, should this patch perhaps come first?
>
> Or... hrm... this is using the correct name for each state, and 1/3 added Sleep
> and Charge to the correct one... right, probably just need a better commit
> message. Not a type, but fixing the messages reporting the wrong states.

Ok, will change in v2 and resend in a few minutes.

>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
