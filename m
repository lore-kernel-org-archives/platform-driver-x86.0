From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: platform: x86: Deletion of checks before backlight_device_unregister()
Date: Sat, 27 Jun 2015 20:06:57 +0200
Message-ID: <558EE641.7040404@users.sourceforge.net>
References: <5307CAA2.8060406@users.sourceforge.net> <5317A59D.4@users.sourceforge.net> <547389A6.9090106@users.sourceforge.net> <3842367.ojrMxTW2rH@path> <5473AD39.9010309@users.sourceforge.net> <alpine.DEB.2.10.1411271908590.2571@hadrien> <20150626230655.GB57818@vmdeb7> <20150627131603.GF28762@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:62743 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753018AbbF0SHN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 27 Jun 2015 14:07:13 -0400
In-Reply-To: <20150627131603.GF28762@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Darren Hart <dvhart@infradead.org>, Julia Lawall <julia.lawall@lip6.fr>, Anisse Astier <anisse@astier.eu>, Corentin Chary <corentin.chary@gmail.com>, Ike Panhc <ike.pan@canonical.com>, Jonathan Woithe <jwoithe@just42.net>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> There is no way for a human being to remember the complete list of
> functions with sanity checks and which don't have sanity checks.

I understand also this software development challenge.


> Markus has introduced quite a few bugs as well

I have only found other opinions about specific update suggestions.
Which of such "bugs" are real mistakes?
Are you looking for a better consensus?


> (people have so far managed to catch his bugs before they were committed).

Would you like to refer to any concrete software developers?


> He so far has resisted any suggestion that he should manually review
> his patches before sending them.

I am performing source code review to some degree.
My approach does partly not fit to your expectations.

Regards,
Markus
