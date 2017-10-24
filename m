From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v4 06/12] fs/pipe.c: export
 create_pipe_files() and replace_fd()
Date: Tue, 24 Oct 2017 18:40:14 +0200
Message-ID: <20171024164014.yzezpxjwt22brf44@linux.intel.com>
References: <20171016191855.16964-7-jarkko.sakkinen@linux.intel.com>
 <20171019080617.GA13601@infradead.org>
 <20171019123616.2cxu74oacerz2ljv@linux.intel.com>
 <20171019145534.GA17068@infradead.org>
 <20171020101436.wyeqwle5lnj425lz@linux.intel.com>
 <ab6bc26f-f482-f23b-fcd2-85b6fbe9fcf4@intel.com>
 <20171023025539.epe763bvwuw5oadu@linux.intel.com>
 <69102fdf-221d-466b-16dd-c17e0ba0ab2f@intel.com>
 <20171024133913.jpyxdy2xymjuyd7n@linux.intel.com>
 <a42edcbb-b80c-ea2a-78c3-2d043457cc63@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:13531 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751323AbdJXQkW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Oct 2017 12:40:22 -0400
Content-Disposition: inline
In-Reply-To: <a42edcbb-b80c-ea2a-78c3-2d043457cc63@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Tue, Oct 24, 2017 at 08:10:37AM -0700, Dave Hansen wrote:
> On 10/24/2017 06:39 AM, Jarkko Sakkinen wrote:
> > On Sun, Oct 22, 2017 at 10:09:16PM -0700, Dave Hansen wrote:
> >> On 10/22/2017 07:55 PM, Jarkko Sakkinen wrote:
> >>> On Fri, Oct 20, 2017 at 07:32:42AM -0700, Dave Hansen wrote:
> >>>> I've always been curious, and the changelog and thread are curiously
> >>>> oblique on this topic: what the heck does this driver use pipes *for*?
> >>> For communication with the process hosting the launch enclave.
> >>
> >> But, why pipes?  Why does the kernel have to be the one setting these
> >> up?  Why is this communication necessary in the first place?
> > 
> > 1. Kernel gives a SIGSTRUCT instance to the LE hosting process.
> > 2. LE hosting process gives the SIGSTRUCT to the LE.
> > 3. LE gives EINITTOKEN to the LE hosting process after generating it.
> > 4. LE hosting process gives it back to the kernel.
> 
> Let me see if I can turn that into english.  Enclaves are all rooted in
> a chain of trust.  To run an enclave, you need to have that enclave
> blessed by the hardware or blessed by a "launch enclave" (aka. LE).  The
> LE is hosted inside a normal process, just as the enclave we are trying
> to launch is hosted in a normal process.  In order to launch a normal
> enclave, we talk to the LE which gives us a token that allows us to
> start a new enclave.

In a kworker turned in-the ring-3 by the user mode helper framework.

> These pipes are the mechanism that we use so that the process starting
> the new process can talk to the launch enclave.
> 
> How's that?

Client process talks to the kernel with ioctl and passes address and
SIGSTRUCT for an enclave it wants to launch. Kernel talks to the LE
hosting process with pipes currently.

For architectural enclaves such as LE that are bound to the root key
hash you don't need the token. You can pass SGX_ENCLAVE_INIT_ARCH flag
to the SGX_ICO_ENCLAVE_INIT if you are launching such an enclave. That
is what kernel does for LE. There's no recursive loops :-)

Actually I just realized that we do not need SGX_ENCLAVE_INIT_ARCH.
Kernel can deduce this by information inside the SIGSTRUCT and value
of the root key hash that it knows. Much more full proof than a flag.

> > I do not understand why using pipes for this is such a big crime to
> > implement this. I do have an alternative proposal if it is.
> 
> The crime is not writing a good changelog to explain what you are doing
> and why you need to do it.

I will refine the changelog. Hard to find the weak spots before you
expose the code for review :-) Thank you.

> 
> > What I can do is to use one struct shmem_file instance and assing it
> > to a file descriptor instead. Kernel and LE hosting process can then
> > use that for communication.
> 
> Could you explain a bit about what kind of information needs to go back
> and forth?  Is it just "give me a launch key" followed by "here you go",
> or is it more complicated than that?

Input:

1. SHA256 hash of the enclave signer public key modulus
2. SIGSTRUCT containing measurements, signature, modulus of the signer
   etc.

Output:

3. EINITTOKEN which cryptographic token generated with hardware
   generated license key (a different for each boot cycle).

I think shmem_file would be a nice alternative, better than using
pipes for this use case.

/Jarkko
