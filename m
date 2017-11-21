From: Jethro Beekman <jethro@fortanix.com>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Tue, 21 Nov 2017 15:45:31 -0800
Message-ID: <32c3936f-f5f0-cd26-f6f8-6d710b4eb3d6@fortanix.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171114083647.uxlaov56s2xw3pua@pd.tnic>
 <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
 <20171115115412.uqdy3y74w4sdnzlo@hirez.programming.kicks-ass.net>
 <20171120224623.hpx7zcorrwo4ivhh@linux.intel.com>
 <20171121123854.rv3uxl7zndh3kr2z@linux.intel.com>
 <20171121124739.vszgiz37bhzjfnug@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-co1nam03on0112.outbound.protection.outlook.com ([104.47.40.112]:2913
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751372AbdKUXpj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2017 18:45:39 -0500
In-Reply-To: <20171121124739.vszgiz37bhzjfnug@pd.tnic>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On 2017-11-21 04:47, Borislav Petkov wrote:
> On Tue, Nov 21, 2017 at 02:38:54PM +0200, Jarkko Sakkinen wrote:
>>    Try to start LE. If it doesn't start i.e. is signed with a different
>>    root key than the one inside MSRs, then fail the initialization.
> 
> But what if the one inside the MSRs is from the fw vendor and I don't
> trust it?
> 

Boris & Peter: this key has nothing to do with "trust" or "security". As 
Sean mentioned in the other thread (PATCH v5 06/11) the kernel is fully 
capable of enforcing any security policy on its own without help of an 
enclave.

 > I.e., let the owner really own the hardware she paid money for.

Yes, let's. Processors with SGX have been commercially available for 
over 2 years (and I have owned them for the same time). Why is it that I 
still can't use a mainline kernel to get access to all the cabapilities 
of my 2-year old hardware? Let's try not to put too much policy in the 
kernel and let userspace decide.

Jethro Beekman
