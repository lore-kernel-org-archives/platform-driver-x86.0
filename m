From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 3 14 to no_hw_rfkill dmi
 list
Date: Mon, 10 Aug 2015 20:31:28 -0700
Message-ID: <20150811033128.GC3095@vmdeb7>
References: <1439196345-3234-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34319 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752609AbbHKDc5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Aug 2015 23:32:57 -0400
Content-Disposition: inline
In-Reply-To: <1439196345-3234-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org

On Mon, Aug 10, 2015 at 10:45:45AM +0200, Hans de Goede wrote:
> Like some of the other Yoga models the Lenovo Yoga 3 14 does not have a
> hw rfkill switch, and trying to read the hw rfkill switch through the
> ideapad module causes it to always reported blocking breaking wifi.
> 
> This commit adds the Lenovo Yoga 3 14 to the no_hw_rfkill dmi list, fixing
> the wifi breakage.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1239050
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Queued for testing, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
