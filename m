From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 0/7] x86/intel_pmc_core: Add Tiger Lake, Elkhart Lake
Date: Mon, 18 Nov 2019 20:23:46 +0200
Message-ID: <20191118182346.GB32742@smile.fi.intel.com>
References: <cover.1573750525.git.gayatri.kammela@intel.com>
 <CAHp75Vfrd-BAZ7H_LuQfz32yaap1X3gEnqZ2-9EPQ+j_b0f93g@mail.gmail.com>
 <MN2PR11MB3711EDFC967C295689E109DEF24D0@MN2PR11MB3711.namprd11.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <MN2PR11MB3711EDFC967C295689E109DEF24D0@MN2PR11MB3711.namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kammela, Gayatri" <gayatri.kammela@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "Somayaji, Vishwanath" <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, Peter Zijlstra <peterz@infradead.org>, "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>, "Liang, Kan" <kan.liang@intel.com>, "Box, David E" <david.e.box@intel.com>, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@intel.com>, "Luck, Tony" <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 18, 2019 at 06:11:16PM +0000, Kammela, Gayatri wrote:
> > > All the information regarding the PCH IPs and names of IPs will be
> > > available in Intel's Platform Controller Hub (PCH) External Design
> > > Specification (EDS) document expected to be released in 2020 before
> > > product launch.
> > 
> > Thanks, though you forgot to fix all prefixes in the mails. We have
> > platform/x86: $DRIVER_NAME: ...
> > 
> Hi Andy! Sorry I think I misunderstood your comment last time. Just to make sure, the prefix should the pattern in this case
> "platform/x86: intel_pmc_core: " and should be same for all the patches in the series right?

I didn't deeply check myself, but sounds right.

> > Also consider Mario's comment (I didn't hear back from you on it).
> Sorry about that. I am planning on sending it a single patch excluding it from the series since we received a request from Dell. Please let me know if you think this patch should be included in the series. 

I think we keep good relationship with Dell.

-- 
With Best Regards,
Andy Shevchenko
