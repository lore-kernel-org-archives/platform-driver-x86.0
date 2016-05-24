From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] thinkpad_acpi: save kbdlight state on suspend and
 restore it on resume
Date: Tue, 24 May 2016 08:49:17 -0700
Message-ID: <20160524154917.GH2735@f23x64.localdomain>
References: <1463620982-21058-1-git-send-email-mail@3v1n0.net>
 <1464043191-20791-1-git-send-email-mail@3v1n0.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37291 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751820AbcEXPtR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 May 2016 11:49:17 -0400
Content-Disposition: inline
In-Reply-To: <1464043191-20791-1-git-send-email-mail@3v1n0.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Trevisan <mail@3v1n0.net>
Cc: platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>

On Tue, May 24, 2016 at 12:39:51AM +0200, Marco Trevisan wrote:
> From: Marco Trevisan (Trevi=F1o) <mail@3v1n0.net>
>=20
> Override default LED class suspend/resume handles, by keeping track o=
f
> the brightness level before suspending so that it can be automaticall=
y
> restored on resume by calling default resume handler.
>=20
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> Signed-off-by: Marco Trevisan (Trevi=F1o) <mail@3v1n0.net>

Just a nit (I fixed it), your Signed-off-by comes first. Reviewers and =
testers
follow, then the sub maintainers Signed-off-by, then Linus' Signed-off-=
by. It
tracks the path the patch took from authorship, testing, review, pull, =
and
merge.

Queued, thanks.

--=20
Darren Hart
Intel Open Source Technology Center
