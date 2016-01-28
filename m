From: Eric Curtin <ericcurtin17@gmail.com>
Subject: Re: [PATCH] Remove ambiguous logging for "Unsupported brightness interface"
Date: Thu, 28 Jan 2016 00:52:18 +0000
Message-ID: <CANpvso6cx4T=ty=r+V_30yMAGX-U=UOo9VmJ7s60CsdNT6Pudg@mail.gmail.com>
References: <CANpvso5_jzOgRv25isy0x6HJcTgKP4dabSH-_a5fM-uihdAUYw@mail.gmail.com>
	<1453937211.10099.31.camel@perches.com>
	<CANpvso7UtUrRh6cZT9aNYU7J62ofMMhr7S91Wwa8GWPHc3w1NQ@mail.gmail.com>
	<1453941821.10099.33.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:34893 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934390AbcA1AwT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jan 2016 19:52:19 -0500
In-Reply-To: <1453941821.10099.33.camel@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: platform-driver-x86@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net

On 28 January 2016 at 00:43, Joe Perches <joe@perches.com> wrote:
> On Thu, 2016-01-28 at 00:36 +0000, Eric Curtin wrote:
>> On 27 January 2016 at 23:26, Joe Perches <joe@perches.com> wrote:
>> > On Wed, 2016-01-27 at 22:14 +0000, Eric Curtin wrote:
>> > > Message gets logged on machines that are well supported.
> []
>> > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> []
>> > +       pr_info("detected %u brightness levels\n", bright_maxlvl + 1);
>> >  }
>> >
>> >  static int __init brightness_init(struct ibm_init_struct *iibm)
>>
>> Maybe, but the other logging issues kinda mean something. There are
>> many, many reports of people thinking their brightness interface is
>> broken because of this logging message, when in reality the i915 driver
>> supports their devices just fine as previously stated.
>
> That's why I suggest changing it to show the number
> of brightness levels detected on any device.
>

Sorry, I missed that line. Looks like a better fix! +1
