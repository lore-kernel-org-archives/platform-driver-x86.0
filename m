From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] admin guide/pm: Admin guide for intel-speed-select
Date: Mon, 18 Nov 2019 10:58:31 -0700
Message-ID: <20191118105831.5fd78335@lwn.net>
References: <20191115204925.55181-1-srinivas.pandruvada@linux.intel.com>
        <20191118104105.11776f58@lwn.net>
        <20191118174828.GY32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118174828.GY32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, prarit@redhat.com, rafael.j.wysocki@intel.co, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 18 Nov 2019 19:48:28 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Mon, Nov 18, 2019 at 10:41:05AM -0700, Jonathan Corbet wrote:
> > On Fri, 15 Nov 2019 12:49:25 -0800
> > Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com> wrote:  
> 
> > > Added documentation to configure servers to use Intel(R) Speed
> > > Select Technology using intel-speed-select tool.  
> 
> > > +=========================================================
> > > +Intel® Speed Select Technology (Intel® SST) : User Guide
> > > +=========================================================  
> > 
> > People give me grief when I take docs patches adding non-ascii characters.
> > Adding nearly 100 useless ® symbols seems likely to trigger that sort of
> > unicode aversion.  Can I ask you, please, to take those out?  There are
> > many occurrences of unadorned "Intel" in the kernel, and the world hasn't
> > ended yet.  
> 
> Side comment. It's really strange to hear above in 21st centure. We are living
> in Unicode times. How harm unicode characters nowadays?

In general I agree, and I have little patience for complaints about
non-ascii characters in places where they actually have value. This,
however, is not one of those places.

Thanks,

jon
