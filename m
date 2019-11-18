From: Daniel Drake <drake@endlessm.com>
Subject: Re: [RFC PATCH 2/3] platform/x86: asus_wmi: Support fan boost mode on FX505DY/FX705DY
Date: Mon, 18 Nov 2019 11:23:31 +0800
Message-ID: <CAD8Lp46Sx004FiZm+1Lus_KBafCAvP5tdnRpE+NEkoEMWNz+jg@mail.gmail.com>
References: <CAPW-Pu0KuxqbKSQ2JQaxh5AHbdZdNQZJfOgxoe_XZSxow+9e3A@mail.gmail.com>
 <CAPW-Pu2g3yiD8H5yUhAsCCN0vMzojoQ6QOn+4iOKCzHizE4T4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPW-Pu2g3yiD8H5yUhAsCCN0vMzojoQ6QOn+4iOKCzHizE4T4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Maxx <leonmaxx@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 4, 2019 at 6:55 PM Leon Maxx <leonmaxx@gmail.com> wrote:
>
> On ASUS FX505DY/FX705DY laptops fan boost mode is same as in other
> TUF laptop models but have different ACPI device ID and different key
> code.

In the spec (which is not publically available, sorry), this
0x00120075 device is described as "Throttle thermal policy" which
takes values 0 for default, 1 for overboost, 2 for silent.

I don't know exactly how this differs from "fan boost" but I suggest
mirroring the spec here, offer this as a separate sysfs control named
according to the spec, separate it from fan boost mode.

Thanks,
Daniel
