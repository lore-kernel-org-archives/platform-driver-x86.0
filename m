From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] drivers:platform/x86:Use ARRAY_SIZE() for the size
 calculation of the array.
Date: Fri, 22 Sep 2017 14:57:22 -0700
Message-ID: <20170922215722.GA20327@fury>
References: <1505300371-31740-1-git-send-email-allen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:46505 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752542AbdIVV5Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Sep 2017 17:57:24 -0400
Content-Disposition: inline
In-Reply-To: <1505300371-31740-1-git-send-email-allen.lkml@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Allen Pais <allen.lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, souvik.k.chakravarty@intel.com, platform-driver-x86@vger.kernel.org

On Wed, Sep 13, 2017 at 04:29:31PM +0530, Allen Pais wrote:
>  Use ARRAY_SIZE() macro instead of TELEM_EVT_LEN().
> 
> v3: Replace TELEM_EVT_LEN() with ARRAY_SIZE().
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

Thanks Allen, queued for testing with minor changelog changes.

> ---

Note: in the future, the changelog (Since v1:, Since v2: goes here, below the
--- line. Also, don't delete the previous changes. See:

Documentation/process/submitting-patches.rst

14) The canonical patch format
-- 
Darren Hart
VMware Open Source Technology Center
