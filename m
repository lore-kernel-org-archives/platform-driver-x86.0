From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/4] alienware-wmi new platform and feature support
Date: Sat, 30 Jan 2016 09:34:23 -0800
Message-ID: <20160130173423.GB9269@malice.jf.intel.com>
References: <1453421100-12984-1-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49982 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932215AbcA3Req (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 30 Jan 2016 12:34:46 -0500
Content-Disposition: inline
In-Reply-To: <1453421100-12984-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Thu, Jan 21, 2016 at 06:04:56PM -0600, Mario Limonciello wrote:
> I've got some extensions for the alienware-wmi driver that have
> been introduced for a few new platforms and can be controlled via the WMI
> interface.
> 
> Mario Limonciello (4):
>   Add support for new platform, X51-R3
>   Add support for alienware graphics amplifier
>   Add support for deep sleep control.
>   Add support for two new systems: ASM200 & ASM201

Hi Mario,

I gave these a quick scan without context from a commit message, and didn't
observe anything particularly troubling. Just a couple minor nits regarding
formatting (new lines to keep from going over 80 characters in a couple places
that weren't really necessary).

Please add commit messages to the series that will provide the reviewer and
future readers with the context they need to understand the motivation for the
patch and the intended approach against which to compare the implementation.

Thanks,

> 
>  drivers/platform/x86/alienware-wmi.c | 285 +++++++++++++++++++++++++++++++----
>  1 file changed, 252 insertions(+), 33 deletions(-)
> 
> -- 
> 1.9.1
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
