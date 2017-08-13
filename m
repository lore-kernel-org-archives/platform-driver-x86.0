From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v1] platform/x86: wmi: Switch to use new generic UUID API
Date: Sun, 13 Aug 2017 08:34:56 -0700
Message-ID: <CALCETrVBm7c0EYEzOsaZnDCstc64ucJu49K39UD7gzS1e-UMFA@mail.gmail.com>
References: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com>
 <CALCETrU1vJXGUXhbwNkW1qi9c73tgxT0vWN7eO=ee21BrvNq0Q@mail.gmail.com>
 <CAHp75VcFB1BDNUG729mi5BkhcR_aBX4MzvoyzdRx=LaAg9=EHQ@mail.gmail.com>
 <CALCETrVUctPyYNjkLL3uZUdxFko9=tpMchpV09VpWEhbjMT16g@mail.gmail.com>
 <1502633755.15214.4.camel@linux.intel.com> <CALCETrX1EtzwKTwc1T==W+4GRnh0+JxyXE4rfP79ynteR2ooUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752382AbdHMPfS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2017 11:35:18 -0400
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com [209.85.217.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90D99239BC
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2017 15:35:17 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id w45so29442382uac.5
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2017 08:35:17 -0700 (PDT)
In-Reply-To: <CALCETrX1EtzwKTwc1T==W+4GRnh0+JxyXE4rfP79ynteR2ooUg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Aug 13, 2017 at 8:23 AM, Andy Lutomirski <luto@kernel.org> wrote:
> On Sun, Aug 13, 2017 at 7:15 AM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>> On Sun, 2017-08-06 at 08:43 -0700, Andy Lutomirski wrote:
>>> On Fri, Aug 4, 2017 at 8:27 AM, Andy Shevchenko
>>> <andy.shevchenko@gmail.com> wrote:
>>> > On Fri, Aug 4, 2017 at 6:01 PM, Andy Lutomirski <luto@kernel.org>
>>> > wrote:
>>> > > > On Aug 2, 2017, at 9:28 AM, Andy Shevchenko <andriy.shevchenko@l
>>> > > > inux.intel.com> wrote:
>>
>>> > > NAK.  guid_block is a firmware interface, so opaque kernel types
>>> > > don't
>>> > > belong in it.
>>> >
>>> > I f we leave this, what do you think about everything else?
>>>
>>> Assuming it works, it's fine with me.  I'd be happy to test.
>>
>> Just sent v2.
>>
>>> Keep in mind that this beast is a *little-endian* GUID abomination,
>>> and I don't see generic conversion helpers.  Something might need to
>>> be added.
>>
>> Do you mean something like char16_to_guid() / char16_to_uuid() ?
>
> No, I mean something like uuid_le_to_guid().  There's an existing
> helper uuid_le_to_bin() which, for all that the implementation and
> signature is ridiculous, does the right thing.

Oh, crikey.  I just read the changelog here:

commit f9727a17db9bab71ddae91f74f11a8a2f9a0ece6
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed May 17 10:02:48 2017 +0200

    uuid: rename uuid types

    Our "little endian" UUID really is a Wintel GUID, so rename it and its
    helpers such (guid_t).  The big endian UUID is the only true one, so
    give it the name uuid_t.  The uuid_le and uuid_be names are retained for
    now, but will hopefully go away soon.  The exception to that are the _cmp
    helpers that will be replaced by better primitives ASAP and thus don't
    get the new names.

Andy and Christoph, can you rethink this?  As a driver writer who
doesn't want to resort to reading changelog entries to explain that
the names of structures in header files don't actually match their
accepted usage, this is awful.  Here's the actual sructure definition
in Linus' tree:

typedef struct {
        __u8 b[UUID_SIZE];
} uuid_t;

No comments.  Maybe I'll try something authoritative like RFC 4122:

> This specification defines a Uniform Resource Name namespace for
> UUIDs (Universally Unique IDentifier), also known as GUIDs (Globally
> Unique IDentifier).

No, that still matches what I thought I knew: "UUID" and "GUID" are synonyms.

As far as I know, there are exactly three representations of
UUIID/GUID: the sane big-endian one, the totally nuts Wintel
little-endian one, and text.  Why not make the Linux helpers
self-explanatory:

typedef whatever uuid_t;
typedef something_different uuid_le;  /* which already existed */

extern void uuid_le_to_uuid(uuid_t *out, uuid_le *in);
extern void uuid_to_uuid_le(...);

and then no one has to read changelogs or nasty constants in a library
file somewhere to figure out what's going on.

In any event, from my perspective as a wmi driver sometimes
maintainer, NAK to this whole patch.  It takes somewhat awkward but
reasonably clear code and updates it to make it look actively
incorrect.  If you can find a way to rework the header and helpers to
make the driver code more readable, that would be great.  In the mean
time, I think this is purely a regression.

--Andy
