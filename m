From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] tc1100-wmi: fix build warning when CONFIG_PM not enabled
Date: Mon, 11 Jan 2016 10:31:31 -0800
Message-ID: <20160111183131.GC10643@malice.jf.intel.com>
References: <1452103379-9838-1-git-send-email-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54548 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933187AbcAKSbc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 13:31:32 -0500
Content-Disposition: inline
In-Reply-To: <1452103379-9838-1-git-send-email-colin.king@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Colin King <colin.king@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 06, 2016 at 06:02:59PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Conditionally declare suspend_data on CONFIG_PM to avoid
> the following warning when CONFIG_OM is not enabled:
> 
> drivers/platform/x86/tc1100-wmi.c:55:27: warning:
>   'suspend_data' defined but not used [-Wunused-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Queued, thank you.

-- 
Darren Hart
Intel Open Source Technology Center
