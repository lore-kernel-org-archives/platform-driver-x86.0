From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Mon, 23 Nov 2015 15:53:51 +0100
Message-ID: <20151123145351.GG24147@pali>
References: <cover.1447479930.git.luto@kernel.org>
 <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
 <20151121000636.GG7413@malice.jf.intel.com>
 <CALCETrVz+4CX=rjY5OZfCSGQDcgW1oQe6t8d9940ubQKDv-Eqg@mail.gmail.com>
 <20151122020414.GR16374@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:32997 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751801AbbKWOxy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Nov 2015 09:53:54 -0500
Received: by wmec201 with SMTP id c201so164435148wme.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2015 06:53:53 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151122020414.GR16374@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "D. Jared Dominguez" <Jared_Dominguez@dell.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <Mario_Limonciello@Dell.com>

On Saturday 21 November 2015 20:04:15 D. Jared Dominguez wrote:
> On Fri, Nov 20, 2015 at 06:12:58PM -0600, Andy Lutomirski wrote:
> >Jared, want to give us some guidance as to whether this code is
> >correct at all and, if so, whether we should actually send a
> >KEY_RFKILL event from dell-wmi when the key is pressed?
> >
> >IOW, should we allow dell-wmi to handle rfkill or should we wait for
> >the other mechanism?
> >
> >--Andy
>=20
> I'm adding Mario since he's worked on our client systems much longer =
and
> knows more about the correct behavior for our hotkeys. I've not yet r=
ead
> through any of our documentation about our hotkey behavior so wouldn'=
t be as
> qualified to answer that. Note that both Mario and I are on vacation =
until
> the 30th, so he may not reply until then.
>=20
> --Jared
>=20

Jared, thanks for your input! When you or Mario are back from vacation,
can you look at it? Or if you do not have much time, can you provide
documentation (or some snippets), so somebody else can update driver to
work correctly?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
