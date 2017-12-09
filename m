From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: wmi: prefix sysfs files in /sys/bus/wmi
 with the ACPI device
Date: Sat, 9 Dec 2017 13:32:29 -0800
Message-ID: <CALCETrWm9jY-jo9EN7KW+E4Gc1nDPrQAJ_g+07L-UgZpe5XgMA@mail.gmail.com>
References: <1512786861-1014-1-git-send-email-mario.limonciello@dell.com>
 <1512786861-1014-2-git-send-email-mario.limonciello@dell.com>
 <DDE9D9EA-D55D-41CC-94ED-EB2A590B7BCF@amacapital.net> <1512790860266.96149@Dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751221AbdLIVcv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Dec 2017 16:32:51 -0500
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com [209.85.223.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6F0C218E3
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Dec 2017 21:32:50 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id o2so2445533ioe.8
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 Dec 2017 13:32:50 -0800 (PST)
In-Reply-To: <1512790860266.96149@Dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andrew Lutomirski <luto@kernel.org>

On Fri, Dec 8, 2017 at 7:41 PM,  <Mario.Limonciello@dell.com> wrote:
>>> On Dec 8, 2017, at 6:34 PM, Mario Limonciello <mario.limonciello@dell.com> wrote:
>>>
>>> It's possible for the same GUID to show up on as system twice.
>>> This means using solely the GUID for identify the file will not
>>> be sufficient.
>>
>>Isn't the file already in a per-bus directory?
>
> Yep, but the symlink created in /sys/bus/wmi/devices isn't.
> That's where the kernel complains about duplicate sysfs
> attributes.
>
> It's not exactly a pretty path I submitted, but it does avoid
> those collisions.
>
> Example (with this in place from /sys/bus/wmi/devices):
> lrwxrwxrwx 1 root root 0 Dec  8 21:39 PNP0C14:04-70FE8229-D03B-4214-A1C6-1F884B1A892A -> ../../../devices/platform/PNP0C14:04/wmi_bus/wmi_bus-PNP0C14:04/PNP0C14:04-70FE8229-D03B-4214-A1C6-1F884B1A892A

Right, I saw that in the cover letter right after sending this.

Greg, is there a cleaner way to deal with this?  There are two
instances of the same bus type, each of which would like to have a
device called "70FE8229-D03B-4214-A1C6-1F884B1A892A".  Can we somehow
rename the symlinks without renaming the device, or are we just
supposed to prefix the device name like Mario is doing here?
