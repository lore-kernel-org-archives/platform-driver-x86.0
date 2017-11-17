From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Fri, 17 Nov 2017 13:43:10 -0800
Message-ID: <20171117214310.GB25974@fury>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40348 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936272AbdKQVnV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2017 16:43:21 -0500
Content-Disposition: inline
In-Reply-To: <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

On Mon, Nov 13, 2017 at 09:45:28PM +0200, Jarkko Sakkinen wrote:

Please do not submit patches to LKML without a commit message. There is
*always* something you can provide to give the review additional context
to aid in their review of your code.

As Thomas has noted, the various maintainers have been omitted from this
series. Always review the output of get_maintainers.pl and update the To
and Cc list accordingly for every patch. See
Documentation/process/submitting-patches.rst for details, e.g.

5) Select the recipients for your patch
12) When to use Acked-by: and Cc:

For example, for this patch:
$ scripts/get_maintainer.pl -f Documentation/x86
Thomas Gleixner <tglx@linutronix.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Ingo Molnar <mingo@redhat.com> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
"H. Peter Anvin" <hpa@zytor.com> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
linux-doc@vger.kernel.org (open list:DOCUMENTATION)

This series will need to be updated per the comments received so far, as
well as with commit messages and a complete Cc list *per patch* giving
all required parties an opportunity to review.

With respect to the obvious security nature of this series, who from the
kernel security folks are going to be reviewing this?
security@kernel.org?

Cc updated for this thread, and specifically the question regarding
location below:

> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  Documentation/index.rst         |   1 +
>  Documentation/x86/intel_sgx.rst | 131 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 132 insertions(+)
>  create mode 100644 Documentation/x86/intel_sgx.rst
> 

...

> diff --git a/Documentation/x86/intel_sgx.rst b/Documentation/x86/intel_sgx.rst
> new file mode 100644
> index 000000000000..34bcf6a2a495
> --- /dev/null
> +++ b/Documentation/x86/intel_sgx.rst
> @@ -0,0 +1,131 @@
> +===================
> +Intel(R) SGX driver
> +===================
> +
> +Introduction
> +============
> +
> +Intel(R) SGX is a set of CPU instructions that can be used by applications to
> +set aside private regions of code and data. The code outside the enclave is
> +disallowed to access the memory inside the enclave by the CPU access control.
> +In a way you can think that SGX provides inverted sandbox. It protects the
> +application from a malicious host.
> +
> +There is a new hardware unit in the processor called Memory Encryption Engine
> +(MEE) starting from the Skylake microarchitecture. BIOS can define one or many
> +MEE regions that can hold enclave data by configuring them with PRMRR registers.
> +
> +The MEE automatically encrypts the data leaving the processor package to the MEE
> +regions. The data is encrypted using a random key whose life-time is exactly one
> +power cycle.
> +
> +You can tell if your CPU supports SGX by looking into ``/proc/cpuinfo``:
> +
> +	``cat /proc/cpuinfo  | grep sgx``

Is SGX considered architectural or not? A quick search of the SDM
includes it in Volume 3:

Volume 3: Includes the full system programming guide, parts 1, 2, 3, and
4.  Describes the operating-system support environment of Intel® 64 and
IA-32 architectures, including: memory management, protection, task
management, interrupt and exception handling, multi-processor support,
thermal and power management features, debugging, performance
monitoring, system management mode, virtual machine extensions (VMX)
instructions, Intel® Virtualization Technology (Intel® VT), and Intel®
Software Guard Extensions (Intel® SGX).

https://software.intel.com/en-us/articles/intel-sdm

Depending on the answer, this impacts whether this belongs in
drivers/platform/x86 or arch/x86/platform per our recent agreement with
Thomas.

Thomas, Mingo, HPA, do you wish to see this organized/located
differently than it is here in v5?

> +Launch control
> +==============
> +
> +For launching an enclave, two structures must be provided for ENCLS(EINIT):
> +
> +1. **SIGSTRUCT:** a signed measurement of the enclave binary.
> +2. **EINITTOKEN:** the measurement, the public key of the signer and various
> +   enclave attributes. This structure contains a MAC of its contents using
> +   hardware derived symmetric key called *launch key*.
> +
> +The hardware platform contains a root key pair for signing the SIGTRUCT
> +for a *launch enclave* that is able to acquire the *launch key* for
> +creating EINITTOKEN's for other enclaves.  For the launch enclave
> +EINITTOKEN is not needed because it is signed with the private root key.
> +
> +There are two feature control bits associate with launch control

Nit: missing colon at the end of the line above ^

-- 
Darren Hart
VMware Open Source Technology Center
