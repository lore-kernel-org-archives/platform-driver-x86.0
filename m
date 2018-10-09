From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: intel_telemetry: Update maintainers info
Date: Tue, 9 Oct 2018 19:42:29 +0530
Message-ID: <f6742716-d302-9af6-4d7f-428def965279@linux.intel.com>
References: <20181008144303.23878-1-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VfNsasf-hpiubrfw=x+iVjBOOcY=uj6dB97iVpkoT6K=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfNsasf-hpiubrfw=x+iVjBOOcY=uj6dB97iVpkoT6K=w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, David Box <david.e.box@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org



On 09-Oct-18 5:07 PM, Andy Shevchenko wrote:
> On Mon, Oct 8, 2018 at 5:44 PM Rajneesh Bhardwaj
> <rajneesh.bhardwaj@linux.intel.com> wrote:
>> Add myself and David as the new maintainers for Intel Telemetry driver.
>>
> There is no explanation why.
> (Like previous one left the company, and / or you are doing set of the
> drivers related to PMC where telemetry is part of, etc)

Hi Andy,
  Souvik no longer works with Intel. I and David are volunteering to 
take up the task on his behalf since we do work on drivers which are 
pretty close to this one in terms of functionalities.

Thanks
Rajneesh

>> Signed-off-by: Box, David E <david.e.box@linux.intel.com>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
>> ---
>>   MAINTAINERS | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 22065048d89d..f33ebd1b8034 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7530,7 +7530,8 @@ F:        arch/x86/crypto/sha*-mb/
>>   F:     crypto/mcryptd.c
>>
>>   INTEL TELEMETRY DRIVER
>> -M:     Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
>> +M:     Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
>> +M:     Box, David E <david.e.box@linux.intel.com>
>>   L:     platform-driver-x86@vger.kernel.org
>>   S:     Maintained
>>   F:     arch/x86/include/asm/intel_telemetry.h
>> --
>> 2.17.1
>>
>
