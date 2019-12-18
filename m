From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Make buffer for
 HPWMI_FEATURE2_QUERY 128 bytes
Date: Wed, 18 Dec 2019 12:18:13 +0100
Message-ID: <92800c93-9d03-ab26-e71f-ce40df1ad3bc@redhat.com>
References: <20191217190604.638467-1-hdegoede@redhat.com>
 <CAHp75Vf8CDwW731uD4OMzB69P-D1AN3PzCMFBGGD4fvBFccpLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vf8CDwW731uD4OMzB69P-D1AN3PzCMFBGGD4fvBFccpLg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 18-12-2019 11:17, Andy Shevchenko wrote:
> On Tue, Dec 17, 2019 at 9:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> At least on the HP Envy x360 15-cp0xxx model the WMI interface
>> for HPWMI_FEATURE2_QUERY requires an outsize of at least 128 bytes,
>> otherwise it fails with an error code 5 (HPWMI_RET_INVALID_PARAMETERS):
>>
>> Dec 06 00:59:38 kernel: hp_wmi: query 0xd returned error 0x5
>>
>> We do not care about the contents of the buffer, we just want to know
>> if the HPWMI_FEATURE2_QUERY command is supported.
>>
>> This commits bumps the buffer size, fixing the error.
>>
> 
> Fixes tag?

The HPWMI_FEATURE2_QUERY call was introduced in 8a1513b4932, so I guess
this should have a:

Fixes: 8a1513b4932 ("hp-wmi: limit hotkey enable")

Tag, shall I send a v2 with this, or can you add it while applying the patch?

Regards,

Hans




> 
>> Cc: stable@vger.kernel.org
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1520703
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/platform/x86/hp-wmi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
>> index 9579a706fc08..a881b709af25 100644
>> --- a/drivers/platform/x86/hp-wmi.c
>> +++ b/drivers/platform/x86/hp-wmi.c
>> @@ -300,7 +300,7 @@ static int __init hp_wmi_bios_2008_later(void)
>>
>>   static int __init hp_wmi_bios_2009_later(void)
>>   {
>> -       int state = 0;
>> +       u8 state[128];
>>          int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
>>                                         sizeof(state), sizeof(state));
>>          if (!ret)
>> --
>> 2.23.0
>>
> 
> 
