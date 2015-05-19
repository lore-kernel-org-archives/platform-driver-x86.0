From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: revert unintentional device
 attribute renaming
Date: Tue, 19 May 2015 14:03:17 -0300
Message-ID: <1432054997.3131891.272907897.5DEBC139@webmail.messagingengine.com>
References: <1432044821-16340-1-git-send-email-bjorn@mork.no>
 <1432048439.3106362.272800449.45A5D8AC@webmail.messagingengine.com>
 <87pp5wpozi.fsf@nemi.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48440 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751367AbbESRDS convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 May 2015 13:03:18 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E06C520EB3
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2015 13:03:17 -0400 (EDT)
In-Reply-To: <87pp5wpozi.fsf@nemi.mork.no>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?ISO-8859-1?Q?Bj=F8rn=20Mork?= <bjorn@mork.no>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Bastien Nocera <hadess@hadess.net>, platform-driver-x86@vger.kernel.org

On Tue, May 19, 2015, at 12:26, Bj=F8rn Mork wrote:
> Henrique de Moraes Holschuh <hmh@hmh.eng.br> writes:
> >> -static ssize_t hotkey_wakeup_reason_show(struct device *dev,
> >> +static ssize_t wakeup_reason_show(struct device *dev,
> >
> > Before, all "hotkey subdriver" functions had the hotkey_ prefix.  N=
ow,
> > we have to intrude into whatever "namespace" an attribute name happ=
ens
> > to clash (in this case, the "wakeup" namespace).
> >
> > If this is the least horrible way to fix the issue, I will ack it e=
ven
> > if I don't like it.  However, if there's a way to do it that would =
keep
> > the "hotkey_" prefix in the C side, and only change the rest of the=
 C
> > function name (if required), I'd rather the fix did that.
>=20
> We could use the DEVICE_ATTR(_name, _mode, _show, _store) macro inste=
ad
> for the affected attributes if you prefer that.

Yes, please.  I'd rather have a bit more boilerplate than sacrifice the
"subdriver prefix" in the C functions handling the sysfs nodes.

> I didn't think the names of these static functions mattered that much=
,
> but I do see that yout have a point for a 10kloc source file like
> thinkpad_acpi.c.  You haven't ever considered splitting it? :-)

Heh, yeah, I did.  I was going to at least kick the hwmon and the
alsa-related stuff to separate drivers.  But there are all sorts of tie=
s
between the separate functionalities due to a common firmware event
interface, so the result looked worse than the monolithic driver.  And
we often get more of those when new firmware/hardware functionality
arrives...

A split-and-refactor might be in thinkpad-acpi's future, yes.  But the
result would not be a bunch of independent modules due to the way the
firmware interface works, so there is little reason to not have it as a
monolitic module. This is not something you'd have in an embedded
kernel, after all...

Those 10k loc are mostly organized into highly modular blocks
("subdrivers"), thus my dislike for the change on the C function
prefixes for the sysfs attributes.  Those prefixes make it easier to
maintain the driver ;-)

When I last tried it several years ago, splitting the large C file into
several smaller C files did not make that large a difference in
maintainability, for a noticeable cost in lost compile-time
optimizations.  So, I never published it.

> > Also, the fix needs to go to stable (4.0+).
>=20
> I don't think so.  The bug was introduced in v4.1-rc1 AFAICS.  Am I
> missing something?

Hmm, I screwed up when I was trying to locate which trees shipped the
broken commit.  You're right, this fix does _not_ need to go to stable.=
=20
Sorry about that!

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
