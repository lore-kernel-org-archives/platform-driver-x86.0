From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: Add another DMI entry for Yoga 900
Date: Wed, 19 Oct 2016 13:10:43 -0700
Message-ID: <20161019201043.GA78689@f23x64.localdomain>
References: <20161019102740.74567-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57642 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752006AbcJSUK1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Oct 2016 16:10:27 -0400
Content-Disposition: inline
In-Reply-To: <20161019102740.74567-1-mika.westerberg@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>

On Wed, Oct 19, 2016 at 01:27:40PM +0300, Mika Westerberg wrote:
> This particular laptop has its motherboard replaced and after that, even
> with the latest BIOS, some DMI identification strings have become
> "INVALID". This includes DMI_PRODUCT_VERSION which results Wifi being
> blocked.
> 
> It seems that DMI_BOARD_NAME is still valid so use that as an
> alternative for Lenovo Yoga 900.

Well, that stinks. We have a similar split for the Yoga 2 11/13/Pro.

Applied.

-- 
Darren Hart
Intel Open Source Technology Center
