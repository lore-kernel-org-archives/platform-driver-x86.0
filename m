From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 910-13IKB to
 no_hw_rfkill dmi list
Date: Wed, 12 Oct 2016 01:17:39 -0700
Message-ID: <20161012081739.GB4411@f23x64.localdomain>
References: <1476228482-2823-1-git-send-email-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53301 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752865AbcJLIRm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2016 04:17:42 -0400
Content-Disposition: inline
In-Reply-To: <1476228482-2823-1-git-send-email-masneyb@onstation.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Brian Masney <masneyb@onstation.org>
Cc: ike.pan@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 11, 2016 at 07:28:02PM -0400, Brian Masney wrote:
> The Lenovo Yoga 910-13IKB does not have a hw rfkill switch, and trying
> to read the hw rfkill switch through the ideapad module causes it to
> always report as blocked.
> 
> This commit adds the Lenovo Yoga 910-13IKB to the no_hw_rfkill dmi list,
> fixing the WiFI breakage.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Thanks Brian,

Queued to testing.

-- 
Darren Hart
Intel Open Source Technology Center
