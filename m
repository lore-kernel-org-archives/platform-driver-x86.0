From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager
 (IOM) driver
Date: Fri, 28 Aug 2020 12:08:32 +0300
Message-ID: <20200828090832.GB174928@kuha.fi.intel.com>
References: <20200822040508.23510-1-rajmohan.mani@intel.com>
 <20200822040508.23510-2-rajmohan.mani@intel.com>
 <20200828074359.GC942935@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200828074359.GC942935@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rajmohan Mani <rajmohan.mani@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee.jones@linaro.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Jithu Joseph <jithu.joseph@intel.com>, =?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, pmalani@chromium.org, bleung@chromium.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Greg,

On Fri, Aug 28, 2020 at 09:43:59AM +0200, Greg Kroah-Hartman wrote:
> I still find this crazy that a whole separate driver is created just to
> read a single 32bit value.
> 
> Why not put this logic in the driver that wants to read that value?
> That would be much simpler, smaller, and more obvious.

That would mean that we start maintaining something like DMI quirk
table in those drivers. Unfortunately the IOM device is not available
on every platform. Also, even on platforms that do have it, there is
no guarantee that the device is always going to be mapped to the same
address.

Nevertheless, I was originally hoping that we could hide the handling
of IOM somehow in ACPI without the need for an actual device object,
but it now turns out that the other features of the IOM chip have
created interest. At least our i915 guys probable have some use for it
(I don't know exactly what they are planning to use it for).

So the fact that we may later need the device for something else, on
top of the clumsiness and most importantly risks involved with using
ACPI to take care of extra tasks (ASL tends to have bugs - bugs that
may never ever get fixed), I think the IOM device object, and the
driver that binds to it, do have a valid reason for existing.


thanks,

-- 
heikki
