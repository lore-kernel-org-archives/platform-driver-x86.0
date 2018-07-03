From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v12 05/13] x86/sgx: architectural structures
Date: Tue, 3 Jul 2018 14:22:52 -0700
Message-ID: <5790d6a4-7d30-1ed8-0214-f68f1cb72294@intel.com>
References: <20180703182118.15024-1-jarkko.sakkinen@linux.intel.com>
 <20180703182118.15024-6-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703182118.15024-6-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
Cc: sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, linux-sgx@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 07/03/2018 11:19 AM, Jarkko Sakkinen wrote:
> +enum sgx_cpuid {
> +	SGX_CPUID_CAPABILITIES	= 0,
> +	SGX_CPUID_ATTRIBUTES	= 1,
> +	SGX_CPUID_EPC_BANKS	= 2,
> +};

I made a review comment about these last time.  I don't remember
receiving any kind of response from you on it, or seeing it addressed in
these patches in any kind of way.

I've also seen comments from Thomas that sound really familiar such as
the lack of comments on the paging code or the use of a semaphore to
protect things that don't sleep.  I made very, very similar comments on
the last posting.

Is there a reason that those comments were not addressed?
