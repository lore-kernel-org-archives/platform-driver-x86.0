From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [Patch v1 6/8] x86/cpu: Add Cannonlake to Intel family
Date: Wed, 31 Jan 2018 18:44:25 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1801311844121.9911@nanos.tec.linutronix.de>
References: <1516352307-20123-1-git-send-email-rajneesh.bhardwaj@intel.com> <1516352307-20123-7-git-send-email-rajneesh.bhardwaj@intel.com> <CAHp75VcsMzTtn-TD32Jyh6pennLWLjEuiAi_-LJMowENv=P2-Q@mail.gmail.com>
 <20180131172747.GA9877@raj-desk2.iind.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180131172747.GA9877@raj-desk2.iind.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 31 Jan 2018, Rajneesh Bhardwaj wrote:

> On Fri, Jan 26, 2018 at 02:39:47PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 19, 2018 at 10:58 AM, Rajneesh Bhardwaj
> > <rajneesh.bhardwaj@intel.com> wrote:
> > > Add CPUID of Cannonlake (CNL) processors to Intel family list.
> > >
> > > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > cc: Ingo Molnar <mingo@redhat.com>
> > > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > > Cc: x86@kernel.org
> > 
> > Thomas, can you Ack this patch?
> 
> Sorry to bug you again, MAINTAINERS. The series depends on this patch for
> enabling Cannonlake support. Requesting your ACK / Feedback for this one.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
