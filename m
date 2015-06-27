From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/1] platform: x86: Deletion of checks before
 backlight_device_unregister()
Date: Sat, 27 Jun 2015 16:16:03 +0300
Message-ID: <20150627131603.GF28762@mwanda>
References: <5307CAA2.8060406@users.sourceforge.net>
 <5317A59D.4@users.sourceforge.net>
 <547389A6.9090106@users.sourceforge.net>
 <3842367.ojrMxTW2rH@path>
 <5473AD39.9010309@users.sourceforge.net>
 <alpine.DEB.2.10.1411271908590.2571@hadrien>
 <20150626230655.GB57818@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:33764 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753228AbbF0NRO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 27 Jun 2015 09:17:14 -0400
Content-Disposition: inline
In-Reply-To: <20150626230655.GB57818@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, SF Markus Elfring <elfring@users.sourceforge.net>, Anisse Astier <anisse@astier.eu>, Corentin Chary <corentin.chary@gmail.com>, Ike Panhc <ike.pan@canonical.com>, Jonathan Woithe <jwoithe@just42.net>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jun 26, 2015 at 04:06:55PM -0700, Darren Hart wrote:
> Julia, do you have any particular objection to this specific patch? I didn't see
> a reason to prevent it going in.

I hate these patches...

We're saying "these functions have sanity checks so let's pass nonsense
values to them, it's fine."  It makes the code harder to understand.
There is no way for a human being to remember the complete list of
functions with sanity checks and which don't have sanity checks.

Markus has introduced quite a few bugs as well (people have so far
managed to catch his bugs before they were committed).  He so far has
resisted any suggestion that he should manually review his patches
before sending them.

Btw do have a scripts/coccinelle/free/ifnullfree.cocci which removes
checks before kfree, debugfs_remove, debugfs_remove_recursive, and
usb_free_urb.

regards,
dan carpenter
