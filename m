From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 13/13] intel_sgx: in-kernel
 launch enclave
Date: Mon, 25 Jun 2018 12:27:53 +0300
Message-ID: <bbffd5f975a4054850e1885b7fc5013ef9a3e7f3.camel@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
         <20180608171216.26521-14-jarkko.sakkinen@linux.intel.com>
         <CALCETrW3aZJMMm1GqgPm-cOD3p7JvKxLj7j85KJwfNW2iHTj4A@mail.gmail.com>
         <CALCETrVp1ZhrxF5bQDSaZpLucS88tErejj5JC6Jb0fB5etWRbA@mail.gmail.com>
         <20180611115255.GC22164@hmswarspite.think-freely.org>
         <CALCETrX6SD0ThNzpjkbXd7CbNTguzqiQhWMomGK+tocx_DE9XQ@mail.gmail.com>
         <20180612174535.GE19168@hmswarspite.think-freely.org>
         <CALCETrV-4D-M2ap1EFHQiQerYf_XgwLmBAx5WMvcCUefOODjOA@mail.gmail.com>
         <CAOASepN9t3jF4ajfKLG_odTZddOvXjY_DqLQhRPWhJ-imtjkgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOASepN9t3jF4ajfKLG_odTZddOvXjY_DqLQhRPWhJ-imtjkgg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathaniel McCallum <npmccallum@redhat.com>, luto@kernel.org
Cc: Neil Horman <nhorman@redhat.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, intel-sgx-kernel-dev@lists.01.org, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org, Peter Jones <pjones@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2018-06-20 at 12:28 -0400, Nathaniel McCallum wrote:
> As I understand it, the current policy models under discussion look like this:
> 
> 1. SGX w/o FLC (not being merged) looks like this:
>   Intel CPU => (Intel signed) launch enclave => enclaves
> 
> 2. SGX w/ FLC, looks like this:
>   Intel CPU => kernel => launch enclave => enclaves
> 
> 3. Andy is proposing this:
>   Intel CPU => kernel => enclaves

What if MSRs are not writable after hand over to the OS? It is a legit
configuration at least according to the SDM.

/Jarkko
