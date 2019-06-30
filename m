From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 10/10] tools/power/x86: A tool to validate Intel Speed
 Select commands
Date: Sun, 30 Jun 2019 10:11:34 -0700
Message-ID: <92900b0ce2333e3d04f197d3b7d3eaaf0b95432f.camel@linux.intel.com>
References: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
         <20190626223851.19138-11-srinivas.pandruvada@linux.intel.com>
         <CAHp75VfMDpKyYnZkZw51dwcEt5neQwGuZUaB7yEFQW6fjRYCqg@mail.gmail.com>
         <1c4238f7d18d316df82d3ba1618fecdcf014f98a.camel@linux.intel.com>
         <CAHp75VfZLjtAKwFWYp32YgPc_Nq6nCGpNwrXYCp-=m38+2r-Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfZLjtAKwFWYp32YgPc_Nq6nCGpNwrXYCp-=m38+2r-Mg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Alan Cox <alan@linux.intel.com>, Len Brown <lenb@kernel.org>, prarit@redhat.com, darcari@redhat.com, Linux Documentation List <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 2019-06-29 at 19:00 +0300, Andy Shevchenko wrote:
> On Sat, Jun 29, 2019 at 5:53 PM Srinivas Pandruvada
> <srinivas.pandruvada@linux.intel.com> wrote:
> > On Sat, 2019-06-29 at 17:31 +0300, Andy Shevchenko wrote:
> > > On Thu, Jun 27, 2019 at 1:39 AM Srinivas Pandruvada
> > > <srinivas.pandruvada@linux.intel.com> wrote:
> > > > +++ b/tools/power/x86/intel_speed_select/Makefile
> > > 
> > > My experience with some tools are not good in order of their
> > > build
> > > process.
> > > Can this one use tools build infrastructure from the day 1?
> > 
> > Can you give some pointers?
> 
> Sure.
> 
> At least simple ones are under tools/gpio, tools/iio, etc.
> 
> You may compare them to see what's different and what's common and
> base Makefile here on that.
> 
> I dunno if there is any tool under tools/power to use that, it might
> give an example of `descend` feature in Makefile.
Sent an update to include this change.

Thanks,
Srinivas

> 
> > > > @@ -0,0 +1,31 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +CC             = $(CROSS_COMPILE)gcc
> > > > +BUILD_OUTPUT   := $(CURDIR)
> > > > +PREFIX         ?= /usr
> > > > +DESTDIR                ?=
> > > > +
> > > > +override CFLAGS += -D__EXPORTED_HEADERS__ -Wall -D_GNU_SOURCE
> > > > +override CFLAGS += -I$(CURDIR)/../../../../include/uapi/
> > > > +override CFLAGS += -I$(CURDIR)/../../../../include/
> > > > +
> > > > +%: %.c
> > > > +       @mkdir -p $(BUILD_OUTPUT)
> > > > +       $(CC) $(CFLAGS) $< -o $(BUILD_OUTPUT)/$@ $(LDFLAGS)
> > > > +
> > > > +DEPS = isst.h
> > > > +OBJ = isst_config.o isst_core.o isst_display.o
> > > > +
> > > > +%.o: %.c $(DEPS)
> > > > +       $(CC) -c -o $(BUILD_OUTPUT)/$@ $< $(CFLAGS)
> > > > +
> > > > +intel-speed-select: $(OBJ)
> > > > +       $(CC) -o $(BUILD_OUTPUT)/$@ $^ $(CFLAGS)
> > > > +
> > > > +.PHONY : clean
> > > > +clean :
> > > > +       @rm -f $(BUILD_OUTPUT)/intel-speed-select
> > > > +       @rm -f $(BUILD_OUTPUT)/*.o
> > > > +
> > > > +install : intel-speed-select
> > > > +       install -d $(DESTDIR)$(PREFIX)/sbin
> > > > +       install $(BUILD_OUTPUT)/intel-speed-select
> > > > $(DESTDIR)$(PREFIX)/sbin/intel-speed-select
> 
> 
