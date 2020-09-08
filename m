From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 0/4] Add 4 new keycodes and use them for 4 new hotkeys
 on new Lenovo Thinkpads
Date: Tue, 8 Sep 2020 16:39:50 -0700
Message-ID: <20200908233950.GC1665100@dtor-ws>
References: <20200908135147.4044-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200908135147.4044-1-hdegoede@redhat.com>
Sender: linux-input-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, linux-input@vger.kernel.org, Mark Pearson <mpearson@lenovo.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi Hans,

On Tue, Sep 08, 2020 at 03:51:43PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is a v2 of my series to get a couple of new hotkeys, and matching
> thinkpad_acpi hkey event codes seen on the last 2 generations of
> Thinkpads supported.
> 
> New in this version that Lenovo got back to me and explained that the 0x1316
> hkey event belongs to Fn + right Shift, so that is mapped now too.
> 
> Since these make both include/uapi/linux/input-event-codes.h and
> drivers/platform/x86 changes one open question with this series is how to
> merge it.
> 
> Dmitry, for v1 of this series you suggested you could merge them all
> through the input tree ? Andy, one of the drivers/platform/x86 maintainers
> gave his Acked-by for this:
> 
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

I queued up the series, thank you.

-- 
Dmitry
