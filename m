From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v1] platform/x86: wmi: Switch to use new generic UUID API
Date: Sun, 13 Aug 2017 08:23:13 -0700
Message-ID: <CALCETrX1EtzwKTwc1T==W+4GRnh0+JxyXE4rfP79ynteR2ooUg@mail.gmail.com>
References: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com>
 <CALCETrU1vJXGUXhbwNkW1qi9c73tgxT0vWN7eO=ee21BrvNq0Q@mail.gmail.com>
 <CAHp75VcFB1BDNUG729mi5BkhcR_aBX4MzvoyzdRx=LaAg9=EHQ@mail.gmail.com>
 <CALCETrVUctPyYNjkLL3uZUdxFko9=tpMchpV09VpWEhbjMT16g@mail.gmail.com> <1502633755.15214.4.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751025AbdHMPXf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2017 11:23:35 -0400
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com [209.85.217.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3D74239B4
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2017 15:23:34 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id q25so29462357uah.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2017 08:23:34 -0700 (PDT)
In-Reply-To: <1502633755.15214.4.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Aug 13, 2017 at 7:15 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Sun, 2017-08-06 at 08:43 -0700, Andy Lutomirski wrote:
>> On Fri, Aug 4, 2017 at 8:27 AM, Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>> > On Fri, Aug 4, 2017 at 6:01 PM, Andy Lutomirski <luto@kernel.org>
>> > wrote:
>> > > > On Aug 2, 2017, at 9:28 AM, Andy Shevchenko <andriy.shevchenko@l
>> > > > inux.intel.com> wrote:
>
>> > > NAK.  guid_block is a firmware interface, so opaque kernel types
>> > > don't
>> > > belong in it.
>> >
>> > I f we leave this, what do you think about everything else?
>>
>> Assuming it works, it's fine with me.  I'd be happy to test.
>
> Just sent v2.
>
>> Keep in mind that this beast is a *little-endian* GUID abomination,
>> and I don't see generic conversion helpers.  Something might need to
>> be added.
>
> Do you mean something like char16_to_guid() / char16_to_uuid() ?

No, I mean something like uuid_le_to_guid().  There's an existing
helper uuid_le_to_bin() which, for all that the implementation and
signature is ridiculous, does the right thing.
