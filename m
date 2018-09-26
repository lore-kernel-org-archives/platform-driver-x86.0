From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH 2/4] platform/x86: intel_pmc_core: Fix LTR IGNORE Max
 offset
Date: Wed, 26 Sep 2018 19:54:44 +0530
Message-ID: <92d451b5-e6b7-74a2-dc71-19e30654c2f3@linux.intel.com>
References: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
 <20180903180415.31575-2-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75Vcx-rk_dgf6fNRMa6o-zFeSXAG+HSNMAN-1XVCsXvvv1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vcx-rk_dgf6fNRMa6o-zFeSXAG+HSNMAN-1XVCsXvvv1w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Thank you.


On 26-Sep-18 7:27 PM, Andy Shevchenko wrote:
> On Mon, Sep 3, 2018 at 9:05 PM Rajneesh Bhardwaj
> <rajneesh.bhardwaj@linux.intel.com> wrote:
>> Cannonlake PCH allows us to ignore LTR from more IPs than Sunrisepoint
>> PCH so make the LTR ignore platform specific.
>>
> This looks fine to me.
>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
>> ---
>>   drivers/platform/x86/intel_pmc_core.c | 4 +++-
>>   drivers/platform/x86/intel_pmc_core.h | 4 +++-
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
>> index 972735bd4c75..c1330a03523d 100644
>> --- a/drivers/platform/x86/intel_pmc_core.c
>> +++ b/drivers/platform/x86/intel_pmc_core.c
>> @@ -149,6 +149,7 @@ static const struct pmc_reg_map spt_reg_map = {
>>          .ppfear_buckets = SPT_PPFEAR_NUM_ENTRIES,
>>          .pm_cfg_offset = SPT_PMC_PM_CFG_OFFSET,
>>          .pm_read_disable_bit = SPT_PMC_READ_DISABLE_BIT,
>> +       .ltr_ignore_max = SPT_NUM_IP_IGN_ALLOWED,
>>   };
>>
>>   /* Cannonlake: PGD PFET Enable Ack Status Register(s) bitmap */
>> @@ -320,6 +321,7 @@ static const struct pmc_reg_map cnp_reg_map = {
>>          .ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
>>          .pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
>>          .pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
>> +       .ltr_ignore_max = CNP_NUM_IP_IGN_ALLOWED,
>>   };
>>
>>   static inline u8 pmc_core_reg_read_byte(struct pmc_dev *pmcdev, int offset)
>> @@ -566,7 +568,7 @@ static ssize_t pmc_core_ltr_ignore_write(struct file *file, const char __user
>>                  goto out_unlock;
>>          }
>>
>> -       if (val > NUM_IP_IGN_ALLOWED) {
>> +       if (val > map->ltr_ignore_max) {
>>                  err = -EINVAL;
>>                  goto out_unlock;
>>          }
>> diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
>> index b24407048fa1..12663c58f122 100644
>> --- a/drivers/platform/x86/intel_pmc_core.h
>> +++ b/drivers/platform/x86/intel_pmc_core.h
>> @@ -44,7 +44,7 @@
>>   #define SPT_PMC_READ_DISABLE_BIT               0x16
>>   #define SPT_PMC_MSG_FULL_STS_BIT               0x18
>>   #define NUM_RETRIES                            100
>> -#define NUM_IP_IGN_ALLOWED                     17
>> +#define SPT_NUM_IP_IGN_ALLOWED                 17
>>   #define SPT_PMC_LTR_CUR_PLT                    0x350
>>   #define SPT_PMC_LTR_CUR_ASLT                   0x354
>>   #define SPT_PMC_LTR_SPA                                0x360
>> @@ -153,6 +153,7 @@ enum ppfear_regs {
>>   #define CNP_PPFEAR_NUM_ENTRIES                 8
>>   #define CNP_PMC_READ_DISABLE_BIT               22
>>   #define CNP_PMC_LATCH_SLPS0_EVENTS             BIT(31)
>> +#define CNP_NUM_IP_IGN_ALLOWED                 19
>>   #define CNP_PMC_LTR_CUR_PLT                    0x1B50
>>   #define CNP_PMC_LTR_CUR_ASLT                   0x1B54
>>   #define CNP_PMC_LTR_SPA                                0x1B60
>> @@ -215,6 +216,7 @@ struct pmc_reg_map {
>>          const u32 pm_cfg_offset;
>>          const int pm_read_disable_bit;
>>          const u32 slps0_dbg_offset;
>> +       const u32 ltr_ignore_max;
>>   };
>>
>>   /**
>> --
>> 2.17.1
>>
>
