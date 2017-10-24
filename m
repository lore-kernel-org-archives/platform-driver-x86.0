From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v4 06/12] fs/pipe.c: export
 create_pipe_files() and replace_fd()
Date: Tue, 24 Oct 2017 15:39:13 +0200
Message-ID: <20171024133913.jpyxdy2xymjuyd7n@linux.intel.com>
References: <20171016191855.16964-1-jarkko.sakkinen@linux.intel.com>
 <20171016191855.16964-7-jarkko.sakkinen@linux.intel.com>
 <20171019080617.GA13601@infradead.org>
 <20171019123616.2cxu74oacerz2ljv@linux.intel.com>
 <20171019145534.GA17068@infradead.org>
 <20171020101436.wyeqwle5lnj425lz@linux.intel.com>
 <ab6bc26f-f482-f23b-fcd2-85b6fbe9fcf4@intel.com>
 <20171023025539.epe763bvwuw5oadu@linux.intel.com>
 <69102fdf-221d-466b-16dd-c17e0ba0ab2f@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:12723 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751505AbdJXNjU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Oct 2017 09:39:20 -0400
Content-Disposition: inline
In-Reply-To: <69102fdf-221d-466b-16dd-c17e0ba0ab2f@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Sun, Oct 22, 2017 at 10:09:16PM -0700, Dave Hansen wrote:
> On 10/22/2017 07:55 PM, Jarkko Sakkinen wrote:
> > On Fri, Oct 20, 2017 at 07:32:42AM -0700, Dave Hansen wrote:
> >> I've always been curious, and the changelog and thread are curiously
> >> oblique on this topic: what the heck does this driver use pipes *for*?
> > For communication with the process hosting the launch enclave.
> 
> But, why pipes?  Why does the kernel have to be the one setting these
> up?  Why is this communication necessary in the first place?

1. Kernel gives a SIGSTRUCT instance to the LE hosting process.
2. LE hosting process gives the SIGSTRUCT to the LE.
3. LE gives EINITTOKEN to the LE hosting process after generating it.
4. LE hosting process gives it back to the kernel.

I do not understand why using pipes for this is such a big crime to
implement this. I do have an alternative proposal if it is.

What I can do is to use one struct shmem_file instance and assing it
to a file descriptor instead. Kernel and LE hosting process can then
use that for communication.

It would simplify the infrastructure so I will vote that anyhow even if
using pipes would turn out to be acceptable. And does this solution does
not require new exports.

I would still like to hear a better explanation than Christoph gave why
using pipes is a crime and why coredump still uses them if it is.

/Jarkko
