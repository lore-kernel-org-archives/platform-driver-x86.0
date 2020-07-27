From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] isst: isst_if.h: drop a duplicated word
Date: Mon, 27 Jul 2020 13:27:34 +0300
Message-ID: <CAHp75VeugozEiOMg1VeWegrP1m0VU5xKfxEj6gJPQbnuYh5zCw@mail.gmail.com>
References: <20200719002903.20469-1-rdunlap@infradead.org> <c76c51bfa78316caaf8201a63ac200fa373ae3ae.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c76c51bfa78316caaf8201a63ac200fa373ae3ae.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jul 21, 2020 at 6:10 PM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> On Sat, 2020-07-18 at 17:29 -0700, Randy Dunlap wrote:
> > Drop the repeated word "for" in a comment.
> >
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > Cc: platform-driver-x86@vger.kernel.org
> > Cc: Darren Hart <dvhart@infradead.org>
> > Cc: Andy Shevchenko <andy@infradead.org>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>

Pushed to my review and testing queue, thanks!

> > ---
> > This description could still use some better wording.
>
> I will fix the wording in a follow up patch.
>
> >  include/uapi/linux/isst_if.h |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > --- linux-next-20200717.orig/include/uapi/linux/isst_if.h
> > +++ linux-next-20200717/include/uapi/linux/isst_if.h
> > @@ -69,7 +69,7 @@ struct isst_if_cpu_maps {
> >   * @logical_cpu:     Logical CPU number to get target PCI device.
> >   * @reg:             PUNIT register offset
> >   * @value:           For write operation value to write and for
> > - *                   for read placeholder read value
> > + *                   read placeholder read value
> >   *
> >   * Structure to specify read/write data to PUNIT registers.
> >   */
>


-- 
With Best Regards,
Andy Shevchenko
