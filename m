From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver
 for Intel Software Guard Extensions
Date: Thu, 02 Nov 2017 12:48:35 -0700
Message-ID: <1509652115.17230.9.camel@intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
         <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:28629 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932497AbdKBTvY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2017 15:51:24 -0400
In-Reply-To: <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org

On Tue, 2017-10-10 at 17:32 +0300, Jarkko Sakkinen wrote:
> +static int __init sgx_drv_init(void)
> +{
> +	int ret;
> +
> +	ret = sgx_drv_subsys_init();

The return value of sgx_drv_subsys_init is being ignored.

> +
> +	ret = platform_driver_register(&sgx_drv);
> +	if (ret)
> +		sgx_drv_subsys_exit();
> +
> +	return ret;
> +}
> +module_init(sgx_drv_init);
> +
> +static void __exit sgx_drv_exit(void)
> +{
> +	platform_driver_unregister(&sgx_drv);
> +	sgx_drv_subsys_exit();
> +}
> +module_exit(sgx_drv_exit);
