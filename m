From: Akio Idehara <zbe64533@gmail.com>
Subject: Re: [PATCH] toshiba_acpi: Add support for transflective LCD
Date: Wed, 14 Mar 2012 02:04:47 +0900
Message-ID: <4F5F7E2F.30305@gmail.com>
References: <4F3ECEED.9000206@gmail.com> <20120312141118.GB11375@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120312141118.GB11375@srcf.ucam.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mjg59@srcf.ucam.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Charles@schwieters.org, corentin.chary@gmail.com, seth.forshee@canonical.com
List-Id: platform-driver-x86.vger.kernel.org

I also think it seems a good idea.  I'll try to make a new patch using your suggestion.

BTW, I have one question about disabling backlight interface.
My toshiba laptop has three sysfs backlight interfaces,
"acpi_video0", "intel_backlight" and "toshiba".
Fedora16 is always using "acpi_video0" interface.
If I add acpi_backlight=vendor in boot param,
then Fedora16 uses "intel_backlight".
# "toshiba" is lowest priority.
So I want to know how to disable "intel_backlight" interface.
Or enable "toshiba" interface only.

Matthew Garrett wrote:

> Is there any userspace that currently manipulates the bl_power field? 
> I'm wondering whether this should actually just be implemented by adding 
> an extra level to the backlight and having 0 change to transflective 
> mode.
> 
