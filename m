From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2 1/4] platform/x86: intel_pmc_core: Show Latency
 Tolerance info
Date: Tue, 30 Oct 2018 11:50:00 -0700
Message-ID: <327d2cd2561270d975e26a7f52d81ef85cbcc507.camel@linux.intel.com>
References: <20181006065113.669-1-rajneesh.bhardwaj@linux.intel.com>
         <CAHp75VcQ3SDQ4X9+LX+y2vB4PWQURid4R=qy5+5PkWHC5nGqQA@mail.gmail.com>
         <a839e9d3-838b-0fb1-55ac-07562ec71313@linux.intel.com>
         <CAHp75Vd8zUR9LYOj1X-3FgqnB_XVZD5hbA+WPN_7T_6kZBAQ5w@mail.gmail.com>
         <0d940313e1be7ddaa06c5ebf4aea7a4df84540f2.camel@linux.intel.com>
         <CAHp75VcF5jB6hnLVbMJJKRvuRN7=0BS+OS1nB-EeR8Y8nTVz3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcF5jB6hnLVbMJJKRvuRN7=0BS+OS1nB-EeR8Y8nTVz3w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: rajneesh.bhardwaj@linux.intel.com, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2018-10-30 at 20:33 +0200, Andy Shevchenko wrote:
> On Tue, Oct 30, 2018 at 8:03 PM Srinivas Pandruvada
> <srinivas.pandruvada@linux.intel.com> wrote:
> 
> > > > Index printing is required here (for LTR Show and LTR Ignore)
> > > > because it
> > > > paves an obvious and easy way for the users of this driver to
> > > > know
> > > > the
> > > > IP number to be used for LTR ignore. This was specifically
> > > > requested by
> > > > some customer and Srinivas asked me to implement this so adding
> > > > him
> > > > for
> > > > his inputs.
> > > 
> > > So, why it should be in kernel? When user prints this, they
> > > usually
> > > call `cat /.../file`, right?
> > > Is it too hard to call `cat -n /.../file` instead? The benefit of
> > > such
> > > approach is that it's independent on the file we are printing.
> > > 
> > > (Note, `grep -n <PATTERN> /.../file` does the same`)
> > > 
> > > For more variants
> > > 
> > 
> > 
https://stackoverflow.com/questions/8206370/add-numbers-to-the-beginning-of-every-line-in-a-file
> > > 
> > 
> > We get copy/paste data from some serial terminals from systems
> > which
> > don't have traditional linux shell or busy box. Not sure if they
> > can do
> > cat "-n" option or have this command at all. So line number helps.
> > They
> > can't even store output as as file as this is RO file system.
> 
> Hmm... I'm not following this. If there is serial connection where at
> least you may see things, how it's guaranteed that it will not print
> more enough to rewrite the DTE's input buffer?
No guarantee, This is just best effort.
We get something like this from emails:

Device	S-state	  Status   Sysfs node BR1A	  S4	*disabled  pci:
0000:00:01.0 BR1B	  S4	*disabled BR2A	  S4	*disabled  pci:
0000:00:02.0

Any line marker helps. But again this is not a hard requirement.
There will always be argument, that this can be done in other ways.

For sake of time discussing this:

Rajneesh,
Please get rid of index printing.

> On the other hand if you copy the data to the other system which, I
> bet, has `cat -n` available, not a problem either.
> 
> So, the use case here, AFAICS, if you have a debug log enabled and
> it's spitted out like SysRq where you can see, but not able to copy
> and it's guaranteed not to overflow on the screen / output device.
> 
> > But I am not as sticky on this.
> 
> Since it's a debugfs and not any ABI implied, I'm fine with it to
> have, but I would like to understand the real use case of it (and
> this
> definitely should be reflected in the commit message).
> 
