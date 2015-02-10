From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH resend 2/6] toshiba_acpi: Add fan entry to sysfs
Date: Mon, 9 Feb 2015 21:25:03 -0700
Message-ID: <CAGdLNWH=Sf1B_Pn-x7o_VDkVR73noRWQziM_gFbvo4mmP0r_4Q@mail.gmail.com>
References: <1423539294-2941-1-git-send-email-coproscefalo@gmail.com>
	<1423539294-2941-3-git-send-email-coproscefalo@gmail.com>
	<20150210040235.GA37927@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:65380 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751126AbbBJEZF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Feb 2015 23:25:05 -0500
In-Reply-To: <20150210040235.GA37927@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-02-09 21:02 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> On Mon, Feb 09, 2015 at 08:34:50PM -0700, Azael Avalos wrote:
>> This patch adds a fan entry to sysfs, enabling the user to get and
>> set the fan status.
>>
>
> Hi Azael,
>
> I was finally getting around to these when you resent them. Apologies for the
> delay. Travel and still fighting a cold/flu/bug. Sigh. Anyway... on to patch
> review :-)

Sorry for the rushing of the patches, hope you're better now, in case you're
still in recovery, take my motto "la cerveza cura todo" into account XD

>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>>  drivers/platform/x86/toshiba_acpi.c | 51 ++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 50 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> index 334b65e..413af60 100644
>> --- a/drivers/platform/x86/toshiba_acpi.c
>> +++ b/drivers/platform/x86/toshiba_acpi.c
>> @@ -1516,6 +1516,11 @@ static const struct backlight_ops toshiba_backlight_data = {
>>   */
>>  static ssize_t toshiba_version_show(struct device *dev,
>>                                   struct device_attribute *attr, char *buf);
>> +static ssize_t toshiba_fan_store(struct device *dev,
>> +                              struct device_attribute *attr,
>> +                              const char *buf, size_t count);
>> +static ssize_t toshiba_fan_show(struct device *dev,
>> +                             struct device_attribute *attr, char *buf);
>>  static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
>>                                        struct device_attribute *attr,
>>                                        const char *buf, size_t count);
>> @@ -1569,6 +1574,8 @@ static ssize_t toshiba_usb_sleep_music_store(struct device *dev,
>>                                            const char *buf, size_t count);
>>
>>  static DEVICE_ATTR(version, S_IRUGO, toshiba_version_show, NULL);
>> +static DEVICE_ATTR(fan, S_IRUGO | S_IWUSR,
>> +                toshiba_fan_show, toshiba_fan_store);
>>  static DEVICE_ATTR(kbd_backlight_mode, S_IRUGO | S_IWUSR,
>>                  toshiba_kbd_bl_mode_show, toshiba_kbd_bl_mode_store);
>>  static DEVICE_ATTR(kbd_type, S_IRUGO, toshiba_kbd_type_show, NULL);
>
> At some point, before we add too much more, it would be nice to convert these
> over to DEVICE_ATTR_RW and DEVICE_ATTR_RO. Any reason not to do this sooner
> rather than later?

I have patches ready for all the functions in sysfs regarding this change,
I just wanted the patches to land in you tree (or next) to send them for 3.21,
I'll be in janitor mode after these patches, cleaning the driver according to
coding style, add files to Documentation/ABI, etc..

>
>> @@ -1594,6 +1601,7 @@ static DEVICE_ATTR(usb_sleep_music, S_IRUGO | S_IWUSR,
>>
>>  static struct attribute *toshiba_attributes[] = {
>>       &dev_attr_version.attr,
>> +     &dev_attr_fan.attr,
>>       &dev_attr_kbd_backlight_mode.attr,
>>       &dev_attr_kbd_type.attr,
>>       &dev_attr_available_kbd_modes.attr,
>> @@ -1621,6 +1629,45 @@ static ssize_t toshiba_version_show(struct device *dev,
>>       return sprintf(buf, "%s\n", TOSHIBA_ACPI_VERSION);
>>  }
>>
>> +static ssize_t toshiba_fan_store(struct device *dev,
>> +                              struct device_attribute *attr,
>> +                              const char *buf, size_t count)
>> +{
>> +     struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
>> +     u32 result;
>> +     int state;
>> +     int ret;
>> +
>> +     ret = kstrtoint(buf, 0, &state);
>> +     if (ret)
>> +             return ret;
>> +
>> +     if (state != 0 && state != 1)
>> +             return -EINVAL;
>> +
>> +     result = hci_write1(toshiba, HCI_FAN, state);
>> +     if (result == TOS_FAILURE)
>> +             return -EIO;
>> +     else if (result == TOS_NOT_SUPPORTED)
>> +             return -ENODEV;
>> +
>
> A quick scan of hci_write1 makes me wonder if there are more than two possible
> failures. Should we also have an "else if (result)" or "else if (result !=
> WHATEVER_SUCCESS_IS)" before we assume success and return count?

Can't really tell you, I just ported the code "as-is" from the procfs files,
and to be honest, I haven't seen this function in any recent Toshiba
laptop out there,
I just wanted to port this in case some old laptop/app/script/etc. is
still using this.

>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
