From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Tue, 19 Jan 2016 10:19:25 +0100
Message-ID: <20160119101925.6ced84bf@endymion.delvare>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
	<20160118164425.1e94185b@endymion.delvare>
	<CALCETrVqb4awUCvm4KYRqi2mgCW2O00=-2-T=NSngrtzEeH93g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36577 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753087AbcASJT2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 04:19:28 -0500
In-Reply-To: <CALCETrVqb4awUCvm4KYRqi2mgCW2O00=-2-T=NSngrtzEeH93g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 18 Jan 2016 10:09:46 -0800, Andy Lutomirski wrote:
> On Mon, Jan 18, 2016 at 7:44 AM, Jean Delvare <jdelvare@suse.de> wrote:
> > On Sun,  3 Jan 2016 06:52:28 -0800, Andy Lutomirski wrote:
> >> +     if (results->err || results->keymap)
> >> +             return;         /* We already found the hotkey table. */
> >
> > Can this actually happen?
> 
> Yes, I think, if Dell ships a laptop with two tables of type 0xB2.
> There's no return code that says "I'm done", so I can't just stop
> walking the DMI data after finding what I'm looking for.

This may be another thing to consider when redesigning dmi_walk. Maybe
we should let the callback function notify when processing should stop.
If nothing else it should make things slightly faster by avoiding
callbacks for the remaining entries. And it may allow for cleaner
handling of corner cases.

> (...)
> I think the length check is correct, but the hotkey_num calculation is
> wrong.  The table is 84 bytes on my system, which makes perfect sense:
> 6 bytes of header and 78 == 13*6 bytes of entries.  But 84-4 is *not*
> a multiple of 6.

For the record, I don't have a Dell laptop myself but I have a DMI
table dump from a Latitude E6410 and the type 178 record length is 96
bytes (4 + 23 * 4.)

> > (...)
> > I think it would make sense to fix dmi_walk() so that it lets the
> > decoding function return error codes. This would avoid the
> > convoluted error code handling. Not sure why I didn't do that
> > originally :(
> 
> I think that would make sense as a followup.  It'll probably have to
> change the callback's signature, though.

Indeed. That won't be a nice and easy change, but it can still be done.

-- 
Jean Delvare
SUSE L3 Support
