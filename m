From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 5/5] thinkpad_acpi: Convert dbg_printk to tp_dbg and
 tp_vdbg
Date: Sun, 24 Jun 2012 11:42:30 -0300
Message-ID: <20120624144230.GB24236@khazad-dum.debian.net>
References: <cover.1339985626.git.joe@perches.com>
 <d8ab2f07efe50ddd9d3db8612c1cc333cb7e5813.1339985627.git.joe@perches.com>
 <20120624004051.GC20885@khazad-dum.debian.net>
 <1340507206.7758.30.camel@joe2Laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1340507206.7758.30.camel@joe2Laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 23 Jun 2012, Joe Perches wrote:
> On Sat, 2012-06-23 at 21:40 -0300, Henrique de Moraes Holschuh wrote:
> > On Sun, 17 Jun 2012, Joe Perches wrote:
> > > Use a more current logging style.
> > > 
> > > Add #define DEBUG and use pr_debug to enable dynamic debugging.
> > > Coalesce formats and align arguments.
> > > 
> > > Signed-off-by: Joe Perches <joe@perches.com>
> > 
> > Joe, are there any extra procedures required from the user to get the debug
> > messages with this patch applied?
> 
> No.
> 
> The added #define DEBUG makes dynamic_debug emit those
> messages automatically.  Without the #define DEBUG, then

I suspected as much, but I wanted direct confirmation.  That
#define DEBUG is a relatively recent enhancement to dynamic printk, isn't
it?  Something I will have to keep in mind if I resume doing backports of
this driver for 2.6.32, 3.0 and 3.2 ?

> these tp_[v]dbg calls might not be compiled in at all.
> 
> These to_[v]dbg calls can be turned off via the normal
> dyn_debug mechanisms.
> 
> see: Documentation/dynamic-debug-howto.txt

Ok. That's good enough for me.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
