From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 01/11] intel_sgx: updated MAINTAINERS
Date: Fri, 17 Nov 2017 13:54:22 -0800
Message-ID: <20171117215422.GD25974@fury>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-2-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:34152 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936515AbdKQVyX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2017 16:54:23 -0500
Content-Disposition: inline
In-Reply-To: <20171113194528.28557-2-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 13, 2017 at 09:45:18PM +0200, Jarkko Sakkinen wrote:
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2d3d750b19c0..30a4b7f97a93 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14932,6 +14932,11 @@ L:	linux-mm@kvack.org
>  S:	Maintained
>  F:	mm/zswap.c
>  
> +INTEL SGX
> +M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

It is clear from the review thus far that this is going to need
additional entries here. Likely from the x86 folks at the very least. If
not maintainers then at least reviewers (R:).

> +L:	intel-sgx-kernel-dev@lists.01.org
> +Q:	https://patchwork.kernel.org/project/intel-sgx/list/

F: entries here

-- 
Darren Hart
VMware Open Source Technology Center
