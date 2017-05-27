From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Improve explanation about DELLABC6
Date: Sat, 27 May 2017 09:07:14 -0700
Message-ID: <CALCETrVv8MVYtHf5h2tdAAW7wZZP8RPjMhmuaH_C2KC3y-5LtQ@mail.gmail.com>
References: <c3d605a0a82e819891fec18b4057406358878a76.1495862179.git.dvhart@infradead.org>
 <201705271301.10526@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752505AbdE0QHg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 12:07:36 -0400
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com [209.85.213.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F11E239ED
        for <platform-driver-x86@vger.kernel.org>; Sat, 27 May 2017 16:07:36 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id x71so16780353vkd.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 27 May 2017 09:07:36 -0700 (PDT)
In-Reply-To: <201705271301.10526@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Mario Limonciello <mario_limonciello@dell.com>

On Sat, May 27, 2017 at 4:01 AM, Pali Rohár <pali.rohar@gmail.com> wrote:
> On Saturday 27 May 2017 07:16:19 Darren Hart wrote:
>> From: Andy Lutomirski <luto@kernel.org>
>>
>> According to Mario at Dell, the DELLABC6 device should not be used on
>> a Linux system. It also conflicts with Intel-HID and its
>> interactions with Network Manager. Document that we are aware of the
>> device, but that we are intentionally ignoring it.
>>
>> Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> [dvhart: New commit message and minor comment wording fixes]
>> Cc: Mario Limonciello <mario_limonciello@dell.com>
>> Cc: "Pali Rohár" <pali.rohar@gmail.com>
>> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
>> ---
>>  drivers/platform/x86/dell-rbtn.c | 26 +++++++++++++++++++-------
>>  1 file changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell-rbtn.c
>> b/drivers/platform/x86/dell-rbtn.c index dcd9f40..2eeef03 100644
>> --- a/drivers/platform/x86/dell-rbtn.c
>> +++ b/drivers/platform/x86/dell-rbtn.c
>> @@ -223,14 +223,26 @@ static const struct acpi_device_id rbtn_ids[] =
>> { * This driver can also handle the "DELLABC6" device that
>>        * appears on the XPS 13 9350, but that device is disabled
>>        * by the DSDT unless booted with acpi_osi="!Windows 2012"
>> -      * acpi_osi="!Windows 2013".  Even if we boot that and bind
>> -      * the driver, we seem to have inconsistent behavior in
>> -      * which NetworkManager can get out of sync with the rfkill
>> -      * state.
>> +      * acpi_osi="!Windows 2013".
>>        *
>> -      * On the XPS 13 9350 and similar laptops, we're not supposed to
>> -      * use DELLABC6 at all.  Instead, we handle the rfkill button
>> -      * via the intel-hid driver.
>> +      * According to Mario at Dell:
>> +      *
>> +      *  DELLABC6 is a custom interface that was created solely to
>> +      *  have airplane mode support for Windows 7.  For Windows 10
>> +      *  the proper interface is to use that which is handled by
>> +      *  intel-hid.  A OEM airplane mode driver is not used.
>> +      *
>> +      *  Since the kernel doesn't identify as Windows 7 it would be
>> +      *  incorrect to do attempt to use that interface.
>> +      *
>> +      * Even if we override _OSI and bind to DELLABC6, we end up
>> +      * with inconsistent behavior in which NetworkManager can get
>> +      * out of sync with the rfkill state.  This happens because
>> +      * NetworkManager receives events from intel-hid and fights with
>> +      * dell-rbtn for control.
>> +      *
>> +      * The upshot is that it's better to just ignore DELLABC6
>> +      * devices.
>>        */
>>
>>       { "", 0 },
>
> Just one note: Kernel code should not depend on one particular software
> which implements networking (in userspace). Either behaviour is
> independent of used software and therefore comment does not apply only
> to Network Manager OR behaviour is strictly bounded to Network Manager
> which is IMHO not a kernel bug, but rather userspace software
> application bug. If there is a bug in userspace, then userspace should
> be fixed instead of adding hacks/workarounds in kernel.

Fair enough.  NetworkManager is just an example here.  The general
kernel behavior is that, if the kernel sends KEY_RFKILL or similar,
that means "the button was pressed and it's up to userspace to handle
it".  Sending KEY_RFKILL *and* handling it in the kernel is not going
to go well.  This should be true with any other reasonably modern
userspace (connmgr or whatever it's called, perhaps?).
