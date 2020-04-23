From: Jithu Joseph <jithu.joseph@intel.com>
Subject: Re: [PATCH 1/1] platform/x86: Add Slim Bootloader firmware update
 signaling driver
Date: Wed, 22 Apr 2020 19:02:42 -0700
Message-ID: <ac04f1aa46234496fc88354add386da725d883ab.camel@intel.com>
References: <20200420194405.8281-1-jithu.joseph@intel.com>
         <20200420194405.8281-2-jithu.joseph@intel.com>
         <CAHp75VeV+HOditUphBkFoy6LLh6QKfBoC-eLixquAHLTwaz4RQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeV+HOditUphBkFoy6LLh6QKfBoC-eLixquAHLTwaz4RQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, maurice.ma@intel.com, ravi.p.rangarajan@intel.com, sean.v.kelley@intel.com, kuo-lang.tseng@intel.com, jithu.joseph@intel.com
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,

Appreciate your valuable feedback. I think I understood most of your
comments but I need clarification regarding the last comment in this
reply.

On Wed, 2020-04-22 at 16:42 +0300, Andy Shevchenko wrote:
> On Mon, Apr 20, 2020 at 10:50 PM Jithu Joseph <jithu.joseph@intel.com
> > wrote:
> > 
> > 
> > This driver only implements a signaling mechanism, the actual
> > firmware
> > update process and various details like firmware update image
> > format,
> > firmware image location etc are defined by SBL [2] and are not in
> > the
> > scope of this driver.
> 
> I have noticed that it misses ABI documentation. So, please add. Also
> some comments below.

I will add one via a new Documentation/ABI/testing/sysfs-platform-sbl-
fwu-wmi file

> 
> ...
> 
> > [1] https://slimbootloader.github.io
> > [2] https://slimbootloader.github.io/security/firmware-update.html
> 
> Can you add a DocLink: tag below for the reference to the official
> documentation?

I wasnt aware of this tag. Will add this.

> 
> ...
> 
> > +SLIM BOOTLOADER (SBL) FIRMWARE UPDATE WMI DRIVER
> > +M:     Jithu Joseph <jithu.joseph@intel.com>
> > +R:     Maurice Ma <maurice.ma@intel.com>
> > +S:     Maintained
> > +W:     
> > https://slimbootloader.github.io/security/firmware-update.html
> > +F:     drivers/platform/x86/sbl_fwu_wmi.c
> 
> I hope you run latest and greatest version of checkpatch.pl and it's
> okay with this section.

Yes it was fine, chekpatch.pl was merely asking to update the
MAINTAINERS file. And the ordering of the section matches with that of
parse-maintainers.pl

> 
> ...
> 
> > @@ -114,6 +114,16 @@ config XIAOMI_WMI
> >           To compile this driver as a module, choose M here: the
> > module will
> >           be called xiaomi-wmi.
> > 
> > +config SBL_FWU_WMI
> > +       tristate "WMI driver for Slim Bootloader firmware update
> > signaling"
> > +       depends on ACPI_WMI
> > +       help
> > +         Say Y here if you want to be able to use the WMI
> > interface to signal
> > +         Slim Bootloader to trigger update on next reboot.
> > +
> > +         To compile this driver as a module, choose M here: the
> > module will
> > +         be called sbl-fwu-wmi.
> > @@ -15,6 +15,7 @@ obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)   += intel-
> > wmi-thunderbolt.o
> >  obj-$(CONFIG_MXM_WMI)                  += mxm-wmi.o
> >  obj-$(CONFIG_PEAQ_WMI)                 += peaq-wmi.o
> >  obj-$(CONFIG_XIAOMI_WMI)               += xiaomi-wmi.o
> > +obj-$(CONFIG_SBL_FWU_WMI)              += sbl_fwu_wmi.o
> 
> I didn't get an ordering schema in above files.
> Shouldn't be rather alphasort?

Looks like there is an ordering within the wmi related files, so I will
move mine in between PEAQ_WMI and XIAOMI_WMI .

> 
> ...
> 
> > +static ssize_t firmware_update_request_store(struct device *dev,
> > +                                            struct
> > device_attribute *attr,
> > +                                            const char *buf,
> > size_t count)
> > +{
> > +       bool val;
> > +       int ret;
> > +
> > +       ret = kstrtobool(buf, &val);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = set_fwu_request(dev, val ? 1 : 0);
> 
> Hmm... If you are going to extend this, why not to pass integer
> directly? (And thus take one from user)

We have also been thinking about  extensibility …

So I will modify the code to allow any u32 input by the user  to be
passed down via wmi_set_block(), though 0 and 1 will be the only
inputs  documented  in the ABI today.( Or did you still mean  to error
out if the user input is something other than 0 or 1 ?)

Thanks
Jithu
