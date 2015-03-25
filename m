From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH v2 4/4] toshiba_bluetooth: Remove BT enable code from
 *_notify function
Date: Wed, 25 Mar 2015 16:18:19 -0600
Message-ID: <CAGdLNWFMPims1ySYe3eVaHzMJ4pek+dMVieYAM_YALkcq+TD=Q@mail.gmail.com>
References: <1427314757-18232-1-git-send-email-coproscefalo@gmail.com>
	<1427314757-18232-5-git-send-email-coproscefalo@gmail.com>
	<20150325212425.GE19129@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150325212425.GE19129@fury.dvhart.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren,

2015-03-25 15:24 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Wed, Mar 25, 2015 at 02:19:17PM -0600, Azael Avalos wrote:
>> Bug 93911 reported a broken handling of the BT device, causing the
>> driver to get stuck in a loop enabling/disabling the device whenever
>> the device is deactivated by the kill switch as follows:
>>
>> 1. The user activated the kill switch, causing the system to generate
>>    a 0x90 (status change) event and disabling the BT device.
>> 2. The driver catches the event and re-enables the BT device.
>> 3. The system detects the device being activated, but since the kill
>>    switch is activated, disables the BT device (again) and generates
>>    a 0x90 event (again).
>> 4. Repeat from 2.
>>
>> This patch acts according to the BT device status, activating the
>> device only when it is disabled and returning silently if the KS is
>> activated, this way we retain the previous functionality but without
>> affecting the newer devices that trigger the enable/disable loop.
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>>  drivers/platform/x86/toshiba_bluetooth.c | 26 +++++++++++++++++++++++++-
>>  1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
>> index 0343d20..94bec3c 100644
>> --- a/drivers/platform/x86/toshiba_bluetooth.c
>> +++ b/drivers/platform/x86/toshiba_bluetooth.c
>> @@ -2,6 +2,7 @@
>>   * Toshiba Bluetooth Enable Driver
>>   *
>>   * Copyright (C) 2009 Jes Sorensen <Jes.Sorensen@gmail.com>
>> + * Copyright (C) 2015 Azael Avalos <coproscefalo@gmail.com>
>>   *
>>   * Thanks to Matthew Garrett for background info on ACPI innards which
>>   * normal people aren't meant to understand :-)
>> @@ -25,6 +26,10 @@
>>  #include <linux/types.h>
>>  #include <linux/acpi.h>
>>
>> +#define BT_KILLSWITCH_MASK   0x01
>> +#define BT_PLUGGED_MASK              0x40
>> +#define BT_POWER_MASK                0x80
>> +
>>  MODULE_AUTHOR("Jes Sorensen <Jes.Sorensen@gmail.com>");
>>  MODULE_DESCRIPTION("Toshiba Laptop ACPI Bluetooth Enable Driver");
>>  MODULE_LICENSE("GPL");
>> @@ -135,7 +140,26 @@ static int toshiba_bluetooth_disable(acpi_handle handle)
>>
>>  static void toshiba_bt_rfkill_notify(struct acpi_device *device, u32 event)
>>  {
>> -     toshiba_bluetooth_enable(device->handle);
>> +     bool killswitch;
>> +     bool powered;
>> +     bool plugged;
>> +     int status;
>> +
>> +     /* Query the status of the Bluetooth device */
>> +     status = toshiba_bluetooth_status(device->handle);
>> +     if (status < 0)
>> +             return;
>> +
>> +     killswitch = (status & BT_KILLSWITCH_MASK) ? true : false;
>> +     powered = (status & BT_POWER_MASK) ? true : false;
>> +     plugged = (status & BT_PLUGGED_MASK) ? true : false;
>> +
>> +     /* Verify RFKill switch is set to on, if not, we return silently. */
>> +     if (!killswitch)
>> +             return;
>> +     /* Check if the device is not powered or attached and the KS is off */
>> +     if (killswitch && (!powered || !plugged))
>> +             toshiba_bluetooth_enable(device->handle);
>
> The second check for killswitch isn't necessary, or it could be a single
> conditional.

Ok, will remove it, was just added as an extra check.

>
> The difference here from the test in *_enable() is that you ALSO check for
> !powered || !plugged, while *_enable() only tests for killswitch.
>
> This set of tests is thus partially redundant with *_enable().

This second check is added to cover the new and old devices, if we call the
*_enable() function without it, we might end up in the loop as described by
the bug report.

This way we are ensuring to only activate the device whenever its off/detached.

>
> Let's identify how *_enable() is used. There are three cases as I understand it.
> I'll describe them as I understand them, correct me if I get something wrong.
>
> 1) toshiba_bt_rfkill_add()
> 2) toshiba_bt_rfkill_notify()
> 3) toshiba_bt_resume()
>
> This covers the initial scan of the DSDT (and potentially subsequent ones for
> hotplug) via "add", it covers rfkill change events, and resume from suspend.
>
> We apparently don't know when the firmware may handle the AUSB and BTPO by
> itself and when we need to call it explicitly without testing for the rfkill,
> powered, and plugged status explicitly. It seems possible that some systems may
> handle this for us at power on or at resume, just as they do for changes to
> rfkill.

Right, one of my systems (the one I made tests with) handle resume internally,
of course the driver was calling *_enable() but it was doing nothing
since it was
already activated internally.

However, we do need to call *_add() which in turn calls *_enable() otherwise
the device will never be attached/powered at power on, once attached/powered
the system (firmware?) takes care of its status internally.

>
> That suggests to me the checks for rfkill, powered, and plugged states should be
> done in the _enable() function itself, rather than at all the call sites.
>
> So... would a better fix be to push these two additional tests into
> toshiba_bluetooth_enable() before it calls AUSB and BTPO and then retain the
> call the _enable() here?

Sure, I can apply these changes there.

What I wanted was to isolate what each call does as a preparation for
upcoming patches where I will be purging toshiba_acpi from the BT
RFKill code and add it to toshiba_bluetooth (where it belongs).

>
> Thanks,
>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
