From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-wmi: drop to_platform_driver macro
Date: Tue, 22 Dec 2015 13:01:24 -0800
Message-ID: <20151222210124.GQ7244@malice.jf.intel.com>
References: <e04e60378a5e76bf5f5bbde8172a850de2e11922.1450793632.git.geliangtang@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39417 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726AbbLVVB2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 22 Dec 2015 16:01:28 -0500
Content-Disposition: inline
In-Reply-To: <e04e60378a5e76bf5f5bbde8172a850de2e11922.1450793632.git.geliangtang@163.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Geliang Tang <geliangtang@163.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 22, 2015 at 10:16:13PM +0800, Geliang Tang wrote:
> to_platform_driver has been defined in platform_device.h, so drop
> this repetitive macro in asus-wmi.c.
> 
> Signed-off-by: Geliang Tang <geliangtang@163.com>

Thanks, applied.

-- 
Darren Hart
Intel Open Source Technology Center
