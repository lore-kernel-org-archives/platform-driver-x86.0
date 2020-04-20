From: Prarit Bhargava <prarit@redhat.com>
Subject: Re: [PATCH] intel-speed-select: Fix speed-select-base-freq-properties
 output on CLX-N
Date: Mon, 20 Apr 2020 11:46:18 -0400
Message-ID: <d0bfcbfe-4834-624f-b590-1aa93970e5a4@redhat.com>
References: <20200420141054.26173-1-prarit@redhat.com>
 <CAHp75VfKCuX1CNMaVLeghdoP9-KHh3+1yuFVgU8qhRbKi69JNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfKCuX1CNMaVLeghdoP9-KHh3+1yuFVgU8qhRbKi69JNQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



On 4/20/20 11:43 AM, Andy Shevchenko wrote:
> On Mon, Apr 20, 2020 at 6:11 PM Prarit Bhargava <prarit@redhat.com> wrote:
>>
>> On CLX-N, the perf-profile-level's output is terminated before the
>> speed-select-base-freq-properties are output which results in a corrupt
>> json file.
>>
>> Adjust the output of speed-select-base-freq-properties by one on CLX-N.
>>
> 
> Thanks for the patch, it will be pulled from Srinivas' tree whenever
> he sends a PR to PDx86 mailing list.

Srinivas, OOC do you want these patches to be sent somewhere else?  FWIW, I'm
running get_maintainers.pl to get the mailing list and cc.

P.

> 
> 
>> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
>> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>> Cc: platform-driver-x86@vger.kernel.org
>> ---
>>  tools/power/x86/intel-speed-select/isst-display.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
>> index 51dbaa5f02ec..f6e2ce181123 100644
>> --- a/tools/power/x86/intel-speed-select/isst-display.c
>> +++ b/tools/power/x86/intel-speed-select/isst-display.c
>> @@ -470,7 +470,7 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
>>                                 _isst_pbf_display_information(cpu, outf,
>>                                                               tdp_level,
>>                                                           &ctdp_level->pbf_info,
>> -                                                             level + 1);
>> +                                                             level + 2);
>>                         continue;
>>                 }
>>
>> --
>> 2.18.2
>>
> 
> 
