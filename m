From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance
 number
Date: Sun, 6 Aug 2017 18:18:06 +0200
Message-ID: <7d7a104b-1555-8a7c-352b-cd5e4b4ac153@redhat.com>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
 <20170613184228.GC22450@fury> <20170614154654.GA22981@pali>
 <201708061742.57031@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39528 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751300AbdHFQSI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Aug 2017 12:18:08 -0400
In-Reply-To: <201708061742.57031@pali>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 06-08-17 17:42, Pali Rohár wrote:
> On Wednesday 14 June 2017 17:46:54 Pali Rohár wrote:
>> On Tuesday 13 June 2017 11:42:28 Darren Hart wrote:
>>> On Tue, Jun 13, 2017 at 08:04:57PM +0200, Pali Rohár wrote:
>>>> On Tuesday 13 June 2017 18:49:51 Darren Hart wrote:
>>>>> I'd suggest reaching out to the maintainers and contributors to
>>>>> the drivers you mention to request some help in testing.
>>>>
>>>> Seems sane. Grep for all methods with instance number different
>>>> as zero (or just number one -- which can be suspicious as
>>>> somebody could thought that indexing is from one, not zer) and
>>>> try to receive ACPI/BMOF data and verify it.
>>>
>>> This would still be the ideal solution, verify we can do the right
>>> thing without breaking existing drivers. Agreed.
>>
>> Here is all usage:
>>
>> Function wmi_set_block:
>>
>>    msi-wmi.c:
>>    instance=0 /* Instance 0 is "set backlight" */
>>
>>    tc1100-wmi.c:
>>    instance=TC1100_INSTANCE_WIRELESS /* defined as 1 */
>>    instance=TC1100_INSTANCE_JOGDIAL  /* defined as 2 */
>>
>> Function wmi_query_block:
>>
>>    acer-wmi.c:
>>    instance=1 /* no comment why,
>> guid=95764E09-FB56-4E83-B31A-37761F60994A */
>>
>>    dell-wmi.c:
>>    instance=0
>>
>>    msi-wmi.c:
>>    instance=1 /* Instance 1 is "get backlight", cmp with DSDT */
>>
>>    surface3-wmi.c:
>>    instance=0
>>
>>    tc1100-wmi.c:
>>    (same as in wmi_set_block)
>>
>> Function wmi_evaluate_method:
>>
>>    acer-wmi.c:
>>    instance=1 /* no comment why,
>> guid=67C3371D-95A3-4C37-BB61-DD47B491DAAB */ instance=1 /* no
>> comment why, guid=6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3 */ instance=0
>>
>>    alienware-wmi.c:
>>    instance=1 /* no comment why,
>> guid=A70591CE-A997-11DA-B012-B622A1EF5492 */ instance=1 /* no
>> comment why, guid=A80593CE-A997-11DA-B012-B622A1EF5492 */ instance=1
>> /* no comment why, guid=A70591CE-A997-11DA-B012-B622A1EF5492 */
>>
>>    asus-wmi.c:
>>    instance=1 /* no comment why,
>> guid=97845ED0-4E6D-11DE-8A39-0800200C9A66 */
>>
>>    dell-wmi-led.c:
>>    instance=1 /* no comment why,
>> guid=F6E4FE6E-909D-47cb-8BAB-C9F6F2F8D396 */
>>
>>    hp-wmi.c:
>>    instance=0
>>
>>    mxm-wmi.c:
>>    instance=1 /* no comment why,
>> guid=F6CB5C3C-9CAE-4EBD-B577-931EA32A2CC0 */
>>
>> So problematic drivers which use instance=1 without any comments are:
>>
>>    acer-wmi
>>    alienware-wmi
>>    asus-wmi
>>    dell-wmi-led
>>    mxm-wmi
> 
> Also there is a new problematic driver named peaq-wmi.c added by Hans.
> Adding into loop. Hans, can you recheck if arguments for
> wmi_evaluate_method() are correct, specially instance number "1"?

Ok, so looking at wmi_evaluate_method() the instance number becomes
arg0 and the DSDT implementation of the WMBC method which is the one
we care about is:

             Method (WMBC, 3, NotSerialized)
             {
                 If (Arg1 == 0x05)
                 {
                     Local0 = ^^GPO0.DBLY /* \_SB_.GPO0.DBLY */
                     ^^GPO0.DBLY = Zero
                     Return (Local0)
                 }

                 Return (0xFFFFFFFF)
             }

So the instance_index / Arg0 does not matter. I just tested passing 0
and that works fine. Feel free to change this if that helps with the
wmi refactoring.

Interestingly enough passing wmi.debug_dump_wdg=1 shows that the
BC object claims to have 10 instances, but the whole peaq-wmi
interface appears to be a messy quick hack from the manufacturer,
so that is not surprising.

Regards,

Hans
