From: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH] thinkpad_acpi: adding new hotkey ID for Lenovo thinkpad
Date: Tue, 13 Dec 2016 08:49:20 +0800
Message-ID: <29c05895-2f95-0529-00e1-b589d2e1e806@canonical.com>
References: <1478592803-17522-1-git-send-email-hui.wang@canonical.com>
 <20161212182305.GB77230@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:37785 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751615AbcLMAt1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Dec 2016 19:49:27 -0500
In-Reply-To: <20161212182305.GB77230@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: dvhart@linux.intel.com, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On 12/13/2016 02:23 AM, Darren Hart wrote:
> On Tue, Nov 08, 2016 at 04:13:23PM +0800, Hui Wang wrote:
>> Recently we met an issue on lots of Lenovo thinkpad laptops (those
>> laptops are not released to market yet), the issue is that the
>> thinkpad_acpi.ko can't be automatically loaded as before.
>>
>> Through debugging, we found the HKEY_HID is LEN0268 instead of
>> LEN0068 on those machines, and the MHKV is 0x200 instead of
>> 0x100. So adding the new ID into the driver.
>>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> With Henrique's ack, I've queued this to testing.
>
> However, in the commit message you mention two deltas:
>
> 1) HKEY_HID is LEN0268
> 2) MHKV is 0x200
>
> This patch appears to address only #1. Is another patch needed for #2?

The #2 was already addressed by the commit:

commit 0118c2d3eac0545d4095877e5a015b5dc763b3c2
Author: Dennis Wassenberg <dennis.wassenberg@secunet.com>
Date:   Wed Jun 8 10:54:25 2016 -0400

     thinkpad_acpi: Add support for HKEY version 0x200

     Lenovo Thinkpad devices T460, T460s, T460p, T560, X260 use
     HKEY version 0x200 without adaptive keyboard.

     HKEY version 0x200 has method MHKA with one parameter value.
     Passing parameter value 1 will get hotkey_all_mask (the same like
     HKEY version 0x100 without parameter). Passing parameter value 2 to
     MHKA method will retrieve hotkey_all_adaptive_mask. If 0 is returned in
     that case there is no adaptive keyboard available.


It looks like the Lenovo machines have the change for HKEY_HID and MHKV 
as below:

in the past: HKEY_HID=LEN0068  MHKV=0x100
about one year ago: HKEY_HID=LEN0068 MHKV=0x200
recently: HKEY_HID=LEN0268 MHKV=0x200


Cheers,
Hui.

>
> (I'm digging myself out of a deep backlog, so if it's here already, I'll find
> it, but it might expedite things to point it out to me).
>
> Thanks for the patch.
>
