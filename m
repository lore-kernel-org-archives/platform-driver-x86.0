From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Tue, 14 Nov 2017 22:53:27 +0100
Message-ID: <20171114215327.qiqze33uvhlu555g@pd.tnic>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171114083647.uxlaov56s2xw3pua@pd.tnic>
 <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:35336 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757133AbdKNVxg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 16:53:36 -0500
Content-Disposition: inline
In-Reply-To: <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 14, 2017 at 10:49:48PM +0200, Jarkko Sakkinen wrote:
> Pre-boot firmware could potentially configure the root key hash for the
> enclave that signs launch tokens for other enclaves i.e. the launch
> enclave that is built and signed during the kbuild.

So how about firmware doesn't do anything and the machine owner decide
what enclaves get launched and what key hashes to load for a change?
I.e., let the owner really own the hardware she paid money for.

Or are we doing encrypted enclaves but then the firmware vendor can look
inside too?

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
