From: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 1/3] platform/x86: thinkpad_acpi: remove unused defines
Date: Mon, 3 Feb 2020 12:04:57 +0200
Message-ID: <20200203100457.GB32742@smile.fi.intel.com>
References: <20200131143650.4149-1-linux@weissschuh.net>
 <20200131143650.4149-2-linux@weissschuh.net>
 <20200203100043.GZ32742@smile.fi.intel.com>
 <20200203100211.GA32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200203100211.GA32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 03, 2020 at 12:02:11PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 03, 2020 at 12:00:43PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 31, 2020 at 03:36:48PM +0100, Thomas Weißschuh wrote:
> > > They were never used.
> > 
> > Thanks for the series.
> > 
> > Unfortunately I may not proceed it since it misses our patchwork [1]
> > for some reason.
> 
> Oh, sorry! It misses our *mailing list* while patchwork is good.

Found your mails in archive (on the Web), so, it seems Google (gmail) doesn't
like them.

It seems no issue on your side. Anyway, I'm waiting for v3 as commented
previously.

> > Besides that, this patch is okay, but the rest two must be:
> >  - unified together to avoid regression in the middle
> >  - done other way around, simple add aliases to *old* ones
> > 
> > Don't forget to update any documentation if needed.
> > 
> > [1]: https://patchwork.kernel.org/project/platform-driver-x86/list/

-- 
With Best Regards,
Andy Shevchenko
