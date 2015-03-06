From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/3] toshiba_acpi: Use the Hotkey Event Type function for
 keymap choosing
Date: Fri, 6 Mar 2015 10:22:48 -0800
Message-ID: <20150306182248.GH19001@vmdeb7>
References: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
 <1424973434-3032-3-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57314 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753353AbbCFSWs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Mar 2015 13:22:48 -0500
Content-Disposition: inline
In-Reply-To: <1424973434-3032-3-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 26, 2015 at 10:57:13AM -0700, Azael Avalos wrote:
> With the previous patch adding support to "Hotkey Event Type", we can
> now use the type to distinguish which keymap to use.
> 
> This patch changes the toshiba_acpi_setup_keyboard function to make
> use of the hotkey event type to choose the correct keymap without the
> need to use the DMI matching list.

Yay!

Pending discussion on 1/3.

-- 
Darren Hart
Intel Open Source Technology Center
