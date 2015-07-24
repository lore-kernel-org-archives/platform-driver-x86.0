From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH 1/1] toshiba_acpi: Add set_fan_status function
Date: Fri, 24 Jul 2015 17:40:32 -0600
Message-ID: <CAGdLNWF_LRK1hLF32gEHt1t_7sWLFUmzLYaSvDNKOQ=tEFh8TQ@mail.gmail.com>
References: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
	<1437615474-27936-3-git-send-email-coproscefalo@gmail.com>
	<20150724224535.GA18926@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:37358 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753461AbbGXXke (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jul 2015 19:40:34 -0400
In-Reply-To: <20150724224535.GA18926@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-07-24 16:45 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Wed, Jul 22, 2015 at 07:37:48PM -0600, Azael Avalos wrote:
>> This patch adds a new function named "set_fan_status" to complement
>> its get* counterpart, as well as to avoid code duplication between
>> "fan_proc_write" and "fan_store".
>
> It also appears to change the error codes returned via sysfs?
>
> Also adds some pr_ statements.
>
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>>  drivers/platform/x86/toshiba_acpi.c | 55 ++++++++++++++++++++++++-------------
>>  1 file changed, 36 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> index 6013a11..08fc867 100644
>> --- a/drivers/platform/x86/toshiba_acpi.c
>> +++ b/drivers/platform/x86/toshiba_acpi.c
>> @@ -1422,12 +1422,33 @@ static const struct file_operations video_proc_fops = {
>>       .write          = video_proc_write,
>>  };
>>
>> +/* Fan status */
>>  static int get_fan_status(struct toshiba_acpi_dev *dev, u32 *status)
>>  {
>> -     u32 hci_result;
>> +     u32 result = hci_read(dev, HCI_FAN, status);
>>
>> -     hci_result = hci_read(dev, HCI_FAN, status);
>> -     return hci_result == TOS_SUCCESS ? 0 : -EIO;
>> +     if (result == TOS_FAILURE)
>> +             pr_err("ACPI call to get Fan status failed\n");
>
> s/Fan/fan/
>
> Below too.
>
>> +     else if (result == TOS_NOT_SUPPORTED)
>> +             return -ENODEV;
>
> This condition would have returned -EIO previously correct?

Yes, we were returning -EIO for all error codes, with this patch we are at
least informing userspace that such feature is not supported with
-ENODEV instead of just returnning -EIO all the time.

With the pr_ message we are informing that an ACPI error happened,
which might (or might not) be the drivers fault, and this will be
on par with the rest of the HCI/SCI functions of the driver.

>
> I agree this new one is the right change, but it does pose a risk to userspace.
> There is a slim chance we will have to revert if someone complains and can't
> work around it, so we need to be clear about this in the commit message at the
> very least.

Ok, I spotted a few "issues" on the latter patches, I'll wait for your comments
and send a v2 afterwards with an expanded commit message.

> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
