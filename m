From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Wed, 20 Dec 2017 15:18:13 +0200
Message-ID: <20171220131813.esk3ucfcvx42gmva@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171212140750.GA19663@localhost>
 <1513726426.2206.18.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513726426.2206.18.camel@linux.intel.com>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paolo Bonzini <pbonzin>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 20, 2017 at 01:33:46AM +0200, Jarkko Sakkinen wrote:
> On Tue, 2017-12-12 at 15:07 +0100, Pavel Machek wrote:
> > On Sat 2017-11-25 21:29:17, Jarkko Sakkinen wrote:
> > > Intel(R) SGX is a set of CPU instructions that can be used by applications to
> > > set aside private regions of code and data. The code outside the enclave is
> > > disallowed to access the memory inside the enclave by the CPU access control.
> > > In a way you can think that SGX provides inverted sandbox. It protects the
> > > application from a malicious host.
> > 
> > Would you list guarantees provided by SGX?
> > 
> > For example, host can still observe timing of cachelines being
> > accessed by "protected" app, right? Can it also introduce bit flips?
> > 
> > 								Pavel
> 
> I'll give a more proper response to this now that all the reported major
> issues in the code have been fixed in v9.
> 
> Yes, SGX is vulnerable to the L1 cacheline timing attacks. Jethro
> Beekman wrote a great summary about this on early March:
> 
>   https://jbeekman.nl/blog/2017/03/sgx-side-channel-attacks/
> 
> The counter measures are the same as without SGX. It really does not
> add or degrade security in this area.

This came up even in my patch set :-) I.e. I switched to kernel AES-NI
from TinyCrypt's AES because the latter is not timing resistant.

/Jarkko
