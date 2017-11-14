From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v5 11/11] intel_sgx: driver
 documentation
Date: Tue, 14 Nov 2017 21:47:03 +0200
Message-ID: <20171114194703.eqeaxeqtpvzmkeec@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <1510628465.8102.11.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:33288 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753115AbdKNTrK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 14:47:10 -0500
Content-Disposition: inline
In-Reply-To: <1510628465.8102.11.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kai Huang <kai.huang@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Tue, Nov 14, 2017 at 04:01:05PM +1300, Kai Huang wrote:
> Not sure whether you should talk about MEE staff here. They are not in
> SDM and (thus) may potentially be changed in the future.

The use of MEE is documented in many places like

  https://eprint.iacr.org/2016/204.pdf

I see no reason not to talk about MEE.

> IMHO you can just remove this "virtualization" section entirely as your
> first upstreaming driver won't consider virtualization at all.
> 
> Thanks,
> -Kai

Makes sense.

/Jarkko
