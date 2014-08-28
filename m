From: Darren Hart <dvhart@infradead.org>
Subject: Re: [3.17 REGRESSION FIX] Revert "ideapad-laptop: Disable touchpad
 interface on Yoga models"
Date: Thu, 28 Aug 2014 01:13:06 -0700
Message-ID: <20140828081306.GA59286@vmdeb7>
References: <1408960813-12237-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40500 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934347AbaH1INM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Aug 2014 04:13:12 -0400
Content-Disposition: inline
In-Reply-To: <1408960813-12237-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, Corentin Chary <corentin.chary@gmail.com>, GOESSEL Guillaume <g_goessel@outlook.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 25, 2014 at 12:00:13PM +0200, Hans de Goede wrote:
> I've received a bug report from a user that the touchpad control part
> of the ideapad-laptop ACPI interface does work for him on his
> "Lenovo Yoga 2 13", and that this patch causes a regression for him.
> 
> Since it did not work for me when I had a "Lenovo Yoga 2 11" in my own
> hands (loaned from a friend). It seems that this is a bit of hit and miss.
> 
> Since the result of having a false positive here is worse, then the minor
> annoyance of a false touchpad disabled messages being shown after suspend /
> resume on models (or is it firmware versions?) where the interface does not
> work, simply revert the patch.
> 
> This reverts commit f79a901331a823ae370584b15cd39dd110b95a0a.
> 
> Reported-by: GOESSEL Guillaume <g_goessel@outlook.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Queued:
git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-linus

I'll send the pull request next week after some weekend travel.

Thanks,

--
Darren Hart
Intel Open Source Technology Center
