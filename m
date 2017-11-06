From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver
 for Intel Software Guard Extensions
Date: Mon, 6 Nov 2017 09:23:01 +0200
Message-ID: <20171106072301.pdpbgqvn4laac4tz@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
 <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
 <1509652115.17230.9.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:11355 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751087AbdKFHXE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Nov 2017 02:23:04 -0500
Content-Disposition: inline
In-Reply-To: <1509652115.17230.9.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Thu, Nov 02, 2017 at 12:48:35PM -0700, Sean Christopherson wrote:
> On Tue, 2017-10-10 at 17:32 +0300, Jarkko Sakkinen wrote:
> > +static int __init sgx_drv_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret = sgx_drv_subsys_init();
> 
> The return value of sgx_drv_subsys_init is being ignored.
> 
> > +
> > +	ret = platform_driver_register(&sgx_drv);
> > +	if (ret)
> > +		sgx_drv_subsys_exit();
> > +
> > +	return ret;
> > +}
> > +module_init(sgx_drv_init);
> > +
> > +static void __exit sgx_drv_exit(void)
> > +{
> > +	platform_driver_unregister(&sgx_drv);
> > +	sgx_drv_subsys_exit();
> > +}
> > +module_exit(sgx_drv_exit);

Holds still for v4. the latest version under review. Thanks.

/Jarkko
