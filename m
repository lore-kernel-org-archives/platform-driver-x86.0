From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 09/11] fs/pipe.c: export create_pipe_files() and
 replace_fd()
Date: Fri, 8 Dec 2017 15:05:38 +0200
Message-ID: <20171208130538.quwqaqvawbqmehpf@linux.intel.com>
References: <20171125193132.24321-10-jarkko.sakkinen@linux.intel.com>
 <20171128143504.GA22918@infradead.org>
 <20171128204220.j7ipouoyhsbvm7zk@linux.intel.com>
 <20171128210551.GA12431@infradead.org>
 <20171128215753.qnu5krswowjq6gwn@linux.intel.com>
 <20171129231357.GA23443@infradead.org>
 <20171130164321.juvn67pu4jrjq76j@linux.intel.com>
 <1512067110.3020.24.camel@HansenPartnership.com>
 <20171204090059.wgys4vpqklampcpy@linux.intel.com>
 <20171207173738.yfzvdo2vpgaof4ax@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171207173738.yfzvdo2vpgaof4ax@linux.intel.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Christoph Hellwig <hch@infradead.org>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Dec 07, 2017 at 07:37:38PM +0200, Jarkko Sakkinen wrote:
> I think I could replace pipes with anonymous inodes. Is that a better
> idea than pipes? I can work on that v8 if the export is a show stopper
> as it seems. We are using that to do some other stuff in tpm_vtpm_proxy.

I'll go with the anon inode solution. It should be fairly easy
to implement.

/Jarkko
