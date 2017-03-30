From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/8] fujitsu-laptop: use sparse keymaps for input event
 handling
Date: Fri, 31 Mar 2017 08:55:22 +1030
Message-ID: <20170330222521.GC10297@marvin.atrad.com.au>
References: <20170324104959.GA31520@marvin.atrad.com.au>
 <20170327235719.GE23486@marvin.atrad.com.au>
 <20170328061618.GA3694@ozzy.nask.waw.pl>
 <20170328230029.GA29146@marvin.atrad.com.au>
 <20170329071926.GA1070@ozzy.nask.waw.pl>
 <CAHp75Ve2ToZW+Mp=HexjzhV82ZS38QkfK2bMxeRwuX3vu1bCsw@mail.gmail.com>
 <20170330033650.GF15472@localhost.localdomain>
 <20170330035626.GK19787@marvin.atrad.com.au>
 <20170330050430.GA3179@localhost.localdomain>
 <20170330064115.GA1068@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:58350 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932560AbdC3W0O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Mar 2017 18:26:14 -0400
Content-Disposition: inline
In-Reply-To: <20170330064115.GA1068@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Michael

On Thu, Mar 30, 2017 at 08:41:15AM +0200, Micha?? K??pie?? wrote:
> I noted your concerns about error handling in the driver ...  For the time
> being I would rather concentrate on the issues I personally consider more
> pressing as I will most likely lose access to modern Fujitsu hardware in
> about six weeks and I would really like to be able to test my patches on
> hardware on which the code touched by these patches actually runs (LEDs
> come to mind, specifically).

I have no problem with this.  Fixing consistency in connection with error
handling is certainly something which can be done by me (or anyone else)
at a later date.  I agree that the other work is more important.

Regards
  jonathan
