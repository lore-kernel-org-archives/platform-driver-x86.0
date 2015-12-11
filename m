From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH V10 2/2] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Fri, 11 Dec 2015 10:08:53 -0800
Message-ID: <20151211180853.GH11972@malice.jf.intel.com>
References: <1449845100-119784-1-git-send-email-qipeng.zha@intel.com>
 <1449845100-119784-2-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53730 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750923AbbLKSIy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Dec 2015 13:08:54 -0500
Content-Disposition: inline
In-Reply-To: <1449845100-119784-2-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, andriy.shevchenko@linux.intel.com

On Fri, Dec 11, 2015 at 10:45:00PM +0800, Qipeng Zha wrote:
> This driver provides support for P-Unit mailbox IPC on Intel platforms.
> The heart of the P-Unit is the Foxton microcontroller and its firmware,
> which provide mailbox interface for power management usage.
> 
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Thank you for the quick turn-around Qipeng. I've pushed these to the testing
branch for another round of 0day automated testing. If that comes back clean,
usually in a few hours, I'll push it on to the next branch, and you should see
this in linux-next soon.

-- 
Darren Hart
Intel Open Source Technology Center
