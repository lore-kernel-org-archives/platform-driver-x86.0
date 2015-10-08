From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 4/4] platform:x86: Makefile/Kconfig/MAINTAINERS
 changes for Intel Telemetry
Date: Thu, 8 Oct 2015 17:52:09 +0100
Message-ID: <20151008165209.GE101005@vmdeb7>
References: <1442912500-1878-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37049 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933270AbbJHQwe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Oct 2015 12:52:34 -0400
Content-Disposition: inline
In-Reply-To: <1442912500-1878-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: platform-driver-x86@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com

On Tue, Sep 22, 2015 at 02:31:40PM +0530, Souvik Kumar Chakravarty wrote:
> Makefile, Kconfig & MAINTAINERS changes for compiling Telemetry.
> It depends on PUNIT and PMC IPC drivers.
> 
> Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Souvik, v2 seems to be the latest I have from you and checkpatch still reports
several basic coding style errors about comment blocks and comparison constant
location.

See my response to v1 regarding that on Sep 18.

-- 
Darren Hart
Intel Open Source Technology Center
