From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] drivers/platform: make x86/intel_scu_ipc.c explicitly
 non-modular
Date: Tue, 16 Feb 2016 23:30:35 -0800
Message-ID: <20160217073035.GC22091@dvhart-mobl5.amr.corp.intel.com>
References: <1455480052-1732-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43087 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756450AbcBQHai (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 02:30:38 -0500
Content-Disposition: inline
In-Reply-To: <1455480052-1732-1-git-send-email-paul.gortmaker@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Sreedhara DS <sreedhara.ds@intel.com>, Alan Cox <alan@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Sun, Feb 14, 2016 at 03:00:52PM -0500, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> drivers/platform/x86/Kconfig:config INTEL_SCU_IPC
> drivers/platform/x86/Kconfig:   bool "Intel SCU IPC Support"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
> 
> Since module_pci_driver() uses the same init level priority as
> builtin_pci_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We don't replace module.h with init.h since the file already has that.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.

Alan, Sreedhara, any objection to Paul's changes?

This appears to have been introduced as bool in the original commit.

-- 
Darren Hart
Intel Open Source Technology Center
