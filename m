From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 1/2] platform/x86: asus-wmi: Call led hw_changed API on
 kbd brightness change
Date: Mon, 2 Jul 2018 15:10:00 +0300
Message-ID: <CAHp75VcvaJVuM=TL2AJaC=y5B9GRVbXO0DczfHWs+i03OJRXcw@mail.gmail.com>
References: <20180620144645.2084-1-chiu@endlessm.com> <CAB4CAwdCixoGj9t=1Nvcc52kAjmcMWobKt11pRa0vNyLdeA_rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAB4CAwdCixoGj9t=1Nvcc52kAjmcMWobKt11pRa0vNyLdeA_rg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Hans de Goede <hdegoede@redhat.com>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 27, 2018 at 1:27 PM, Chris Chiu <chiu@endlessm.com> wrote:
> On Wed, Jun 20, 2018 at 10:46 PM, Chris Chiu <chiu@endlessm.com> wrote:
>> Make asus-wmi notify on hotkey kbd brightness changes, listen for
>> brightness events and update the brightness directly in the driver.
>> Create new do_kbd_led_set function for in-driver update, and leave
>> kbd_led_set for original led_classdev call path.
>>
>> Update the brightness by led_classdev_notify_brightness_hw_changed.
>> This will allow userspace to monitor (poll) for brightness changes
>> on the LED without reporting via input keymapping.

LGTM, I'm about to push it to my review and testing queue, so, we will
have 1 day or so time to gather objections if any.
Thanks!

>>
>> Signed-off-by: Chris Chiu <chiu@endlessm.com>
>> ---
>>  drivers/platform/x86/asus-wmi.c | 26 ++++++++++++++++++++++----
>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 1f6e68f0b646..f2b9037f6ded 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -460,6 +460,7 @@ static void kbd_led_update(struct work_struct *work)
>>                 ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
>>
>>         asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param, NULL);
>> +       led_classdev_notify_brightness_hw_changed(&asus->kbd_led, asus->kbd_led_wk);
>>  }
>>
>>  static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
>> @@ -490,15 +491,16 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
>>         return retval;
>>  }
>>
>> -static void kbd_led_set(struct led_classdev *led_cdev,
>> -                       enum led_brightness value)
>> +static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>>  {
>>         struct asus_wmi *asus;
>> +       int max_level;
>>
>>         asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>> +       max_level = asus->kbd_led.max_brightness;
>>
>> -       if (value > asus->kbd_led.max_brightness)
>> -               value = asus->kbd_led.max_brightness;
>> +       if (value > max_level)
>> +               value = max_level;
>>         else if (value < 0)
>>                 value = 0;
>>
>> @@ -506,6 +508,12 @@ static void kbd_led_set(struct led_classdev *led_cdev,
>>         queue_work(asus->led_workqueue, &asus->kbd_led_work);
>>  }
>>
>> +static void kbd_led_set(struct led_classdev *led_cdev,
>> +                       enum led_brightness value)
>> +{
>> +       do_kbd_led_set(led_cdev, value);
>> +}
>> +
>>  static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>>  {
>>         struct asus_wmi *asus;
>> @@ -656,6 +664,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>>
>>                 asus->kbd_led_wk = led_val;
>>                 asus->kbd_led.name = "asus::kbd_backlight";
>> +               asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
>>                 asus->kbd_led.brightness_set = kbd_led_set;
>>                 asus->kbd_led.brightness_get = kbd_led_get;
>>                 asus->kbd_led.max_brightness = 3;
>> @@ -1745,6 +1754,15 @@ static void asus_wmi_notify(u32 value, void *context)
>>                 }
>>         }
>>
>> +       if (code == NOTIFY_KBD_BRTUP) {
>> +               do_kbd_led_set(&asus->kbd_led, asus->kbd_led_wk + 1);
>> +               goto exit;
>> +       }
>> +       if (code == NOTIFY_KBD_BRTDWN) {
>> +               do_kbd_led_set(&asus->kbd_led, asus->kbd_led_wk - 1);
>> +               goto exit;
>> +       }
>> +
>>         if (is_display_toggle(code) &&
>>             asus->driver->quirks->no_display_toggle)
>>                 goto exit;
>> --
>> 2.11.0
>>
>
> Gentle ping. Any comment for the v3 patch?
>
> Chris



-- 
With Best Regards,
Andy Shevchenko
