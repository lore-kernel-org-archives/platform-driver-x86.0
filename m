From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver
 for Intel Software Guard Extensions
Date: Tue, 7 Nov 2017 20:43:07 +0200
Message-ID: <20171107184236.4dfejb33eu3iz6ti@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
 <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
 <1509653429.17230.20.camel@intel.com>
 <20171106113904.ao72d5lk5opzir3k@linux.intel.com>
 <1509980069.8259.0.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:35254 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932727AbdKGSnK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Nov 2017 13:43:10 -0500
Content-Disposition: inline
In-Reply-To: <1509980069.8259.0.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Mon, Nov 06, 2017 at 06:54:29AM -0800, Sean Christopherson wrote:
> On Mon, 2017-11-06 at 13:39 +0200, Jarkko Sakkinen wrote:
> > On Thu, Nov 02, 2017 at 01:10:29PM -0700, Sean Christopherson wrote:
> > > 
> > > +       list_for_each_entry(entry, &sgx_free_list, list)
> > >                 kfree(entry);
> > > -       }
> > Shouldn't you iterate 'epc_pages' in the rollback now?
> 
> Yes, that's the intent, nice catch.

Yeah, just a sanity check that I'm misinterpreting what I'm seeing :-)
Thanks.

/Jarkko
