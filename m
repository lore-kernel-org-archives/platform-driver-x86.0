From: =?UTF-8?Q?Marco_Trevisan_=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
Subject: Re: [PATCH] thinkpad_acpi: save kbdlight state on suspend and restore
 it on resume
Date: Fri, 20 May 2016 05:03:52 +0200
Message-ID: <CAALaSc=b821TsgB1FZGy9nmP-ZG0jjycdP2ktE1hFZUFg_ACog@mail.gmail.com>
References: <1463620982-21058-1-git-send-email-mail@3v1n0.net> <20160519075243.GI29844@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35168 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752750AbcETDEZ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 May 2016 23:04:25 -0400
Received: by mail-wm0-f65.google.com with SMTP id s63so11155753wme.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2016 20:04:24 -0700 (PDT)
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com. [74.125.82.46])
        by smtp.gmail.com with ESMTPSA id m140sm2204951wma.24.2016.05.19.20.04.22
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 May 2016 20:04:22 -0700 (PDT)
Received: by mail-wm0-f46.google.com with SMTP id n129so62149799wmn.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2016 20:04:22 -0700 (PDT)
In-Reply-To: <20160519075243.GI29844@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Marco Trevisan <mail@3v1n0.net>, platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>

2016-05-19 9:52 GMT+02:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>:
> For me whole patch looks like a big hack because LED_CORE_SUSPENDRESU=
ME
> does not work correctly... I would rather see fixed support for flag
> LED_CORE_SUSPENDRESUME, not adding another suspend/resume hook if
> possible. Any idea?

As I wrote you in private mail I think the only way we have is to keep
the led_cdev->brightness in sync with actual state. And to do this, we
can listen the ACPI event, keeping this like a private event that we
just consume to update led brightness value, without delivering it to
userspace.

However, the custom code needed for getting this done, is probably way
more than the one I added here.
Maybe it could be useful to others to read the brightness level before
suspending, and in this case we could add a new flag to the led
subsystem, but not sure it's really worth.
