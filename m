From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Thu, 2 Mar 2017 01:16:42 +0200
Message-ID: <CAHp75VeFdkXnvp_zSve4T4JfJz3kK3JBhUyQiPoaNE5XS5NzZw@mail.gmail.com>
References: <20170217184756.15181-1-rrs@debian.org> <1487759058.9334.7.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35911 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753194AbdCAXRA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2017 18:17:00 -0500
In-Reply-To: <1487759058.9334.7.camel@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Feb 22, 2017 at 12:24 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:

> Any further comment on this patch ? Will this be accepted ?
> Please give a N/ACK.

First of all, please do not top post.

> On Sat, 2017-02-18 at 00:17 +0530, Ritesh Raj Sarraf wrote:
>> Lenovo Yoga (many variants: Yoga, Yoga2 Pro, Yoga2 13, Yoga3 Pro, Yoga 3
>> 14 etc) has multiple modles that are a hybrid laptop, working in laptop
>> mode as well as tablet mode.
>>
>> Currently, there is no easy interface to determine the touchpad status,
>> which in case of the Yoga family of machines, can also be useful to
>> assume tablet mode status.
>> Note: The ideapad-laptop driver does not provide a SW_TABLET_MODE either
>>
>> For a detailed discussion  on why we want either of the interfaces,
>> please see:
>> https://bugs.launchpad.net/onboard/+bug/1366421/comments/43
>>
>> This patch adds a sysfs interface for read/write access under:
>> /sys/bus/platform/devices/VPC2004\:00/touchpad_mode

While patch is okay to me per se, I would like to have a formal
acknowledgement from maintainer.

Ike, can you give one?

>> @@ -17,3 +17,11 @@ Description:
>>                       * 2 -> Dust Cleaning
>>                       * 4 -> Efficient Thermal Dissipation Mode
>>
>> +What:                /sys/devices/platform/ideapad/touchpad
>> +Date:                Feb 2017
>> +KernelVersion:       4.11
>> +Contact:     "Ritesh Raj Sarraf <rrs@debian.org>"
>> +Description:
>> +             Control touchpad mode.
>> +                     * 1 -> Switched On
>> +                     * 0 -> Switched Off
>> diff --git a/drivers/platform/x86/ideapad-laptop.c
>> b/drivers/platform/x86/ideapad-laptop.c
>> index f46ece2ce3c4..b35954707e11 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -423,9 +423,43 @@ static ssize_t store_ideapad_fan(struct device *dev,
>>
>>  static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
>>

>> +

Extra empty line.

>> +static ssize_t touchpad_show(struct device *dev,
>> +                             struct device_attribute *attr,
>> +                             char *buf)
>> +{
>> +     struct ideapad_private *priv = dev_get_drvdata(dev);
>> +     unsigned long result;
>> +
>> +     if (read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result))
>> +             return sprintf(buf, "-1\n");
>> +     return sprintf(buf, "%lu\n", result);
>> +}
>> +
>> +static ssize_t touchpad_store(struct device *dev,
>> +                              struct device_attribute *attr,
>> +                              const char *buf, size_t count)
>> +{
>> +     struct ideapad_private *priv = dev_get_drvdata(dev);

>> +     int ret;
>> +     bool state;

Reverse tree order.

>> +
>> +     ret = kstrtobool(buf, &state);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
>> +     if (ret < 0)
>> +             return -EIO;
>> +     return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(touchpad);
>> +
>>  static struct attribute *ideapad_attributes[] = {
>>       &dev_attr_camera_power.attr,
>>       &dev_attr_fan_mode.attr,
>> +     &dev_attr_touchpad.attr,
>>       NULL
>>  };


-- 
With Best Regards,
Andy Shevchenko
