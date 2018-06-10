From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 09/13] x86, sgx: basic routines
 for enclave page cache
Date: Sat, 9 Jun 2018 22:32:21 -0700
Message-ID: <CALCETrVUGubKSS00aH5JJoc0vNkqLGPqCoaG2br2yn5cxWXz-Q@mail.gmail.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com> <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, nhorman@redhat.com, npmccallum@redhat.com, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, intel-sgx-kernel-dev@lists.01.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 8, 2018 at 10:22 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> SGX has a set of data structures to maintain information about the enclaves
> and their security properties. BIOS reserves a fixed size region of
> physical memory for these structures by setting Processor Reserved Memory
> Range Registers (PRMRR). This memory area is called Enclave Page Cache
> (EPC).
>

> +/**
> + * sgx_einit - EINIT an enclave with the appropriate LE pubkey hash
> + * @sigstruct:         a pointer to the enclave's sigstruct
> + * @token:             a pointer to the enclave's EINIT token
> + * @secs_page:         a pointer to the enclave's SECS EPC page
> + * @le_pubkey_hash:    the desired LE pubkey hash for EINIT
> + */
> +int sgx_einit(struct sgx_sigstruct *sigstruct, struct sgx_einittoken *token,
> +             struct sgx_epc_page *secs_page, u64 le_pubkey_hash[4])
> +{
> +       u64 __percpu *cache;
> +       void *secs;
> +       int i, ret;
> +
> +       secs = sgx_get_page(secs_page);
> +
> +       if (!sgx_lc_enabled) {

I'm confused.  What does this code path do?  It kind of looks like the
driver will load and just malfunction if we don't have write access to
the MSRs.  What is the intended behavior?

> +               ret = __einit(sigstruct, token, secs);
> +               goto out;
> +       }
> +
> +       cache = per_cpu(sgx_le_pubkey_hash_cache, smp_processor_id());
> +
> +       preempt_disable();
> +       for (i = 0; i < 4; i++) {
> +               if (le_pubkey_hash[i] == cache[i])
> +                       continue;
> +
> +               wrmsrl(MSR_IA32_SGXLEPUBKEYHASH0 + i, le_pubkey_hash[i]);
> +               cache[i] = le_pubkey_hash[i];
> +       }
> +       ret = __einit(sigstruct, token, secs);
> +       preempt_enable();
> +
> +out:
> +       sgx_put_page(secs);
> +       return ret;
> +}
> +EXPORT_SYMBOL(sgx_einit);
> +
