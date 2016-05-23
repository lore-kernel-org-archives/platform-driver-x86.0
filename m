From: =?UTF-8?Q?Marco_Trevisan_=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
Subject: Re: [PATCH] thinkpad_acpi: save kbdlight state on suspend and restore
 it on resume
Date: Tue, 24 May 2016 00:10:44 +0200
Message-ID: <CAALaScnavfThOtXeb1FRJAqxzMhtV-KmtZt71-pFL0rr23nzhA@mail.gmail.com>
References: <1463620982-21058-1-git-send-email-mail@3v1n0.net>
 <20160523215752.GC2735@f23x64.localdomain> <201605240004.09829@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35198 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751477AbcEWWLP convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2016 18:11:15 -0400
Received: by mail-oi0-f66.google.com with SMTP id j202so4218411oih.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 May 2016 15:11:15 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a71sm1348764oic.16.2016.05.23.15.11.13
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 May 2016 15:11:14 -0700 (PDT)
Received: by mail-oi0-f46.google.com with SMTP id b65so156168901oia.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 May 2016 15:11:13 -0700 (PDT)
In-Reply-To: <201605240004.09829@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>

2016-05-24 0:04 GMT+02:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>:
> Darren, I'm not sure if this is really correct approach in current
> patch... Anyway as Marco wrote, there is ACPI event when keyboard
> backlight change and maybe we should handle it...

I'll be happy to work on that as well, but I've not much time at the mo=
ment.
However I think this could be an ok way to handle things in the mean ti=
me.
