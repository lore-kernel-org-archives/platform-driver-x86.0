From: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Subject: Re: [PATCH] platform/x86/asus-nb-wmi.c: Add X45U quirk
Date: Mon, 31 Oct 2016 23:59:24 -0200
Message-ID: <20161101015922.GA24983@xfiles>
References: <1477945272-4703-1-git-send-email-marcos.souza.org@gmail.com>
 <20161031221405.GA41691@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161031221405.GA41691@f23x64.localdomain>
Sender: stable-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren and Greg,

On Mon, Oct 31, 2016 at 03:14:05PM -0700, Darren Hart wrote:
> On Mon, Oct 31, 2016 at 06:21:12PM -0200, Marcos Paulo de Souza wrote:
> > Without this patch, the Asus X45U wireless card can't be turned
> > on (hard-blocked), but after a suspend/resume it just starts working.
> > 
> > Following this bug report[1], there are other cases like this one, but
> > this Asus is the only model that I can test.
> > 
> > [1] https://ubuntuforums.org/showthread.php?t=2181558
> > 
> > Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
> 
> Thanks Marcos,
> 
> As Greg pointed out, if you want this to go back to stable, you need to
> add the Cc: stable tag below your Signed-off-by. I also ask that you
> attempt to apply this yourself before sending it back to stable. Does it
> apply to 4.8? 4.1? 3.18? How far back do you want to see this backported
> to stable?
> 

I sent a new version right now, specifying 4.8.6 and 4.4.29. Hope it's correct now!

Thanks,

> -- 
> Darren Hart
> Intel Open Source Technology Center
