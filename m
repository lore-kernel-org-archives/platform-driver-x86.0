From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 3/8] platform/x86: dell-wmi-smbios: Use Dell WMI
 descriptor check
Date: Sun, 1 Oct 2017 11:43:56 +0300
Message-ID: <CAHp75VeweaPKApXg_cpqG+vPD6UDdX1Tavt6T5gV6EK+T_R0FQ@mail.gmail.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <bea602b33e27facc77ee850ef14dfa37f6894275.1506571188.git.mario.limonciello@dell.com>
 <20170930012912.GB13307@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f170.google.com ([209.85.216.170]:44387 "EHLO
        mail-qt0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750953AbdJAIn5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Oct 2017 04:43:57 -0400
In-Reply-To: <20170930012912.GB13307@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Mario Limonciello <mario.limonciello@dell.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>

On Sat, Sep 30, 2017 at 4:29 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Sep 27, 2017 at 11:02:15PM -0500, Mario Limonciello wrote:
>> The Dell WMI descriptor check is used as an indication that WMI
>> calls are safe to run both when used with the notification
>> ASL/GUID pair as well as the SMBIOS calling ASL/GUID pair.
>>
>> As some code in dell-wmi-smbios is already a prerequisite for
>> dell-wmi, move the code for performing the descriptor check into
>> dell-wmi-smbios and let both drivers use it from there.

>> +     if (desc_buffer[0] != 0x4C4C4544 && desc_buffer[1] != 0x494D5720)
>
> This seems like it should be an || ?
>
> (I see this is fixed in a later patch)

Interesting, I proposed to use strncmp(), but it's gone again. Perhaps
I missed what is downside of that.

-- 
With Best Regards,
Andy Shevchenko
