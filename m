From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v4 06/12] fs/pipe.c: export
 create_pipe_files() and replace_fd()
Date: Tue, 24 Oct 2017 08:10:37 -0700
Message-ID: <a42edcbb-b80c-ea2a-78c3-2d043457cc63@intel.com>
References: <20171016191855.16964-1-jarkko.sakkinen@linux.intel.com>
 <20171016191855.16964-7-jarkko.sakkinen@linux.intel.com>
 <20171019080617.GA13601@infradead.org>
 <20171019123616.2cxu74oacerz2ljv@linux.intel.com>
 <20171019145534.GA17068@infradead.org>
 <20171020101436.wyeqwle5lnj425lz@linux.intel.com>
 <ab6bc26f-f482-f23b-fcd2-85b6fbe9fcf4@intel.com>
 <20171023025539.epe763bvwuw5oadu@linux.intel.com>
 <69102fdf-221d-466b-16dd-c17e0ba0ab2f@intel.com>
 <20171024133913.jpyxdy2xymjuyd7n@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171024133913.jpyxdy2xymjuyd7n@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 10/24/2017 06:39 AM, Jarkko Sakkinen wrote:
> On Sun, Oct 22, 2017 at 10:09:16PM -0700, Dave Hansen wrote:
>> On 10/22/2017 07:55 PM, Jarkko Sakkinen wrote:
>>> On Fri, Oct 20, 2017 at 07:32:42AM -0700, Dave Hansen wrote:
>>>> I've always been curious, and the changelog and thread are curiously
>>>> oblique on this topic: what the heck does this driver use pipes *for*?
>>> For communication with the process hosting the launch enclave.
>>
>> But, why pipes?  Why does the kernel have to be the one setting these
>> up?  Why is this communication necessary in the first place?
> 
> 1. Kernel gives a SIGSTRUCT instance to the LE hosting process.
> 2. LE hosting process gives the SIGSTRUCT to the LE.
> 3. LE gives EINITTOKEN to the LE hosting process after generating it.
> 4. LE hosting process gives it back to the kernel.

Let me see if I can turn that into english.  Enclaves are all rooted in
a chain of trust.  To run an enclave, you need to have that enclave
blessed by the hardware or blessed by a "launch enclave" (aka. LE).  The
LE is hosted inside a normal process, just as the enclave we are trying
to launch is hosted in a normal process.  In order to launch a normal
enclave, we talk to the LE which gives us a token that allows us to
start a new enclave.

These pipes are the mechanism that we use so that the process starting
the new process can talk to the launch enclave.

How's that?

> I do not understand why using pipes for this is such a big crime to
> implement this. I do have an alternative proposal if it is.

The crime is not writing a good changelog to explain what you are doing
and why you need to do it.

> What I can do is to use one struct shmem_file instance and assing it
> to a file descriptor instead. Kernel and LE hosting process can then
> use that for communication.

Could you explain a bit about what kind of information needs to go back
and forth?  Is it just "give me a launch key" followed by "here you go",
or is it more complicated than that?
