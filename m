From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v11 09/13] x86, sgx: basic routines for enclave page cache
Date: Tue, 19 Jun 2018 17:08:15 +0300
Message-ID: <20180619140815.GA8034@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
 <78982a32-c589-48e2-9a83-fd36903b5588@fortanix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <78982a32-c589-48e2-9a83-fd36903b5588@fortanix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jethro Beekman <jethro@fortanix.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 08, 2018 at 11:21:48AM -0700, Jethro Beekman wrote:
> On 2018-06-08 10:09, Jarkko Sakkinen wrote:
> > +/*
> > + * Writing the LE hash MSRs is extraordinarily expensive, e.g.
> > + * 3-4x slower than normal MSRs, so we use a per-cpu cache to
> > + * track the last known value of the MSRs to avoid unnecessarily
> > + * writing the MSRs with the current value.  Because most Linux
> > + * kernels will use an LE that is signed with a non-Intel key,
> 
> I don't think you can predict what most Linux kernels will be doing. I think
> not initializing the cache to the CPU's initial value is fine, but this
> particular argument shouldn't appear in the rationale.

Are you just referring to the last sentence or the whole paragraph?

/Jarkko
