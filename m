From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v14 11/19] x86/sgx: Add wrappers for ENCLS leaf functions
Date: Thu, 27 Sep 2018 16:12:27 +0300
Message-ID: <20180927131227.GB5436@linux.intel.com>
References: <20180925130845.9962-1-jarkko.sakkinen@linux.intel.com>
 <20180925130845.9962-12-jarkko.sakkinen@linux.intel.com>
 <a2d77169-5c14-10f0-425f-41e37f791ece@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a2d77169-5c14-10f0-425f-41e37f791ece@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, linux-sgx@vger.kernel.org, andriy.shevchenko@linux.intel.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Suresh Siddha <suresh.b.siddha@intel.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 25, 2018 at 01:01:47PM -0700, Randy Dunlap wrote:
> Hi,
> Please don't use "/**" to begin comment blocks that are not kernel-doc
> notation, like the 3 below.  Note: I might have seen one (or some) of
> these "fixed" in other patches in this series (not sure).

Thanks Randy.

/Jarkko
