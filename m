From: David Airlie <airlied@redhat.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance
 number
Date: Wed, 5 Jul 2017 15:30:35 -0400 (EDT)
Message-ID: <1588258750.25982542.1499283035221.JavaMail.zimbra@redhat.com>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com> <20170613184228.GC22450@fury> <20170614154654.GA22981@pali> <201706171847.54407@pali> <20170705095113.GI2102@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:4632 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751659AbdGETah (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Jul 2017 15:30:37 -0400
In-Reply-To: <20170705095113.GI2102@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?Q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Chun-Yi Lee <jlee@suse.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, Oleksij Rempel <linux@rempel-privat.de>, =?utf-8?B?Sm/Do28=?= Paulo Rechi Vita <jprvita@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org



----- Original Message -----
> From: "Pali Rohár" <pali.rohar@gmail.com>
> To: "Chun-Yi Lee" <jlee@suse.com>, "Corentin Chary" <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net,
> "Dave Airlie" <airlied@redhat.com>, "Oleksij Rempel" <linux@rempel-privat.de>, "João Paulo Rechi Vita"
> <jprvita@gmail.com>
> Cc: "Darren Hart" <dvhart@infradead.org>, "Andy Shevchenko" <andy@infradead.org>, "Andy Lutomirski"
> <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
> Sent: Wednesday, 5 July, 2017 7:51:13 PM
> Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
> 
> On Saturday 17 June 2017 18:47:54 Pali Rohár wrote:
> > > So problematic drivers which use instance=1 without any comments are:
> > > 
> > >   acer-wmi
> > >   asus-wmi
> > >   mxm-wmi
> > 
> > Adding authors & maintainers of those drivers in loop.
> 
> Hi!
> 
> Dell drivers and acer-wmi are fixed now. So only asus-wmi and mxm-wmi
> needs to be investigated.
> 
> Adding more people who developed those drivers recently in loop. Can you
> check if instance number is used correctly or not?
> 

I've no memory of why I picked 1 or 0, I probably cut-n-paste it from
somewhere else.

Dave.
