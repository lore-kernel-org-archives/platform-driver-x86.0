From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/3] toshiba_acpi: Hotkey handling and keymap updates
Date: Fri, 6 Mar 2015 10:34:50 -0800
Message-ID: <20150306183450.GK19001@vmdeb7>
References: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53105 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752931AbbCFSfH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Mar 2015 13:35:07 -0500
Content-Disposition: inline
In-Reply-To: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 26, 2015 at 10:57:11AM -0700, Azael Avalos wrote:
> These patches add support to a new function that queries the supported Hotkey
> Event Type, making the use of the DMI matching unnecessary and also fixes
> the "Special Functions" mode on some laptops.
> 
> Azael Avalos (3):
>   toshiba_acpi: Add Hotkey Event Type function and definitions
>   toshiba_acpi: Use the Hotkey Event Type function for keymap choosing
>   toshiba_acpi: Fix the enabling of the Special Functions
> 
>  drivers/platform/x86/toshiba_acpi.c | 97 ++++++++++++++++++++++++-------------
>  1 file changed, 64 insertions(+), 33 deletions(-)
> 

Would you also include a MAINTAINERS update, adding yourself as the
thoshiba-acpi and possibly the toshiba-haps drivers? This helps ensure you get
Cc'd. I'll also look for you to pre-screen any other submission to these drivers
and provide your Reviewed-by before I merge them.

-- 
Darren Hart
Intel Open Source Technology Center
