From: Nathaniel McCallum <npmccallum@redhat.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 13/13] intel_sgx: in-kernel
 launch enclave
Date: Mon, 25 Jun 2018 17:26:58 -0400
Message-ID: <CAOASepOrKApnxXZhiz4usPAeJux8i2zP0tEs1B6FyoYvtiPn4A@mail.gmail.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-14-jarkko.sakkinen@linux.intel.com> <CALCETrW3aZJMMm1GqgPm-cOD3p7JvKxLj7j85KJwfNW2iHTj4A@mail.gmail.com>
 <CALCETrVp1ZhrxF5bQDSaZpLucS88tErejj5JC6Jb0fB5etWRbA@mail.gmail.com>
 <20180611115255.GC22164@hmswarspite.think-freely.org> <CALCETrX6SD0ThNzpjkbXd7CbNTguzqiQhWMomGK+tocx_DE9XQ@mail.gmail.com>
 <20180612174535.GE19168@hmswarspite.think-freely.org> <CALCETrV-4D-M2ap1EFHQiQerYf_XgwLmBAx5WMvcCUefOODjOA@mail.gmail.com>
 <CAOASepN9t3jF4ajfKLG_odTZddOvXjY_DqLQhRPWhJ-imtjkgg@mail.gmail.com> <bbffd5f975a4054850e1885b7fc5013ef9a3e7f3.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bbffd5f975a4054850e1885b7fc5013ef9a3e7f3.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jarkko.sakkinen@linux.intel.com
Cc: luto@kernel.org, Neil Horman <nhorman@redhat.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, intel-sgx-kernel-dev@lists.01.org, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org, Peter Jones <pjones@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 25, 2018 at 5:28 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Wed, 2018-06-20 at 12:28 -0400, Nathaniel McCallum wrote:
> > As I understand it, the current policy models under discussion look like this:
> >
> > 1. SGX w/o FLC (not being merged) looks like this:
> >   Intel CPU => (Intel signed) launch enclave => enclaves
> >
> > 2. SGX w/ FLC, looks like this:
> >   Intel CPU => kernel => launch enclave => enclaves
> >
> > 3. Andy is proposing this:
> >   Intel CPU => kernel => enclaves
>
> What if MSRs are not writable after hand over to the OS? It is a legit
> configuration at least according to the SDM.

It seems to me that "set the MSRs in the BIOS" and "set the MSRs in a
UEFI module" are functionally equivalent.
