From: James Morris <james.l.morris@oracle.com>
Subject: Re: [PATCH v5 06/11] intel_sgx: driver for Intel Software Guard
 Extensions
Date: Tue, 14 Nov 2017 10:41:50 +1100 (AEDT)
Message-ID: <alpine.LFD.2.20.1711141039400.7290@localhost>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com> <20171113194528.28557-7-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:35632 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751073AbdKMXm3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Nov 2017 18:42:29 -0500
In-Reply-To: <20171113194528.28557-7-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 13 Nov 2017, Jarkko Sakkinen wrote:

> +
> +	secs_epc = sgx_alloc_page(0);

Use SGX_ALLOC_ATOMIC instead of 0 ?

> +	if (IS_ERR(secs_epc)) {
> +		ret = PTR_ERR(secs_epc);
> +		goto out;
> +	}

> +out:
> +	if (encl)
> +		kref_put(&encl->refcount, sgx_encl_release);
> +	return ret;
> +}

Don't you need an sgx_free_page() somewhere here?



-- 
James Morris
<james.l.morris@oracle.com>
