From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 02/23] x86/cpufeatures: Add Intel-defined SGX feature
 bit
Date: Fri, 16 Nov 2018 17:18:45 +0200
Message-ID: <20181116151845.GC4244@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-3-jarkko.sakkinen@linux.intel.com>
 <20181116142840.GI20313@zn.tnic>
 <20181116151351.GB4244@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116151351.GB4244@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Kai Huang <kai.huang@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Fenghua Yu <fenghua.yu@intel.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 16, 2018 at 05:13:51PM +0200, Jarkko Sakkinen wrote:
> On Fri, Nov 16, 2018 at 03:28:40PM +0100, Borislav Petkov wrote:
> > Reviewed-by: Borislav Petkov <bp@suse.de>
> 
> Thank you, the very first reviewed-by 8-)

I will also add Sean as co-maintainer as he has the KVM angle and is
needed to ack patches in the future. This functionality really needs
two eyes. Has shown to have value in many occasions.

/Jarkko
