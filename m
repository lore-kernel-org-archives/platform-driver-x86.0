From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 03/18] platform/x86: intel_scu_ipc: Introduce new SCU
 IPC API
Date: Tue, 11 Feb 2020 17:48:41 +0200
Message-ID: <20200211154841.GF10400@smile.fi.intel.com>
References: <20200211132603.73509-1-mika.westerberg@linux.intel.com>
 <20200211132603.73509-4-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200211132603.73509-4-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 11, 2020 at 04:25:48PM +0300, Mika Westerberg wrote:
> The current SCU IPC API has been operating on a single instance and
> there has been no way to pin the providing module in place when the SCU
> IPC is in use.
> 
> This implements a new API that takes the SCU IPC instance as first
> parameter (NULL means the single instance is being used). The SCU IPC
> instance can be retrieved by calling new function
> intel_scu_ipc_dev_get() that take care of pinning the providing module
> in place as long as intel_scu_ipc_dev_put() is not called.
> 
> The old API and constants that are still being used are left there to
> support existing users that cannot be converted easily but they are put
> to a separate header that is subject to be removed eventually.
> Subsequent patches will convert most of the users over to the new API.

I'm thinking now if it would be better to do this in two steps, i.e. split out
legacy header first and then introduce new API?

-- 
With Best Regards,
Andy Shevchenko
