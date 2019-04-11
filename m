From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 01/11] platform/x86: asus-wmi: Fix hwmon device cleanup
Date: Thu, 11 Apr 2019 16:21:28 +0800
Message-ID: <CAD8Lp465z=HB5kKZEk7eHd9NVdhSLYhzgiH6Yg45v=j0TCU+SQ@mail.gmail.com>
References: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com> <f2822519-c137-560e-fe78-172202e52bfa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f2822519-c137-560e-fe78-172202e52bfa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 11, 2019 at 4:21 AM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> The asus-wmi driver does not clean up the hwmon device on exit or error.
> To reproduce the bug, repeat rmmod, insmod to verify that device number
> /sys/devices/platform/asus-nb-wmi/hwmon/hwmon?? grows every time. Add
> pointer to the device in module state and call cleanup on error.

I wonder if this can be fixed more cleanly by using
devm_hwmon_device_register_with_groups() ?

Thanks
Daniel
