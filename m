From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 2/4] asus-wrc: Add ACPI HID ATK4001
Date: Sun, 20 Dec 2015 13:57:50 -0500
Message-ID: <CA+A7VXVg4keOaoWazGduWPwW+UCd4Y4+StDHLuyYn5=DXHqNWw@mail.gmail.com>
References: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
 <1450193442-7930-3-git-send-email-jprvita@endlessm.com> <20151219064047.GE7244@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f194.google.com ([209.85.160.194]:32837 "EHLO
	mail-yk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750714AbbLTS6a convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Dec 2015 13:58:30 -0500
Received: by mail-yk0-f194.google.com with SMTP id x184so10273219yka.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Dec 2015 10:58:30 -0800 (PST)
In-Reply-To: <20151219064047.GE7244@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>, tasev.stefanoska@skynet.be

On 19 December 2015 at 01:40, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Dec 15, 2015 at 10:30:40AM -0500, Jo=C3=A3o Paulo Rechi Vita =
wrote:
>> As reported in https://bugzilla.kernel.org/show_bug.cgi?id=3D98931#c=
22 in
>> the Asus UX31A the "Asus Wireless Radio Control" device (ASHS) uses =
the
>> HID "ATK4001".
>
> Do you happen to have an ASL dump of this ID? Does it differ in any s=
ignificant
> way?
>

The DSDT is attached [1] to the bug report. The ASHS node looks
exactly the same as the one I posted in the commit message, but the
LED id is different. I'm not sure if that is the reason it woks fine
there. I'll elaborate more on that topic on the answer to your
comments on the cover letter of this series.

[1] https://bugzilla.kernel.org/attachment.cgi?id=3D177811

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
