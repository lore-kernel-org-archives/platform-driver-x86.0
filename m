From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/2] platform: x86: ChromeOS ACPI
Date: Mon, 31 Jul 2017 08:17:18 -0700
Message-ID: <CAOesGMhUKLiu6VwfAhUFdoa-XXjSK1Tr_TahS+4vnfAnoLJ-UA@mail.gmail.com>
References: <20170731130318.22976-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170731130318.22976-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Benson Leung <bleung@chromium.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, vbendeb@chromium.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On Mon, Jul 31, 2017 at 6:03 AM, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
> Dear all,
>
> The following series adds a ChromeOS ACPI device and export some values
> reported by the ACPI in a sysfs directory. The patches comes from the
> ChromeOS kernel and were originally created by Olof Johansson. These
> are just a squashed version with few modifications.

It might have received my authorship through rebases or moving the
code, but it was originally implemented by Vadim Bendebury, cc:d here
-- not by me.

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/7dcefe33416d29c524b331ebcf696a8962fbc3cb

> One doubt that I have is that I'm not sure if the chromeos_acpi driver
> should reside in drivers/platform/x86/ or in drivers/platform/chrome.
> Any preference on this?

I have no preference, but original intent of drivers/platform/chrome
was to not organize it by architecture and have both x86 and ARM
there. Whether that still makes sense I'll leave up to current
maintainers.

Also, I see you refreshed copyright dates to 2017 on all contents,
instead of using at least the original and current year. Seems a
little odd to me -- the code clearly isn't all new and written this
year.


-Olof
