From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 3/8] sony-laptop: ignore hard switch rfkill events
 (SPIC)
Date: Sat, 19 Feb 2011 21:46:54 +0900
Message-ID: <20110219124654.GA1726@kamineko.org>
References: <1298083952-22493-1-git-send-email-malattia@linux.it>
 <1298083952-22493-4-git-send-email-malattia@linux.it>
 <20110219030618.GA28870@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:38621
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751740Ab1BSMzR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Feb 2011 07:55:17 -0500
Content-Disposition: inline
In-Reply-To: <20110219030618.GA28870@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, thomas.klose@hiperscan.com

On Sat, Feb 19, 2011 at 03:06:18AM +0000, Matthew Garrett wrote:
> Do you possibly want to catch these and make sure the kernel rfkill 
> state matches the hardware?

hmmmm, to be honest I'm not entirely sure what the actual problem is.
Maybe it's just a timing issue that is made better by avoiding the
input/acpi event generation. For now drop this patch (there is a
different workaround using the mask parameter).

Thomas,
do you still have that TX laptop that had the problem? would you be
available to test a couple of other patches?

Thanks
-- 
mattia
:wq!
