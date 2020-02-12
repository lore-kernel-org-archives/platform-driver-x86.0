From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v5 02/18] platform/x86: intel_scu_ipc: Log more
 information if SCU IPC command fails
Date: Wed, 12 Feb 2020 13:57:17 +0200
Message-ID: <20200212115717.GA2667@lahna.fi.intel.com>
References: <20200211132603.73509-1-mika.westerberg@linux.intel.com>
 <20200211132603.73509-3-mika.westerberg@linux.intel.com>
 <20200211154138.GE10400@smile.fi.intel.com>
 <20200212113649.GV2667@lahna.fi.intel.com>
 <20200212115442.GS10400@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200212115442.GS10400@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 12, 2020 at 01:54:42PM +0200, Andy Shevchenko wrote:
> > You mean move outside of the lock? This one calls ipc_data_readl()
> > which should be under the lock.
> 
> I meant to move dev_err() out of the lock. The rest of course requires to stay
> under it.

OK, got it :)
