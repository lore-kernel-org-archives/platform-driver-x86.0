From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4 13/38] platform/x86: intel_scu_ipc: Reformat
 kernel-doc comments of exported functions
Date: Wed, 22 Jan 2020 16:36:26 +0200
Message-ID: <20200122143626.GU2665@lahna.fi.intel.com>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
 <20200121160114.60007-14-mika.westerberg@linux.intel.com>
 <20200122134050.GD4963@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200122134050.GD4963@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Brown <broonie@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 22, 2020 at 02:40:50PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Jan 21, 2020 at 07:00:49PM +0300, Mika Westerberg wrote:
> > Format kernel-doc comments of the exported functions to follow the
> > typical format that does not have tab indentation. Also capitalize
> > parameter descriptions and add a missing period.
> 
> This should go in the first set of "cleanup" patches, right?

Right. I'll move it to be part of the cleanup patch series.
