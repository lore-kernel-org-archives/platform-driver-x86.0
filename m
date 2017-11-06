From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Mon, 6 Nov 2017 07:54:00 -0800
Message-ID: <8b91bb10-de7d-c0c1-6373-7a565625525f@intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
 <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:18285 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752829AbdKFPyC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Nov 2017 10:54:02 -0500
In-Reply-To: <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org

On 10/10/2017 07:32 AM, Jarkko Sakkinen wrote:
> +static LIST_HEAD(sgx_free_list);
> +static DEFINE_SPINLOCK(sgx_free_list_lock);

Is this a global list?  Will this be a scalability problem on larger
systems?
