From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 08/11] intel_sgx: in-kernel launch enclave
Date: Wed, 29 Nov 2017 00:38:52 +0200
Message-ID: <20171128223852.5hcyg7kwf4su5qy5@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-9-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171125193132.24321-9-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Nov 25, 2017 at 09:29:25PM +0200, Jarkko Sakkinen wrote:
> This commits implements the in-kernel launch enclave. It is wrapped into
> a user space program that reads SIGSTRUCT instances from stdin and
> outputs launch tokens to stdout.
> 
> The commit also adds enclave signing tool that is used by kbuild to
> measure and sign the launch enclave.
> 
> CONFIG_INTEL_SGX_SIGNING_KEY points to a PEM-file for the 3072-bit RSA
> key that is used as the LE public key pair. The default location is:
> 
>   drivers/platform/x86/intel_sgx/intel_sgx_signing_key.pem
> 
> If the default key does not exist kbuild will generate a random key and
> place it to this location. KBUILD_SGX_SIGN_PIN can be used to specify
> the passphrase for the LE public key.
> 
> TinyCrypt (https://github.com/01org/tinycrypt) is used as AES
> implementation, which is not timing resistant. Eventually this needs to
> be replaced with AES-NI based implementation that could be either
> 
> - re-use existing AES-NI code in the kernel
> - have its own hand written code

The AES is the biggest remaining open I think.

I'm starting look at how to re-use kernel aesni code by linking it as
part of the enclave binary i.e. aesni-intel_asm.S. This will render
away TinyCrypt's AES code that is used ATM.

I still need TinyCrypt CMAC, which I will modify to call CBC AES
encryption routine.

Does this sound like a sufficient plan?

/Jarkko
