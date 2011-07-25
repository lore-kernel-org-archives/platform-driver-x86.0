From: =?UTF-8?B?w4lyaWMgUGllbA==?= <eric.piel@tremplin-utc.net>
Subject: [PATCH 00/10] lis3: various fixes and enhancements
Date: Mon, 25 Jul 2011 17:14:32 +0200
Message-ID: <4E2D8858.8000900@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailservice.tudelft.nl ([130.161.131.5]:38358 "EHLO
	mailservice.tudelft.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379Ab1GYPYl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Jul 2011 11:24:41 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Matthew Garrett <mjg@redhat.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Malte Starostik <m-starostik@versanet.de>, Ilkka Koskinen <ilkka.koskinen@nokia.com>, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>

Hello,

Here are a couple of patches from my backlog for the lis3. Since the=20
move out of hwmon, I'm not entirely sure to who I should send the=20
patches for the part which lies in driver/misc. Maybe Andrew can pick=20
them, or should I send them directly to Linus?

Patch 1 avoids crashes with a buggy hardware (which is actually seen in=
=20
the wild). Patch 7 fixes a missing free(). The rest of the patches are=20
more enhancements. Iilka had actually sent another patch, coming as=20
number 11, to allow multiple devices at the same time. But Cascardo=20
noticed that it can cause problems with the misc device, so I'm not=20
including it. Iilka, maybe have you found a solution since then?

Cheers,
=C3=89ric
