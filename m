From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v5 08/11] intel_sgx: in-kernel
 launch enclave
Date: Tue, 21 Nov 2017 00:21:19 +0200
Message-ID: <20171120222119.mgu3opl7giqxdtpy@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-9-jarkko.sakkinen@linux.intel.com>
 <1510679109.23727.6.camel@intel.com>
 <20171114200448.52yohrd7ifwvnlgb@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:34930 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751620AbdKTWVW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2017 17:21:22 -0500
Content-Disposition: inline
In-Reply-To: <20171114200448.52yohrd7ifwvnlgb@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Tue, Nov 14, 2017 at 10:05:05PM +0200, Jarkko Sakkinen wrote:
> On Tue, Nov 14, 2017 at 09:05:09AM -0800, Sean Christopherson wrote:
> > Unless there is some conflict you are worried about, "signing_key.pem" is
> > preferable as the default name so that the key is ignored via the top-level
> > .gitignore.  The intel_sgx dir should have also a .gitignore to exclude the
> > other LE related output files:
> > 
> > 	drivers/platform/x86/intel_sgx/le/enclave/sgx_le.ss
> > 	drivers/platform/x86/intel_sgx/le/enclave/sgxsign
> > 	drivers/platform/x86/intel_sgx/le/sgx_le_proxy
> 
> OK, I'll add these to the .gitignore.
> 
> /Jarkko

I did the signing_key.pem change to v6. Not sure if I update .gitignore
for that version.

/Jarkko
