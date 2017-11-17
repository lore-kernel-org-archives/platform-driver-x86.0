From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Fri, 17 Nov 2017 15:46:45 -0800
Message-ID: <20171117234645.GF25974@fury>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171117214310.GB25974@fury>
 <alpine.DEB.2.20.1711180023440.2186@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1711180023440.2186@nanos>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Nov 18, 2017 at 12:34:33AM +0100, Thomas Gleixner wrote:
> On Fri, 17 Nov 2017, Darren Hart wrote:
> 
> @intel: I removed intel-sgx-kernel-dev@lists.01.org from CC because I can
> do without the silly moderation spam of that list. Please disable that
> nonsense.
> 
> > On Mon, Nov 13, 2017 at 09:45:28PM +0200, Jarkko Sakkinen wrote:
> > Is SGX considered architectural or not? A quick search of the SDM
> > includes it in Volume 3:
> > 
> > Volume 3: Includes the full system programming guide, parts 1, 2, 3, and
> > 4.  Describes the operating-system support environment of Intel® 64 and
> > IA-32 architectures, including: memory management, protection, task
> > management, interrupt and exception handling, multi-processor support,
> > thermal and power management features, debugging, performance
> > monitoring, system management mode, virtual machine extensions (VMX)
> > instructions, Intel® Virtualization Technology (Intel® VT), and Intel®
> > Software Guard Extensions (Intel® SGX).
> > 
> > https://software.intel.com/en-us/articles/intel-sdm
> > 
> > Depending on the answer, this impacts whether this belongs in
> > drivers/platform/x86 or arch/x86/platform per our recent agreement with
> > Thomas.
> > 
> > Thomas, Mingo, HPA, do you wish to see this organized/located
> > differently than it is here in v5?
> 
> This is architecural. From the cursory read of that series it seems there
> are two parts to it:
> 
>   1) The actual core handling, which should be in arch/x86 because that
>      hardly qualifies as a 'platform' device driver.
> 

I'm supportive of that.

>   2) The user space interface, which can be separated out perhaps.
> 
> I don't know how intertwingled they are, but that's hard to tell from the
> actual patches w/o doing a deep inspection. Jarkko should be able to answer
> that.

Jarkko, some additional context on your placement decisions would be helpful.

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
