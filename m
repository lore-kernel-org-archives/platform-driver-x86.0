From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v4 06/12] fs/pipe.c: export
 create_pipe_files() and replace_fd()
Date: Mon, 23 Oct 2017 05:55:39 +0300
Message-ID: <20171023025539.epe763bvwuw5oadu@linux.intel.com>
References: <20171016191855.16964-1-jarkko.sakkinen@linux.intel.com>
 <20171016191855.16964-7-jarkko.sakkinen@linux.intel.com>
 <20171019080617.GA13601@infradead.org>
 <20171019123616.2cxu74oacerz2ljv@linux.intel.com>
 <20171019145534.GA17068@infradead.org>
 <20171020101436.wyeqwle5lnj425lz@linux.intel.com>
 <ab6bc26f-f482-f23b-fcd2-85b6fbe9fcf4@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:29190 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751113AbdJWCzn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 22 Oct 2017 22:55:43 -0400
Content-Disposition: inline
In-Reply-To: <ab6bc26f-f482-f23b-fcd2-85b6fbe9fcf4@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Fri, Oct 20, 2017 at 07:32:42AM -0700, Dave Hansen wrote:
> I've always been curious, and the changelog and thread are curiously
> oblique on this topic: what the heck does this driver use pipes *for*?

For communication with the process hosting the launch enclave.

/Jarkko
