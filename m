From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 900 to no_hw_rfkill dmi
 list
Date: Mon, 9 Nov 2015 13:27:46 -0800
Message-ID: <20151109212746.GH18221@malice.jf.intel.com>
References: <1447085345-32455-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447085345-32455-1-git-send-email-hdegoede@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ike Panhc <ike.pan@canonical.com>, stable@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 09, 2015 at 05:09:05PM +0100, Hans de Goede wrote:
> Like some of the other Yoga models the Lenovo Yoga 900 does not have a
> hw rfkill switch, and trying to read the hw rfkill switch through the
> ideapad module causes it to always reported blocking breaking wifi.
> 
> This commit adds the Lenovo Yoga 900 to the no_hw_rfkill dmi list, fixing
> the wifi breakage.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1275490
> Cc: stable@vger.kernel.org
> Reported-and-tested-by: Kevin Fenzi <kevin@scrye.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Queued to testing, thank you.

-- 
Darren Hart
Intel Open Source Technology Center
