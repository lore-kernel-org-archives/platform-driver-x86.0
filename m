From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [RESEND RFC PATCH 0/5] platform drivers for UP Board
Date: Tue, 13 Sep 2016 12:55:01 +0300
Message-ID: <20160913095501.GM1811@lahna.fi.intel.com>
References: <1465762392-9205-1-git-send-email-dan@emutex.com>
 <1467648434-29080-1-git-send-email-dan@emutex.com>
 <1473759772.11323.265.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473759772.11323.265.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dan O'Donovan <dan@emutex.com>, platform-driver-x86@vger.kernel.org, dvhart@infradead.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 13, 2016 at 12:42:52PM +0300, Andy Shevchenko wrote:
> On Mon, 2016-07-04 at 17:07 +0100, Dan O'Donovan wrote:
> > [Re-sending to a wider audience suggested by Darren Hart]
> > 
> > The UP Board is a new SBC based on the Intel Atom X5-Z8350 "Cherry 
> > Trail" SoC and features a 40-pin I/O pin header and form-factor 
> > inspired by the Raspberry Pi 2.
> > 
> > It utilises a CPLD between the SoC and the external 40-pin header
> > to provide buffered voltage level-shifting of the I/O signals, mux
> > switching and LED control, and programmable pin mapping between the
> > SoC and the external pin header.
> > 
> > The gpio, pinctrl and led drivers provided in this patch series 
> > enable and manage the functions provided by that CPLD.
> > 
> > I have some open questions about this patch series:
> >  * Is it ok to place all of these various UP board drivers together
> >    in drivers/platform/x86/, or would it be preferable to place them
> >    in the respective sub-system directories (gpio, pinctrl, etc.)?
> >    My rationale for keeping them together here is that they are all
> >    specific to this UP Board platform and not expected to be
> >    generally useful on any other platforms (except variants of UP).
> >  * Is it acceptable to include hard-coded references to ACPI device
> >    IDs (representing devices integrated on the SoC devices) for the
> >    purpose of pin map and gpio references? Or is it required to
> >    use only named gpio pins?
> > 
> > Any feedback/suggestions on the questions above, and the patch series
> > in general, would be greatly appreciated!
> 
> Looking closer to this and taking into account what is going on with
> ACPI support for open connected boards I think this patch set is not
> needed at all.
> 
> Basically most (everything?) you are trying to do in C code may and
> should be done in ASL.
> 
> Mika, can you correct me if I'm wrong?

Sounds correct to me.

We have been working on a Yocto layer which allows one to ship your own
peripherals as ACPI ASL fragments which targets all Intel boards which
have ACPI BIOS:

  https://github.com/westeri/meta-acpi

For example adding GPIO leds is just matter of adding:

  ACPI_FRAGMENTS = "leds.asl"
  MACHINE = "minnowboard"

to your Yocto local.conf. The resulting image has these fragments
compiled and included in initrd where the kernel is able to pick them
up.

It is still very much work in progress, though :)
