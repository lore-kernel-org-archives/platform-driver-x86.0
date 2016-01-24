From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] ideapad-laptop: Add Lenovo Yoga 700 to no_hw_rfkill
 dmi list
Date: Sun, 24 Jan 2016 10:16:22 -0800
Message-ID: <20160124181622.GK1979@malice.jf.intel.com>
References: <1453145573-15600-1-git-send-email-jwboyer@fedoraproject.org>
 <1453650402-12805-1-git-send-email-jwboyer@fedoraproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42673 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751085AbcAXSQ1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 24 Jan 2016 13:16:27 -0500
Content-Disposition: inline
In-Reply-To: <1453650402-12805-1-git-send-email-jwboyer@fedoraproject.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Josh Boyer <jwboyer@fedoraproject.org>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

On Sun, Jan 24, 2016 at 10:46:42AM -0500, Josh Boyer wrote:
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

Queued, thank you Josh.

-- 
Darren Hart
Intel Open Source Technology Center
