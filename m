From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 13/13] intel_sgx: in-kernel
 launch enclave
Date: Mon, 25 Jun 2018 12:41:08 +0300
Message-ID: <73b7e4e3712074b73f4ac8211699d24dfdced6bf.camel@linux.intel.com>
References: <20180608171216.26521-14-jarkko.sakkinen@linux.intel.com>
         <CALCETrW3aZJMMm1GqgPm-cOD3p7JvKxLj7j85KJwfNW2iHTj4A@mail.gmail.com>
         <CALCETrVp1ZhrxF5bQDSaZpLucS88tErejj5JC6Jb0fB5etWRbA@mail.gmail.com>
         <20180611115255.GC22164@hmswarspite.think-freely.org>
         <CALCETrX6SD0ThNzpjkbXd7CbNTguzqiQhWMomGK+tocx_DE9XQ@mail.gmail.com>
         <20180612174535.GE19168@hmswarspite.think-freely.org>
         <CALCETrV-4D-M2ap1EFHQiQerYf_XgwLmBAx5WMvcCUefOODjOA@mail.gmail.com>
         <CAOASepN9t3jF4ajfKLG_odTZddOvXjY_DqLQhRPWhJ-imtjkgg@mail.gmail.com>
         <e3f8e5b9-aa1e-20da-37ac-3c3caafa66bc@fortanix.com>
         <b5c81504-83cd-8150-ebe4-41355026590f@fortanix.com>
         <20180620210158.GA24328@linux.intel.com>
         <CAOASepN1AtgEhobJUVh=rcsQ_Qt8ujoEhnivV-29y=-AiyJwZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOASepN1AtgEhobJUVh=rcsQ_Qt8ujoEhnivV-29y=-AiyJwZQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathaniel McCallum <npmccallum@redhat.com>, sean.j.christopherson@intel.com
Cc: jethro@fortanix.com, luto@kernel.org, Neil Horman <nhorman@redhat.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, intel-sgx-kernel-dev@lists.01.org, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org, Peter Jones <pjones@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2018-06-21 at 08:32 -0400, Nathaniel McCallum wrote:
> This implies that it should be possible to create MSR activation (and
> an embedded launch enclave?) entirely as a UEFI module. The kernel
> would still get to manage who has access to /dev/sgx and other
> important non-cryptographic policy details. Users would still be able
> to control the cryptographic policy details (via BIOS Secure Boot
> configuration that exists today). Distributions could still control
> cryptographic policy details via signing of the UEFI module with their
> own Secure Boot key (or using something like shim). The UEFI module
> (and possibly the external launch enclave) could be distributed via
> linux-firmware.
> 
> Andy/Neil, does this work for you?

Nothing against having UEFI module for MSR activation step.

And we would move the existing in-kernel LE to firmware so that it is
avaible for locked-in-to-non-Intel-values case? 

/Jarkko
