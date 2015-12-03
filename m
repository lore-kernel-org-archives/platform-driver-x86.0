From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v2 3/3] dell-wmi: Improve unknown hotkey handling
Date: Thu, 3 Dec 2015 15:45:11 -0800
Message-ID: <CALCETrXq3MNAWLWRR47-dW4XhOZCdsMOX=Jz7-frCCb88C8Czg@mail.gmail.com>
References: <cover.1448931589.git.luto@kernel.org> <b409d60963f81611e398b492a73ffd998414cd68.1448931589.git.luto@kernel.org>
 <20151203233856.GC1800@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:38035 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750905AbbLCXpb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 Dec 2015 18:45:31 -0500
Received: by igbxm8 with SMTP id xm8so24834516igb.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Dec 2015 15:45:31 -0800 (PST)
In-Reply-To: <20151203233856.GC1800@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Linux ACPI <linux-acpi@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>

On Thu, Dec 3, 2015 at 3:38 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Mon, Nov 30, 2015 at 05:02:01PM -0800, Andy Lutomirski wrote:
>> If DMI lists a hotkey that we don't recognize, log and ignore it
>> instead of trying to map it to keycode 0.  I haven't seen this happen,
>> but it will help maintain the key map in the future and it will help
>> avoid sending bogus events.
>>
>> This also improves the message that we log when we get an unknown key
>> event.
>>
>> Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> ---
>
> Please include the individual patch changelogs here under --- in the patch
> itself - this helps me build confidence that I am indeed looking at the right
> patch and the expected changes are here.

Will do in the future -- different maintainers have different
preferences here, I think.

--Andy
