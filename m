From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v5 08/11] intel_sgx: in-kernel
 launch enclave
Date: Tue, 14 Nov 2017 09:05:09 -0800
Message-ID: <1510679109.23727.6.camel@intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
         <20171113194528.28557-9-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171113194528.28557-9-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, intel-sgx-kernel-dev@lists.01.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2017-11-13 at 21:45 +0200, Jarkko Sakkinen wrote:
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
>   drivers/platform/x86/intel_sgx/intel_sgx_signing_key.pem

Unless there is some conflict you are worried about, "signing_key.pem" is
preferable as the default name so that the key is ignored via the top-level
.gitignore.  The intel_sgx dir should have also a .gitignore to exclude the
other LE related output files:

	drivers/platform/x86/intel_sgx/le/enclave/sgx_le.ss
	drivers/platform/x86/intel_sgx/le/enclave/sgxsign
	drivers/platform/x86/intel_sgx/le/sgx_le_proxy

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
> ---
