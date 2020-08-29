From: Joe Perches <joe@perches.com>
Subject: Re: sysfs output without newlines
Date: Sat, 29 Aug 2020 13:33:56 -0700
Message-ID: <b64a4cb0ee68fee01973616e5ef0f299ac191f6d.camel@perches.com>
References: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
         <4cd6275c-6e95-3aeb-9924-141f62e00449@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <4cd6275c-6e95-3aeb-9924-141f62e00449@linux.com>
Sender: netdev-owner@vger.kernel.org
To: Denis Efremov <efremov@linux.com>, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Kees Cook <keescook@chromium.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, Julia Lawall <julia.lawall@inria.fr>, Alex Dewar <alex.dewar90@gmail.com>
Cc: York Sun <york.sun@nxp.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Boris Brezillon <bbrezillon@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>, Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>, Madalin Bucur <madalin.bucur@nxp.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Douglas Miller <dougmill@linux.ibm.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, Darren Hart <dvhart@infradead.org>, An
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 2020-08-29 at 23:23 +0300, Denis Efremov wrote:
> Hi,
> 
> On 8/29/20 9:23 PM, Joe Perches wrote:
> > While doing an investigation for a possible treewide conversion of
> > sysfs output using sprintf/snprintf/scnprintf, I discovered
> > several instances of sysfs output without terminating newlines.
> > 
> > It seems likely all of these should have newline terminations
> > or have the \n\r termination changed to a single newline.
> 
> I think that it could break badly written scripts in rare cases.

Maybe.

Is sysfs output a nominally unchangeable api like seq_?
Dunno.  seq_ output is extended all the time.

I think whitespace isn't generally considered part of
sscanf type input content awareness.

> > Anyone have any objection to patches adding newlines to these
> > in their original forms using sprintf/snprintf/scnprintf?
> 
> I'm not sure about existing cases, but I think it's a good
> checkpatch.pl warning for new patches. It should be 
> possible to check sysfs_emit() calls.

Eventually, yes.

cheers, Joe
