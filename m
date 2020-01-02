From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 26/37] mfd: intel_soc_pmic: Add SCU IPC member to struct
 intel_soc_pmic
Date: Thu, 2 Jan 2020 11:45:29 +0200
Message-ID: <20200102094529.GC465886@lahna.fi.intel.com>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
 <20191223141716.13727-27-mika.westerberg@linux.intel.com>
 <20200102090132.GD22390@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200102090132.GD22390@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 02, 2020 at 09:01:32AM +0000, Lee Jones wrote:
> On Mon, 23 Dec 2019, Mika Westerberg wrote:
> 
> > Both PMIC drivers (intel_soc_pmic_mrfld and intel_soc_pmic_bxtwc) will
> > be using this field going forward to access the SCU IPC instance.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  include/linux/mfd/intel_soc_pmic.h | 1 +
> >  1 file changed, 1 insertion(+)
> 
> This might be a good time to add a Kerneldoc header.

Good point. I'll add it in v2.
