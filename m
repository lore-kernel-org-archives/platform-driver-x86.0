From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v1] platform/x86: wmi: Switch to use new generic UUID API
Date: Wed, 30 Aug 2017 13:01:28 -0700
Message-ID: <CALCETrW6+MYpX+w-NKq8Uzo8_rJk+fLGkJaZiNAr4aCFRYNUQg@mail.gmail.com>
References: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com>
 <CALCETrU1vJXGUXhbwNkW1qi9c73tgxT0vWN7eO=ee21BrvNq0Q@mail.gmail.com>
 <CAHp75VcFB1BDNUG729mi5BkhcR_aBX4MzvoyzdRx=LaAg9=EHQ@mail.gmail.com>
 <CALCETrVUctPyYNjkLL3uZUdxFko9=tpMchpV09VpWEhbjMT16g@mail.gmail.com>
 <1502633755.15214.4.camel@linux.intel.com> <CALCETrX1EtzwKTwc1T==W+4GRnh0+JxyXE4rfP79ynteR2ooUg@mail.gmail.com>
 <CALCETrVBm7c0EYEzOsaZnDCstc64ucJu49K39UD7gzS1e-UMFA@mail.gmail.com> <20170830122545.GA26045@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750793AbdH3UBu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Aug 2017 16:01:50 -0400
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com [209.85.223.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 836C321A94
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2017 20:01:49 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id d78so8770032ioe.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2017 13:01:49 -0700 (PDT)
In-Reply-To: <20170830122545.GA26045@lst.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 30, 2017 at 5:25 AM, Christoph Hellwig <hch@lst.de> wrote:
> On Sun, Aug 13, 2017 at 08:34:56AM -0700, Andy Lutomirski wrote:
>> > This specification defines a Uniform Resource Name namespace for
>> > UUIDs (Universally Unique IDentifier), also known as GUIDs (Globally
>> > Unique IDentifier).
>>
>> No, that still matches what I thought I knew: "UUID" and "GUID" are synonyms.
>
> Well, in practice they aren't - wintel GUID are big endian, and
> RFC4122 clearly states it is big endian, although it uses the term
> "network byte order":

What I'm saying is: I agree that "RFC4122 UUID" and "wintel GUID" are
different, but the new structs aren't called "RFC4122 UUID" and
"wintel GUID" - they're called "uuid" and "guid".  I think the latter
is very far from intuitive.  I read the wmi patches several times
before I figured out that they were even potentially correct.

>>
>> typedef whatever uuid_t;
>> typedef something_different uuid_le;  /* which already existed */
>>
>> extern void uuid_le_to_uuid(uuid_t *out, uuid_le *in);
>> extern void uuid_to_uuid_le(...);
>
> What's the point of converting between a RFC4122 UUID and a Wintel
> GUID?  They are used for entirely different things.

I can see at least two clean ways to design the API:

1. Make them totally separate.  Have a function to convert a string to
a uuid_le (or a guid_le or whatever you want to call it, as long as
"le" or perhaps "wintel" is involved so it's obvious.)  Have another
function to convert back.  Teach printk to understand %pULE.

2. Have a function to convert back and forth so that kernel code uses
the real RFC4122 UUID for internal representations and keep just %pU.

--Andy
