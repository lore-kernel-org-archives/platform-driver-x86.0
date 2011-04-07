From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 3/4] asus-laptop: Pegatron Lucid accelerometer
Date: Thu, 7 Apr 2011 18:09:38 +0200
Message-ID: <BANLkTimizXbH4GBgcCSbNA1AsZ3SejTabw@mail.gmail.com>
References: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
	<1301004130-3294-4-git-send-email-andy.ross@windriver.com>
	<AANLkTin849Cr2UUv4astP860=_f5xMMoPAhFhA4K+rzZ@mail.gmail.com>
	<20110328054314.GC31692@core.coreip.homeip.net>
	<4D90AB00.5080800@windriver.com>
	<AANLkTikK0FTAj0MeMk4n3_V6=yDYBL4cVROWSOHDm+XG@mail.gmail.com>
	<BANLkTimUsoc=uJbNAQvaiyfb2vYRnun2Dg@mail.gmail.com>
	<20110407175659.48d04f16@destiny.ordissimo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:59118 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751827Ab1DGQJk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Apr 2011 12:09:40 -0400
Received: by ewy4 with SMTP id 4so839271ewy.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Apr 2011 09:09:39 -0700 (PDT)
In-Reply-To: <20110407175659.48d04f16@destiny.ordissimo>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: Andy Ross <andy.ross@windriver.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

On Thu, Apr 7, 2011 at 5:56 PM, Anisse Astier <anisse@astier.eu> wrote:
> On Mon, 4 Apr 2011 17:16:05 +0000, Corentin Chary <corentin.chary@gmail.com> wrote :
>
>> On Thu, Mar 31, 2011 at 7:23 AM, Corentin Chary
>> <corentin.chary@gmail.com> wrote:
> <snip>
>> > Just to try to fix the crash in a more cleaner way, can you (re-)tell
>> > us more about it ? It's a kernel crash, or the hardware just start
>> > doing stupid things ? Any traces ? Does it also happens when you load
>> > the model *after* boot (blacklist it, then modprobe) ? Could you also
>> > re-send me the dsdt ? I think I lost it.
>>
>> ping ?
>
> I have a Pegatron Lucid. Please find the DSDT attached.

Thanks for the DSDT. After a quick read I didn't find anything in it
that could produce the crash.
I'll wait for Andy's answers.


-- 
Corentin Chary
http://xf.iksaif.net
