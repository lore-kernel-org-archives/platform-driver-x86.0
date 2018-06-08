From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v11 11/13] intel_sgx: ptrace() support
Date: Fri, 8 Jun 2018 11:34:29 -0700
Message-ID: <91e35b3e-b42d-b3d5-752c-031973e69273@intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-12-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608171216.26521-12-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
Cc: sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 06/08/2018 10:09 AM, Jarkko Sakkinen wrote:
> +		ret = sgx_edbgrd(encl, entry, align, data);
> +		if (ret)
> +			break;
> +		if (write) {
> +			memcpy(data + offset, buf + i, cnt);
> +			ret = sgx_edbgwr(encl, entry, align, data);
> +			if (ret)
> +				break;
> +		}
> +		else
> +			memcpy(buf + i,data + offset, cnt);
> +	}

The SGX instructions like "edbgrd" be great to put on a license plat,
but we can do better in the kernel.  Can you give these reasonable
english names, please?  sgx_debug_write(), maybe?

Note that we have plenty of incomprehensible instruction names in the
kernel like "wrpkru", but we do our best to keep them as confined as
possible and make sure they don't hurt code readability.
