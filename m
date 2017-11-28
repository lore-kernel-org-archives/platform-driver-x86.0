From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] platform/x86: hp-wmi: Actually use mask parameter in
 hp_wmi_hw_state
Date: Tue, 28 Nov 2017 19:06:08 +0100
Message-ID: <e8ff5280-537e-bb60-f0ba-791117abb4a4@daenzer.net>
References: <20171128151758.9234-1-michel@daenzer.net>
 <20171128165724.GA16349@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171128165724.GA16349@fury>
Content-Language: en-CA
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 2017-11-28 05:57 PM, Darren Hart wrote:
> On Tue, Nov 28, 2017 at 04:17:58PM +0100, Michel Dänzer wrote:
>> We were always checking bit 0 (which represents the docked state)
>> regardless of the mask.
>>
>> Fixes the "tablet mode" state always being reported the same as the
>> docked state, which with current libinput can cause the built-in input
>> devices of laptops to be incorrectly disabled while docked.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: ("platform/x86: hp-wmi: Refactor dock and tablet state fetchers")
>> Signed-off-by: Michel Dänzer <michel@daenzer.net>
>> ---
>>  drivers/platform/x86/hp-wmi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
>> index b4ed3dc983d5..2bdd6bbdb353 100644
>> --- a/drivers/platform/x86/hp-wmi.c
>> +++ b/drivers/platform/x86/hp-wmi.c
>> @@ -297,7 +297,7 @@ static int hp_wmi_hw_state(int mask)
>>  	if (state < 0)
>>  		return state;
>>  
>> -	return state & 0x1;
>> +	return (state & mask) ? 1 : 0;
> 
> The current code does:
> 
> return !!(state & mask);
> 
> See:
> 9968e12 platform/x86: hp-wmi: Fix tablet mode detection for convertibles
> 
> Merged in 4.15-rc1

AFAIK commits without

 Cc: stable@vger.kernel.org

don't get automatically picked up for stable branches. Can you manually
nominate 9968e12 for stable?


Thanks,


-- 
Earthling Michel Dänzer               |               http://www.amd.com
Libre software enthusiast             |             Mesa and X developer
