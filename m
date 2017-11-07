From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver
 for Intel Software Guard Extensions
Date: Tue, 7 Nov 2017 20:47:09 +0200
Message-ID: <20171107184709.srgrx2aa23fupmk7@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
 <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
 <8b91bb10-de7d-c0c1-6373-7a565625525f@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:55326 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932971AbdKGSrO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Nov 2017 13:47:14 -0500
Content-Disposition: inline
In-Reply-To: <8b91bb10-de7d-c0c1-6373-7a565625525f@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Mon, Nov 06, 2017 at 07:54:00AM -0800, Dave Hansen wrote:
> On 10/10/2017 07:32 AM, Jarkko Sakkinen wrote:
> > +static LIST_HEAD(sgx_free_list);
> > +static DEFINE_SPINLOCK(sgx_free_list_lock);
> 
> Is this a global list?  Will this be a scalability problem on larger
> systems?

It will be need to be refined for NUMA.

In addition, per-CPU caches would probably make sense.

For simplicity, I would keep it as it is up until the driver is in the
mainline.

/Jarkko
