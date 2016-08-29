From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH 2/3] toshiba_acpi: Change error checking logic from TCI functions
Date: Mon, 29 Aug 2016 09:32:17 -0600
Message-ID: <CAGdLNWEuur0VeyPXRdf_+xh-BHA0ZOKy38E5T0HRQPxnGg20ug@mail.gmail.com>
References: <20160816180617.1743-1-coproscefalo@gmail.com> <20160816180617.1743-3-coproscefalo@gmail.com>
 <20160828165654.GB96930@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34609 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757658AbcH2PcV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Aug 2016 11:32:21 -0400
In-Reply-To: <20160828165654.GB96930@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2016-08-28 10:56 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Tue, Aug 16, 2016 at 12:06:16PM -0600, Azael Avalos wrote:
>> Currently the success/error checking logic is intermixed, making the
>> code a bit cumbersome to understand.
>>
>> This patch changes the affected functions to first check for errors
>> and take appropriate actions, then check for the supported features.
>>
>> This patch also separates the error check from the acpi_status and
>> the tci_raw function call error check, as those two are completely
>> unrelated and were nested in if/else statements.
>
> Thanks, this is a good improvement. One questions below...
>
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>>  drivers/platform/x86/toshiba_acpi.c | 222 ++++++++++++++++++++++--------------
>>  1 file changed, 135 insertions(+), 87 deletions(-)
>>
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> index c6fc5cc..2256cf5 100644
>> --- a/drivers/platform/x86/toshiba_acpi.c
>> +++ b/drivers/platform/x86/toshiba_acpi.c
>> @@ -476,10 +476,15 @@ static void toshiba_illumination_available(struct toshiba_acpi_dev *dev)
>>
>>       status = tci_raw(dev, in, out);
>>       sci_close(dev);
>> -     if (ACPI_FAILURE(status))
>> +     if (ACPI_FAILURE(status)) {
>>               pr_err("ACPI call to query Illumination support failed\n");
>> -     else if (out[0] == TOS_SUCCESS)
>> -             dev->illumination_supported = 1;
>> +             return;
>> +     }
>> +
>> +     if (out[0] != TOS_SUCCESS)
>
> Does this condition not merit a pr_err message? It reads like an error...
>
> There are several similar situations below which are equally silent. Is this a
> deliberate decision?

This was on purpose, since we are querying for all the supported features,
the kernel log will contain a lot of error strings for not supported features,
as not all laptop models support all of them.

>
> --
> Darren Hart
> Intel Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
-- El mundo apesta y vosotros apestais tambien --
