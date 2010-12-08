From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for December 8 (drivers/platform/x86/Kconfig:422:error:
 recursive dependency detected!)
Date: Wed, 8 Dec 2010 11:12:51 +0100
Message-ID: <AANLkTimxa5hOWC2ouLUfLPpWgoKz6ou2b5NzGwWfNLtZ@mail.gmail.com>
References: <AANLkTim3FJjVpbjM10kJJhXbONpvGSGQFE+mfGX9pAS6@mail.gmail.com>
	<AANLkTimjVY-6OwRfFUzUbmyacM81M35wf5qDWqAouUYb@mail.gmail.com>
	<1291801990.5992.105.camel@i7.infradead.org>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:49862 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750939Ab0LHKMx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Dec 2010 05:12:53 -0500
In-Reply-To: <1291801990.5992.105.camel@i7.infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>

On Wed, Dec 8, 2010 at 10:53 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 2010-12-08 at 10:12 +0100, Corentin Chary wrote:
>>
>> I don't really see how it's a recursive dependency, but maybe it's
>> time to clean this KConfig.
>> What is our current policy about that ?
>>
>> I think we should *depends* on important subsystem (ACPI, INPUT, ...)
>> and select obscure things so
>> that the driver does not get lost if you don't enable the leds.
>
> A better policy is: "NEVER USE SELECT".

Yes, confirmed (see my patch to MLs).

- Sedat -
