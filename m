From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 07/11] intel_sgx: ptrace() support
Date: Sun, 26 Nov 2017 19:01:41 +0200
Message-ID: <20171126170141.g45ysaciaokxdn2v@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-8-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:34080 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751322AbdKZRBp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Nov 2017 12:01:45 -0500
Content-Disposition: inline
In-Reply-To: <20171125193132.24321-8-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Sat, Nov 25, 2017 at 09:29:24PM +0200, Jarkko Sakkinen wrote:
> +	offset = addr & PAGE_MASK;

Should be addr & ~PAGE_MASK. Had fixup for this but it ended up not be
squashed to the series :-(

/Jarkko
