From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 16/37] watchdog: intel-mid_wdt: Convert to use new SCU
 IPC API
Date: Fri, 27 Dec 2019 11:59:20 +0200
Message-ID: <20191227095920.GR2628@lahna.fi.intel.com>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
 <20191223141716.13727-17-mika.westerberg@linux.intel.com>
 <0a488bbc-e101-0479-2968-1fb9acef69fc@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0a488bbc-e101-0479-2968-1fb9acef69fc@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 23, 2019 at 07:46:50AM -0800, Guenter Roeck wrote:
> On 12/23/19 6:16 AM, Mika Westerberg wrote:
> > This converts the Intel MID watchdog driver over the new SCU IPC API
> > where the SCU IPC instance is passed to the functions.
> > 
> > While there drop useless print at the end of probe.
> 
> If you say that you drop the statement you should actually do so.

Oops. I did that originally but during internal review I ended up
removing that part. Will fix the changelog in the next version.
