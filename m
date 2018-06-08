From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v11 10/13] intel_sgx: driver for Intel Software Guard
 Extensions
Date: Fri, 8 Jun 2018 12:35:51 -0700
Message-ID: <b4403cf7-ddfa-284a-d61f-ad93b895b097@intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-11-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608171216.26521-11-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
Cc: sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

> +#define sgx_pr_ratelimited(level, encl, fmt, ...)			\
> +	pr_ ## level ## _ratelimited("[%d:0x%p] " fmt,			\
> +				     pid_nr((encl)->tgid),		\
> +				     (void *)(encl)->base, ##__VA_ARGS__)
> +
> +#define sgx_dbg(encl, fmt, ...) \
> +	sgx_pr_ratelimited(debug, encl, fmt, ##__VA_ARGS__)
> +#define sgx_info(encl, fmt, ...) \
> +	sgx_pr_ratelimited(info, encl, fmt, ##__VA_ARGS__)
> +#define sgx_warn(encl, fmt, ...) \
> +	sgx_pr_ratelimited(warn, encl, fmt, ##__VA_ARGS__)
> +#define sgx_err(encl, fmt, ...) \
> +	sgx_pr_ratelimited(err, encl, fmt, ##__VA_ARGS__)
> +#define sgx_crit(encl, fmt, ...) \
> +	sgx_pr_ratelimited(crit, encl, fmt, ##__VA_ARGS__)

I thought the pr_* thingies were to keep everyone from having to do this
in each driver.  Why did you need this?

Can you do any better than a 2,000-line patch?  For instance, could you
break out the memory management portion into its own part and have that
reviewed by mm folks?  Or the ioctl()'s by device driver folks?
