From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v2] platform/x86: Add driver for Apple gmux device
Date: Thu, 15 Mar 2012 16:09:03 +0000
Message-ID: <20120315160903.GA7502@srcf.ucam.org>
References: <1329424465-1211-1-git-send-email-seth.forshee@canonical.com>
 <1329921457-26887-1-git-send-email-seth.forshee@canonical.com>
 <20120312142126.GA11969@srcf.ucam.org>
 <20120312145701.GA12322@ubuntu-macmini>
 <20120312150717.GA13211@srcf.ucam.org>
 <20120315154756.GE9673@ubuntu-macmini>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:55136 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031252Ab2COQJG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Mar 2012 12:09:06 -0400
Content-Disposition: inline
In-Reply-To: <20120315154756.GE9673@ubuntu-macmini>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 15, 2012 at 10:47:56AM -0500, Seth Forshee wrote:

> Turns out that acpi_video0 does work under Windows, and it also works
> under Linux depending on how the OS is booted. Doing a boot camp style
> boot gives us working acpi_video0 and apple_bl backlights. acpi_video1
> doesn't show up in a legacy boot situation, as evaluating _BCM gives an
> error.
> 
> Under EFI boot, both acpi_video backlights show up but neither works.
> The readback verify in apple_bl's probe fails, so that one doesn't show
> up. Only gmux_backlight actually works.

Ok, that's consistent. You can probably handle that case by just calling 
acpi_video_unregister() in gmux. Something like your patch looks fine 
for the apple_bl case.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
