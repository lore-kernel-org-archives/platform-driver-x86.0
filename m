From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH 0/2] add sysfs for acpi interfaces of thinkpad hardware mute
Date: Wed, 14 Aug 2013 15:16:42 +0800
Message-ID: <CAJ=jqubPzq+pwY9F4tMEFRHr6rG+-1Hxm++5L45AbpR6mfFeJw@mail.gmail.com>
References: <1376458802-11923-1-git-send-email-alex.hung@canonical.com>
	<1376458937.30031.1.camel@x230>
	<CAJ=jqua8STZQideGbQTDh2W8iHcF4J9OJAC5tw-bkdBLLzsP2A@mail.gmail.com>
	<1376459647.30031.2.camel@x230>
	<CAJ=jqub1sRSzBRv_R6soDVAydRL+5nmA9-pMC4E+sgXhP6tbPw@mail.gmail.com>
	<1376460872.30031.4.camel@x230>
	<CAJ=jquaCHpBPKVYHKKCyMoih3NVCL8VmyiiN5Vy0UmTTTrwKjQ@mail.gmail.com>
	<1376463610.30031.6.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:50567 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759415Ab3HNHQm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Aug 2013 03:16:42 -0400
Received: by mail-oa0-f48.google.com with SMTP id o17so12533998oag.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2013 00:16:42 -0700 (PDT)
In-Reply-To: <1376463610.30031.6.camel@x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, David Henningsson <david.henningsson@canonical.com>, Tim Chen <tim.chen119@canonical.com>
Cc: "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>, "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Added in David and Tim who also has some ideas to share.

On Wed, Aug 14, 2013 at 3:00 PM, Matthew Garrett
<matthew.garrett@nebula.com> wrote:
> On Wed, 2013-08-14 at 14:41 +0800, Alex Hung wrote:
>> Hi Matthew,
>>
>> The problem is that thinkpad-acpi does not aware of mute is changed by
>> either hotkey presses or in desktop.
>
> Ok, how about this. Register the LED with the kernel LED subsystem. Add
> a new LED trigger for volume-mute. Have the HDA driver call that trigger
> whenever the mute state changes.
>
> --
> Matthew Garrett <matthew.garrett@nebula.com>



-- 
Cheers,
Alex Hung
