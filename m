From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: revert unintentional device attribute
 renaming
Date: Tue, 19 May 2015 12:13:59 -0300
Message-ID: <1432048439.3106362.272800449.45A5D8AC@webmail.messagingengine.com>
References: <1432044821-16340-1-git-send-email-bjorn@mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53105 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753336AbbESPOA convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 May 2015 11:14:00 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 2EBB820DDD
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2015 11:14:00 -0400 (EDT)
In-Reply-To: <1432044821-16340-1-git-send-email-bjorn@mork.no>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?ISO-8859-1?Q?Bj=F8rn=20Mork?= <bjorn@mork.no>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Bastien Nocera <hadess@hadess.net>

On Tue, May 19, 2015, at 11:13, Bj=F8rn Mork wrote:
> The conversion to DEVICE_ATTR_* macros failed to fixup a few cases wh=
ere
> the old attribute names didn't match the show/store function names.
> Instead of renaming the functions, the attributes were renamed. This
> caused an unintentional API change.  The hwmon required 'name' attrib=
ute
> were among the renamed attribute, causing libsensors to fail to detec=
t
> the hwmon device at all.
>=20
> Fixes: b4dd04ac6ef8 ("thinkpad_acpi: use DEVICE_ATTR_* macros")
> Cc: Bastien Nocera <hadess@hadess.net>
> Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> Signed-off-by: Bj=F8rn Mork <bjorn@mork.no>

=2E..

> -static ssize_t hotkey_wakeup_reason_show(struct device *dev,
> +static ssize_t wakeup_reason_show(struct device *dev,

Before, all "hotkey subdriver" functions had the hotkey_ prefix.  Now,
we have to intrude into whatever "namespace" an attribute name happens
to clash (in this case, the "wakeup" namespace).

If this is the least horrible way to fix the issue, I will ack it even
if I don't like it.  However, if there's a way to do it that would keep
the "hotkey_" prefix in the C side, and only change the rest of the C
function name (if required), I'd rather the fix did that.

Also, the fix needs to go to stable (4.0+).

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
