From: Till Smejkal <till.smejkal@googlemail.com>
Subject: Re: [PATCH v6 08/11] intel_sgx: in-kernel launch enclave
Date: Mon, 27 Nov 2017 10:58:28 +0100
Message-ID: <20171127095828.GA32603@aton>
References: <20171125193132.24321-9-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171125193132.24321-9-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 25 Nov 2017, Jarkko Sakkinen wrote:
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
                                   ^
                                   signing_key.pem

You forgot to change the name of the pem file in the commit message.

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
> 
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

[...]

Cheers
Till
