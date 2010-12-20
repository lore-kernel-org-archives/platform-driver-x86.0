From: Peter =?utf-8?q?H=C3=BCwe?= <PeterHuewe@gmx.de>
Subject: Re: [PATCH] platform/x86: Fix recursive Kconfig dependency
Date: Mon, 20 Dec 2010 18:09:40 +0100
Message-ID: <201012201809.41269.PeterHuewe@gmx.de>
References: <1291850970-7190-1-git-send-email-peterhuewe@gmx.de> <201012192000.14969.PeterHuewe@gmx.de> <AANLkTi=gqimS5n6J6GXcZA_W1JHZ8yHJHAKqP=dDmN0Z@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:41736 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with SMTP
	id S932889Ab0LTRJ4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Dec 2010 12:09:56 -0500
In-Reply-To: <AANLkTi=gqimS5n6J6GXcZA_W1JHZ8yHJHAKqP=dDmN0Z@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, John Linville <linville@tuxdriver.com>

Am Montag 20 Dezember 2010, 15:46:02 schrieb Sedat Dilek:
> > Added Stephen Rothwell on CC, maybe he can apply it directly to
> > linux-next ;)
> > 
> > Peter
> 
> I do not think this will happen for a "as-warning-classified" patch.

On arm and avr32 it is not only a warning but an error instead!

-> so the patch fixes an error / build failure which imho is quite an 
important issue.

You can see the errors in Ellerman's build farm.

http://kisskb.ellerman.id.au/kisskb/buildresult/3652816/
http://kisskb.ellerman.id.au/kisskb/buildresult/3664077/
http://kisskb.ellerman.id.au/kisskb/buildresult/3652972/
http://kisskb.ellerman.id.au/kisskb/buildresult/3664113/

As it is an error for arm and avr32 maybe it should go through their trees 
instead?

Peter
