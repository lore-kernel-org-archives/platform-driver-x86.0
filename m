From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 10/10] tools/power/x86: A tool to validate Intel Speed
 Select commands
Date: Tue, 2 Jul 2019 18:39:29 +0300
Message-ID: <CAHp75VfY+u4L85VncaLYFcoFwa0OzTo__ZKZGboRXmyQ50mCOA@mail.gmail.com>
References: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
 <20190626223851.19138-11-srinivas.pandruvada@linux.intel.com>
 <CAHp75VfMDpKyYnZkZw51dwcEt5neQwGuZUaB7yEFQW6fjRYCqg@mail.gmail.com> <CAJvTdK=S1vPGg9HZjUxJN2aXSfSXBDyYYLawONA0PP_yKvf19A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJvTdK=S1vPGg9HZjUxJN2aXSfSXBDyYYLawONA0PP_yKvf19A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Len Brown <lenb@kernel.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Alan Cox <alan@linux.intel.com>, Prarit Bhargava <prarit@redhat.com>, David Arcari <darcari@redhat.com>, Linux Documentation List <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jul 2, 2019 at 5:42 PM Len Brown <lenb@kernel.org> wrote:
>
> Acked-by: Len Brown <len.brown@intel.com>
>

Thanks!
I hope this is applicable for v2.

> On Sat, Jun 29, 2019 at 10:31 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, Jun 27, 2019 at 1:39 AM Srinivas Pandruvada
> > <srinivas.pandruvada@linux.intel.com> wrote:
> > >
> > > The Intel(R) Speed select technologies contains four features.
> > >
> > > Performance profile:An non architectural mechanism that allows multiple
> > > optimized performance profiles per system via static and/or dynamic
> > > adjustment of core count, workload, Tjmax, and TDP, etc. aka ISS
> > > in the documentation.
> > >
> > > Base Frequency: Enables users to increase guaranteed base frequency on
> > > certain cores (high priority cores) in exchange for lower base frequency
> > > on remaining cores (low priority cores). aka PBF in the documenation.
> > >
> > > Turbo frequency: Enables the ability to set different turbo ratio limits
> > > to cores based on priority. aka FACT in the documentation.
> > >
> > > Core power: An Interface that allows user to define per core/tile
> > > priority.
> > >
> > > There is a multi level help for commands and options. This can be used
> > > to check required arguments for each feature and commands for the
> > > feature.
> > >
> > > To start navigating the features start with
> > >
> > > $sudo intel-speed-select --help
> > >
> > > For help on a specific feature for example
> > > $sudo intel-speed-select perf-profile --help
> > >
> > > To get help for a command for a feature for example
> > > $sudo intel-speed-select perf-profile get-lock-status --help
> > >
> >
> > I need an Ack from tools/power maintainer(s) for this.

-- 
With Best Regards,
Andy Shevchenko
