From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Tue, 12 Apr 2016 14:03:23 +0200
Message-ID: <20160412120323.GA2583@eudyptula.hq.kempniu.pl>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
 <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
 <20160324113513.GA5129@marvin.atrad.com.au>
 <20160410023020.GA27081@dvhart-mobl5.amr.corp.intel.com>
 <20160410105258.GA2922@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34531 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932467AbcDLMD2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Apr 2016 08:03:28 -0400
Received: by mail-lf0-f44.google.com with SMTP id j11so21792070lfb.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2016 05:03:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160410105258.GA2922@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> > Where are we with this? The above reads as "Doesn't appear to break=
 existing
> > systems on hand". Jonathan, are you happy with this patch?
>=20
> Sorry, I got caught up over the last couple of weeks with other tasks=
 and
> have not yet managed to confirm the lack of regressions on the S7020.=
  It
> was on my list for this coming week though.  My comments quoted above=
 were
> theoretical rather than based on an actual test.  The patch appears f=
airly
> innoculous given that BTNI bit 24 is not set on the S7020 but for
> completeness I would prefer to give it a run on the S7020 before we m=
erge
> the patch.  I will make an effort to fit this in over the next couple=
 of
> days.
>=20
> > Micha=C5=82, do you have plans for a v2?
>=20
> I wasn't clear on this myself.  I suspect, given the lack of a v2 in =
the
> time since the last discussion, that there is no v2 planned at this s=
tage
> and I will proceed with my testing accordingly.

Jonathan, in one of my previous messages [1] I laid out my motivation
for implementing this patch the way I did.  In your response [2], you
wrote:

> This is a quick reply with preliminary information.  I'll follow up i=
n the
> next few days with further details.

Thus, I have been patiently awaiting your response ever since as I see
no reason to rush this patch.

Darren, even if Jonathan is happy with v1 code-wise, I was planning to
post a v2 with an improved commit message (as hinted before [1]).  Yet,
the contents of that message may depend on the results of Jonathan's
tests.

The logical path forward for me would be to wait until Jonathan finds
time to respond to the issues I raised and only then post a v2 with at
least an updated commit message.  Let me know if you would like to
handle this differently.

[1] https://www.spinics.net/lists/platform-driver-x86/msg08657.html
[2] https://www.spinics.net/lists/platform-driver-x86/msg08662.html

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
