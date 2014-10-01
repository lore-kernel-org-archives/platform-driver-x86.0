From: Michael Tokarev <mjt@tls.msk.ru>
Subject: asus-nb-wmi: wifi & brightness keys does not work on asus x200la
 laptop
Date: Wed, 01 Oct 2014 14:15:00 +0400
Message-ID: <542BD424.8010202@msgid.tls.msk.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from isrv.corpit.ru ([86.62.121.231]:44422 "EHLO isrv.corpit.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750997AbaJAKYR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Oct 2014 06:24:17 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: acpi4asus-user@lists.sourceforge.net, Corentin Chary <corentin.chary@gmail.com>

Hello.

It looks like asus-nb-wmi (or asus-wmi) does not handle some
(acpi?) keys on some recent asus laptops.  In particular, on
my x200la laptop, the mentioned keys does absolutely nothing
(neither showkeys nor xev shows them).  Also, wifi led is
always off.

Reportedly the same prob exists on another (but similar) series,
x200ma (which is basically the same but is built on celeron/atom
processor).

How can I help in debugging/implementing this support?

Thanks,

/mjt
