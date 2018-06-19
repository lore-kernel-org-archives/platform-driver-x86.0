From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 13/13] intel_sgx: in-kernel
 launch enclave
Date: Tue, 19 Jun 2018 18:05:50 +0300
Message-ID: <20180619150550.GD8034@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-14-jarkko.sakkinen@linux.intel.com>
 <CALCETrWSDVdrrVbvEbOH06OQcBkGF-M9R5WQkQ0r4qK2oAL3vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrWSDVdrrVbvEbOH06OQcBkGF-M9R5WQkQ0r4qK2oAL3vQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, nhorman@redhat.com, npmccallum@redhat.com, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, intel-sgx-kernel-dev@lists.01.org, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, andy@infradead.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 08, 2018 at 11:50:14AM -0700, Andy Lutomirski wrote:
> On Fri, Jun 8, 2018 at 10:32 AM Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> >
> > The Launch Enclave (LE) generates cryptographic launch tokens for user
> > enclaves. A launch token is used by EINIT to check whether the enclave
> > is authorized to launch or not. By having its own launch enclave, Linux
> > has full control of the enclave launch process.
> >
> > LE is wrapped into a user space proxy program that reads enclave
> > signatures outputs launch tokens. The kernel-side glue code is
> > implemented by using the user space helper framework.  The IPC between
> > the LE proxy program and kernel is handled with an anonymous inode.
> >
> > The commit also adds enclave signing tool that is used by kbuild to
> > measure and sign the launch enclave. CONFIG_INTEL_SGX_SIGNING_KEY points
> > to a PEM-file for the 3072-bit RSA key that is used as the LE public key
> > pair. The default location is:
> 
> It might be nice to use the infrastructure that Alexei added for
> bpfilter (the umh_blob stuff) here, which is slated for merging in
> this merge window.
> 
> --Andy

Thanks, not familiar with this work. Is there any documentation for
it available?

/Jarkko
