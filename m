From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 07/11] intel_sgx: ptrace() support
Date: Sun, 26 Nov 2017 17:44:29 +0200
Message-ID: <20171126154429.3stntmhj25otqmy5@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-8-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:33241 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752220AbdKZPoe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Nov 2017 10:44:34 -0500
Content-Disposition: inline
In-Reply-To: <20171125193132.24321-8-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Sat, Nov 25, 2017 at 09:29:24PM +0200, Jarkko Sakkinen wrote:
> +	ptr = sgx_get_page(page->epc_page);
> +	ret = __edbgrd((unsigned long)ptr + offset, data);
> +	sgx_put_page(ptr);
> +	if (ret) {
> +		sgx_dbg(encl, "EDBGRD returned %d\n", ret);
                               ~~~~~~
			       EDBGWR

/Jarkko
