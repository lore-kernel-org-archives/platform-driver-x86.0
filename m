From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch] intel_scu_ipcutil: underflow in scu_reg_access()
Date: Sat, 30 Jan 2016 09:42:39 -0800
Message-ID: <20160130174239.GC9269@malice.jf.intel.com>
References: <20160126092425.GA15717@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50625 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932215AbcA3Rmx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 30 Jan 2016 12:42:53 -0500
Content-Disposition: inline
In-Reply-To: <20160126092425.GA15717@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sreedhara DS <sreedhara.ds@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 26, 2016 at 12:24:25PM +0300, Dan Carpenter wrote:
> "count" is controlled by the user and it can be negative.  Let's prevent
> that by making it unsigned.  You have to have CAP_SYS_RAWIO to call this
> function so the bug is not as serious as it could be.
> 
> Fixes: 5369c02d951a ('intel_scu_ipc: Utility driver for intel scu ipc')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued to fixes for 4.5-rc1 as well as stable.

Thanks Dan,


-- 
Darren Hart
Intel Open Source Technology Center
