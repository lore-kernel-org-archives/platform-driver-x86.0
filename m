From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Wed, 22 Nov 2017 12:00:56 +0100
Message-ID: <20171122110056.3536wfyh4gnaglks@pd.tnic>
References: <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171114083647.uxlaov56s2xw3pua@pd.tnic>
 <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
 <20171115115412.uqdy3y74w4sdnzlo@hirez.programming.kicks-ass.net>
 <20171120224623.hpx7zcorrwo4ivhh@linux.intel.com>
 <20171121123854.rv3uxl7zndh3kr2z@linux.intel.com>
 <20171121124739.vszgiz37bhzjfnug@pd.tnic>
 <32c3936f-f5f0-cd26-f6f8-6d710b4eb3d6@fortanix.com>
 <20171122001059.rbpcj3ugvj5th3g2@pd.tnic>
 <383f2831-b703-62c5-bf05-a990ce25f863@fortanix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <383f2831-b703-62c5-bf05-a990ce25f863@fortanix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jethro Beekman <jethro@fortanix.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 21, 2017 at 04:27:45PM -0800, Jethro Beekman wrote:
> See http://www.spinics.net/lists/platform-driver-x86/msg13829.html under
> "Launch control". Essentially, firmware can make it so that user has no
> control over IA32_SGXLEPUBKEYHASHn value.

... and we're back full circle to my initial objection: firmware should
not be doing anything here. The user should.

The mail you're quoting is the same subthread we are at.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
