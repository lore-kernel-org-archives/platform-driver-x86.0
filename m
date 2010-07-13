From: Samuel Xu <samuel.xu.tech@gmail.com>
Subject: How to read time stamp from HPET timer from device driver?
Date: Tue, 13 Jul 2010 17:36:42 +0800
Message-ID: <AANLkTimTF1tNxpfd86a9h6PDKDeFiq9zQcHCbKyfTm5M@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:57956 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753527Ab0GMJgo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Jul 2010 05:36:44 -0400
Received: by qyk38 with SMTP id 38so4771914qyk.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jul 2010 02:36:43 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

HI:
I am a freshman for HPET timer. Previously, I use TSC counter, to use
rdtsc to get the time stamp. elapsed cycle can be counter from 2 time
stamps.
As a advanced replacement of TSC, I suppose HPET timer can be
conveniently to read time stamp from both kernel mode user  and user
mode apps.
While I failed to find a way to get time stamp value of HPET in Linux
kenerl (I am doing a driver and want to know elapsed cycle from driver
code).

Anyone can help me?

Thanks!

Samuel
