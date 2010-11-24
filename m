From: Gyorgy Jeney <nog.lkml@gmail.com>
Subject: On a sony VAIO Z12C5E: sony-laptop: Unknown event: 0x100 0xa6, etc.
Date: Wed, 24 Nov 2010 19:22:55 +0100
Message-ID: <AANLkTi=kq35KAs0Wy=6PY7tZVAOaGRMH_KnSv+NC5NqC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:61102 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753051Ab0KXSW4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Nov 2010 13:22:56 -0500
Received: by vws2 with SMTP id 2so23576vws.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2010 10:22:56 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org

Hello,

On a Sony VAIO Z12C9E, I get some messages from the kernel when
certain buttons are pressed:

"Assist" pressed: sony-laptop: Unknown event: 0x100 0xa6
"Assist" released: sony-laptop: Unknown event: 0x100 0x26
"VAIO" pressed: sony-laptop: Unknown event: 0x100 0xa5
"VAIO" released: sony-laptop: Unknown event: 0x100 0x25
CDROM eject key pressed: sony-laptop: Unknown event: 0x100 0xa4
CDROM eject key released: sony-laptop: Unknown event: 0x100 0x24

What bothers me about this is I get a bunch of messages on my console
each time the DVD tray is opened, but I guess it shouldn't be hard to
make these events "do the right thing".

nog.
