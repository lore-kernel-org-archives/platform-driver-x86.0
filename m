From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86/asus-nb-wmi.c: Add X45U quirk
Date: Mon, 7 Nov 2016 10:35:05 -0800
Message-ID: <20161107183505.GA14565@f23x64.localdomain>
References: <1477965370-24892-1-git-send-email-marcos.souza.org@gmail.com>
 <20161105182404.GB100528@f23x64.localdomain>
 <20161106020510.GA6228@xfiles>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161106020510.GA6228@xfiles>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Nov 06, 2016 at 12:05:12AM -0200, Marcos Paulo de Souza wrote:
> Hi Darren,
> 
> On Sat, Nov 05, 2016 at 11:24:04AM -0700, Darren Hart wrote:
> > On Mon, Oct 31, 2016 at 11:56:10PM -0200, Marcos Paulo de Souza wrote:
> > > Without this patch, the Asus X45U wireless card can't be turned
> > > on (hard-blocked), but after a suspend/resume it just starts working.
> > > 
> > > Following this bug report[1], there are other cases like this one, but
> > > this Asus is the only model that I can test.
> > > 
> > > [1] https://ubuntuforums.org/showthread.php?t=2181558
> > > 
> > > Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
> > > Cc: <stable@vger.kernel.org>
> > > 
> > > ---
> > > This patch applies smoothly in 4.8.6 and 4.4.29. I hope now I followed
> > > the instructions correctly.
> > 
> > Hi Marcos,
> > 
> > You'll find exact steps in the stable_kernel_rules.txt document regarding how to
> > annotate the commit message with Cc lines indicating to which versions this
> > patch should be applied.
> > 
> > If, for example, you have verified that this patch is relevant only to 4.4 and
> > forward, you would include:
> > 
> > Cc: <stable@vger.kernel.org> # 4.4.x-
> > 
> > But this should mean that the patch is explicitly broken or otherwise
> > inappropriate for 4.3 and earlier.
> 
> Yes, I have misread the documentation. I could apply the patch as is just in
> the versions 4.8.6 and 4.4.29, but maybe I could rework te patch earlier versions.
> 
> But, aside from stable tree, do you agree with this change, since it fixes the
> wireless problem in this laptop?

Yes, no objection to the patch. It happened to land right about the time we were
having the "be better about how you manage your stable commits" discussion at
kernel summit, so it got some extra focus :-)

Care to resend with the Cc stable tag corrected?

-- 
Darren Hart
Intel Open Source Technology Center
