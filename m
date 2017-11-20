From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Tue, 21 Nov 2017 01:41:45 +0200
Message-ID: <20171120234145.6bnm5s5ntevbzjfk@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171114083647.uxlaov56s2xw3pua@pd.tnic>
 <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
 <20171114215327.qiqze33uvhlu555g@pd.tnic>
 <20171120223741.52dj6gevcwn5jzag@linux.intel.com>
 <20171120224256.kz3qvz4ek6ky7ywc@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:54418 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751207AbdKTXlt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2017 18:41:49 -0500
Content-Disposition: inline
In-Reply-To: <20171120224256.kz3qvz4ek6ky7ywc@pd.tnic>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 20, 2017 at 11:42:56PM +0100, Borislav Petkov wrote:
> On Tue, Nov 21, 2017 at 12:37:41AM +0200, Jarkko Sakkinen wrote:
> > Firmware cannot access the memory inside an enclave. CPU asserts every
> > memory access coming outside the enclave.
> 
> But "firmware could potentially configure the root key hash for the
> enclave." How about the owner configures the root key hash instead?
> Along with deciding whether to lock down the feature control register or


In potential deployments of SGX, the owner could do this either in the
firmware level or OS level depending whether the MSRs are configured as
writable in the feature control.

One option would be to have a config flag to decide whether to require
MSRs to be writable or not.

/Jarkko
