From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] platform: x86: Add ACPI driver for ChromeOS
Date: Tue, 24 Mar 2020 18:16:49 +0100
Message-ID: <20200324171649.GA2522961@kroah.com>
References: <20200322094334.1872663-1-enric.balletbo@collabora.com>
 <20200322111022.GA72939@kroah.com>
 <c480f318-c326-d51c-e757-c65c2526ab4d@collabora.com>
 <20200324164956.GE2518746@kroah.com>
 <3444110c-d6c0-16df-9b5d-12578ed442c5@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3444110c-d6c0-16df-9b5d-12578ed442c5@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel@vger.kernel.org, vbendeb@chromium.org, groeck@chromium.org, bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org, andy@infradead.org, Collabora Kernel ML <kernel@collabora.com>, Ayman Bagabas <ayman.bagabas@gmail.com>, Darren Hart <dvhart@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jeremy Soller <jeremy@system76.com>, Mattias Jacobsson <2pi@mok.nu>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rajat Jain <rajatja@google.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Yauhen Kharuzhy <jekhor@gmail.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 24, 2020 at 06:08:03PM +0100, Enric Balletbo i Serra wrote:
> Hi Greg,
> 
> On 24/3/20 17:49, Greg Kroah-Hartman wrote:
> > On Tue, Mar 24, 2020 at 05:31:10PM +0100, Enric Balletbo i Serra wrote:
> >> Hi Greg,
> >>
> >> Many thanks for your quick answer, some comments below.
> >>
> >> On 22/3/20 12:10, Greg Kroah-Hartman wrote:
> >>> On Sun, Mar 22, 2020 at 10:43:34AM +0100, Enric Balletbo i Serra wrote:
> >>>> This driver attaches to the ChromeOS ACPI device and then exports the values
> >>>> reported by the ACPI in a sysfs directory. The ACPI values are presented in
> >>>> the string form (numbers as decimal values) or binary blobs, and can be
> >>>> accessed as the contents of the appropriate read only files in the sysfs
> >>>> directory tree originating in /sys/devices/platform/chromeos_acpi.
> >>>>
> >>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >>>
> >>> What is wrong with the "default" ACPI sysfs access?  Why do you need a
> >>> special driver just for this specific ACPI firmware?
> >>>
> >>
> >> Please correct me if I am wrong, as I'm not an ACPI expert and I probably have
> >> some ACPI leaks and misunderstandings.
> >>
> >> What is exporting this driver is the attributes for the non-default Chromebook
> >> specific MLST ACPI method. Hence, I assumed we needed a special driver to expose
> >> these values that can't be done using "default" ACPI sysfs. Note that these
> >> attributes are dynamically created and are different between Chromebooks so need
> >> some parsing.
> >>
> >> I didn't find a "standard" way to expose these attributes to userspace, so,
> >> please kindly point me to one if there is one.
> > 
> > Are you sure they aren't already there under /sys/firmware/acpi/?  I
> > thought all tables and methods were exported there with no need to do
> > anything special.
> > 
> 
> That's the first I did when I started to forward port this patch from chromeos
> kernel to mainline.
> 
> On my system I get:
> 
> /sys/firmware/acpi/tables#
> APIC  DSDT  FACP  FACS  HPET  MCFG  SSDT  data  dynamic
> 
> (data and dynamic are empty directories)
> 
> I quickly concluded (maybe wrong) that as there is no a MLST entry it was not
> exported, but maybe one of those already contains the info? Or, should I expect
> a MLST entry here?
> 
> > What makes these attributes "special" from any other ACPI method?
> > 
> 
> I can't answer this question right now. I need to investigate more I guess ;-)

You can always ask the acpi developers as well, you need to get their
review for your driver anyway :)

good luck!

greg k-h
