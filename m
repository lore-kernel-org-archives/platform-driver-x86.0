From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v2 3/3] dmi: Make dmi_walk and dmi_walk_early return real
 error codes
Date: Tue, 19 Jan 2016 15:51:49 -0800
Message-ID: <CALCETrWXE1aG+q4aXx99X7kh6r7_dm6PuuUPfEiju7JZo7xgnQ@mail.gmail.com>
References: <cover.1453150613.git.luto@kernel.org> <9d1eb8634669ef09334c7e792eb21f20b320a07b.1453150613.git.luto@kernel.org>
 <20160119085426.7d4b1f8b@endymion.delvare> <20160119083633.GD7192@pali>
 <20160119100303.73cf6256@endymion.delvare> <20160119090736.GF7192@pali> <20160119104051.21d8e2ac@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35538 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754295AbcASXwJ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 18:52:09 -0500
Received: by mail-ob0-f180.google.com with SMTP id py5so233282035obc.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jan 2016 15:52:09 -0800 (PST)
In-Reply-To: <20160119104051.21d8e2ac@endymion.delvare>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jan 19, 2016 at 1:40 AM, Jean Delvare <jdelvare@suse.de> wrote:
> On Tue, 19 Jan 2016 10:07:36 +0100, Pali Roh=C3=A1r wrote:
>> On Tuesday 19 January 2016 10:03:03 Jean Delvare wrote:
>> > Hi Pali,
>> >
>> > On Tue, 19 Jan 2016 09:36:33 +0100, Pali Roh=C3=A1r wrote:
>> > > On Tuesday 19 January 2016 08:54:26 Jean Delvare wrote:
>> > > > > @@ -978,11 +978,11 @@ int dmi_walk(void (*decode)(const stru=
ct dmi_header *, void *),
>> > > > >       u8 *buf;
>> > > > >
>> > > > >       if (!dmi_available)
>> > > > > -             return -1;
>> > > > > +             return -ENOENT;
>> > > >
>> > > > -ENOSYS would seem more appropriate?
>> > >
>> > > IIRC -ENOSYS is for non implemented syscalls.
>> >
>> > I can see a lot of -ENOSYS in include/linux/*.h returned by stubs =
when
>> > a specific subsystem is not included. Not related to syscalls at a=
ll.
>> > This is what lead to my suggestion.
>>
>> https://lkml.org/lkml/2014/8/22/492
>
> Thanks for the pointer, I wasn't aware of that.
>
> It really should be documented. No, checkpatch.pl isn't documentation=
=2E
>
> Also the commit sadly doesn't say why using ENOSYS in other contexts =
is
> considered a bad thing. What actual trouble did it cause?

The trouble is that user code likes to assume that, when a syscall
returns -ENOSYS, that syscall isn't implemented.  Letting ENOSYS leak
out to userspace via a syscall that *is* implemented can confused
things.

>
> Are the current presumably incorrect uses of ENOSYS ultimately going =
to
> be fixed? If not, I see no point in preventing other use cases.

We at least want to prevent it from newly introduced syscalls.

I'll try to clean up the docs.

--Andy
