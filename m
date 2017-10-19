From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v4 06/12] fs/pipe.c: export create_pipe_files() and
 replace_fd()
Date: Thu, 19 Oct 2017 15:36:16 +0300
Message-ID: <20171019123616.2cxu74oacerz2ljv@linux.intel.com>
References: <20171016191855.16964-1-jarkko.sakkinen@linux.intel.com>
 <20171016191855.16964-7-jarkko.sakkinen@linux.intel.com>
 <20171019080617.GA13601@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:46097 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751872AbdJSMgT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Oct 2017 08:36:19 -0400
Content-Disposition: inline
In-Reply-To: <20171019080617.GA13601@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk

On Thu, Oct 19, 2017 at 01:06:17AM -0700, Christoph Hellwig wrote:
> On Mon, Oct 16, 2017 at 10:18:49PM +0300, Jarkko Sakkinen wrote:
> > Export create_pipe_files() and replace_fd() so that the SGX driver is
> > able to create stdin and stdout pipes.
> 
> Err, no way.

What would be a better alternative?

/Jarkko
