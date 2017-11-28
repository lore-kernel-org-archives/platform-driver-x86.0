From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 08/11] intel_sgx: in-kernel launch enclave
Date: Tue, 28 Nov 2017 22:17:39 +0200
Message-ID: <20171128201739.t2r4wqofqluddsxl@linux.intel.com>
References: <20171125193132.24321-9-jarkko.sakkinen@linux.intel.com>
 <20171127095828.GA32603@aton>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:16470 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752191AbdK1URi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 15:17:38 -0500
Content-Disposition: inline
In-Reply-To: <20171127095828.GA32603@aton>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Mon, Nov 27, 2017 at 10:58:28AM +0100, Till Smejkal wrote:
> >   drivers/platform/x86/intel_sgx/intel_sgx_signing_key.pem
>                                    ^
>                                    signing_key.pem
> 
> You forgot to change the name of the pem file in the commit message.

Thanks for catching this :-) Will fix it for the next version.

/Jarkko
