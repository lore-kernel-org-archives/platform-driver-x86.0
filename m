From: Darren Hart <dvhart@infradead.org>
Subject: Re: randconfig build error with next-20151214, in
 drivers/platform/x86/toshiba_acpi.c
Date: Mon, 14 Dec 2015 15:47:40 -0800
Message-ID: <20151214234740.GN11972@malice.jf.intel.com>
References: <CA+r1ZhjPfPMHeBJDiD4DE1z0U3KT4g9vOad57KxJoOHaGiujsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37243 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932197AbbLNXrl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Dec 2015 18:47:41 -0500
Content-Disposition: inline
In-Reply-To: <CA+r1ZhjPfPMHeBJDiD4DE1z0U3KT4g9vOad57KxJoOHaGiujsA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, coproscefalo@gmail.com, platform-driver-x86@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>

On Mon, Dec 14, 2015 at 04:31:48PM -0700, Jim Davis wrote:
> Building with the attached random configuration file,
> 
> drivers/built-in.o: In function `toshiba_acpi_resume':
> toshiba_acpi.c:(.text+0xbdab11): undefined reference to `rfkill_set_hw_state'

Thanks, Azael posted a patch which I have now merged to my testing and for-next
branches.

-- 
Darren Hart
Intel Open Source Technology Center
