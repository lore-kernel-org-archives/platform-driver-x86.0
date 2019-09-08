From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v7] platform/x86: intel_pmc_core: Attach using APCI HID "INT33A1"
Date: Sun, 8 Sep 2019 13:06:47 -0700
Message-ID: <CACK8Z6F5wjT0CE2ftjaB0_zEhK+P8UTSmzmzWZS3LD1688kgRw@mail.gmail.com>
References: <CAHp75Ver=TNKxh8rdJs1xQYSLNsRLfEoFtcGG6hViug=cF6s_g@mail.gmail.com>
 <20190628033413.8058-1-rajatja@google.com> <CACK8Z6GYwPhz-+7zxxe-aG673Tbin=GYUvVZyL9cTgjqk_EXqA@mail.gmail.com>
 <CAHp75VdPY83U5dWJbca_ZCJwT6z8L+V4R+fY0aZTOkM=vNweYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdPY83U5dWJbca_ZCJwT6z8L+V4R+fY0aZTOkM=vNweYQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rafael J Wysocki <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Furquan Shaikh <furquan@google.com>, Evan Green <evgreen@google.com>, Rajat Jain <rajatxjain@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 7, 2019 at 10:42 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Aug 23, 2019 at 1:44 AM Rajat Jain <rajatja@google.com> wrote:
> >
> > On Thu, Jun 27, 2019 at 8:34 PM Rajat Jain <rajatja@google.com> wrote:
> > >
> > > Most modern platforms already have the ACPI device "INT33A1" that could
> > > be used to attach to the driver. Switch the driver to using that and
> > > thus make the intel_pmc_core.c a pure platform_driver.
> > >
> > > Some of the legacy platforms though, may still not have this ACPI device
> > > in their ACPI tables. Thus for such platforms, move the code to manually
> > > instantiate a platform_device into a new file of its own. This would
> > > instantiate the intel_pmc_core platform device and thus attach to
> > > the driver, if the ACPI device for the same ("INT33A1") is not present
> > > in a system where it should be. This was discussed here:
> > > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1966991.html
> >
> >
> > HI Andy, Rajneesh, this seems to have fallen through the cracks. Any
> > comments here on this patch?
>
> % git tag --list v5.3* --contains b02f6a2ef0a1
> v5.3-rc1

Oops, my apologies, I failed to notice it.

Thanks,

Rajat
>
> --
> With Best Regards,
> Andy Shevchenko
