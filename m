From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver
 for Intel Software Guard Extensions
Date: Tue, 14 Nov 2017 21:33:34 +0200
Message-ID: <20171114193334.26fj2txyptd5se5c@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
 <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
 <8b91bb10-de7d-c0c1-6373-7a565625525f@intel.com>
 <20171107184709.srgrx2aa23fupmk7@linux.intel.com>
 <1f0a2fc6-9018-1569-d358-42e912db5f10@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:27733 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753399AbdKNTdj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 14:33:39 -0500
Content-Disposition: inline
In-Reply-To: <1f0a2fc6-9018-1569-d358-42e912db5f10@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 07, 2017 at 11:05:08AM -0800, Dave Hansen wrote:
> On 11/07/2017 10:47 AM, Jarkko Sakkinen wrote:
> > On Mon, Nov 06, 2017 at 07:54:00AM -0800, Dave Hansen wrote:
> >> On 10/10/2017 07:32 AM, Jarkko Sakkinen wrote:
> >>> +static LIST_HEAD(sgx_free_list);
> >>> +static DEFINE_SPINLOCK(sgx_free_list_lock);
> >>
> >> Is this a global list?  Will this be a scalability problem on larger
> >> systems?
> > 
> > It will be need to be refined for NUMA.
> > 
> > In addition, per-CPU caches would probably make sense.
> > 
> > For simplicity, I would keep it as it is up until the driver is in the
> > mainline.
> 
> FWIW, I don't think we should merge things that aren't performant.
> Global locks like this are just intolerable.  You can add this as a
> later patch, but please don't merge stuff like this.

The back pointer to struct sgx_encl_page from struct sgx_epc_page is
useless. I've had this in backlog already long time ago but had forgot
it as I've been mostly working with the launch infrastructure lately.

Your comment worked as kind of a reminder of that. Thank you.

Once that field is removed the whole struct is useless and EPC bank
converges to an array. With an array the driver should be able reserve
pages without a global lock.

I've started writing a patch to make all this happen and it is
progressing really well. I'm planning to include this change to v6.
As it simplifies code I'm going to squash it as part of the initial
driver patch.

How does this sound?

/Jarkko
