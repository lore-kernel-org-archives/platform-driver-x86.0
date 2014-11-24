From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/1] platform: x86: Deletion of checks before
 backlight_device_unregister()
Date: Mon, 24 Nov 2014 00:28:54 -0800
Message-ID: <20141124082854.GD97532@vmdeb7>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <547389A6.9090106@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <547389A6.9090106@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Anisse Astier <anisse@astier.eu>, Corentin Chary <corentin.chary@gmail.com>, Ike Panhc <ike.pan@canonical.com>, Jonathan Woithe <jwoithe@just42.net>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 24, 2014 at 08:40:22PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 24 Nov 2014 20:30:29 +0100
> 
> The backlight_device_unregister() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks Markus, queued.

-- 
Darren Hart
Intel Open Source Technology Center
