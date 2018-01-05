From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Filter out spurious keyboard
 backlight change events
Date: Fri, 5 Jan 2018 12:11:24 +0100
Message-ID: <82cf6114-8194-8f98-a0ba-5b583d9313d3@redhat.com>
References: <20180104085256.31431-1-hdegoede@redhat.com>
 <CAHp75VftaqUNixkEiSkmWKf_AS3L_pzALTQo7cemVAqz3U3bVA@mail.gmail.com>
 <20180105110724.cjxngyawhzotkkj3@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:45758 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750837AbeAELL2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Jan 2018 06:11:28 -0500
Received: by mail-wm0-f66.google.com with SMTP id 9so1768440wme.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Jan 2018 03:11:27 -0800 (PST)
In-Reply-To: <20180105110724.cjxngyawhzotkkj3@pali>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi,

On 05-01-18 12:07, Pali Rohár wrote:
> On Friday 05 January 2018 12:40:04 Andy Shevchenko wrote:
>> On Thu, Jan 4, 2018 at 10:52 AM, Hans de Goede <hdegoede@redhat.com> wrote:
>>> On some Dell XPS models WMI events of type 0x0000 reporting a keycode of
>>> 0xe00c get reported when the brightness of the LCD panel changes.
>>>
>>> This leads to us reporting false-positive kbd_led change events to
>>> userspace which in turn leads to the kbd backlight OSD showing when it
>>> should not.
>>>
>>> We already read the current keyboard backlight brightness value when
>>> reporting events because the led_classdev_notify_brightness_hw_changed
>>> API requires this. Compare this value to the last known value and filter
>>> out duplicate events, fixing this.
>>>
>>> Note the fixed issue is esp. a problem on XPS models with an ambient light
>>> sensor and automatic brightness adjustments turned on, this causes the kbd
>>> backlight OSD to show all the time there.
>>>
>>
>> Should it have Fixes tag?
>>
>> Pali, any comment on this?
> 
> See comments below. If there are not any problems, add my:
> Acked-by: Pali Rohár <pali.rohar@gmail.com>
> 
>>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1514969
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>   drivers/platform/x86/dell-laptop.c | 24 ++++++++++++++++++++++--
>>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
>>> index cd4725e7e0b5..2ef3297a9efc 100644
>>> --- a/drivers/platform/x86/dell-laptop.c
>>> +++ b/drivers/platform/x86/dell-laptop.c
>>> @@ -1133,6 +1133,7 @@ static u8 kbd_previous_mode_bit;
>>>
>>>   static bool kbd_led_present;
>>>   static DEFINE_MUTEX(kbd_led_mutex);
>>> +static enum led_brightness kbd_led_level;
> 
> Introduction of cached state of brightness level in kernel driver can
> lead to problem as userspace is able to change brightness (via direct
> DELL SMM API) without notice of kernel.
> 
> But now patches for new interaction with DELL SMM via WMI are in kernel
> and there is explicit filter which blocks request for keyboard
> backlight. So hopefully this would not be a problem anymore... (or
> correct me if there still can be).

Right, as discussed previously now that we've kernel support for this
userspace really should not be directly touching this.

>>>   /*
>>>    * NOTE: there are three ways to set the keyboard backlight level.
>>> @@ -1947,6 +1948,7 @@ static enum led_brightness kbd_led_level_get(struct led_classdev *led_cdev)
>>>   static int kbd_led_level_set(struct led_classdev *led_cdev,
>>>                               enum led_brightness value)
>>>   {
>>> +       enum led_brightness new_value = value;
>>>          struct kbd_state state;
>>>          struct kbd_state new_state;
>>>          u16 num;
>>> @@ -1976,6 +1978,9 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
>>>          }
>>>
>>>   out:
>>> +       if (ret == 0)
>>> +               kbd_led_level = new_value;
>>> +
>>>          mutex_unlock(&kbd_led_mutex);
>>>          return ret;
>>>   }
>>> @@ -2003,6 +2008,9 @@ static int __init kbd_led_init(struct device *dev)
>>>                  if (kbd_led.max_brightness)
>>>                          kbd_led.max_brightness--;
>>>          }
>>> +
>>> +       kbd_led_level = kbd_led_level_get(NULL);
> 
> Technically, kbd_led_level_get() is API function for struct led_cdev and
> therefore should take valid kbd_led, NULL there looks suspicious.

Right, but I did not want to pass in a non-registered led_cdev and since
kbd_led_level_get() does not dereference the passed in led_cdev passing
NULL seems the cleanest solution.

> But in
> reality this function itself ignores it first parameter. Probably the
> clean solution would be to have one private function for struct led_cdev
> usage and one which get current level for all other cases. This looks
> ugly too, so if somebody else would not come with better idea, let this
> code as is.

Ack, lets keep this as in, as said it is not perfect but passing NULL
is the cleanest solution.

Regards,

Hans




> 
>>> +
>>>          ret = led_classdev_register(dev, &kbd_led);
>>>          if (ret)
>>>                  kbd_led_present = false;
>>> @@ -2027,13 +2035,25 @@ static void kbd_led_exit(void)
>>>   static int dell_laptop_notifier_call(struct notifier_block *nb,
>>>                                       unsigned long action, void *data)
>>>   {
>>> +       bool changed = false;
>>> +       enum led_brightness new_kbd_led_level;
>>> +
>>>          switch (action) {
>>>          case DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED:
>>>                  if (!kbd_led_present)
>>>                          break;
>>>
>>> -               led_classdev_notify_brightness_hw_changed(&kbd_led,
>>> -                                               kbd_led_level_get(&kbd_led));
>>> +               mutex_lock(&kbd_led_mutex);
>>> +               new_kbd_led_level = kbd_led_level_get(&kbd_led);
>>> +               if (kbd_led_level != new_kbd_led_level) {
>>> +                       kbd_led_level = new_kbd_led_level;
>>> +                       changed = true;
>>> +               }
>>> +               mutex_unlock(&kbd_led_mutex);
>>> +
>>> +               if (changed)
>>> +                       led_classdev_notify_brightness_hw_changed(&kbd_led,
>>> +                                                               kbd_led_level);
>>>                  break;
>>>          }
>>>
>>> --
>>> 2.14.3
>>>
>>
>>
>>
> 
