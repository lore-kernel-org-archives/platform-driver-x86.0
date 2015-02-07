From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH] Sony-laptop: fix sparse warning
Date: Sat, 07 Feb 2015 12:33:16 +0100
Message-ID: <87386irm6b.fsf@nemi.mork.no>
References: <1423147781-26018-1-git-send-email-prabhakar.csengg@gmail.com>
	<54D39283.4070300@gmail.com>
	<CA+V-a8utKmCRLgWMEMSzPv01hQ5F_nXeyYQe5r9ZKiqTw_uddg@mail.gmail.com>
	<20150207030827.GC20934@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:54911 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755490AbbBGLd6 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 7 Feb 2015 06:33:58 -0500
In-Reply-To: <20150207030827.GC20934@fury.dvhart.com> (Darren Hart's message
	of "Fri, 6 Feb 2015 19:08:27 -0800")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Giedrius =?utf-8?Q?St?= =?utf-8?Q?atkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>

Darren Hart <dvhart@infradead.org> writes:
> On Thu, Feb 05, 2015 at 04:00:32PM +0000, Lad, Prabhakar wrote:
>
>> Lad, Prabhakar <prabhakar.lad@ti.com>
>> Lad, Prabhakar <prabhakar.csengg@gmail.com>
>
> I think there may be a problem with this in an unquoted email address=
=2E The
> unquoted local part, per RFC 2822 3.4.1, can only contain  !#$%'*+-/=3D=
?^_`{|}~
> and . separators.

Yes, but that is not applicable to the git commit tags.  They are not
RFC2822 header fields.  Nothing will ever parse "Lad" as an unqualified
local destination in a SOB, and therefore there is no problem using the
comma there.

Note that names using non-ascii characters are often written without
quotes i SOBs (wonder how I know this? :-).  In practice I believe the
character set is only limited by what you will allow in your git log.
The only characters with a special meaning are :<>#, and the latter is
somewhat dubious.  But it's often used as a comment separator in stable
CCs, so I guess it should be avoided for other uses.

Scripts etc trying to parse these tags into email headers must be
prepared to do the necessary stripping and quoting of any text outside
the <> brackets.

Requiring a full name is of course good for accountability, but do let
people format their names as they want them to appear in the log.
Different cultures have different traditions. Wookey has collected a fe=
w
links on this subject if anyone is interested:
http://wookware.org/name.html


Bj=C3=B8rn
