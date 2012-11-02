From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Subject: Re: How to implement ACPI EC support?
Date: Fri, 02 Nov 2012 12:49:21 +0100
Message-ID: <5093B341.9060102@profitbricks.com>
References: <50912CC2.2050902@profitbricks.com> <20121102021232.GB3262@khazad-dum.debian.net> <CAHR064jOAKNWgDanyO5EEoWSd6bnaCa6UpAL9O7WZSSMJyvD0w@mail.gmail.com> <5093B1D6.7020807@profitbricks.com> <CAHR064hgjbmNCT=ku90Haky2L_mH2zOdHp=tpDQH3BEgbtngdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:39987 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751253Ab2KBLtV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 2 Nov 2012 07:49:21 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so1349295bkc.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Nov 2012 04:49:20 -0700 (PDT)
In-Reply-To: <CAHR064hgjbmNCT=ku90Haky2L_mH2zOdHp=tpDQH3BEgbtngdg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On 02.11.2012 12:46, Corentin Chary wrote:
> On Fri, Nov 2, 2012 at 11:43 AM, Sebastian Riemer
> <sebastian.riemer@profitbricks.com> wrote:
>>
>> Nope, I guess not. There is no MOF stuff in the DSDT.
> Really ? No  methods/buffer starting in WQ ?
>

That's all:

Method (WQ00, 1, NotSerialized)
{
    Return (0x10)
}
