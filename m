From: Neil Horman <nhorman@redhat.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 13/13] intel_sgx: in-kernel
 launch enclave
Date: Mon, 11 Jun 2018 07:52:55 -0400
Message-ID: <20180611115255.GC22164@hmswarspite.think-freely.org>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-14-jarkko.sakkinen@linux.intel.com>
 <CALCETrW3aZJMMm1GqgPm-cOD3p7JvKxLj7j85KJwfNW2iHTj4A@mail.gmail.com>
 <CALCETrVp1ZhrxF5bQDSaZpLucS88tErejj5JC6Jb0fB5etWRbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrVp1ZhrxF5bQDSaZpLucS88tErejj5JC6Jb0fB5etWRbA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, npmccallum@redhat.com, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, intel-sgx-kernel-dev@lists.01.org, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, andy@infradead.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jun 10, 2018 at 10:17:13PM -0700, Andy Lutomirski wrote:
> > On Jun 9, 2018, at 10:39 PM, Andy Lutomirski <luto@kernel.org> wrote:
> >
> > On Fri, Jun 8, 2018 at 10:32 AM Jarkko Sakkinen
> > <jarkko.sakkinen@linux.intel.com> wrote:
> >>
> >> The Launch Enclave (LE) generates cryptographic launch tokens for user
> >> enclaves. A launch token is used by EINIT to check whether the enclave
> >> is authorized to launch or not. By having its own launch enclave, Linux
> >> has full control of the enclave launch process.
> >>
> >> LE is wrapped into a user space proxy program that reads enclave
> >> signatures outputs launch tokens. The kernel-side glue code is
> >> implemented by using the user space helper framework.  The IPC between
> >> the LE proxy program and kernel is handled with an anonymous inode.
> >>
> >> The commit also adds enclave signing tool that is used by kbuild to
> >> measure and sign the launch enclave. CONFIG_INTEL_SGX_SIGNING_KEY points
> >> to a PEM-file for the 3072-bit RSA key that is used as the LE public key
> >> pair. The default location is:
> >>
> >>  drivers/platform/x86/intel_sgx/sgx_signing_key.pem
> >>
> >> If the default key does not exist kbuild will generate a random key and
> >> place it to this location. KBUILD_SGX_SIGN_PIN can be used to specify
> >> the passphrase for the LE public key.
> >
> > It seems to me that it might be more useful to just commit a key pair
> > into the kernel.  As far as I know, there is no security whatsoever
> > gained by keeping the private key private, so why not make
> > reproducible builds easier by simply fixing the key?
> 
> Having thought about this some more, I think that you should
> completely remove support for specifying a key. Provide a fixed key
> pair, hard code the cache, and call it a day. If you make the key
> configurable, every vendor that has any vendor keys (Debian, Ubuntu,
> Fedora, Red Hat, SuSE, Clear Linux, etc) will see that config option
> and set up their own key pair for no gain whatsoever.  Instead, it'll
> give some illusion of security and it'll slow down operations in a VM
> guest due to swapping out the values of the MSRs.  And, if the code to
> support a locked MSR that just happens to have the right value stays
> in the kernel, then we'll risk having vendors actually ship one
> distro's public key hash, and that will seriously suck.
> 
If you hard code the key pair however, doesn't that imply that anyone can sign a
user space binary as a launch enclave, and potentially gain control of the token
granting process?  It was my understanding that the value of the key pair was
that the end user was guaranteed autonomy and security over which processes
could start enclaves.  By publishing a fixed key pair, it seems to remove that
ability.

What would be nicer (I think) would be the abilty to specify both the public and
the private key at run time.  the use case here is not one in which a vendor or
os distribution ships a key pair, but one in which a downstream user doesn't
want a vendor/os distribution to have any cryptographic information installed on
their system

Neil
