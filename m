From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: platform: x86: Deletion of checks before backlight_device_unregister()
Date: Sat, 27 Jun 2015 12:00:13 +0200
Message-ID: <558E742D.2010907@users.sourceforge.net>
References: <5307CAA2.8060406@users.sourceforge.net> <5317A59D.4@users.sourceforge.net> <547389A6.9090106@users.sourceforge.net> <3842367.ojrMxTW2rH@path> <5473AD39.9010309@users.sourceforge.net> <alpine.DEB.2.10.1411271908590.2571@hadrien> <20150626230655.GB57818@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:63728 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752353AbbF0KAh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 27 Jun 2015 06:00:37 -0400
In-Reply-To: <20150626230655.GB57818@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Anisse Astier <anisse@astier.eu>, Corentin Chary <corentin.chary@gmail.com>, Ike Panhc <ike.pan@canonical.com>, Jonathan Woithe <jwoithe@just42.net>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Julia, do you have any particular objection to this specific patch?
> I didn't see a reason to prevent it going in.

Thanks for your interest around this concrete update suggestion.

* Would you like to distinguish the consequences a bit more
  for results from the application of the semantic patch language?

* Where do you prefer to store special extensions for
  Coccinelle's script collection

Regards,
Markus
