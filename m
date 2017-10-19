From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 06/12] fs/pipe.c: export create_pipe_files() and
 replace_fd()
Date: Thu, 19 Oct 2017 01:06:17 -0700
Message-ID: <20171019080617.GA13601@infradead.org>
References: <20171016191855.16964-1-jarkko.sakkinen@linux.intel.com>
 <20171016191855.16964-7-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171016191855.16964-7-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 16, 2017 at 10:18:49PM +0300, Jarkko Sakkinen wrote:
> Export create_pipe_files() and replace_fd() so that the SGX driver is
> able to create stdin and stdout pipes.

Err, no way.
