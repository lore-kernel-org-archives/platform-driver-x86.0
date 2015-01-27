From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 1/3] intel_scu_ipc: fix indentation in few places
Date: Mon, 26 Jan 2015 16:50:03 -0800
Message-ID: <20150127005003.GA21554@vmdeb7>
References: <1421869091-11543-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40854 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756846AbbA0AuG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jan 2015 19:50:06 -0500
Content-Disposition: inline
In-Reply-To: <1421869091-11543-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Jan 21, 2015 at 09:38:09PM +0200, Andy Shevchenko wrote:
> While here, do couple of amendments:
>  - move platform variable to the function where it's used
>  - define intel_scu_ipc_check_status() static
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Series applied and queued for 3.20.

Minor wording change to 3/3 commit subject and log.

Running through testing, will push to for-next tomorrow.

Thank you Andy.

-- 
Darren Hart
Intel Open Source Technology Center
