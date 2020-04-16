From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/6] platform/x86: intel_cht_int33fe: clean up series
Date: Thu, 16 Apr 2020 17:17:30 +0300
Message-ID: <20200416141730.GE185537@smile.fi.intel.com>
References: <20200408160905.12101-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200408160905.12101-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Apr 08, 2020 at 07:09:00PM +0300, Andy Shevchenko wrote:
> When I started looking into the intel_cht_int33fe driver for an example of use
> software node API, I have noticed that it's hard to get and code a bit messy.
> Here is a clean up, main part of which is to introduce node groups and API to
> register and unregister them. This and some pre-existing APIs can be used in
> the driver.
> 
> So, because of cross-subsystem nature of this series, I may recommend to create
> myself the immutable branch which can be pulled to Rafael's and Greg's trees
> respectively. I'm also open for other proposals how to proceed.

Greg, Rafael,
any suggestion how to proceed with this series?

(It has been reviewed and tested).

> Andy Shevchenko (6):
>   device property: export set_secondary_fwnode() to modules
>   software node: Allow register and unregister software node groups
>   platform/x86: intel_cht_int33fe: Convert software node array to group
>   platform/x86: intel_cht_int33fe: Convert to use set_secondary_fwnode()
>   platform/x86: intel_cht_int33fe: Switch to use
>     acpi_dev_hid_uid_match()
>   platform/x86: intel_cht_int33fe: Fix spelling issues
> 
>  drivers/base/core.c                           |   1 +
>  drivers/base/swnode.c                         |  48 ++++++++
>  .../platform/x86/intel_cht_int33fe_typec.c    | 106 +++++++++---------
>  include/linux/property.h                      |   3 +
>  4 files changed, 108 insertions(+), 50 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko
