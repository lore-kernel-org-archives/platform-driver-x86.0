From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-wireless: send an EV_SYN/SYN_REPORT between state
 changes
Date: Fri, 8 Dec 2017 16:10:58 -0800
Message-ID: <20171209001058.GE14187@fury>
References: <20171204002617.GA11430@jelly>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42337 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751086AbdLIALH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 19:11:07 -0500
Content-Disposition: inline
In-Reply-To: <20171204002617.GA11430@jelly>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Corentin Chary <corentin.chary@gmail.com>, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 04, 2017 at 10:26:17AM +1000, Peter Hutterer wrote:
> Sending the switch state change twice within the same frame is invalid evdev
> protocol and only works if the client handles keys immediately as well.
> Processing events immediately is incorrect, it forces a fake order of events
> that does not exist on the device.
> 
> Recent versions of libinput changed to only process the device state and
> SYN_REPORT time, so now the key event is lost.
> 
> https://bugs.freedesktop.org/show_bug.cgi?id=104041
> 
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>

Thanks Peter, queued.

-- 
Darren Hart
VMware Open Source Technology Center
