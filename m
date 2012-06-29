From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] backlight: add support for disabling backlights via
 sysfs
Date: Fri, 29 Jun 2012 03:57:24 +0100
Message-ID: <20120629025724.GB18605@srcf.ucam.org>
References: <1340910426-13269-1-git-send-email-seth.forshee@canonical.com>
 <20120628191043.GA9777@srcf.ucam.org>
 <20120628193017.GA29456@thinkpad-t410>
 <20120628193652.GB10945@srcf.ucam.org>
 <20120628211600.GB29456@thinkpad-t410>
 <20120628211936.GA14286@srcf.ucam.org>
 <1340937839.6196.212.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1340937839.6196.212.camel@linux-s257.site>
Sender: linux-kernel-owner@vger.kernel.org
To: joeyli <jlee@suse.com>
Cc: seth.forshee@canonical.com, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 29, 2012 at 10:43:59AM +0800, joeyli wrote:

> 	http://msdn.microsoft.com/en-us/windows/hardware/gg487382.aspx
>
> In WDDM architecture, in spec p.5, there have a "Monitor" driver to
> check the WDDM driver support brightness DDI, if not, then it will use
> standard acpi method to control brightness.

What's the interaction between GPU drivers and platform drivers? For 
instance, on acer systems that have backlight control via WMI, does 
Windows use WMI, the GPU driver or ACPI?
 
-- 
Matthew Garrett | mjg59@srcf.ucam.org
