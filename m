From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-rbtn: add keycode for Dell's toggle switch
Date: Thu, 30 Apr 2015 11:56:16 -0700
Message-ID: <20150430185616.GE40200@fury.dvhart.com>
References: <1429861327-28644-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44712 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752743AbbD3S4R (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Apr 2015 14:56:17 -0400
Content-Disposition: inline
In-Reply-To: <1429861327-28644-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Fri, Apr 24, 2015 at 03:42:07PM +0800, Alex Hung wrote:
> When Method(CRBT) returns 0 and 1, BIOS will not change hardware pin. As a
> result, a keycode KEY_RFKILL is required when wireless hotkey is pressed.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
>  drivers/platform/x86/dell-rbtn.c |   99 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 94 insertions(+), 5 deletions(-)

Hi Alex - what are you applying this against?

-- 
Darren Hart
Intel Open Source Technology Center
