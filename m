From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v5 08/11] intel_sgx: in-kernel
 launch enclave
Date: Tue, 14 Nov 2017 22:05:05 +0200
Message-ID: <20171114200448.52yohrd7ifwvnlgb@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-9-jarkko.sakkinen@linux.intel.com>
 <1510679109.23727.6.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:48165 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756425AbdKNUFK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 15:05:10 -0500
Content-Disposition: inline
In-Reply-To: <1510679109.23727.6.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Tue, Nov 14, 2017 at 09:05:09AM -0800, Sean Christopherson wrote:
> Unless there is some conflict you are worried about, "signing_key.pem" is
> preferable as the default name so that the key is ignored via the top-level
> .gitignore.  The intel_sgx dir should have also a .gitignore to exclude the
> other LE related output files:
> 
> 	drivers/platform/x86/intel_sgx/le/enclave/sgx_le.ss
> 	drivers/platform/x86/intel_sgx/le/enclave/sgxsign
> 	drivers/platform/x86/intel_sgx/le/sgx_le_proxy

OK, I'll add these to the .gitignore.

/Jarkko
