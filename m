From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4] surface pro 4: Add support for Surface Pro 4 Buttons
Date: Thu, 14 Jan 2016 15:01:00 -0800
Message-ID: <20160114230100.GF1989@malice.jf.intel.com>
References: <1451244080-940-1-git-send-email-wengxt@gmail.com>
 <1452627835-20806-1-git-send-email-wengxt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45475 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932120AbcANXBB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Jan 2016 18:01:01 -0500
Content-Disposition: inline
In-Reply-To: <1452627835-20806-1-git-send-email-wengxt@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Weng Xuetian <wengxt@gmail.com>
Cc: Chen Yu <yu.c.chen@intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Tue, Jan 12, 2016 at 11:43:55AM -0800, Weng Xuetian wrote:
> Surface Pro 4 buttons are managed by a device with _HID "MSHW0040"
> different from Surface Pro 3.
> 
> This commit adds MSHW0040 to id list to support the Surface Pro 4.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=109871
> Signed-off-by: Weng Xuetian <wengxt@gmail.com>

This is so much better, thank you Weng.

Yu, are you happy with this version?

-- 
Darren Hart
Intel Open Source Technology Center
