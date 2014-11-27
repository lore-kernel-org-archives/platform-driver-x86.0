From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 1/1] platform: x86: Deletion of checks before
 backlight_device_unregister()
Date: Thu, 27 Nov 2014 19:13:10 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1411271908590.2571@hadrien>
References: <5307CAA2.8060406@users.sourceforge.net> <5317A59D.4@users.sourceforge.net> <547389A6.9090106@users.sourceforge.net> <3842367.ojrMxTW2rH@path> <5473AD39.9010309@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5473AD39.9010309@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Anisse Astier <anisse@astier.eu>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, Jonathan Woithe <jwoithe@just42.net>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
List-Id: platform-driver-x86.vger.kernel.org



On Mon, 24 Nov 2014, SF Markus Elfring wrote:

> >> This issue was detected by using the Coccinelle software.
> >
> > What script was used ?
>
> A semantic patch approach which I published on the mailing lists in March
> is in action on my software development system for a while.
>
>
> > Is it in scripts/coccinelle ?
>
> Not yet.
>
> I hope that the involved update suggestions got sufficient positive feedback
> to integrate five scripts there.

The current scripts are very complicated, involving the interaction
between multiple scripts and a database, and I think they are not very
suitable for make coccicheck.  Also, the idea of removing the null checks
is not appropriate in all contexts.  Perhaps it could be possible to add
a script to the Linux kernel that handles a number of common cases for
which removing the null test is widely considered to be desirable.

julia
