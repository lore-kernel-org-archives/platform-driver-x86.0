From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel_punit_ipc: add NULL check for input parameters
Date: Thu, 14 Jan 2016 14:23:17 -0800
Message-ID: <20160114222317.GC1989@malice.jf.intel.com>
References: <1452249147-34712-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34078 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752476AbcANWXT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Jan 2016 17:23:19 -0500
Content-Disposition: inline
In-Reply-To: <1452249147-34712-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, andriy.shevchenko@linux.intel.com, souvik.k.chakravarty@intel.com

On Fri, Jan 08, 2016 at 06:32:27PM +0800, Qipeng Zha wrote:
> intel_punit_ipc_command() maybe called when in or out
> data pointers are NULL.
> 
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Queued, thank you Qipeng.

-- 
Darren Hart
Intel Open Source Technology Center
