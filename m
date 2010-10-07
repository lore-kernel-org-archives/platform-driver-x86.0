From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-laptop: Add hwswitch_only module parameter
Date: Thu, 7 Oct 2010 12:15:10 +0100
Message-ID: <20101007111510.GA19624@srcf.ucam.org>
References: <1286422207-14248-1-git-send-email-keng-yu.lin@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:43744 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751495Ab0JGLPT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Oct 2010 07:15:19 -0400
Content-Disposition: inline
In-Reply-To: <1286422207-14248-1-git-send-email-keng-yu.lin@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Keng-Yu Lin <keng-yu.lin@canonical.com>
Cc: len.brown@intel.com, alan-jenkins@tuffmail.co.uk, superm1@ubuntu.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 07, 2010 at 11:30:07AM +0800, Keng-Yu Lin wrote:
> Some BIOS does not report the correct state of the wireless killswitch
> in the return value of SMI Class 17, Select 11.
> 
> This causes the killswitch to always stay as soft-blocked once the rfkill
> hotkey is pressed.
> 
> This patch adds a module parameter to work around this by disregarding
> the software rfkill and using only Bit 16 in the return value of
> SMI Class 17, Select 11 as the hardware killswitch.

I don't like "Fix my hardware" options. Is there any way we can identify 
this failure case?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
