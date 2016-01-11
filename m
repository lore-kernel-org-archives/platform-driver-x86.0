From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] surface pro 4: Add support for Surface Pro 4 Buttons
Date: Mon, 11 Jan 2016 10:38:23 -0800
Message-ID: <20160111183823.GD10643@malice.jf.intel.com>
References: <1451237389-7993-1-git-send-email-wengxt@gmail.com>
 <1451244080-940-1-git-send-email-wengxt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56495 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933187AbcAKSiZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 13:38:25 -0500
Content-Disposition: inline
In-Reply-To: <1451244080-940-1-git-send-email-wengxt@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Weng Xuetian <wengxt@gmail.com>
Cc: Chen Yu <yu.c.chen@intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Sun, Dec 27, 2015 at 11:21:20AM -0800, Weng Xuetian wrote:
> Surface Pro 4 buttons are managed by a device with _HID "MSHW0040"
> different from Surface Pro 3.
> 
> This commit adds MSHW0040 to id list to support the Surface Pro 4, and
> renames the driver to surfacepro_button accordingly.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=109871
> Signed-off-by: Weng Xuetian <wengxt@gmail.com>

Weng,

Given the feedback on renaming from Andy, Yu, and myself, I'm dropping this
patch and waiting for a v4 without the rename.

-- 
Darren Hart
Intel Open Source Technology Center
