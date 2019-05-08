From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 01/11] platform/x86: asus-wmi: Fix hwmon device cleanup
Date: Wed, 8 May 2019 16:25:49 +0300
Message-ID: <CAHp75VeNSUniQtEmf9z1EGPun_3p1DZ_viXYXiAyDouU0s3uHg@mail.gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com> <a548ce35-5bbc-1c61-2a52-808462000091@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a548ce35-5bbc-1c61-2a52-808462000091@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 19, 2019 at 1:00 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> The driver does not clean up the hwmon device on exit or error. To
> reproduce the bug, repeat rmmod, insmod to verify that device number
> /sys/devices/platform/asus-nb-wmi/hwmon/hwmon?? grows every time. Replace
> call for registering device with devm_* version that unregisters it
> automatically.

>         struct device *hwmon;
>
> -       hwmon = hwmon_device_register_with_groups(&asus->platform_device->dev,
> -                                                 "asus", asus,
> -                                                 hwmon_attribute_groups);
> +       hwmon = devm_hwmon_device_register_with_groups(
> +                       &asus->platform_device->dev, "asus", asus,
> +                       hwmon_attribute_groups);
> +

Temporary variable would help with readability, i.e.

struct device *dev = &asus->platform_device->dev;
...

-- 
With Best Regards,
Andy Shevchenko
