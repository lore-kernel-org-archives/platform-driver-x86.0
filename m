From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v4 06/12] fs/pipe.c: export
 create_pipe_files() and replace_fd()
Date: Sun, 22 Oct 2017 22:09:16 -0700
Message-ID: <69102fdf-221d-466b-16dd-c17e0ba0ab2f@intel.com>
References: <20171016191855.16964-1-jarkko.sakkinen@linux.intel.com>
 <20171016191855.16964-7-jarkko.sakkinen@linux.intel.com>
 <20171019080617.GA13601@infradead.org>
 <20171019123616.2cxu74oacerz2ljv@linux.intel.com>
 <20171019145534.GA17068@infradead.org>
 <20171020101436.wyeqwle5lnj425lz@linux.intel.com>
 <ab6bc26f-f482-f23b-fcd2-85b6fbe9fcf4@intel.com>
 <20171023025539.epe763bvwuw5oadu@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:2227 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750746AbdJWFJS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Oct 2017 01:09:18 -0400
In-Reply-To: <20171023025539.epe763bvwuw5oadu@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On 10/22/2017 07:55 PM, Jarkko Sakkinen wrote:
> On Fri, Oct 20, 2017 at 07:32:42AM -0700, Dave Hansen wrote:
>> I've always been curious, and the changelog and thread are curiously
>> oblique on this topic: what the heck does this driver use pipes *for*?
> For communication with the process hosting the launch enclave.

But, why pipes?  Why does the kernel have to be the one setting these
up?  Why is this communication necessary in the first place?
