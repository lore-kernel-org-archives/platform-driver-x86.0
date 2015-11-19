From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Thu, 19 Nov 2015 09:19:39 +0100
Message-ID: <20151119081939.GA26011@pali>
References: <cover.1447479930.git.luto@kernel.org>
 <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
 <CALCETrXOR8qtCMT8WF-78LxauFTSQxxAYhtkwA6vfbPcUcFteg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:37604 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756094AbbKSITq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 Nov 2015 03:19:46 -0500
Received: by wmww144 with SMTP id w144so105379162wmw.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2015 00:19:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CALCETrXOR8qtCMT8WF-78LxauFTSQxxAYhtkwA6vfbPcUcFteg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Wednesday 18 November 2015 13:24:33 Andy Lutomirski wrote:
> On Fri, Nov 13, 2015 at 9:49 PM, Andy Lutomirski <luto@kernel.org> wr=
ote:
> > The XPS 13 Skylake has an rfkill button and a switchvideomode butto=
n
> > that aren't enumerated in the DMI table AFAICT.  Add a table listin=
g
> > extra un-enumerated hotkeys.  To avoid breaking things that worked
> > before, these un-enumerated hotkeys won't be used if the DMI table
> > maps them to something else.
>=20
> Consider this withdrawn entirely for now.  Apparently there's an
> entirely new mechanism for this in the era of Windows 10.
>=20

Can you provide more information? I'm planning to cleanup dell-wmi.c
driver and if there are needed changes for Windows 10, please let me
know what... Thanks!

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
