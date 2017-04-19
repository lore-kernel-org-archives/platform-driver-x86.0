From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] hp-wmi: Fix detection for dock and tablet mode
Date: Wed, 19 Apr 2017 19:23:39 +0300
Message-ID: <CAHp75VcPm878U+m9s+AEdy7nnkkSWoqB1j2w5b5SuwSH31Y=sQ@mail.gmail.com>
References: <20170409135608.15621-1-carlo@caione.org> <20170409135608.15621-3-carlo@caione.org>
 <20170413182150.GI2064@fury> <CAL9uMOG_3Ov6+bgDoHWYUgSKG9YbXs-vk0XsnOYAt+rDV48e7w@mail.gmail.com>
 <20170413230749.GA11189@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:33659 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966258AbdDSQXq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 12:23:46 -0400
In-Reply-To: <20170413230749.GA11189@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Carlo Caione <carlo@endlessm.com>, Carlo Caione <carlo@caione.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>

On Fri, Apr 14, 2017 at 2:07 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Thu, Apr 13, 2017 at 10:09:43PM +0200, Carlo Caione wrote:
>> On Thu, Apr 13, 2017 at 8:21 PM, Darren Hart <dvhart@infradead.org> wrote:
>> > On Sun, Apr 09, 2017 at 03:56:08PM +0200, Carlo Caione wrote:

> EINVAL is being used to broadly here. If the input values are incorrect, then
> yes -EINVAL is the right response. However, if the query was unsuccessful, that
> is more appropriately -EIO.
>
> If the handle/method doesn't exist, that would be -ENXIO.
>
> However, your changes make the driver self-consistent and I'll apply them as is
> to testing.

Darren, if it's not yet in for-next, I would like Carlo to update his
patch 1. I think it's better if we not shadow negative error code from
the callee.

-- 
With Best Regards,
Andy Shevchenko
