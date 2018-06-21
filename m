From: Nathaniel McCallum <npmccallum@redhat.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 13/13] intel_sgx: in-kernel
 launch enclave
Date: Thu, 21 Jun 2018 08:12:49 -0400
Message-ID: <CAOASepOgpsrYfcYBRA+4_UATNmN_re94R7oTjBExu8+kFL3Bqw@mail.gmail.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-14-jarkko.sakkinen@linux.intel.com> <CALCETrW3aZJMMm1GqgPm-cOD3p7JvKxLj7j85KJwfNW2iHTj4A@mail.gmail.com>
 <CALCETrVp1ZhrxF5bQDSaZpLucS88tErejj5JC6Jb0fB5etWRbA@mail.gmail.com>
 <20180611115255.GC22164@hmswarspite.think-freely.org> <CALCETrX6SD0ThNzpjkbXd7CbNTguzqiQhWMomGK+tocx_DE9XQ@mail.gmail.com>
 <20180612174535.GE19168@hmswarspite.think-freely.org> <CALCETrV-4D-M2ap1EFHQiQerYf_XgwLmBAx5WMvcCUefOODjOA@mail.gmail.com>
 <CAOASepN9t3jF4ajfKLG_odTZddOvXjY_DqLQhRPWhJ-imtjkgg@mail.gmail.com> <e3f8e5b9-aa1e-20da-37ac-3c3caafa66bc@fortanix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e3f8e5b9-aa1e-20da-37ac-3c3caafa66bc@fortanix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jethro@fortanix.com
Cc: luto@kernel.org, Neil Horman <nhorman@redhat.com>, jarkko.sakkinen@linux.intel.com, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, intel-sgx-kernel-dev@lists.01.org, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org, Peter Jones <pjones@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 20, 2018 at 2:16 PM Jethro Beekman <jethro@fortanix.com> wrote:
>
> On 2018-06-20 09:28, Nathaniel McCallum wrote:
> > As I understand it, the current policy models under discussion look like this:
> >
> > 1. SGX w/o FLC (not being merged) looks like this:
> >    Intel CPU => (Intel signed) launch enclave => enclaves
>
> I think you mean:
>
>       Intel CPU => kernel => (Intel signed) launch enclave => enclaves

I get what you mean. But it wasn't what I intended. I'm referring to
cryptographic policy. While it is true that the kernel would provide
hardware support and would still enforce other non-cryptographic
policy under this model (such as filesystem permissions to /dev/sgx),
the kernel doesn't verify signatures or pick the key used to verify
signatures. The Intel CPU validates the signature of the launch
enclave using a hard-coded key. Since the kernel doesn't get to pick
the key, it has no say in the cryptographic policy.

> > 2. SGX w/ FLC, looks like this:
> >    Intel CPU => kernel => launch enclave => enclaves

In this case, the kernel picks the key used to verify the signature of
the LE and writes it to the appropriate MSRs. So it has a say in the
policy chain.

> > 3. Andy is proposing this:
> >    Intel CPU => kernel => enclaves

In this case, the kernel basically throws away the concept of LEs
based on the fact that proposal #2 doesn't actually reduce the attack
surface and therefore adds complexity without security. So the kernel
takes over the evaluation of the cryptographic policy.

> > This proposal is based on the fact that if the kernel can write to the
> > MSRs then a kernel compromise allows an attacker to run their own
> > launch enclave and therefore having an independent launch enclave adds
> > only complexity but not security.
> >
> > Is it possible to restrict the ability of the kernel to change the
> > MSRs? For example, could a UEFI module manage the MSRs? Could the
> > launch enclave live entirely within that UEFI module?
>
> On 2017-03-17 09:15, Jethro Beekman wrote:
>  > While collecting my thoughts about the issue I read through the
>  > documentation again and it seems that it will not be possible for a
>  > platform to lock in a non-Intel hash at all. From Section 39.1.4 of the
>  > latest Intel SDM:
>  >
>  >  > IA32_SGXLEPUBKEYHASH defaults to digest of Intel’s launch enclave
>  >  > signing key after reset.
>  >  >
>  >  > IA32_FEATURE_CONTROL bit 17 controls the permissions on the
>  >  > IA32_SGXLEPUBKEYHASH MSRs when CPUID.(EAX=12H, ECX=00H):EAX[0] = 1.
>  >  > If IA32_FEATURE_CONTROL is locked with bit 17 set,
>  >  > IA32_SGXLEPUBKEYHASH MSRs are reconfigurable (writeable). If either
>  >  > IA32_FEATURE_CONTROL is not locked or bit 17 is clear, the MSRs are
>  >  > read only.
>  >
>  > This last bit is also repeated in different words in Table 35-2 and
>  > Section 42.2.2. The MSRs are *not writable* before the write-lock bit
>  > itself is locked. Meaning the MSRs are either locked with Intel's key
>  > hash, or not locked at all.
>
> >
> > 4. I am suggesting this:
> >    Intel CPU => UEFI module => enclaves
> >
> > Under this architecture, the kernel isn't involved in policy at all
> > and users get exactly the same freedoms they already have with Secure
> > Boot. Further, the launch enclave can be independently updated and
> > could be distributed in linux-firmware. The UEFI module can also be
> > shared across operating systems. If I want to have my own enclave
> > policy, then I can build the UEFI module myself, with my
> > modifications, and I can disable Secure Boot. Alternatively,
> > distributions that want to set their own policies can build their own
> > UEFI module and sign it with their vendor key.
>
> Jethro Beekman | Fortanix
>
