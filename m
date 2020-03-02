From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v7 00/19] platform/x86: Rework intel_scu_ipc and
 intel_pmc_ipc drivers
Date: Mon, 2 Mar 2020 17:25:25 +0200
Message-ID: <20200302152525.GB2540@lahna.fi.intel.com>
References: <20200302133327.55929-1-mika.westerberg@linux.intel.com>
 <20200302142621.GB3494@dell>
 <20200302143803.GI2667@lahna.fi.intel.com>
 <20200302151924.GC3494@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200302151924.GC3494@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 02, 2020 at 03:19:24PM +0000, Lee Jones wrote:
> > I wasn't really sure what to do with them. They are not in the normal
> > tag format I've seen so I thought you use them yourself somehow to
> > manage your mailboxes. I can add them back if needed.
> 
> Yes, please add them, so I can track them.
> 
> It normally means that I plan to take the set through MFD and
> subsequently send an immutable pull-request out to the other
> Maintainers once all the other Acks have been provided.
> 
> MFD handles these kinds of cross-subsystem patch-sets often.

OK, thanks for the explanation. I'll re-send with your acks added then.
