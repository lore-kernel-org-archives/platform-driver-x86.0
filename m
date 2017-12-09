From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][V2] intel-hid: add a DMI quirk to support Wacom
 MobileStudio Pro
Date: Fri, 8 Dec 2017 16:04:23 -0800
Message-ID: <20171209000423.GD14187@fury>
References: <1512618023-30209-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:51402 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750788AbdLIAE1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 19:04:27 -0500
Content-Disposition: inline
In-Reply-To: <1512618023-30209-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, jason.gerecke@wacom.com

On Thu, Dec 07, 2017 at 11:40:23AM +0800, Alex Hung wrote:
> HEBC method reports capabilities of 5 button array but Wacom
> MobileStudio Pro does not have this control method. A DMI quirk
> was created to enable 5 button array for this system.

Jason, have you been able to verify this patch with testing?

> [V2] Update DMI strings from shipping systems

Please place patch versioning detail below the --- in the future

> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197991
> 
> Reported-by: Jason Gerecke <jason.gerecke@wacom.com>
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---

here (see submitting patches docs for details)


-- 
Darren Hart
VMware Open Source Technology Center
