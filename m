From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 09/11] fs/pipe.c: export create_pipe_files() and
 replace_fd()
Date: Thu, 7 Dec 2017 19:37:38 +0200
Message-ID: <20171207173738.yfzvdo2vpgaof4ax@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-10-jarkko.sakkinen@linux.intel.com>
 <20171128143504.GA22918@infradead.org>
 <20171128204220.j7ipouoyhsbvm7zk@linux.intel.com>
 <20171128210551.GA12431@infradead.org>
 <20171128215753.qnu5krswowjq6gwn@linux.intel.com>
 <20171129231357.GA23443@infradead.org>
 <20171130164321.juvn67pu4jrjq76j@linux.intel.com>
 <1512067110.3020.24.camel@HansenPartnership.com>
 <20171204090059.wgys4vpqklampcpy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171204090059.wgys4vpqklampcpy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Christoph Hellwig <hch@infradead.org>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 04, 2017 at 11:00:59AM +0200, Jarkko Sakkinen wrote:
> On Thu, Nov 30, 2017 at 10:38:30AM -0800, James Bottomley wrote:
> > On Thu, 2017-11-30 at 18:43 +0200, Jarkko Sakkinen wrote:
> > > On Wed, Nov 29, 2017 at 03:13:57PM -0800, Christoph Hellwig wrote:
> > > > 
> > > > On Tue, Nov 28, 2017 at 11:57:53PM +0200, Jarkko Sakkinen wrote:
> > > > > 
> > > > > > 
> > > > > > Yes.  You still shall not play nasty games with file
> > > > > > descriptors.
> > > > > 
> > > > > I need to put something to file descriptors in order to have a IO
> > > > > channels for the launch enclave hosting process.
> > > > 
> > > > Just do it like any other program - open it from your userspace
> > > > program using open() and related syscalls.
> > > 
> > > In this case it would not work as the launch enclave is still part of
> > > the kernel and it would create a dependency how the user space
> > > defines paths. If using pipe specifically is an issue, I could easily
> > > use shmem file as a mean for communiation.
> > 
> > Can't you simply use 
> > 
> > sys_pipe2()
> > sys_close()
> > sys_dup2()
> > 
> > To achieve the same effect as replace_fd()/create_pipe_files()?
> > 
> > The point Christoph is making is that you can call sys_ interfaces from
> > within the kernel (carefully) and have them operate like direct
> > invocations.  Look at main.c:kernel_init_freeable() it's doing
> > something similar to what you want, except with the console, not a pipe
> > and it begins with the file table empty.
> 
> Thank you. I'll take a peek.

It doesn't apply here as it depends of the filesystem paths.

I think I could replace pipes with anonymous inodes. Is that a better
idea than pipes? I can work on that v8 if the export is a show stopper
as it seems. We are using that to do some other stuff in tpm_vtpm_proxy.

I submitted v7 of the patch set still as a self-contained driver. For
that I'm looking forward to get feedback on:

1. Could the first upstream version be a self-contained driver even if
some stuff would be eventually moved to arch/x86? There is nothing
preventing on doing that and that would be a non-intrusive way to
upstream such a large piece of functionality.
2. If for the first upstream version something needs to be placed to
arch/x86, I would like to get some guidelines on deployment. I guess
it would go under arch/x86/kernel/cpu/sgx?
3. I fixed the AES issue. Is there anything else BIG that needs to be
fixed?

/Jarkko
