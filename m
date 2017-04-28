From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Fri, 28 Apr 2017 22:17:33 +0300
Message-ID: <CAHp75VcGYLSsnDgb_dzD0NVCK+aR6w7jZWfR+4nN-BfnAcdRWA@mail.gmail.com>
References: <20170217184756.15181-1-rrs@debian.org> <1487759058.9334.7.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:32908 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1164277AbdD1TRf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 15:17:35 -0400
In-Reply-To: <1487759058.9334.7.camel@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Feb 22, 2017 at 12:24 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:

> Any further comment on this patch ? Will this be accepted ?
> Please give a N/ACK.

Sorry for a long delay, but I can't go with this without clear
understanding that there is indeed no other ways available.
From what I read in the above link the main issue that driver doesn't
send SW_TABLET_MODE event through input device.
I think this is the best approach how it should go.

-- 
With Best Regards,
Andy Shevchenko
