From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 700 to no_hw_rfkill dmi
 list
Date: Thu, 21 Jan 2016 13:52:51 -0800
Message-ID: <20160121215251.GF1979@malice.jf.intel.com>
References: <1453145573-15600-1-git-send-email-jwboyer@fedoraproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53616 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752850AbcAUVwy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 16:52:54 -0500
Content-Disposition: inline
In-Reply-To: <1453145573-15600-1-git-send-email-jwboyer@fedoraproject.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Josh Boyer <jwboyer@fedoraproject.org>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

On Mon, Jan 18, 2016 at 02:32:53PM -0500, Josh Boyer wrote:
> Like the Yoga 900 models the Lenovo Yoga 700 does not have a
> hw rfkill switch, and trying to read the hw rfkill switch through the
> ideapad module causes it to always reported blocking breaking wifi.
> 
> This commit adds the Lenovo Yoga 700 to the no_hw_rfkill dmi list, fixing
> the wifi breakage.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1295272
> Tested-by: <dinyar.rabady+spam@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Josh Boyer <jwboyer@fedoraproject.org>

Queued to testing, thank you.

-- 
Darren Hart
Intel Open Source Technology Center
