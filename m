From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Do not register vendor backlight when
 acpi_video bl is available
Date: Sat, 18 Apr 2015 18:45:38 -0700
Message-ID: <20150419014538.GA19608@fury.dvhart.com>
References: <1429107117-7608-1-git-send-email-hdegoede@redhat.com>
 <CAGdLNWF1KXJWzcREHU2d3KycdH3YGPYbkY4ccMa_xLf-7-MXkQ@mail.gmail.com>
 <55314236.4000301@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39798 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751342AbbDSBpl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 18 Apr 2015 21:45:41 -0400
Content-Disposition: inline
In-Reply-To: <55314236.4000301@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Azael Avalos <coproscefalo@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Fri, Apr 17, 2015 at 07:26:14PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 17-04-15 18:58, Azael Avalos wrote:
> >Hi there,
> >
> >Sorry for the late reply, I've been a bit overwhelmed with work related stuff,
> >and to top it off I was having issues with one of my systems, but anyway,
> >on to the patch :-)
> >
> >2015-04-15 8:11 GMT-06:00 Hans de Goede <hdegoede@redhat.com>:
> >>commit a39f46df33c6 ("toshiba_acpi: Fix regression caused by backlight extra
> >>check code") causes the backlight to no longer work on the Toshiba Z30,
> >>reverting that commit fixes this but restores the original issue fixed
> >>by that commit.
> >>
> >>Looking at the toshiba_acpi backlight code for a fix for this I noticed that
> >>the toshiba code is the only code under platform/x86 which unconditionally
> >>registers a vendor acpi backlight interface, without checking for acpi_video
> >>backlight support first.
> >>
> >>This commit adds the necessary checks bringing toshiba_acpi in line with the
> >>other drivers, and fixing the Z30 regression without needing to revert the
> >>commit causing it.
> >>
> >>Chances are that there will be some Toshiba models which have a non working
> >>acpi-video implementation while the toshiba vendor backlight interface does
> >>work, this commit adds an empty dmi_id table where such systems can be added,
> >>this is identical to how other drivers handle such systems.
> >>
> >>BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1206036
> >>BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=86521
> >>Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>---
> >>  drivers/platform/x86/Kconfig        |  1 +
> >>  drivers/platform/x86/toshiba_acpi.c | 23 +++++++++++++++++++++++
> >>  2 files changed, 24 insertions(+)
> >>
> >>diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> >>index 9752761..f9f205c 100644
> >>--- a/drivers/platform/x86/Kconfig
> >>+++ b/drivers/platform/x86/Kconfig
> >>@@ -614,6 +614,7 @@ config ACPI_TOSHIBA
> >>         depends on INPUT
> >>         depends on RFKILL || RFKILL = n
> >>         depends on SERIO_I8042 || SERIO_I8042 = n
> >>+       depends on ACPI_VIDEO || ACPI_VIDEO = n
> >>         select INPUT_POLLDEV
> >>         select INPUT_SPARSEKMAP
> >>         ---help---
> >>diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> >>index dbcb7a8..2da716c 100644
> >>--- a/drivers/platform/x86/toshiba_acpi.c
> >>+++ b/drivers/platform/x86/toshiba_acpi.c
> >>@@ -51,6 +51,7 @@
> >>  #include <linux/acpi.h>
> >>  #include <linux/dmi.h>
> >>  #include <linux/uaccess.h>
> >>+#include <acpi/video.h>
> >>
> >
> >Is this patch intended for 4.1 (or later)?
> 
> Yes, this is intended for 4.1.
> 

Agreed, I'd like to see it in. It's a fix, so it can go in outside the merge
window, but I'd prefer sooner rather than later. If you can get a respin within
the next couple of days that would be great Hans.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
