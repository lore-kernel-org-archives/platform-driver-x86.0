From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 09/11] fs/pipe.c: export create_pipe_files() and
 replace_fd()
Date: Thu, 30 Nov 2017 18:43:21 +0200
Message-ID: <20171130164321.juvn67pu4jrjq76j@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-10-jarkko.sakkinen@linux.intel.com>
 <20171128143504.GA22918@infradead.org>
 <20171128204220.j7ipouoyhsbvm7zk@linux.intel.com>
 <20171128210551.GA12431@infradead.org>
 <20171128215753.qnu5krswowjq6gwn@linux.intel.com>
 <20171129231357.GA23443@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171129231357.GA23443@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Nov 29, 2017 at 03:13:57PM -0800, Christoph Hellwig wrote:
> On Tue, Nov 28, 2017 at 11:57:53PM +0200, Jarkko Sakkinen wrote:
> > > Yes.  You still shall not play nasty games with file descriptors.
> > 
> > I need to put something to file descriptors in order to have a IO
> > channels for the launch enclave hosting process.
> 
> Just do it like any other program - open it from your userspace
> program using open() and related syscalls.

In this case it would not work as the launch enclave is still part of
the kernel and it would create a dependency how the user space defines
paths. If using pipe specifically is an issue, I could easily use shmem
file as a mean for communiation.

The way I implemented is much like how I did arch/x86/realmode with HPA
and it has kind of comparable requirements, part of the kernel but not
exactly code living in the kernel namespace.

/Jarkko
