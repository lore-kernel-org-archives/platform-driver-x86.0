From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v4 06/12] fs/pipe.c: export create_pipe_files() and
 replace_fd()
Date: Fri, 20 Oct 2017 13:14:55 +0300
Message-ID: <20171020101436.wyeqwle5lnj425lz@linux.intel.com>
References: <20171016191855.16964-1-jarkko.sakkinen@linux.intel.com>
 <20171016191855.16964-7-jarkko.sakkinen@linux.intel.com>
 <20171019080617.GA13601@infradead.org>
 <20171019123616.2cxu74oacerz2ljv@linux.intel.com>
 <20171019145534.GA17068@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171019145534.GA17068@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 19, 2017 at 07:55:34AM -0700, Christoph Hellwig wrote:
> On Thu, Oct 19, 2017 at 03:36:16PM +0300, Jarkko Sakkinen wrote:
> > On Thu, Oct 19, 2017 at 01:06:17AM -0700, Christoph Hellwig wrote:
> > > On Mon, Oct 16, 2017 at 10:18:49PM +0300, Jarkko Sakkinen wrote:
> > > > Export create_pipe_files() and replace_fd() so that the SGX driver is
> > > > able to create stdin and stdout pipes.
> > > 
> > > Err, no way.
> > 
> > What would be a better alternative?
> 
> Don't abuse pipes for your interface.

coredump uses pipes in a similar way. Maybe you could elaborate a bit
why this is abusing? That could help me to find something more
acceptable.

The only reasonable alternative that comes into mind would be netlink
socket.

/Jarkko
