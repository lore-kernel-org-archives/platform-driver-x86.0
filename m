From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Apply no_hw_rfkill to
 Y20-15IKBM, too
Date: Fri, 22 Jun 2018 17:00:10 -0700
Message-ID: <20180623000010.GF27466@fury>
References: <20180622085917.22969-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180622085917.22969-1-tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Andy Shevchenko <andy@infradead.org>, Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 22, 2018 at 10:59:17AM +0200, Takashi Iwai wrote:
> The commit 5d9f40b56630 ("platform/x86: ideapad-laptop: Add
> Y520-15IKBN to no_hw_rfkill") added the entry for Y20-15IKBN, and it
> turned out that another variant, Y20-15IKBM, also requires the
> no_hw_rfkill.
> 
> Trim the last letter from the string so that it matches to both
> Y20-15IKBN and Y20-15IKBM models.
> 
> Bugzilla: https://bugzilla.opensuse.org/show_bug.cgi?id=1098626
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Thanks Takashi, queued.

-- 
Darren Hart
VMware Open Source Technology Center
