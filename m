From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform: intel_turbo_max_3: make it explicitly
 non-modular
Date: Tue, 21 Feb 2017 10:35:57 -0800
Message-ID: <20170221183557.GA114286@f23x64.localdomain>
References: <20170214003700.8978-1-paul.gortmaker@windriver.com>
 <20170217033712.GA25241@wisp>
 <1487606145.2714.3.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487606145.2714.3.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 20, 2017 at 07:55:45AM -0800, Srinivas Pandruvada wrote:
> On Thu, 2017-02-16 at 19:37 -0800, Darren Hart wrote:
> > On Mon, Feb 13, 2017 at 07:37:00PM -0500, Paul Gortmaker wrote:
> > > The Kconfig currently controlling compilation of this code is:
> > > 
> > > drivers/platform/x86/Kconfig:config INTEL_TURBO_MAX_3
> > > drivers/platform/x86/Kconfig:   bool "Intel Turbo Boost Max
> > > Technology 3.0 enumeration driver"
> > > 
> > > ...meaning that it currently is not being built as a module by
> > > anyone.
> > > 
> > > Lets remove the couple traces of modular infrastructure use, so
> > > that
> > > when reading the driver there is no doubt it is builtin-only.
> > > 
> > > Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> > > 
> > > We also delete the MODULE_LICENSE tag etc. since all that
> > > information
> > > was (or is now) contained at the top of the file in the comments.
> > > 
> > > We do uncover some implicit includes during build coverage that
> > > were hidden behind the module.h which pulls in a lot of dependants.
> > > 
> > 
> > Paul, this all looks so very familiar... have we been through this
> > before? Maybe
> > for another driver...
> > 
> > > Cc: Darren Hart <dvhart@infradead.org>
> > > Cc: Andy Shevchenko <andy@infradead.org>
> > > Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > 
> > Srinivas, any objections?
> This module can be loadable just by adding EXPORT_GPL to two scheduler
> function. I was hoping that someone will require those functions to be
> exported.
> But any way I have no objections in this case as this driver doesn't
> have to be loadable at all.

OK, merged. We can always make it a module if that becomes an option.

-- 
Darren Hart
Intel Open Source Technology Center
