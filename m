From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 06/11] intel_sgx: driver for Intel Software Guard
 Extensions
Date: Sun, 26 Nov 2017 19:33:56 +0200
Message-ID: <20171126173356.ik7dhvvcojgermof@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-7-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171125193132.24321-7-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

> +struct sgx_encl_page {
> +	unsigned long addr;
> +	unsigned int flags;
> +	void *epc_page;
> +	struct sgx_va_page *va_page;
> +	unsigned int va_offset;
> +	struct list_head list;
> +};

This can be without major streches hoops packed way more. There are 12
bits free for use in the addr field. I can use low three bits for flags
and upper nine bits for va_offset.

I think I can also quite easily union epc_page and va_page fields.

With these changes the struct would shrink to:

struct sgx_encl_page {
	unsigned long addr;
	union {
		void *epc_page;
		struct sgx_va_page *va_page;
	};
	struct list_head list;
};

I can rework this for v7.

/Jarkko
