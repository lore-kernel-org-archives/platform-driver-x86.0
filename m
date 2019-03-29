From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 1/2] platform/x86: intel_pmc_core: Convert to a
 platform_driver
Date: Fri, 29 Mar 2019 08:53:39 -0700
Message-ID: <0fc21af78c41e49aea452f971b5afe1271a09f3f.camel@linux.intel.com>
References: <20190313222124.229371-1-rajatja@google.com>
         <20190316081752.GA21812@raj-desk2.iind.intel.com>
         <CAA93t1qoQx2B9=KuNpuXL_PvdpgGJPzZk8N-KWqS4XyO8qrS5g@mail.gmail.com>
         <3fc03e60-492a-e9b5-ac9b-caa17f8a8e27@linux.intel.com>
         <CACK8Z6HGEeM_0AnM1eJcUgNPwFz6_wsT8oFAG2rkV4UZczDi3g@mail.gmail.com>
         <c98af2ef-5800-0dee-7b58-3be48f612d07@linux.intel.com>
         <CACK8Z6HQ1QMRygSVgWabO9kUSA3tTL9Uh0Lhw6wv3Vyb4aaFKA@mail.gmail.com>
         <30c3eff209246cc184cbddb0ec60e9acd9dd1d6b.camel@linux.intel.com>
         <CAA93t1p915ofjgzLeW3n+tsKrDWU0wDjf7QXu1fwTao0U-bqLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAA93t1p915ofjgzLeW3n+tsKrDWU0wDjf7QXu1fwTao0U-bqLQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajatxjain@gmail.com
Cc: Rajat Jain <rajatja@google.com>, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Furquan Shaikh <furquan@google.com>, Evan Green <evgreen@google.com>, "Box, David E" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2019-03-28 at 22:29 -0700, Rajat Jain wrote:
> Hi Srinivas,
> 
> 

[...]

> So if everyone here thinks we should completely switch to using
> > > the
> > > ACPI HID "INT33A1" for attaching to the device, sure, we can do
> > > that.
> > > Yes, for Chromeos, we can put in a work around internally that
> > > ensures
> > > that shipping chromebooks (Kabylake etc) can work fine without
> > > that
> > > ACPI ID. What I do not know is if that will cause any regressions
> > > outside of Chromeos. Can you discuss with Rafael, Andy, Srinivas
> > > internally and let me know on how they'd like to proceed on this.
> > > 
> > > The other option is to apply this patch as-is so we know that
> > > there
> > > is
> > > no "functional change" and thus no possible regression (so the
> > > driver
> > > continues to attach to those and only those systems that s it
> > > used
> > > to,
> > > before this patch). And then introduce the ACPI ID Change as a
> > > new
> > > independent patch.
> > 
> > Use INT33A1 to enumerate, if this id doesn't exist then fallback to
> > the
> > cpuid style. The aim should be that we don't have to add any more
> > CPU
> > model to enumerate. But most probably register map will differ so
> > we
> > still may end up adding some CPU model relationship.
> 
> Thanks for the guidance. Just to reconfirm my understanding of your
> suggestion:
> 
> Here is the suggestive code Rajneesh provided, and I intend to do it
> similarly:
> 
> +static const struct acpi_device_id pmc_acpi_ids[] = {
> +             {"INT33A1", 0}, /* _HID for Intel Power Engine, _CID
> PNP0D80*/
> +             { }
> +};
> 
> +static struct platform_driver pmc_plat_driver = {
> +             .remove = pmc_plat_remove,
> +             .probe = pmc_plat_probe,
> +             .driver = {
> +                             .name = "pmc_core_driver",
> +                             .acpi_match_table =
> ACPI_PTR(pmc_acpi_ids),
> +             },
> +};
> 
> My understanding is that with this, the kernel would use
> acpi_match_table to automatically create the platform_device on a
> platform where ACPI tables contain the INT33A1 HID, and thus we don't
> need to create the platform_device in module_init time on such
> platforms.
Yes. There will be /sys/bus/platform/devices/INT33A1:00.


>  So are you saying that during init, I should check if the
> ACPI HID INT33A1 is not present on the platform, then use the cpu_id
> table to create the platform_device? Thus newer platforms will not
> need an entry in the table.
Yes. Preferably in a different file as Andy would like. So the the
current driver only implements platform driver for INT33A1. The other driver which will enumerate on CPUID and create INT33A1 platform device  if there is no ACPI match via acpi_match_device() or similar API, for INT33A1. When you create a platform device the pmc driver will be probed.

Thanks,
Srinivas
