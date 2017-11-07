From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Tue, 7 Nov 2017 11:05:08 -0800
Message-ID: <1f0a2fc6-9018-1569-d358-42e912db5f10@intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
 <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
 <8b91bb10-de7d-c0c1-6373-7a565625525f@intel.com>
 <20171107184709.srgrx2aa23fupmk7@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:57320 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754016AbdKGTFL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Nov 2017 14:05:11 -0500
In-Reply-To: <20171107184709.srgrx2aa23fupmk7@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On 11/07/2017 10:47 AM, Jarkko Sakkinen wrote:
> On Mon, Nov 06, 2017 at 07:54:00AM -0800, Dave Hansen wrote:
>> On 10/10/2017 07:32 AM, Jarkko Sakkinen wrote:
>>> +static LIST_HEAD(sgx_free_list);
>>> +static DEFINE_SPINLOCK(sgx_free_list_lock);
>>
>> Is this a global list?  Will this be a scalability problem on larger
>> systems?
> 
> It will be need to be refined for NUMA.
> 
> In addition, per-CPU caches would probably make sense.
> 
> For simplicity, I would keep it as it is up until the driver is in the
> mainline.

FWIW, I don't think we should merge things that aren't performant.
Global locks like this are just intolerable.  You can add this as a
later patch, but please don't merge stuff like this.
