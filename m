From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH 1/3] toshiba_acpi: Add Hotkey Event Type function and definitions
Date: Fri, 6 Mar 2015 11:42:50 -0700
Message-ID: <CAGdLNWE5RoFJG19k514jphgcF=-=36es98kwHrNPa9Ex5v0j1A@mail.gmail.com>
References: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
	<1424973434-3032-2-git-send-email-coproscefalo@gmail.com>
	<20150306182102.GG19001@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:40543 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751828AbbCFSmw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Mar 2015 13:42:52 -0500
In-Reply-To: <20150306182102.GG19001@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-03-06 11:21 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> On Thu, Feb 26, 2015 at 10:57:12AM -0700, Azael Avalos wrote:
>
> Hi Azael,
>
> I'm pretty behind on this one, apologies.
>

No wories, we still have plenty of time for 4.1 ;-)
I simply wanted to send these early to get as much tests as possible.

>> This patch adds support to query the "Hotkey Event Type" the system
>> supports.
>>
>> There are two main event types (so far), 0x10 and 0x11, with the
>> first beign all those laptops that have the old keyboard layout, and
>
> being
>
>> the latter all those new laptops with the new keyboard layout.
>>
>
> Some concern about this binary "new" and "old". What happens in 2 years when
> they decide to break^W change our keyboards again?

Well, a new key mapping will need to be added, and hopefully
a new value (other than 0x10 and 0x11) to identify the "newer"
layout, only time will tell.

>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>>  drivers/platform/x86/toshiba_acpi.c | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> index dbcb7a8..e6aa8f9 100644
>> --- a/drivers/platform/x86/toshiba_acpi.c
>> +++ b/drivers/platform/x86/toshiba_acpi.c
>> @@ -116,6 +116,7 @@ MODULE_LICENSE("GPL");
>>  #define HCI_KBD_ILLUMINATION         0x0095
>>  #define HCI_ECO_MODE                 0x0097
>>  #define HCI_ACCELEROMETER2           0x00a6
>> +#define HCI_HOTKEY_EVENT_TYPE                0xc000
>>  #define SCI_PANEL_POWER_ON           0x010d
>>  #define SCI_ILLUMINATION             0x014e
>>  #define SCI_USB_SLEEP_CHARGE         0x0150
>> @@ -127,8 +128,11 @@ MODULE_LICENSE("GPL");
>>
>>  /* field definitions */
>>  #define HCI_ACCEL_MASK                       0x7fff
>> +#define HCI_HOTKEY_EVENT_NORMAL              0x10
>> +#define HCI_HOTKEY_EVENT_SPECIAL     0x11
>
> NORMAL and SPECIAL? Hrm... what comes after special? EXTRASPECIAL? ;-)

Hehe, well, those can be changed to something like
HCI_HOTKEY_EVENT_TYPE{1, 2}
I just named them after the "special events" feature, as the value
returned from HCI_HOTKEY_EVENT_TYPE is related to.

>
> Or am I not looking at this right? Is there reason to expect these two to be
> sufficient?

We can use the SCI_KBD_FUNCTION_KEYS too, all newer laptops
that now come with the new layout support this feature.
I can test for its presence and also for the value returned by
HCI_HOTKEY_EVENT_TYPE.

>
>>  #define HCI_HOTKEY_DISABLE           0x0b
>>  #define HCI_HOTKEY_ENABLE            0x09
>> +#define HCI_HOTKEY_ENABLE_SPECIAL    0x10
>>  #define HCI_LCD_BRIGHTNESS_BITS              3
>>  #define HCI_LCD_BRIGHTNESS_SHIFT     (16-HCI_LCD_BRIGHTNESS_BITS)
>>  #define HCI_LCD_BRIGHTNESS_LEVELS    (1 << HCI_LCD_BRIGHTNESS_BITS)
>> @@ -1149,6 +1153,28 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
>>       return 0;
>>  }
>>
>> +/* Hotkey event type */
>> +static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
>> +                                      u32 *hotkey_event_type)
>> +{
>> +     u32 val1 = 0x03;
>> +     u32 val2 = 0;
>> +     u32 result;
>> +
>> +     result = hci_read2(dev, HCI_HOTKEY_EVENT_TYPE, &val1, &val2);
>> +     if (result == TOS_FAILURE) {
>> +             pr_err("ACPI callto get Hotkey Event type failed\n");
>
> call to
>

Caught this one after I sent the patches :-P

> Thanks,
>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
