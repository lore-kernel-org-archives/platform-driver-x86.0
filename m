From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 09/11] fs/pipe.c: export create_pipe_files() and
 replace_fd()
Date: Tue, 28 Nov 2017 22:42:20 +0200
Message-ID: <20171128204220.j7ipouoyhsbvm7zk@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-10-jarkko.sakkinen@linux.intel.com>
 <20171128143504.GA22918@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171128143504.GA22918@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 28, 2017 at 06:35:04AM -0800, Christoph Hellwig wrote:
> Repeated NAK - any interface that deals with raw file descriptor table
> entries has absolutely no business in a driver.
> 
> Please fix your API already.

Does it make a differnece if the code is moved to arch/x86, which could
potentially happen (see Darren's and tglx's comments on v5)? Then the
need for export will be gone.

/Jarkko
