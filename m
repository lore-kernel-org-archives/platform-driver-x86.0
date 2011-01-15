From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [PATCH 1/5] Backlight: Add backlight type
Date: Sat, 15 Jan 2011 15:41:22 +0100
Message-ID: <AANLkTin-GW6PgTNraPbrcoSTGX-cghCrdSh4SCJv=ecS@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:41597 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751090Ab1AOOlX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 15 Jan 2011 09:41:23 -0500
Received: by qyj19 with SMTP id 19so492258qyj.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jan 2011 06:41:22 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, platform-driver-x86@vger.kernel.org

[...]
+What:		/sys/class/backlight/<backlight>/type
+Date:		September 2010
+KernelVersion:	2.6.37
[...]

2.6.37?
Will this go into 2.6.38? 2.6.39?

Through which subsystem will these patches walk through? drm-2.6?
platform-drivers-x86?
Are you planning a GIT tree/branch for this patch-set?

The patch-set from 14-Jan-2011 applies against linux-next (next-20110115).
I will compile, test and report.

- Sedat -
