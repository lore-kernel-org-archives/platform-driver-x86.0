From: Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH] platform/x86: Add Driver to set up lid GPEs on MS Surface
 device
Date: Sat, 12 Sep 2020 00:46:30 +0200
Message-ID: <e6125bee-d42e-f485-295a-8b9ad6777d4a@gmail.com>
References: <20200908171934.1661509-1-luzmaximilian@gmail.com>
 <20200911221053.GF103884@mtg-dev.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200911221053.GF103884@mtg-dev.jf.intel.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: mgross@linux.intel.com
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 9/12/20 12:10 AM, mark gross wrote:
> Surface devices are tablets with detachable keyboards.  they don't really
> have a "lid" as the tablet is the "lid".

The Surface Laptop series doesn't have a detachable keyboard, yet still
requires this. Arguably, the Surface Books are also more laptop than
tablet (at least that's the way I use mine...). Finally, on the actual
tablets (Surface Pro series) the lid switch detects when the keyboard
cover is opened (or at least that's what I have been told, I don't
own/have access to a Pro series device).

Regardless of that, this patch is intended to provide the same behavior
as found on Windows, for all devices included in this patch, which is:
When you open the lid, or in case of the Pro series fold away the
keyboard cover, the device wakes from suspend/s2idle. Without this
patch, that doesn't work.

> I'm just questioning if the creator of the device designed it the way they did
> maybe we should think twice about doing this.

As far as I can tell, the intended behavior is to wake the device when
the lid is opened, which on the Laptops and Books is a more conventional
lid and on the Pros constitutes opening the cover.

I'm open for any alternative though.

Also please note that I've already sent a v2 of this patch with Andy's
comments addressed: https://lore.kernel.org/patchwork/patch/1303997/

--
Regards,
Max
