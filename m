From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v4] platform: x86: Add ACPI driver for ChromeOS
Date: Sat, 6 Jun 2020 11:04:35 -0700
Message-ID: <20200606180435.GQ89269@dtor-ws>
References: <20200413134611.478441-1-enric.balletbo@collabora.com>
 <CAJZ5v0gWZ27_DwWQadsJOUxLo4a0rAMe45d4AWXS2gHJZfgfKg@mail.gmail.com>
 <a2953d50-da22-279a-f1e4-faa796d815b1@collabora.com>
 <10490419.gsntqH5CaE@kreacher>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10490419.gsntqH5CaE@kreacher>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Len Brown <lenb@kernel.org>, Collabora Kernel ML <kernel@collabora.com>, Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, Dmitry Torokhov <dtor@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, vbendeb@chromium.org, Andy Shevchenko <andy@infradead.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>, Darren Hart <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Jeremy
List-Id: platform-driver-x86.vger.kernel.org

Hi Rafael,

On Fri, Jun 05, 2020 at 01:17:15PM +0200, Rafael J. Wysocki wrote:
> 
> First off, GGL0001 is not a valid ACPI device ID, because the GGL prefix is not
> present in the list at https://uefi.org/acpi_id_list
> 
> There are two ways to address that.  One would be to take the GOOG prefix
> (present in the list above), append a proper unique number (if I were to
> guess, I would say that 0001 had been reserved already) to it and then
> put the resulting device ID into the firmware, to be returned _HID for the
> device in question (you can add a _CID returning "GGL0001" so it can be
> found by the old invalid ID at least from the kernel).

This is not going to happen, as there are devices in the wild with such
firmware (i.e. Samus - Google Pixel 2 - was shipped in 2015). Even if
Google were to release updated firmware (which is quite unlikely), it
does not mean that users who are not using Chrome OS would apply updated
firmware.

> The other one would
> be to properly register the GGL prefix for Google and establish a process for
> allocating IDs with that prefix internally.

I think it depends on whether there are more instances of "GGL" prefix.
I thought we mostly used GOOG for everything.

Thanks.

-- 
Dmitry
