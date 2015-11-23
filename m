From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 0/2] toshiba_acpi: Add WWAN support
Date: Mon, 23 Nov 2015 10:56:11 -0800
Message-ID: <20151123185611.GS7413@malice.jf.intel.com>
References: <1448300951-5492-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45087 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754984AbbKWS4N (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Nov 2015 13:56:13 -0500
Content-Disposition: inline
In-Reply-To: <1448300951-5492-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 23, 2015 at 10:49:09AM -0700, Azael Avalos wrote:
> These two patches add WWAN support to the driver, the first adds the actual
> support functions and the second adds RFKill handler functions to set the
> device status according to the killswitch.
> 
> Changes since v2:
> - Changed code according to review comments
> 
> Changes since v1:
> - Added missing calls to rfkill_unregister and rfkill_destroy functions
> 
> Azael Avalos (2):
>   toshiba_acpi: Add support for WWAN devices
>   toshiba_acpi: Add WWAN RFKill support
> 
>  drivers/platform/x86/toshiba_acpi.c | 188 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 185 insertions(+), 3 deletions(-)

Queued to testing, thanks Azael.

In particular, thank you for the comments in the ACPI calls which document the
expected firmware interface.

-- 
Darren Hart
Intel Open Source Technology Center
