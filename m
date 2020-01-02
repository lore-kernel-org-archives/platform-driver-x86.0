From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 33/37] platform/x86: intel_pmc_ipc: Move under MFD
Date: Thu, 2 Jan 2020 11:50:40 +0200
Message-ID: <20200102095040.GE465886@lahna.fi.intel.com>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
 <20191223141716.13727-34-mika.westerberg@linux.intel.com>
 <20200102094126.GG22390@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200102094126.GG22390@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 02, 2020 at 09:41:26AM +0000, Lee Jones wrote:
> On Mon, 23 Dec 2019, Mika Westerberg wrote:
> 
> > This driver only creates a bunch of platform devices sharing resources
> > belonging to the PMC device. This is pretty much what MFD subsystem is
> > for so move the driver there, renaming it to intel_pmc_bxt.c which
> > should be more clear what it is. We convert the driver to call MFD APIs
> > in subsequent patches.
> 
> Nope.  Not happening.
> 
> It's not appropriate to dump a 1000+ line source file into MFD without
> a thorough review.  For starters, the 100's of lines of code which
> support the bespoke IPC APIs should remain within the 'platform'
> domain.
> 
> It's okay to move the subordinate device registration into MFD, but it
> will need to be converted *whilst* transferring it, rather than the
> dump/edit method currently implemented.

OK, will do so in v2.
