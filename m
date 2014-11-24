From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: [PATCH 1/1] platform: x86: Deletion of checks before backlight_device_unregister()
Date: Mon, 24 Nov 2014 23:12:09 +0100
Message-ID: <5473AD39.9010309@users.sourceforge.net>
References: <5307CAA2.8060406@users.sourceforge.net> <5317A59D.4@users.sourceforge.net> <547389A6.9090106@users.sourceforge.net> <3842367.ojrMxTW2rH@path>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <3842367.ojrMxTW2rH@path>
Sender: kernel-janitors-owner@vger.kernel.org
To: Anisse Astier <anisse@astier.eu>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, Jonathan Woithe <jwoithe@just42.net>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
List-Id: platform-driver-x86.vger.kernel.org

>> This issue was detected by using the Coccinelle software.
> 
> What script was used ?

A semantic patch approach which I published on the mailing lists in March
is in action on my software development system for a while.


> Is it in scripts/coccinelle ?

Not yet.

I hope that the involved update suggestions got sufficient positive feedback
to integrate five scripts there.

Regards,
Markus
