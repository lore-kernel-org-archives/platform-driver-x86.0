From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: Re: [PATCH 01/11] platform/x86: asus-wmi: Fix hwmon device cleanup
Date: Fri, 12 Apr 2019 19:49:50 +0200
Message-ID: <3e14cbf9-2cb0-1a5d-9c2f-aa9ca014c660@gmail.com>
References: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com>
 <f2822519-c137-560e-fe78-172202e52bfa@gmail.com>
 <CAD8Lp465z=HB5kKZEk7eHd9NVdhSLYhzgiH6Yg45v=j0TCU+SQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD8Lp465z=HB5kKZEk7eHd9NVdhSLYhzgiH6Yg45v=j0TCU+SQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hello Daniel,

thank you for the tip. I did not know about this function. It does indeed
seem to make this complete patch redundant looking at
6e5f62b9e3651e61 hwmon: (lm90) Use devm_hwmon_device_register_with_groups

I will surely implement it this way in the next version.

Best regards,
Yurii

On 11.04.19 10:21, Daniel Drake wrote:
> On Thu, Apr 11, 2019 at 4:21 AM Yurii Pavlovskyi
> <yurii.pavlovskyi@gmail.com> wrote:
>>
>> The asus-wmi driver does not clean up the hwmon device on exit or error.
>> To reproduce the bug, repeat rmmod, insmod to verify that device number
>> /sys/devices/platform/asus-nb-wmi/hwmon/hwmon?? grows every time. Add
>> pointer to the device in module state and call cleanup on error.
> 
> I wonder if this can be fixed more cleanly by using
> devm_hwmon_device_register_with_groups() ?
> 
> Thanks
> Daniel
> 
