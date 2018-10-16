From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V3] MAINTAINERS: intel_telemetry: Update maintainers info
Date: Tue, 16 Oct 2018 18:51:51 +0300
Message-ID: <CAHp75VcPiyU+NKnzEdqSye2Eat8RtxNyFbUKZ3DGdXinF5A=eg@mail.gmail.com>
References: <262d8a05cedc76bc90fa5be7d3b92d5faa2b4ce9.camel@perches.com>
 <20181012162816.14396-1-david.e.box@intel.com> <6fd036103f87d52214694ac0a172527a113c07b5.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6fd036103f87d52214694ac0a172527a113c07b5.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: "Box, David E" <david.e.box@intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rajneesh.bhardwaj@linux.intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Oct 12, 2018 at 7:46 PM Joe Perches <joe@perches.com> wrote:
>
> On Fri, 2018-10-12 at 09:28 -0700, David E. Box wrote:
> > Remove Souvik who has left this role. Add Rajneesh and David who work
> > jointly on telemetry updates for new platforms.
> >
> > Signed-off-by: David E. Box <david.e.box@intel.com>
> > Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> []
> > diff --git a/MAINTAINERS b/MAINTAINERS
> []
> > @@ -7355,7 +7355,8 @@ F:      arch/x86/crypto/sha*-mb
> >  F:   crypto/mcryptd.c
> >
> >  INTEL TELEMETRY DRIVER
> > -M:   Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
> > +M:   Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> > +M:   "David E. Box" <david.e.box@linux.intel.com>
> >  L:   platform-driver-x86@vger.kernel.org
> >  S:   Maintained
>
>         S: Status, one of the following:
>            Supported:   Someone is actually paid to look after this.
>            Maintained:  Someone actually looks after it.
>
> Perhaps this is driver status should be marked
>
>         "S:     Supported"
>
> >  F:   arch/x86/include/asm/intel_telemetry.h

Thanks, Joe.
I may fix it when applying.

-- 
With Best Regards,
Andy Shevchenko
