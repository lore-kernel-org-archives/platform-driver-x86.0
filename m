From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH 4/4] toshiba_bluetooth: Remove BT enable code from
 *_notify function
Date: Wed, 25 Mar 2015 13:01:49 -0600
Message-ID: <CAGdLNWFahQ17h4Sa_0WndSzmZaiSzXKBAbsFbpMPRxT-H3-XQw@mail.gmail.com>
References: <1426705979-11880-1-git-send-email-coproscefalo@gmail.com>
	<1426705979-11880-6-git-send-email-coproscefalo@gmail.com>
	<20150325175042.GB19129@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:37710 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092AbbCYTBu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Mar 2015 15:01:50 -0400
In-Reply-To: <20150325175042.GB19129@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Jes.Sorensen@gmail.com, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-03-25 11:50 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Wed, Mar 18, 2015 at 01:12:59PM -0600, Azael Avalos wrote:
>> Bug 93911 reported a broken handling of the BT device, causing the
>> driver to get stuck in a loop enabling/disabling the device whenever
>> the device is deactivated by the kill switch as follows:
>>
>> 1. The user activated the kill switch, causing the system to generate
>>    a 0x90 (status change) event and disabling the BT device.
>> 2. The driver catches the event and re-enables the BT device.
>
> It does? The toshiba_bluetooth_enable() call is supposed to exit silently if
> BTST is not on. Is this check not working on some systems?

Apparently not, I looked at the file and saw the comment block
and the check for the KS status and all seemed fine to me, but somehow,
and as you say, it is not working on some systems.

>
>> 3. The system detects the device being activated, but since the kill
>>    switch is activated, disables the BT device (again) and generates
>>    a 0x90 event (again).
>> 4. Repeat from 2.
>>
>> This patch removes the toshiba_bluetooth_enable call from the
>> toshiba_bluetooth_notify function, as we do not always need to
>> re-activate the device everytime we receive an event, we need to act
>> depending on the status of the BT device.
>>
>> For now, we simply print the event received and the status of the BT
>> device, so we can later add code to handle special circumstances
>> depending on the status of the device.
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>>  drivers/platform/x86/toshiba_bluetooth.c | 20 +++++++++++++++++++-
>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
>> index 0343d20..07edded 100644
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
>> @@ -135,7 +140,20 @@ static int toshiba_bluetooth_disable(acpi_handle handle)
>>
>>  static void toshiba_bt_rfkill_notify(struct acpi_device *device, u32 event)
>>  {
>> -     toshiba_bluetooth_enable(device->handle);
>> +     int status;
>> +
>> +     pr_info("Received event %x\n", event);
>> +
>> +     /* Query the status of the Bluetooth device */
>> +     status = toshiba_bluetooth_status(device->handle);
>> +     if (status < 0)
>> +             return;
>> +
>> +     pr_info("Switch status %x\n", status & BT_KILLSWITCH_MASK);
>> +     pr_info("Power status %x\n", status & BT_POWER_MASK);
>> +     pr_info("Plug status %x\n", status & BT_PLUGGED_MASK);
>
> This seems a bit noisy for the info level as this information seems more aimed
> at a developer working to complete the TODO below... debug seems more
> appropriate.

Ok, will do, or simply remove them depending on comments below.

>
>> +
>> +     /* TODO: Add event handling here depending on Bluetooth status */
>
> Before if the RFKILL was disabled, this would have called
> toshiba_bluetooth_enable() which would have checked BTST, found it on, and
> enabled the device. In addition to killing the call to
> toshiba_bluetooth_enable() when RFKILL is on, this also removes the call when
> it's switched off.

Well, instead of the TODO, I can add checks for these cases, and that way we
have the same functionality as before, without triggering the enable/disable
loop on recent devices.

>
> I think I'm missing a path. Where does enable occur when the user turns the
> radio back on now?

On the systems tested (even one of mine), it is done internally and a 0x90
event gets generated, and its happening for both cases (enable/disable),
the user flips the KS and the BT device gets detached and powered off,
deactivate the KS and the device gets powered and re-attached.

>
>
>>  }
>>
>>  #ifdef CONFIG_PM_SLEEP
>> --
>> 2.2.2
>>
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael



-- 
-- El mundo apesta y vosotros apestais tambien --
