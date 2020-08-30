From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: sysfs output without newlines
Date: Sun, 30 Aug 2020 11:11:42 +0200
Message-ID: <20200830091142.GC112265@kroah.com>
References: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Kees Cook <keescook@chromium.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, Julia Lawall <julia.lawall@inria.fr>, Alex Dewar <alex.dewar90@gmail.com>, York Sun <york.sun@nxp.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Boris Brezillon <bbrezillon@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>, Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>Ma
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Aug 29, 2020 at 11:23:43AM -0700, Joe Perches wrote:
> While doing an investigation for a possible treewide conversion of
> sysfs output using sprintf/snprintf/scnprintf, I discovered
> several instances of sysfs output without terminating newlines.
> 
> It seems likely all of these should have newline terminations
> or have the \n\r termination changed to a single newline.
> 
> Anyone have any objection to patches adding newlines to these
> in their original forms using sprintf/snprintf/scnprintf?

No objection for me, patches for my subsystems will be gladly taken.

thanks,

greg k-h
