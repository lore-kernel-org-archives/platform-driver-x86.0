From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/2] Use acpi_dev_present()
Date: Tue, 19 Jan 2016 13:12:29 -0800
Message-ID: <20160119211229.GB3253@malice.jf.intel.com>
References: <cover.1453060661.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:36136 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757208AbcASVMh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 16:12:37 -0500
Content-Disposition: inline
In-Reply-To: <cover.1453060661.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>, Rafael Wysocki <rjw@rjwysocki.net>, Lv Zheng <lv.zheng@intel.com>, Robert Moore <robert.moore@intel.com>
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net

On Sun, Jan 17, 2016 at 09:49:41PM +0100, Lukas Wunner wrote:
> Hi Darren,
> 
> the acpi_dev_present() API has now landed in Linus' tree.
> Thus, after Linus' tree gets merged back into yours,
> it would be possible to use the API in the pdx86 drivers
> as per the following patches.
> 
> I've also pushed these to GitHub in case anyone prefers
> perusing them in a browser:
> https://github.com/l1k/linux/commits/acpi_dev_present_pdx86
> 
> This is a repost of patches submitted in November, the only
> change is one line added to the commit messages to reference
> the commit which introduces the API:
> http://thread.gmane.org/gmane.linux.alsa.devel/147414/focus=8004
> http://thread.gmane.org/gmane.linux.alsa.devel/147414/focus=8005

Who's tree did the API make it in through? That would likely be the best tree to
pull these 2 patches in from.

Robert, Lv, Rafael? Would one of you prefer to take these 2 patches using the
new API?

Alternatively, I can create a second pull request with a newer base after my
first pull request to Linus this week. It just seems smoother to go through the
tree that introduced the API if done during the same merge window.

> 
> Thanks,
> 
> Lukas
> 
> 
> Lukas Wunner (2):
>   eeepc-wmi: Use acpi_dev_present()
>   acer-wmi: Use acpi_dev_present()
> 
>  drivers/platform/x86/acer-wmi.c  | 16 ++++------------
>  drivers/platform/x86/eeepc-wmi.c | 24 ++----------------------
>  2 files changed, 6 insertions(+), 34 deletions(-)
> 
> -- 
> 1.8.5.2 (Apple Git-48)
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
