From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update for Intel Speed Select Technology
Date: Wed, 3 Jul 2019 15:34:41 +0300
Message-ID: <CAHp75VcALNWX-WsfvBt9Q4aE_6AzF=6WV9PUpdnszugi4z+nzw@mail.gmail.com>
References: <20190703015331.5449-1-srinivas.pandruvada@linux.intel.com> <1893254.mYh7M8VbD2@kreacher>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1893254.mYh7M8VbD2@kreacher>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Corbet <corbet@lwn.net>, Alan Cox <alan@linux.intel.com>, Len Brown <lenb@kernel.org>, Prarit Bhargava <prarit@redhat.com>, David Arcari <darcari@redhat.com>, Linux Documentation List <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 3, 2019 at 2:59 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> On Wednesday, July 3, 2019 3:53:31 AM CEST Srinivas Pandruvada wrote:
> > Added myself as the maintainer.
> >
> > Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>

Pushed along with the driver, thanks!

> > ---
> >  MAINTAINERS | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5cfbea4ce575..b6ed7958372d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8101,6 +8101,14 @@ S:     Supported
> >  F:   drivers/infiniband/hw/i40iw/
> >  F:   include/uapi/rdma/i40iw-abi.h
> >
> > +INTEL SPEED SELECT TECHNOLOGY
> > +M:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > +L:   platform-driver-x86@vger.kernel.org
> > +S:   Maintained
> > +F:   drivers/platform/x86/intel_speed_select_if/
> > +F:   tools/power/x86/intel-speed-select/
> > +F:   include/uapi/linux/isst_if.h
> > +
> >  INTEL TELEMETRY DRIVER
> >  M:   Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> >  M:   "David E. Box" <david.e.box@linux.intel.com>
> >
>
>
>
>


-- 
With Best Regards,
Andy Shevchenko
