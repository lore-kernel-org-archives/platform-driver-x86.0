From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad_laptop: Add Lenovo G40-30 to devices without
 radio switch
Date: Sun, 3 May 2015 11:16:16 -0700
Message-ID: <20150503181616.GB16105@fury.dvhart.com>
References: <1430572448-32552-1-git-send-email-philippe.coval@open.eurogiciel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34431 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751179AbbECSQS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 14:16:18 -0400
Content-Disposition: inline
In-Reply-To: <1430572448-32552-1-git-send-email-philippe.coval@open.eurogiciel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Philippe Coval <philippe.coval@open.eurogiciel.org>
Cc: ike.pan@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Philippe Coval <rzr@gna.org>

On Sat, May 02, 2015 at 03:14:08PM +0200, Philippe Coval wrote:
> Lenovo G40-30 does not provide any physical radio switch to user.
> Therefore disable the rfkill switch identically to the Yoga 2 approach.
> (Note for later, models ids are sorted alphabetically).
> 
> Benefit is to make wireless available again without unloading module.
> 
> It was tested successfully on 4.1.0-rc1 base with this model:
> (LENOVO_MT_80FY_BU_idea_FM_Lenovo G40-30).
> 
> BugLink: https://bugs.launchpad.net/ideapad-laptop/+bug/1450946
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philippe Coval <rzr@gna.org>

Queued, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
