From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH v6 09/11] fs/pipe.c: export create_pipe_files() and
 replace_fd()
Date: Thu, 30 Nov 2017 10:38:30 -0800
Message-ID: <1512067110.3020.24.camel@HansenPartnership.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
         <20171125193132.24321-10-jarkko.sakkinen@linux.intel.com>
         <20171128143504.GA22918@infradead.org>
         <20171128204220.j7ipouoyhsbvm7zk@linux.intel.com>
         <20171128210551.GA12431@infradead.org>
         <20171128215753.qnu5krswowjq6gwn@linux.intel.com>
         <20171129231357.GA23443@infradead.org>
         <20171130164321.juvn67pu4jrjq76j@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171130164321.juvn67pu4jrjq76j@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Christoph Hellwig <hch@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2017-11-30 at 18:43 +0200, Jarkko Sakkinen wrote:
> On Wed, Nov 29, 2017 at 03:13:57PM -0800, Christoph Hellwig wrote:
> > 
> > On Tue, Nov 28, 2017 at 11:57:53PM +0200, Jarkko Sakkinen wrote:
> > > 
> > > > 
> > > > Yes.  You still shall not play nasty games with file
> > > > descriptors.
> > > 
> > > I need to put something to file descriptors in order to have a IO
> > > channels for the launch enclave hosting process.
> > 
> > Just do it like any other program - open it from your userspace
> > program using open() and related syscalls.
> 
> In this case it would not work as the launch enclave is still part of
> the kernel and it would create a dependency how the user space
> defines paths. If using pipe specifically is an issue, I could easily
> use shmem file as a mean for communiation.

Can't you simply use 

sys_pipe2()
sys_close()
sys_dup2()

To achieve the same effect as replace_fd()/create_pipe_files()?

The point Christoph is making is that you can call sys_ interfaces from
within the kernel (carefully) and have them operate like direct
invocations.  Look at main.c:kernel_init_freeable() it's doing
something similar to what you want, except with the console, not a pipe
and it begins with the file table empty.

James
