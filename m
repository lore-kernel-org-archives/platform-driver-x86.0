From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH] drivers/platform/x86: Lenovo IdeaPad Z570 support
Date: Thu, 05 Jul 2012 14:41:32 +0300
Message-ID: <4FF57D6C.2060301@gmail.com>
References: <1338811006.17357.3.camel@lenovo-ideapad-z570.gentooroot.dyndns.org> <20120626183110.GA29375@srcf.ucam.org> <4FF41640.8060608@canonical.com> <4FF45C98.60305@gmail.com> <4FF57606.7070806@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:42686 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932083Ab2GELlh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 Jul 2012 07:41:37 -0400
Received: by bkwj10 with SMTP id j10so3286174bkw.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Jul 2012 04:41:36 -0700 (PDT)
In-Reply-To: <4FF57606.7070806@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

> Thanks. I have the patch tested on my ideapads. They all looks fine.
> 
> The last thing I need is ACK for psmouse patch.

Psmouse patch is not needed any more, all things work without it because now
touchpad is being toggled with i8042_command() without any intrusion into
psmouse driver.
