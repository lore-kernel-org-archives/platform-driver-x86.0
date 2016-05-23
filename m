From: =?UTF-8?Q?Marco_Trevisan_=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
Subject: Re: [PATCH] thinkpad_acpi: save kbdlight state on suspend and restore
 it on resume
Date: Tue, 24 May 2016 00:08:46 +0200
Message-ID: <CAALaSc=dtXhPgqxQCWx40JxrwJECjH22EGq6p2rv_9w0+kQoHA@mail.gmail.com>
References: <1463620982-21058-1-git-send-email-mail@3v1n0.net> <20160523215752.GC2735@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:34931 "EHLO
	mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751477AbcEWWJS convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2016 18:09:18 -0400
Received: by mail-oi0-f67.google.com with SMTP id j202so4207983oih.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 May 2016 15:09:18 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 99sm2055964otf.36.2016.05.23.15.09.16
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 May 2016 15:09:16 -0700 (PDT)
Received: by mail-oi0-f48.google.com with SMTP id b65so156103471oia.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 May 2016 15:09:16 -0700 (PDT)
In-Reply-To: <20160523215752.GC2735@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>

2016-05-23 23:57 GMT+02:00 Darren Hart <dvhart@infradead.org>:
> On Thu, May 19, 2016 at 03:23:02AM +0200, Marco Trevisan wrote:
>> From: Marco Trevisan (Trevi=C3=B1o) <mail@3v1n0.net>
>>
>> Override default LED class suspend/resume handles, by keeping track =
of
>> the brightness level before suspending so that it can be automatical=
ly
>> restored on resume by calling default resume handler.
>>
>> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
>
> The patch requires a Signed-off-by. I presume that should be from Mar=
co?

I'm quite new to this, so please let me know how I should proceed.

> Henrique, is this Acked-by from you accurate? I need to see maintaine=
rs respond
> on list as they would likely object to me just taking other people's =
word for it
> in other scenarios ;-)

I've added it based on this reply (on ibm-acpi ML):
 - http://thread.gmane.org/gmane.linux.acpi.ibm-acpi.devel/4006/focus=3D=
4007
