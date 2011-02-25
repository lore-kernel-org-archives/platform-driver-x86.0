From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] eeepc-wmi: set the touchpad toggle key code to F21
Date: Fri, 25 Feb 2011 14:12:42 +0000
Message-ID: <20110225141242.GA20786@srcf.ucam.org>
References: <1298611140-21573-1-git-send-email-keng-yu.lin@canonical.com> <AANLkTim_JKQU9J3OJ0FRQ_ZVPktAPbnzr2t8SvhL2Uzj@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:42487 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756053Ab1BYOMw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Feb 2011 09:12:52 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTim_JKQU9J3OJ0FRQ_ZVPktAPbnzr2t8SvhL2Uzj@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Keng-Yu Lin <keng-yu.lin@canonical.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, tyson.chen@canonical.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Fri, Feb 25, 2011 at 07:52:11AM +0100, Corentin Chary wrote:

> Hum, I'm not very comfortable with this patch now that we got
> KEY_TOUCHPAD_TOGGLE.
> I know, it doesn't work with current Xorg, but if we continue to
> workaround that, it'll never be fixed.
> 
> Dmitry, Matthew, any advice ?

Yeah, I'd go with Dmitry's idea for now.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
