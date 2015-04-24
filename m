From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] toshiba_acpi: Do not register vendor backlight when
 acpi_video bl is available
Date: Fri, 24 Apr 2015 11:10:14 -0700
Message-ID: <20150424181014.GA125479@vmdeb7>
References: <1429610492-22333-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54981 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751270AbbDXSKQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Apr 2015 14:10:16 -0400
Content-Disposition: inline
In-Reply-To: <1429610492-22333-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org

On Tue, Apr 21, 2015 at 12:01:32PM +0200, Hans de Goede wrote:
> commit a39f46df33c6 ("toshiba_acpi: Fix regression caused by backlight extra
> check code") causes the backlight to no longer work on the Toshiba Z30,
> reverting that commit fixes this but restores the original issue fixed
> by that commit.
> 
> Looking at the toshiba_acpi backlight code for a fix for this I noticed that
> the toshiba code is the only code under platform/x86 which unconditionally
> registers a vendor acpi backlight interface, without checking for acpi_video
> backlight support first.
> 
> This commit adds the necessary checks bringing toshiba_acpi in line with the
> other drivers, and fixing the Z30 regression without needing to revert the
> commit causing it.
> 
> Chances are that there will be some Toshiba models which have a non working
> acpi-video implementation while the toshiba vendor backlight interface does
> work, this commit adds an empty dmi_id table where such systems can be added,
> this is identical to how other drivers handle such systems.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1206036
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=86521
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-and-tested-by: Azael Avalos <coproscefalo@gmail.com>

Queued, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
