From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][v2] dell-wireless: new driver for dell wireless button
 for Windows 8
Date: Thu, 13 Nov 2014 18:45:46 -0800
Message-ID: <20141114024546.GA3088@vmdeb7>
References: <1415775104-25105-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43287 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933518AbaKNCpu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Nov 2014 21:45:50 -0500
Content-Disposition: inline
In-Reply-To: <1415775104-25105-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Nov 12, 2014 at 02:51:44PM +0800, Alex Hung wrote:
> This is for Dell's new ACPI device for radio switches with ACPI
> ID "DELLABCE". This device is Dell's solution for Microsoft
> Windows 8's new requirement for wireless hotkeys.
> 
> When wireless hotkey is pressed, BIOS issues a Notify(RBTN, 0x80)
> which is tanslated to a keycode KEY_RFKILL to userspace.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>

Queued, thanks Alex.

-- 
Darren Hart
Intel Open Source Technology Center
