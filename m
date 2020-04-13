From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] platform: x86: Add ACPI driver for ChromeOS
Date: Mon, 13 Apr 2020 22:41:51 +0200
Message-ID: <CAJZ5v0gWZ27_DwWQadsJOUxLo4a0rAMe45d4AWXS2gHJZfgfKg@mail.gmail.com>
References: <20200413134611.478441-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200413134611.478441-1-enric.balletbo@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Collabora Kernel ML <kernel@collabora.com>, Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, Dmitry Torokhov <dtor@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, vbendeb@chromium.org, Andy Shevchenko <andy@infradead.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>, Darren Hart <dvhart@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Jeremy Soller <je>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 13, 2020 at 3:46 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> This driver attaches to the ChromeOS ACPI device and then exports the values
> reported by the ACPI in a sysfs directory. These values are not exported
> via the standard ACPI tables, hence a specific driver is needed to do
> it.

So how exactly are they exported?

> The ACPI values are presented in the string form (numbers as decimal
> values) or binary blobs, and can be accessed as the contents of the
> appropriate read only files in the standard ACPI devices sysfs directory tree.

My understanding based on a cursory look at the patch is that there is
an ACPI device with _HID equal to "GGL0001"  and one or more special
methods under it that return values which you want to export over
sysfs as binary attributes.  They appear to be read-only.

I guess that these data are to be consubed by user space?
