From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Tue, 14 Nov 2017 09:36:47 +0100
Message-ID: <20171114083647.uxlaov56s2xw3pua@pd.tnic>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:36308 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753184AbdKNIg4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 03:36:56 -0500
Content-Disposition: inline
In-Reply-To: <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 13, 2017 at 09:45:28PM +0200, Jarkko Sakkinen wrote:

<--- and yeah, all those patches without a commit message, need one.

> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  Documentation/index.rst         |   1 +
>  Documentation/x86/intel_sgx.rst | 131 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 132 insertions(+)
>  create mode 100644 Documentation/x86/intel_sgx.rst

...

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
> +
> +* **IA32_FEATURE_CONTROL[0]**: locks down the feature control register
> +* **IA32_FEATURE_CONTROL[17]**: allow runtime reconfiguration of
> +  IA32_SGXLEPUBKEYHASHn MSRs that define MRSIGNER hash for the launch
> +  enclave. Essentially they define a signing key that does not require
> +  EINITTOKEN to be let run.
> +
> +The BIOS can configure IA32_SGXLEPUBKEYHASHn MSRs before feature control
> +register is locked.
> +
> +It could be tempting to implement launch control by writing the MSRs
> +every time when an enclave is launched. This does not scale because for
> +generic case because BIOS might lock down the MSRs before handover to
> +the OS.

What does that mean exactly?

OEM vendor BIOS can control how many enclaves user can launch and what
signing key is loaded and lock down the feature control register so that
no other signing keys are loaded?

Or am I misreading this?

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
