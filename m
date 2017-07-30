From: Paulo Alcantara <pcacjr@zytor.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Correctly determine method id in
 WMI calls
Date: Sun, 30 Jul 2017 09:31:22 -0300
Message-ID: <8d36b62d-92be-de5c-df90-b4f42c35648a@zytor.com>
References: <20170730031921.10324-1-pcacjr@zytor.com>
 <CAHp75VdRKvsngnt6Kvs6g9w8n92Fz_EjnNWj_cXR+3G_TZCmSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from terminus.zytor.com ([65.50.211.136]:34971 "EHLO mail.zytor.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750957AbdG3Mdi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Jul 2017 08:33:38 -0400
In-Reply-To: <CAHp75VdRKvsngnt6Kvs6g9w8n92Fz_EjnNWj_cXR+3G_TZCmSg@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

Hi Andy,

On 30/07/2017 06:01, Andy Shevchenko wrote:
> On Sun, Jul 30, 2017 at 6:19 AM, Paulo Alcantara <pcacjr@zytor.com> wrote:
>> The WMI queries are performed by evaluating the WMPV() method from ACPI
>> DSDT tables, and it takes three arguments: instance index, method id and
>> input data (buffer).
>>
>> Currently the method id is hard-coded to 0x3 in hp_wmi_perform_query()
>> which means that it will perform WMI calls that expect an output data of
>> size 0x80 (128). The output size is usually OK for the WMI queries we
>> perform, however it would be better to pick the correct one before
>> evaluating the WMI method.
>>
>> Which correct method id to choose can be figured out by looking at the
>> following ASL code from WVPI() method:
>>
>> ...
>> Name (PVSZ, Package (0x05)
>>              {
>>              Zero,
>>              0x04,
>>              0x80,
>>              0x0400,
>>              0x1000
>>              })
>> Store (Zero, Local0)
>> If (LAnd (LGreaterEqual (Arg1, One), LLessEqual (Arg1, 0x05)))
>> {
>>      Store (DerefOf (Index (PVSZ, Subtract (Arg1, One))), Local0)
>> }
>> ...
>>
>> Arg1 is the method id and PVSZ is the package used to index the
>> corresponding output size; 1 -> 0, 2 -> 4, 3 -> 128, 4 -> 1024, 5 ->
>> 4096.
>>
>> This patch maps the output size passed in hp_wmi_perform_query() to the
>> correct method id before evaluating the WMI method.
> 
> Thanks for the patch, my comments below.
> 
>> +/* map output size to the corresponding WMI method id */
>> +static inline u32 outsize_to_mid(int outsize)
> 
> I would name it like
> 
> encode_outsize_for_pvsz
> 
>> +{
>> +       if (!outsize)
>> +               return 1;
>> +       if (outsize <= 0x4)
>> +               return 2;
>> +       if (outsize <= 0x80)
>> +               return 3;
>> +       if (outsize <= 0x400)
>> +               return 4;
>> +       if (outsize <= 0x1000)
>> +               return 5;
>> +       return (u32)-1;
> 
> I would do other way around, i.e.
> 
> if (outsize > 4096)
>   return U32_MAX;
> if (outsize > ...)
>   return ...;
> if (outsize > 0)
>   return 2;
> return 1;
> 
> Note two things:
> 1) use decimal integers for size (slightly better to read);
> 2) don't trick negative numbers.
> 
>> +}
> 
>> +       mid = outsize_to_mid(outsize);
>> +       if (WARN_ON(mid == (u32)-1))
> 
> And looking here, why you don't return int from that function directly
> and use it's negative value as error code?
> 
>> +               return -EINVAL;
>> +

Thanks for the quick review. I agree with all you comments and 
suggestions. I'll send a v2 shortly.

-Paulo
