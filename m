From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: peaq-wmi: Add DMI check before binding to
 the WMI interface
Date: Thu, 5 Oct 2017 16:27:37 +0200
Message-ID: <acc2d503-877b-5862-b978-4aea41eca4b8@redhat.com>
References: <20171005142021.4899-1-hdegoede@redhat.com>
 <CAHp75VezzgBXscqiVg_eFkpQdk8NPjQVyxh2FH_DuXop74KzLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36666 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751043AbdJEO1j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 10:27:39 -0400
In-Reply-To: <CAHp75VezzgBXscqiVg_eFkpQdk8NPjQVyxh2FH_DuXop74KzLw@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org

Hi,

On 05-10-17 16:23, Andy Shevchenko wrote:
> On Thu, Oct 5, 2017 at 5:20 PM, Hans de Goede <hdegoede@redhat.com> wrote:
>> It seems that the WMI GUID used by the PEAQ 2-in-1 WMI hotkeys is not
>> as unique as a GUID should be and is used on some other devices too.
>>
>> This is causing spurious key-press reports on these other devices.
>>
>> This commits adds a DMI check to the PEAQ 2-in-1 WMI hotkeys driver to
>> ensure that it is actually running on a PEAQ 2-in-1, fixing the
>> spurious key-presses on these other devices.
>>
> 
> Recently I have pushed similar patch (another device). Can you rebase
> against testing?

That patch adds a blacklist, for yet another model then the 2 bugreports:

>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1497861
>> BugLink: https://bugzilla.suse.com/attachment.cgi?id=743182

which I've received. My patch adds a whitelist instead as it seems the GUID
used is some very generic GUID, so the blacklist patch should simply be
dropped, after which my patch should apply cleanly :)

Regards,

Hans






>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/platform/x86/peaq-wmi.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
>> index bc98ef95514a..67fa3fa32011 100644
>> --- a/drivers/platform/x86/peaq-wmi.c
>> +++ b/drivers/platform/x86/peaq-wmi.c
>> @@ -8,6 +8,7 @@
>>    */
>>
>>   #include <linux/acpi.h>
>> +#include <linux/dmi.h>
>>   #include <linux/input-polldev.h>
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>> @@ -64,8 +65,22 @@ static void peaq_wmi_poll(struct input_polled_dev *dev)
>>          }
>>   }
>>
>> +/* Some other devices (Shuttle XS35) use the same WMI GUID for other purposes */
>> +static const struct dmi_system_id peaq_dmi_table[] = {
>> +       {
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "PEAQ"),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "PEAQ PMM C1010 MD99187"),
>> +               },
>> +       },
>> +};
>> +
>>   static int __init peaq_wmi_init(void)
>>   {
>> +       /* WMI GUID is not unique, also check for a DMI match */
>> +       if (!dmi_check_system(peaq_dmi_table))
>> +               return -ENODEV;
>> +
>>          if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
>>                  return -ENODEV;
>>
>> @@ -86,6 +101,9 @@ static int __init peaq_wmi_init(void)
>>
>>   static void __exit peaq_wmi_exit(void)
>>   {
>> +       if (!dmi_check_system(peaq_dmi_table))
>> +               return;
>> +
>>          if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
>>                  return;
>>
>> --
>> 2.14.2
>>
> 
> 
> 
