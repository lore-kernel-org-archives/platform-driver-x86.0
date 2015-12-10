From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo ideapad Y700-17ISK to
 no_hw_rfkill dmi list
Date: Thu, 10 Dec 2015 15:06:00 -0800
Message-ID: <20151210230600.GG11972@malice.jf.intel.com>
References: <1449713572-16670-1-git-send-email-jwboyer@fedoraproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53477 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751688AbbLJXGD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Dec 2015 18:06:03 -0500
Content-Disposition: inline
In-Reply-To: <1449713572-16670-1-git-send-email-jwboyer@fedoraproject.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Josh Boyer <jwboyer@fedoraproject.org>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

On Wed, Dec 09, 2015 at 09:12:52PM -0500, Josh Boyer wrote:
> One of the newest ideapad models also lacks a physical hw rfkill switch,
> and trying to read the hw rfkill switch through the ideapad module
> causes it to always reported blocking breaking wifi.
> 
> Fix it by adding this model to the DMI list.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1286293
> Cc: stable@vger.kernel.org
> Signed-off-by: Josh Boyer <jwboyer@fedoraproject.org>

Queued, thanks Josh.

-- 
Darren Hart
Intel Open Source Technology Center
