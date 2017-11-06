From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver
 for Intel Software Guard Extensions
Date: Mon, 06 Nov 2017 06:54:29 -0800
Message-ID: <1509980069.8259.0.camel@intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
         <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
         <1509653429.17230.20.camel@intel.com>
         <20171106113904.ao72d5lk5opzir3k@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:30207 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752276AbdKFO5r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Nov 2017 09:57:47 -0500
In-Reply-To: <20171106113904.ao72d5lk5opzir3k@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Mon, 2017-11-06 at 13:39 +0200, Jarkko Sakkinen wrote:
> On Thu, Nov 02, 2017 at 01:10:29PM -0700, Sean Christopherson wrote:
> > 
> > +       list_for_each_entry(entry, &sgx_free_list, list)
> >                 kfree(entry);
> > -       }
> Shouldn't you iterate 'epc_pages' in the rollback now?

Yes, that's the intent, nice catch.
