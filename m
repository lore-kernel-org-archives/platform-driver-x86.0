From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Improve explanation about
 DELLABC6
Date: Sat, 3 Jun 2017 12:25:48 -0700
Message-ID: <20170603192548.GF4854@fury>
References: <c3d605a0a82e819891fec18b4057406358878a76.1495862179.git.dvhart@infradead.org>
 <CAHp75VeV0tKOFFxOC6n7htJLb_J_4JH8_wCk-G6LBRc9poVf8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:48412 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbdFCTZu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 3 Jun 2017 15:25:50 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VeV0tKOFFxOC6n7htJLb_J_4JH8_wCk-G6LBRc9poVf8Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Mario Limonciello <mario_limonciello@dell.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>

On Sat, May 27, 2017 at 07:27:19PM +0300, Andy Shevchenko wrote:
> On Sat, May 27, 2017 at 8:16 AM, Darren Hart <dvhart@infradead.org> wrote:
> > From: Andy Lutomirski <luto@kernel.org>
> >
> > According to Mario at Dell, the DELLABC6 device should not be used on a
> > Linux system. It also conflicts with Intel-HID and its interactions with
> > Network Manager. Document that we are aware of the device, but that we
> > are intentionally ignoring it.
> >
> 
> Pali made a good point.
> Otherwise, FWIW:
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Agreed, updated to remove specific mention of NetworkManager.

Thanks.

-- 
Darren Hart
VMware Open Source Technology Center
