From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Transflective backlight updates
Date: Mon, 20 Jul 2015 14:40:32 -0700
Message-ID: <20150720214032.GB34611@vmdeb7>
References: <1437089632-4293-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43151 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752319AbbGTVkd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Jul 2015 17:40:33 -0400
Content-Disposition: inline
In-Reply-To: <1437089632-4293-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 16, 2015 at 05:33:52PM -0600, Azael Avalos wrote:
> This patch changes the tr function seconf parameter from bool to u32,

second

> to be in par with the rest of the TCI functions of the driver, and the

on par

> code was updated accordingly.
> 
> Also, the check for translective support was moved to the *add
> function, as the {__get, set}_lcd_brightness functions amke use of it.

make

I can make minor typographical corrections, but please do be more careful :)

> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Otherwise, looks good. No need to resend.

-- 
Darren Hart
Intel Open Source Technology Center
