From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v2] thinkpad_acpi: revert unintentional device attribute
 renaming
Date: Tue, 19 May 2015 14:55:17 -0300
Message-ID: <1432058117.3143492.272974641.60D462B3@webmail.messagingengine.com>
References: <1432057503-18089-1-git-send-email-bjorn@mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46462 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754937AbbESRzS convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 May 2015 13:55:18 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 8EDBC20F49
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2015 13:55:17 -0400 (EDT)
In-Reply-To: <1432057503-18089-1-git-send-email-bjorn@mork.no>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?ISO-8859-1?Q?Bj=F8rn=20Mork?= <bjorn@mork.no>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Bastien Nocera <hadess@hadess.net>

On Tue, May 19, 2015, at 14:45, Bj=F8rn Mork wrote:
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
> Fix by using the DEVICE_ATTR macro for these attributes, allowing the
> show/store functions to keep their system specific prefixes.
>=20
> Fixes: b4dd04ac6ef8 ("thinkpad_acpi: use DEVICE_ATTR_* macros")
> Cc: Bastien Nocera <hadess@hadess.net>
> Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> Signed-off-by: Bj=F8rn Mork <bjorn@mork.no>
> ---
> v2: kept the original function names, using the DEVICE_ATTR instead

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
