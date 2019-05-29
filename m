From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Only Tell EC the OS will handle
 display hotkeys from asus_nb_wmi
Date: Wed, 29 May 2019 10:55:36 +0200
Message-ID: <1026f860-e961-cefe-3695-aaeaa8896597@redhat.com>
References: <20190521062837.3887-1-hdegoede@redhat.com>
 <CAOcMMifdq8PcnwANKxGtAmB+5nNOv-aEW3aFJyfPNngXeYCK5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOcMMifdq8PcnwANKxGtAmB+5nNOv-aEW3aFJyfPNngXeYCK5A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi João,

On 5/28/19 11:22 PM, João Paulo Rechi Vita wrote:
> On Mon, May 20, 2019 at 11:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Commit 78f3ac76d9e5 ("platform/x86: asus-wmi: Tell the EC the OS will
>> handle the display off hotkey") causes the backlight to be permanently off
>> on various EeePC laptop models using the eeepc-wmi driver (Asus EeePC
>> 1015BX, Asus EeePC 1025C).
>>
>> The asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL) call added
>> by that commit is made conditional in this commit and only enabled in
>> the quirk_entry structs in the asus-nb-wmi driver fixing the broken
>> display / backlight on various EeePC laptop models.
>>
>> Cc: João Paulo Rechi Vita <jprvita@endlessm.com>
>> Fixes: 78f3ac76d9e5 ("platform/x86: asus-wmi: Tell the EC the OS will handle the display off hotkey")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/platform/x86/asus-nb-wmi.c | 8 ++++++++
>>   drivers/platform/x86/asus-wmi.c    | 2 +-
>>   drivers/platform/x86/asus-wmi.h    | 1 +
>>   3 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>> index b6f2ff95c3ed..59f3a37a44d7 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -78,10 +78,12 @@ static bool asus_q500a_i8042_filter(unsigned char data, unsigned char str,
>>
>>   static struct quirk_entry quirk_asus_unknown = {
>>          .wapf = 0,
>> +       .wmi_backlight_set_devstate = true,
>>   };
>>
>>   static struct quirk_entry quirk_asus_q500a = {
>>          .i8042_filter = asus_q500a_i8042_filter,
>> +       .wmi_backlight_set_devstate = true,
>>   };
>>
>>   /*
>> @@ -92,26 +94,32 @@ static struct quirk_entry quirk_asus_q500a = {
>>   static struct quirk_entry quirk_asus_x55u = {
>>          .wapf = 4,
>>          .wmi_backlight_power = true,
>> +       .wmi_backlight_set_devstate = true,
>>          .no_display_toggle = true,
>>   };
>>
>>   static struct quirk_entry quirk_asus_wapf4 = {
>>          .wapf = 4,
>> +       .wmi_backlight_set_devstate = true,
>>   };
>>
>>   static struct quirk_entry quirk_asus_x200ca = {
>>          .wapf = 2,
>> +       .wmi_backlight_set_devstate = true,
>>   };
>>
>>   static struct quirk_entry quirk_asus_ux303ub = {
>>          .wmi_backlight_native = true,
>> +       .wmi_backlight_set_devstate = true,
>>   };
>>
>>   static struct quirk_entry quirk_asus_x550lb = {
>> +       .wmi_backlight_set_devstate = true,
>>          .xusb2pr = 0x01D9,
>>   };
>>
>>   static struct quirk_entry quirk_asus_forceals = {
>> +       .wmi_backlight_set_devstate = true,
>>          .wmi_force_als_set = true,
>>   };
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index ee1fa93708ec..a66e99500c12 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -2131,7 +2131,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>>                  err = asus_wmi_backlight_init(asus);
>>                  if (err && err != -ENODEV)
>>                          goto fail_backlight;
>> -       } else
>> +       } else if (asus->driver->quirks->wmi_backlight_set_devstate)
>>                  err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL);
>>
>>          status = wmi_install_notify_handler(asus->driver->event_guid,
>> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
>> index 6c1311f4b04d..57a79bddb286 100644
>> --- a/drivers/platform/x86/asus-wmi.h
>> +++ b/drivers/platform/x86/asus-wmi.h
>> @@ -44,6 +44,7 @@ struct quirk_entry {
>>          bool store_backlight_power;
>>          bool wmi_backlight_power;
>>          bool wmi_backlight_native;
>> +       bool wmi_backlight_set_devstate;
> 
> Wouldn't it be better to add this field to struct asus_wmi_driver
> instead, and set it in asus_nb_wmi_driver only? This way we wouldn't
> need to make sure it is present in all quirk entries from this driver,
> current and future.
> 
> I've tested both the original patch and my suggestion above and in
> both cases the "turn off backlight" hotkey continued to work fine on a
> machine where asus-nb-wmi is used (I don't have access to any machine
> using the eeepc driver).

I deliberately put in the quirks struct so that if necessary we can
enable / disable it easily on a per model (rather then per driver)
case in the future.

Regards,

Hans
