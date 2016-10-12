From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH] toshiba-wmi: Fix loading the driver on non Toshiba laptops
Date: Wed, 12 Oct 2016 10:26:43 -0600
Message-ID: <CAGdLNWGderHFpsqcRc5FjHYOCokoKzfsTeMUkjyZYhAU3guQ0w@mail.gmail.com>
References: <20160825185055.12143-1-coproscefalo@gmail.com> <20160828170037.GC96930@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34382 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753724AbcJLQ0p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2016 12:26:45 -0400
In-Reply-To: <20160828170037.GC96930@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, carlos@strangeworlds.co.uk

*ping*

2016-08-28 11:00 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Thu, Aug 25, 2016 at 12:50:55PM -0600, Azael Avalos wrote:
>> Bug 150611 uncovered that the WMI ID used by the toshiba-wmi driver
>> is not Toshiba specific, and as such, the driver was being loaded
>> on non Toshiba laptops too.
>>
>> This patch adds a DMI matching list checking for TOSHIBA as the
>> vendor, refusing to load if it is not.
>>
>> Also the WMI GUID was renamed, dropping the TOSHIBA_ prefix, to
>> better reflect that such GUID is not a Toshiba specific one.
>>
>> Cc: <stable@vger.kernel.org> # 4.4+
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>> Hi Darren,
>>
>> I was waiting on input from the bug above, but haven't received an
>> answer (as of yet), so I decided to send this to the mailing list
>> for feedback as to whether this is the correct approach for this
>> issue.
>
> Thanks. Let's see if Carlos (wmi.c author) has an opinion...
>
> Carlos?

Any input on this?

>
>>
>>  drivers/platform/x86/toshiba-wmi.c | 26 +++++++++++++++++++-------
>>  1 file changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/toshiba-wmi.c b/drivers/platform/x86/toshiba-wmi.c
>> index feac457..0c92887 100644
>> --- a/drivers/platform/x86/toshiba-wmi.c
>> +++ b/drivers/platform/x86/toshiba-wmi.c
>> @@ -24,14 +24,15 @@
>>  #include <linux/acpi.h>
>>  #include <linux/input.h>
>>  #include <linux/input/sparse-keymap.h>
>> +#include <linux/dmi.h>
>>
>>  MODULE_AUTHOR("Azael Avalos");
>>  MODULE_DESCRIPTION("Toshiba WMI Hotkey Driver");
>>  MODULE_LICENSE("GPL");
>>
>> -#define TOSHIBA_WMI_EVENT_GUID       "59142400-C6A3-40FA-BADB-8A2652834100"
>> +#define WMI_EVENT_GUID       "59142400-C6A3-40FA-BADB-8A2652834100"
>>
>> -MODULE_ALIAS("wmi:"TOSHIBA_WMI_EVENT_GUID);
>> +MODULE_ALIAS("wmi:"WMI_EVENT_GUID);
>>
>>  static struct input_dev *toshiba_wmi_input_dev;
>>
>> @@ -63,6 +64,16 @@ static void toshiba_wmi_notify(u32 value, void *context)
>>       kfree(response.pointer);
>>  }
>>
>> +static struct dmi_system_id toshiba_wmi_dmi_table[] __initdata = {
>> +     {
>> +             .ident = "Toshiba laptop",
>> +             .matches = {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
>> +             },
>> +     },
>> +     {}
>> +};
>> +
>>  static int __init toshiba_wmi_input_setup(void)
>>  {
>>       acpi_status status;
>> @@ -81,7 +92,7 @@ static int __init toshiba_wmi_input_setup(void)
>>       if (err)
>>               goto err_free_dev;
>>
>> -     status = wmi_install_notify_handler(TOSHIBA_WMI_EVENT_GUID,
>> +     status = wmi_install_notify_handler(WMI_EVENT_GUID,
>>                                           toshiba_wmi_notify, NULL);
>>       if (ACPI_FAILURE(status)) {
>>               err = -EIO;
>> @@ -95,7 +106,7 @@ static int __init toshiba_wmi_input_setup(void)
>>       return 0;
>>
>>   err_remove_notifier:
>> -     wmi_remove_notify_handler(TOSHIBA_WMI_EVENT_GUID);
>> +     wmi_remove_notify_handler(WMI_EVENT_GUID);
>>   err_free_keymap:
>>       sparse_keymap_free(toshiba_wmi_input_dev);
>>   err_free_dev:
>> @@ -105,7 +116,7 @@ static int __init toshiba_wmi_input_setup(void)
>>
>>  static void toshiba_wmi_input_destroy(void)
>>  {
>> -     wmi_remove_notify_handler(TOSHIBA_WMI_EVENT_GUID);
>> +     wmi_remove_notify_handler(WMI_EVENT_GUID);
>>       sparse_keymap_free(toshiba_wmi_input_dev);
>>       input_unregister_device(toshiba_wmi_input_dev);
>>  }
>> @@ -114,7 +125,8 @@ static int __init toshiba_wmi_init(void)
>>  {
>>       int ret;
>>
>> -     if (!wmi_has_guid(TOSHIBA_WMI_EVENT_GUID))
>> +     if (!wmi_has_guid(WMI_EVENT_GUID) ||
>> +         !dmi_check_system(toshiba_wmi_dmi_table))
>>               return -ENODEV;
>>
>>       ret = toshiba_wmi_input_setup();
>> @@ -130,7 +142,7 @@ static int __init toshiba_wmi_init(void)
>>
>>  static void __exit toshiba_wmi_exit(void)
>>  {
>> -     if (wmi_has_guid(TOSHIBA_WMI_EVENT_GUID))
>> +     if (wmi_has_guid(WMI_EVENT_GUID))
>>               toshiba_wmi_input_destroy();
>>  }
>>
>> --
>> 2.9.3
>>
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center



-- 
-- El mundo apesta y vosotros apestais tambien --
