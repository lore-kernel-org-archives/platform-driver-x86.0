From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Mon, 20 Nov 2017 23:42:56 +0100
Message-ID: <20171120224256.kz3qvz4ek6ky7ywc@pd.tnic>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171114083647.uxlaov56s2xw3pua@pd.tnic>
 <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
 <20171114215327.qiqze33uvhlu555g@pd.tnic>
 <20171120223741.52dj6gevcwn5jzag@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:37580 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751149AbdKTWnN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2017 17:43:13 -0500
Content-Disposition: inline
In-Reply-To: <20171120223741.52dj6gevcwn5jzag@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 21, 2017 at 12:37:41AM +0200, Jarkko Sakkinen wrote:
> Firmware cannot access the memory inside an enclave. CPU asserts every
> memory access coming outside the enclave.

But "firmware could potentially configure the root key hash for the
enclave." How about the owner configures the root key hash instead?
Along with deciding whether to lock down the feature control register or
not...

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
