From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Tue, 21 Nov 2017 00:37:41 +0200
Message-ID: <20171120223741.52dj6gevcwn5jzag@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171114083647.uxlaov56s2xw3pua@pd.tnic>
 <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
 <20171114215327.qiqze33uvhlu555g@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171114215327.qiqze33uvhlu555g@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 14, 2017 at 10:53:27PM +0100, Borislav Petkov wrote:
> On Tue, Nov 14, 2017 at 10:49:48PM +0200, Jarkko Sakkinen wrote:
> > Pre-boot firmware could potentially configure the root key hash for the
> > enclave that signs launch tokens for other enclaves i.e. the launch
> > enclave that is built and signed during the kbuild.
> 
> So how about firmware doesn't do anything and the machine owner decide
> what enclaves get launched and what key hashes to load for a change?
> I.e., let the owner really own the hardware she paid money for.
> 
> Or are we doing encrypted enclaves but then the firmware vendor can look
> inside too?
> 
> -- 
> Regards/Gruss,
>     Boris.

Firmware cannot access the memory inside an enclave. CPU asserts every
memory access coming outside the enclave.

/Jarkko
