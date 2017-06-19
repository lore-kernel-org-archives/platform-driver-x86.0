From: Andy Lutomirski <luto@kernel.org>
Subject: Re: WMI and Kernel:User interface
Date: Mon, 19 Jun 2017 15:10:09 -0700
Message-ID: <CALCETrWvkXe7yjMYK8GrY8LMfMWWLL7GoWq4_H0nDWJ+ay8-fg@mail.gmail.com>
References: <201706101236.40663@pali> <20170612170249.GA27850@fury>
 <201706130017.29023@pali> <20170613012435.GB27850@fury> <20170613070535.GA13252@infradead.org>
 <20170613153857.GC27850@fury> <20170613155000.GA24483@kroah.com>
 <20170613162242.GF27850@fury> <20170613165247.GA32546@kroah.com>
 <20170613170719.GK27850@fury> <20170614043853.GE10146@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752645AbdFSWKc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jun 2017 18:10:32 -0400
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com [209.85.213.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6DD7E23A07
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jun 2017 22:10:31 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id p62so60017878vkp.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jun 2017 15:10:31 -0700 (PDT)
In-Reply-To: <20170614043853.GE10146@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Darren Hart <dvhart@infradead.org>, Christoph Hellwig <hch@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 9:38 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Jun 13, 2017 at 10:07:19AM -0700, Darren Hart wrote:
>> On Tue, Jun 13, 2017 at 06:52:47PM +0200, Greg Kroah-Hartman wrote:
>> > > As a concrete example, Dell has specifically made the request that we
>> > > work on a solution that doesn't require them to come back to the kernel
>> > > community each time they add a WMI GUID to their BIOS. They would like
>> > > to see those GUIDs automatically exposed.
>> >
>> > What do you mean exactly by "exposed"?  What do they do with these?  Why
>>
>> By exposed I meant: the chardev for the WMI GUID is created
>>
>> The idea being the kernel maps WMI GUIDs to chardevs and shepherds the
>> userspace calls through to the ACPI method evaluation and back. But the
>> kernel wmi driver doesn't, in general, have specific knowledge of the
>> methods or input and output formats.
>
> Hah, and those people who insist on "secure boot" are going to allow
> userspace access to ACPI methods like this?  Well, I guess as Windows
> does it, it must be ok...
>
> I'll shut up now and just wait for patches :)
>

Darren, Pali, etc, I wanted to throw out another idea for handling some of this
stuff without risking blobification: make WMI button work declaratively.  Here's
what I mean:

Currently, we have a whole bunch of WMI drivers that have a bunch of code
to do more or less the same thing.  They bind to a WMI event device,
parse events,
turn them into scancodes, and feed them to sparse_keymap_report_event.

What if we created a single driver that did this generically?  The core would
filter a WMI event device and look up each event by trying to match
it to a pattern.  A pattern is literally a bunch of bytes, where 1-4
of those bytes
are all NULL in the pattern but are marked as containing a scancode.  If there's
a match, the result is fed to sparse_keymap_report_event().  A pattern
would look
like (totally made up):

05 74 AB [0] [1] FF [2] [3]

[0] means that this byte is the low byte of the scancode.  [1] means
second byte of the scancode.  05 is a literal.

The scancode would also be programmable.

Then we let WMI drivers bind the device and feed the core a sparse
keymap and a pattern or list of patterns.  We'd also let the keymap
and the patterns be queried and edited from userspace.  Then, if a new
laptop comes out, some hwdb could feed the pattern to the kernel, and
the kernel would log the pattern that was fed in.  Then, later on, we
could update the kernel driver, or we could just leave the whole
pattern list in userspace.

Hmm?
