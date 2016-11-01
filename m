From: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Subject: Re: [PATCH] platform/x86/asus-nb-wmi.c: Add X45U quirk
Date: Mon, 31 Oct 2016 22:22:33 -0200
Message-ID: <20161101002232.GA4590@xfiles>
References: <1477945272-4703-1-git-send-email-marcos.souza.org@gmail.com>
 <20161031221405.GA41691@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36564 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S948132AbcKAAWn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Oct 2016 20:22:43 -0400
Content-Disposition: inline
In-Reply-To: <20161031221405.GA41691@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

Hi Daren and Greg,

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

Sorry, first time sending a patch to stable. I'm cloning stable here to check if this patch applies smoothly on 4.8 and 4.1, and then resend it to stable. This patch was based in 4.9-rc3, so it can be queued to rc4, since it fixes a problem to all users of this model.

Thanks Daren and Greg for guiding me in the right path of stable :)

> 
> -- 
> Darren Hart
> Intel Open Source Technology Center
