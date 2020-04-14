From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/6] platform/x86: intel_cht_int33fe: clean up series
Date: Tue, 14 Apr 2020 15:31:07 +0300
Message-ID: <20200414123107.GN34613@smile.fi.intel.com>
References: <20200408160905.12101-1-andriy.shevchenko@linux.intel.com>
 <9aa81292-70c2-c12a-ded1-1164faac0024@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9aa81292-70c2-c12a-ded1-1164faac0024@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Apr 14, 2020 at 02:08:42PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 4/8/20 6:09 PM, Andy Shevchenko wrote:
> > When I started looking into the intel_cht_int33fe driver for an example of use
> > software node API, I have noticed that it's hard to get and code a bit messy.
> > Here is a clean up, main part of which is to introduce node groups and API to
> > register and unregister them. This and some pre-existing APIs can be used in
> > the driver.
> > 
> > So, because of cross-subsystem nature of this series, I may recommend to create
> > myself the immutable branch which can be pulled to Rafael's and Greg's trees
> > respectively. I'm also open for other proposals how to proceed.
> 
> The series looks good to me and I've also tested it on one of
> the devices using the intel_cht_int33fe driver and everything seems
> to work fine, so for the whole series:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>

Thank you, Hans!
I'll wait for Greg and Rafael to conclude how to proceed with it and maybe for
Heikki's response as well.

> > Andy Shevchenko (6):
> >    device property: export set_secondary_fwnode() to modules
> >    software node: Allow register and unregister software node groups
> >    platform/x86: intel_cht_int33fe: Convert software node array to group
> >    platform/x86: intel_cht_int33fe: Convert to use set_secondary_fwnode()
> >    platform/x86: intel_cht_int33fe: Switch to use
> >      acpi_dev_hid_uid_match()
> >    platform/x86: intel_cht_int33fe: Fix spelling issues
> > 
> >   drivers/base/core.c                           |   1 +
> >   drivers/base/swnode.c                         |  48 ++++++++
> >   .../platform/x86/intel_cht_int33fe_typec.c    | 106 +++++++++---------
> >   include/linux/property.h                      |   3 +
> >   4 files changed, 108 insertions(+), 50 deletions(-)

-- 
With Best Regards,
Andy Shevchenko
