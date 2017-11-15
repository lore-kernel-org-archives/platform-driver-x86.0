From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v5 10/11] intel_sgx: glue code for
 in-kernel LE
Date: Wed, 15 Nov 2017 12:10:11 +0200
Message-ID: <20171115101011.ivp5x33zm2mqoing@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-11-jarkko.sakkinen@linux.intel.com>
 <1510683403.11044.2.camel@intel.com>
 <20171114203115.cuwsgwxzadqn7d4u@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:42485 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757338AbdKOKKP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Nov 2017 05:10:15 -0500
Content-Disposition: inline
In-Reply-To: <20171114203115.cuwsgwxzadqn7d4u@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Tue, Nov 14, 2017 at 10:31:15PM +0200, Jarkko Sakkinen wrote:
> On Tue, Nov 14, 2017 at 10:16:43AM -0800, Sean Christopherson wrote:
> > This semaphore approach is broken due to the LE process using an anon inode for
> > /dev/sgx, which results in sgx_release being called without an accompanying call
> > to sgx_open.  This causes deadlocks due to a semaphore underrun.
> > 
> > https://lists.01.org/pipermail/intel-sgx-kernel-dev/2017-November/000901.html
> 
> Thank you for catching this. I can only say that I forgot to fix it it
> for v5. It will be refined for v6.
> 
> /Jarkko

I added a fix to 'le' branch (will be squashed in v6).

/Jarkko
