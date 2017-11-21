From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Tue, 21 Nov 2017 12:10:09 +0100
Message-ID: <20171121111009.d6h2pqhmlqkf7yby@pd.tnic>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171114083647.uxlaov56s2xw3pua@pd.tnic>
 <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
 <20171114215327.qiqze33uvhlu555g@pd.tnic>
 <20171120223741.52dj6gevcwn5jzag@linux.intel.com>
 <20171120224256.kz3qvz4ek6ky7ywc@pd.tnic>
 <20171120234145.6bnm5s5ntevbzjfk@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171120234145.6bnm5s5ntevbzjfk@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 21, 2017 at 01:41:45AM +0200, Jarkko Sakkinen wrote:
> In potential deployments of SGX, the owner could do this either in the
> firmware level or OS level depending whether the MSRs are configured as
> writable in the feature control.
> 
> One option would be to have a config flag to decide whether to require
> MSRs to be writable or not.

"potential", "would", "could" - all carefully formulated. :-)

Realistically, though, I'm afraid OEMs would jump on the opportunity to
control yet another arch aspect like wasps on honey. So having a way to
override what the firmware decided for me - without even asking me -
would be RealGood(tm).

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
