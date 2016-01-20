From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 700 to no_hw_rfkill dmi
 list
Date: Wed, 20 Jan 2016 08:47:01 -0800
Message-ID: <20160120164701.GC1979@malice.jf.intel.com>
References: <1453145573-15600-1-git-send-email-jwboyer@fedoraproject.org>
 <CA+5PVA67NAQZtrR0N4p7XVqQ6iBXYYyXebFEmwiw-ebcsDez2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+5PVA67NAQZtrR0N4p7XVqQ6iBXYYyXebFEmwiw-ebcsDez2A@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Josh Boyer <jwboyer@fedoraproject.org>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 20, 2016 at 09:18:10AM -0500, Josh Boyer wrote:
> On Mon, Jan 18, 2016 at 2:32 PM, Josh Boyer <jwboyer@fedoraproject.org> wrote:
> > Like the Yoga 900 models the Lenovo Yoga 700 does not have a
> > hw rfkill switch, and trying to read the hw rfkill switch through the
> > ideapad module causes it to always reported blocking breaking wifi.
> >
> > This commit adds the Lenovo Yoga 700 to the no_hw_rfkill dmi list, fixing
> > the wifi breakage.
> >
> > BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1295272
> > Tested-by: <dinyar.rabady+spam@gmail.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Josh Boyer <jwboyer@fedoraproject.org>
> > ---
> >
> > This applies to the for-next branch of the platform-x86-drivers tree
> 
> Just another note that this is actually a new separate entry.  The
> changelog and DMI information look similar to the patch that was just
> merged into Linus' tree, but they are different.  This patch isn't a
> resend.

Yup, understood - I just couldn't include it in yesterday's pull request as it
came in too late. As a DMI match, it will still make the 4.5 series.

-- 
Darren Hart
Intel Open Source Technology Center
