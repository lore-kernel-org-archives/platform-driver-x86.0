From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 09/11] fs/pipe.c: export create_pipe_files() and
 replace_fd()
Date: Wed, 29 Nov 2017 15:13:57 -0800
Message-ID: <20171129231357.GA23443@infradead.org>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-10-jarkko.sakkinen@linux.intel.com>
 <20171128143504.GA22918@infradead.org>
 <20171128204220.j7ipouoyhsbvm7zk@linux.intel.com>
 <20171128210551.GA12431@infradead.org>
 <20171128215753.qnu5krswowjq6gwn@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171128215753.qnu5krswowjq6gwn@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 28, 2017 at 11:57:53PM +0200, Jarkko Sakkinen wrote:
> > Yes.  You still shall not play nasty games with file descriptors.
> 
> I need to put something to file descriptors in order to have a IO
> channels for the launch enclave hosting process.

Just do it like any other program - open it from your userspace
program using open() and related syscalls.
