From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Fri, 4 Dec 2015 14:27:45 +0100
Message-ID: <20151204132745.GA13441@eudyptula.hq.kempniu.pl>
References: <20151130211542.GE30553@malice.jf.intel.com>
 <1654e7bcde98f1cf89f698a1e359110c06c6fcd4.1448999372.git.kernel@kempniu.pl>
 <20151204011606.GI1800@malice.jf.intel.com>
 <20151204085624.GN10982@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151204085624.GN10982@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> This patch is not enough for enabling 0xe025 key on that Vostro machi=
ne.
> Some extra SMBIOS call is needed, without them ACPI will not send WMI
> keypress event.

Indeed.  But have you read the last e-mail I wrote before submitting th=
e
original patch [1]?  Brightness control on the V131 is already broken
"out of the box" with newer kernels (flickering upon brightness change)=
,
but if we do what you're suggesting and include the SMI call in the
kernel, we'll break it even more, to the point where pressing one of th=
e
brightness control keys might not result in any brightness change at
all.  Sure, we can fix that by overriding an arbitrary ACPI method.  Oh=
,
wait, did I say "fix"?

I posted the patch without the SMI call because that way if you want to
use the Dell Instant Launch hotkey, you just fire up a userspace script
(which uses libsmbios and takes care of overriding the ACPI method) and
chances are you will end up with a fully functional system.  Of course
you need to understand that using this script is not an elegant solutio=
n
and that it might break something else, but it's your choice, not the
kernel's.  And the patch itself does not change kernel's default
behavior, so we're not risking breaking any other models out there.

> At least I think this one patch should not be included into kernel un=
til
> there will be full support for 0xe025 key (adding that SMBIOS call).

Again, fully supporting the Dell Instant Launch hotkey makes brightness
control even more broken than it has to be.  In other words, everything
is terrible.

The only real solution to all these issues is a BIOS fix and I'm pretty
sure it's not happening.

[1] http://www.spinics.net/lists/platform-driver-x86/msg07679.html

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
