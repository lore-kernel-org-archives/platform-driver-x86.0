From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-smbios: fix string overflow
Date: Wed, 8 Nov 2017 12:45:33 -0800
Message-ID: <20171108204533.GA21449@fury>
References: <20171108120844.3196747-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40804 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752207AbdKHUpi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Nov 2017 15:45:38 -0500
Content-Disposition: inline
In-Reply-To: <20171108120844.3196747-1-arnd@arndb.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andy@infradead.org>, Edward O'Callaghan <quasisec@google.com>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 08, 2017 at 01:08:39PM +0100, Arnd Bergmann wrote:
> The new sysfs code overwrites two fixed-length character arrays
> that are each one byte shorter than they need to be, to hold
> the trailing \0:
> 
> drivers/platform/x86/dell-smbios.c: In function 'build_tokens_sysfs':
> drivers/platform/x86/dell-smbios.c:494:42: error: 'sprintf' writing a terminating nul past the end of the destination [-Werror=format-overflow=]
>    sprintf(buffer_location, "%04x_location",
> drivers/platform/x86/dell-smbios.c:494:3: note: 'sprintf' output 14 bytes into a destination of size 13
> drivers/platform/x86/dell-smbios.c:506:36: error: 'sprintf' writing a terminating nul past the end of the destination [-Werror=format-overflow=]
>    sprintf(buffer_value, "%04x_value",
> drivers/platform/x86/dell-smbios.c:506:3: note: 'sprintf' output 11 bytes into a destination of size 10
> 
> This changes it to just use kasprintf(), which always gets it right.
> 
> Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Queued, thanks Arnd.

Yes, please keep the error messages. Costs us nothing and can be useful to have.

I corrected the prefix as noted, and added the details of the gcc and reverted
patch for reproducer context.

-- 
Darren Hart
VMware Open Source Technology Center
