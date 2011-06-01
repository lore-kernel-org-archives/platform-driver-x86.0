From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-laptop: support synaptics touchpad led
Date: Wed, 1 Jun 2011 14:31:55 +0100
Message-ID: <20110601133155.GA5215@srcf.ucam.org>
References: <1306917288-8531-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:53758 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751411Ab1FANb7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jun 2011 09:31:59 -0400
Content-Disposition: inline
In-Reply-To: <1306917288-8531-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Jun 01, 2011 at 04:34:48PM +0800, AceLan Kao wrote:
> The TP-LOCK-LED would bright while TP-disablement.
> You can implement 97 command services routing of P/S2 device.
> Code like below:
> out 0x64,0x97 ;set 0x97 to command port;0x64 is command port
> out 0x60,0x01 ;set 0x01 to data port then make LED bright;0x60 is data port
> out 0x60,0x02 ;set 0x02 to data port then make LED dark
> 
> Before you send the action to the port, you must make sure the Input buffer
> is empty (port 0x64).

NAK - you're sending commands to the touchpad. The code for that needs 
to live in the touchpad driver, not dell-laptop (what happens if these 
commands are sent to different types of touchpad?). The scancode needs 
to be mapped to an appropriate keycode and userspace needs to tie them 
together.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
