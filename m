From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH RFT] platform/x86: intel_pmc_ipc: Convert to use
 platform_device_register_full
Date: Wed, 28 Sep 2016 16:35:50 -0700
Message-ID: <20160928233550.GB7630@f23x64.localdomain>
References: <1474689248-5925-1-git-send-email-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38129 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755118AbcI1Xfx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2016 19:35:53 -0400
Content-Disposition: inline
In-Reply-To: <1474689248-5925-1-git-send-email-axel.lin@ingics.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Zha Qipeng <qipeng.zha@intel.com>, Aubrey Li <aubrey.li@linux.intel.com>, platform-driver-x86@vger.kernel.org

On Sat, Sep 24, 2016 at 11:54:08AM +0800, Axel Lin wrote:
> Use platform_device_register_full() instead of open-coded.
> 

Thanks Axel. This looks good to me. My only comment would be that the change
eliminates all the dev_err calls which will reduce the debugability some. I've
queued this to testing, but Qipeng, please speak up if you have any objections.

-- 
Darren Hart
Intel Open Source Technology Center
