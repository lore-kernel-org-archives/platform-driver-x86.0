From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] video: backlight: Remove backlight sysfs uevent
Date: Thu, 21 Nov 2013 14:33:26 +0000
Message-ID: <20131121143326.GA19773@srcf.ucam.org>
References: <20131111235700.GA29987@july>
 <002901cedf3c$a7e77a00$f7b66e00$%han@samsung.com>
 <20131112005628.GA2914@khazad-dum.debian.net>
 <1384990859.20536.4.camel@x230>
 <20131121114332.GA23710@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131121114332.GA23710@khazad-dum.debian.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Jingoo Han <jg1.han@samsung.com>, 'Kyungmin Park' <kmpark@infradead.org>, 'Henrique de Moraes Holschuh' <ibm-acpi@hmh.eng.br>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, kay@vrfy.org, 'Richard Purdie' <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 21, 2013 at 09:43:32AM -0200, Henrique de Moraes Holschuh wrote:

> With this patchset applied, as far as I can tell anything that used to be
> uevent-driven by the backlight class will break: when a process changes the
> backlight using sysfs, other processes will not be notified of the change
> anymore.  This patchset seems to break backlight uevent support in such a
> way that basically renders the entire thing useless and you might as well
> just remove uevent support entirely.

The uevent support was initially added to handle systems where pressing 
a hotkey generates an event (good) but the firmware automatically 
changes the brightness (bad). I have absolutely no idea why I added 
BACKLIGHT_UPDATE_SYSFS - BACKLIGHT_UPDATE_HOTKEY solves the problem I 
was trying to solve. I'm not aware of any userspace that relies on 
BACKLIGHT_UPDATE_SYSFS.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
