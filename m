From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v5 06/11] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Tue, 14 Nov 2017 22:28:35 +0200
Message-ID: <20171114202835.64rl35asldh3jgui@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-7-jarkko.sakkinen@linux.intel.com>
 <1510682106.3313.24.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:19844 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751233AbdKNU2j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 15:28:39 -0500
Content-Disposition: inline
In-Reply-To: <1510682106.3313.24.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Tue, Nov 14, 2017 at 09:55:06AM -0800, Sean Christopherson wrote:
> What do you mean by bottlenecks?  Assuming you're referring to performance
> bottlenecks, this statement is flat out false.  Moving the launch enclave into
> the kernel introduces performance bottlenecks, e.g. as implemented, a single LE
> services all EINIT requests and is protected by a mutex.  That is the very
> definition of a bottleneck.

I guess the text does not do a good job describing what I meant. Maybe I
should refine it? Your argument about mutex is correct.

The use of "bottleneck" does not specifically refer to performance. I'm
worried about splitting the tasks needed to launch an enclave between
kernel and user space. It could become difficult to manage when more
SGX features are added. That is what I was referring when I used the
word "bottleneck".

I suppose you think I should refine the commit message?

About the perf bottleneck. Given that all the data is already in
sgx_le_ctx the driver could for example have own LE process for every
opened /dev/sgx. Is your comment also suggesting to refine this or
could it be postponed?

The driver architecture already allows to scale this but it is not
nearly as bad issue as the one Dave pointed out.

/Jarkko
