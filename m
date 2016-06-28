From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH] intel-hid: remove duplicated acpi_remove_notify_handler
 and extra indents
Date: Tue, 28 Jun 2016 15:55:08 +0800
Message-ID: <CAJ=jquYbZPe5buFH3och25O_f=kBvwq9U9oeorOkK3pK-CML9w@mail.gmail.com>
References: <1467083382-31634-1-git-send-email-alex.hung@canonical.com> <20160628043543.GC3837@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f48.google.com ([209.85.213.48]:35011 "EHLO
	mail-vk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752074AbcF1HzK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 03:55:10 -0400
Received: by mail-vk0-f48.google.com with SMTP id j2so11372586vkg.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jun 2016 00:55:10 -0700 (PDT)
In-Reply-To: <20160628043543.GC3837@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

It was an observed error and it does not generate panic.  I also
checked the function in acpica and it validates parameters (as below)
and therefore it shall not cause any troubles; however, it is still
worthwhile to get it fixed.

acpi_status
acpi_remove_notify_handler(acpi_handle device,
                           u32 handler_type, acpi_notify_handler handler)
{
        ....
        /* Parameter validation */

        if ((!device) || (!handler) || (!handler_type) ||
            (handler_type > ACPI_MAX_NOTIFY_HANDLER_TYPE)) {
                return_ACPI_STATUS(AE_BAD_PARAMETER);
        }
        ....

I will include more details for this patch in V2.

On Tue, Jun 28, 2016 at 12:35 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Jun 28, 2016 at 11:09:42AM +0800, Alex Hung wrote:
>
> What triggered this patch? Was an error/panic observed? Is this a theoretical
> bug or an observed one? This will impact if it goes back to stable. Please
> provide a complete change log.
>
>> Signed-off-by: Alex Hung <alex.hung@canonical.com>
>> ---
>>  drivers/platform/x86/intel-hid.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
>> index a818db6..ed58742 100644
>> --- a/drivers/platform/x86/intel-hid.c
>> +++ b/drivers/platform/x86/intel-hid.c
>> @@ -122,8 +122,8 @@ static int intel_hid_input_setup(struct platform_device *device)
>>       return 0;
>>
>>  err_free_device:
>> -             input_free_device(priv->input_dev);
>> -             return ret;
>> +     input_free_device(priv->input_dev);
>> +     return ret;
>>  }
>>
>>  static void intel_hid_input_destroy(struct platform_device *device)
>> @@ -224,7 +224,6 @@ static int intel_hid_remove(struct platform_device *device)
>>       acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
>>       intel_hid_input_destroy(device);
>>       intel_hid_set_enable(&device->dev, 0);
>> -     acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
>>
>>       /*
>>        * Even if we failed to shut off the event stream, we can still
>> --
>> 2.7.4
>>
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center



-- 
Cheers,
Alex Hung
