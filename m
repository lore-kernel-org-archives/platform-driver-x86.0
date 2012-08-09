From: "Alexander E. Patrakov" <patrakov@gmail.com>
Subject: Re: ACPI keys for Sony VAIO VPC-Z23A4R laptop
Date: Thu, 9 Aug 2012 20:54:32 +0600
Message-ID: <CAN_LGv3JT1foL2qOji8JwxX2YQt19UP7+=ykC5xnjrLhV5hing@mail.gmail.com>
References: <CAN_LGv17f+DHvPO0DOpuBp10Rf6W-FSFu2Juk9OA-8_+atfbhw@mail.gmail.com>
	<20120731213758.GA6206@kamineko.org>
	<1343784601.1557.2.camel@Nokia-N900>
	<20120801213441.GA31698@kamineko.org>
	<CAN_LGv14kpcDbs=cfK=kKd-yWKV9CAJzspwYuOd0Xra+U93fng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:58383 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030611Ab2HIOyd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Aug 2012 10:54:33 -0400
Received: by vcbfk26 with SMTP id fk26so442436vcb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Aug 2012 07:54:32 -0700 (PDT)
In-Reply-To: <CAN_LGv14kpcDbs=cfK=kKd-yWKV9CAJzspwYuOd0Xra+U93fng@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org

2012/8/9 Alexander E. Patrakov <patrakov@gmail.com>:
> Sorry for the long delay. The full dmesg is attached, with all
> non-working (and two working - ASSIST and WEB) keys annotated via echo
> "Will press something" > /dev/kmsg.

BTW, I would like to question the default keysym assignment to the
ASSIST and WEB keys. I am basing my judgement on
http://cgit.freedesktop.org/xorg/proto/x11proto/tree/XF86keysym.h, but
of course I might be wrong.

Currently, ASSIST produces the Help keysym. In Windows, this key is
preconfigured to launch the "VAIO Care" application which is related
to backup, SONY software updates & troubleshooting, not to browsing
help files, so XF86Tools or XF86Support might be a better semantic
fit.

WEB currently produces XF86HomePage, but in Windows it launches the
browser. So I'd argue for it being assigned to XF86WWW instead.

The VAIO key currently does not work, and in Windows it starts some
sort of multimedia organizer. XF86AudioMedia or may be a good semantic
equivalent.

-- 
Alexander E. Patrakov
