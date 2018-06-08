From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v11 04/13] x86, sgx: add SGX definitions to msr-index.h
Date: Fri, 8 Jun 2018 10:25:29 -0700
Message-ID: <a51c11da-650a-1828-4173-e424a5340565@intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-5-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608171216.26521-5-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
Cc: sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Haim Cohen <haim.cohen@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On 06/08/2018 10:09 AM, Jarkko Sakkinen wrote:
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Haim Cohen <haim.cohen@intel.com>
> Tested-by: Serge Ayoun <serge.ayoun@intel.com>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Tested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

These are a mess.  If you're signing off on it, a review of some kind is
pretty implied.

Also, how did Sean write this, send it to Haim to sign off on it, and
then send it to you?  That seems unlikely.
