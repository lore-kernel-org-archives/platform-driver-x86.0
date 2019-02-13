From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH v2 10/10] platform/x86: intel_pmc_core: Quirk to ignore
 XTAL shutdown
Date: Wed, 13 Feb 2019 21:01:58 +0530
Message-ID: <ac029ee9-be09-aadc-d8c8-4f3add2f381e@linux.intel.com>
References: <20190213150810.32750-1-rajneesh.bhardwaj@linux.intel.com>
 <20190213150810.32750-11-rajneesh.bhardwaj@linux.intel.com>
 <939c9bf7f0f3443b8cea8b1af7418158@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <939c9bf7f0f3443b8cea8b1af7418158@ausx13mpc120.AMER.DELL.COM>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com, platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


On 13-Feb-19 8:51 PM, Mario.Limonciello@dell.com wrote:
>
>> -----Original Message-----
>> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
>> owner@vger.kernel.org> On Behalf Of Rajneesh Bhardwaj
>> Sent: Wednesday, February 13, 2019 9:08 AM
>> To: platform-driver-x86@vger.kernel.org
>> Cc: dvhart@infradead.org; andy@infradead.org; linux-kernel@vger.kernel.org;
>> Rajneesh Bhardwaj
>> Subject: [PATCH v2 10/10] platform/x86: intel_pmc_core: Quirk to ignore XTAL
>> shutdown
>>
>>
>> [EXTERNAL EMAIL]
>>
>> On some platforms such as HP Elite-x2-1013-g3, the platform BIOS
>> enforces XTAL to remain off before S0ix state can be achieved. This may
>> not be optimum when we want to enable use cases like Low Power Audio,
>> Wake on Voice etc which always need 24mhz clock.
>>
>> This introduces a new quirk to allow S0ix entry when all other
>> conditions except for XTAL clock are good on a given platform. The extra
>> power consumed by XTAL clock is about 2mw but it saves much more
>> platform power compared to the system that remains in just PC10.
>>
> I wonder are there really any use cases for 24 mhz clock "needing" to stay
> enabled on Linux over a S0ix cycle and factor into the S0ix state decision?
>
> Is it perhaps better to set this as default behavior and quirk situations that it
> may not be needed.

Hi Mario,

I agree but the PMC default settings are determined by the platform 
BIOS. Some vendors may want to support WakeOnVoice and other use cases 
where a dependent clock from XTAL may be required while others might 
just not care. For this particular machine, the BIOS runs some special 
asl code that handles these settings for Windows and this is a deviation 
from normal. Thus we prefer a quirk for this and will monitor similar 
reports from other vendors too on other SoCs as well before we make this 
default in driver.


>
>> Link: https://bit.ly/2UmnrFf
>> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=201579
>> Tested-by: "David E. Box" <david.e.box@linux.intel.com>
>> Reported-and-tested-by: russianneuromancer <russianneuromancer@ya.ru>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
>> ---
>>   drivers/platform/x86/intel_pmc_core.c | 34 +++++++++++++++++++++++++++
>>   drivers/platform/x86/intel_pmc_core.h |  5 ++++
>>   2 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel_pmc_core.c
>> b/drivers/platform/x86/intel_pmc_core.c
>> index 4e7aa1711148..a27574e3e868 100644
>> --- a/drivers/platform/x86/intel_pmc_core.c
>> +++ b/drivers/platform/x86/intel_pmc_core.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/bitfield.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/delay.h>
>> +#include <linux/dmi.h>
>>   #include <linux/io.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> @@ -151,6 +152,7 @@ static const struct pmc_reg_map spt_reg_map = {
>>   	.pm_cfg_offset = SPT_PMC_PM_CFG_OFFSET,
>>   	.pm_read_disable_bit = SPT_PMC_READ_DISABLE_BIT,
>>   	.ltr_ignore_max = SPT_NUM_IP_IGN_ALLOWED,
>> +	.pm_vric1_offset = SPT_PMC_VRIC1_OFFSET,
>>   };
>>
>>   /* Cannonlake: PGD PFET Enable Ack Status Register(s) bitmap */
>> @@ -821,6 +823,37 @@ static const struct pci_device_id pmc_pci_ids[] = {
>>   	{ 0, },
>>   };
>>
>> +/*
>> + * This quirk can be used on those platforms where
>> + * the platform BIOS enforces 24Mhx Crystal to shutdown
>> + * before PMC can assert SLP_S0#.
>> + */
>> +int quirk_xtal_ignore(const struct dmi_system_id *id)
>> +{
>> +	struct pmc_dev *pmcdev = &pmc;
>> +	u32 value;
>> +
>> +	value = pmc_core_reg_read(pmcdev, pmcdev->map->pm_vric1_offset);
>> +	/* 24MHz Crystal Shutdown Qualification Disable */
>> +	value |= SPT_PMC_VRIC1_XTALSDQDIS;
>> +	/* Low Voltage Mode Enable */
>> +	value &= ~SPT_PMC_VRIC1_SLPS0LVEN;
>> +	pmc_core_reg_write(pmcdev, pmcdev->map->pm_vric1_offset, value);
>> +	return 0;
>> +}
>> +
>> +static const struct dmi_system_id pmc_core_dmi_table[]  = {
>> +	{
>> +	.callback = quirk_xtal_ignore,
>> +	.ident = "HP Elite x2 1013 G3",
>> +	.matches = {
>> +		DMI_MATCH(DMI_SYS_VENDOR, "HP"),
>> +		DMI_MATCH(DMI_PRODUCT_NAME, "HP Elite x2 1013 G3"),
>> +		},
>> +	},
>> +	{}
>> +};
>> +
>>   static int __init pmc_core_probe(void)
>>   {
>>   	struct pmc_dev *pmcdev = &pmc;
>> @@ -862,6 +895,7 @@ static int __init pmc_core_probe(void)
>>   		return err;
>>   	}
>>
>> +	dmi_check_system(pmc_core_dmi_table);
>>   	pr_info(" initialized\n");
>>   	return 0;
>>   }
>> diff --git a/drivers/platform/x86/intel_pmc_core.h
>> b/drivers/platform/x86/intel_pmc_core.h
>> index 6f1b64808075..88d9c0653a5f 100644
>> --- a/drivers/platform/x86/intel_pmc_core.h
>> +++ b/drivers/platform/x86/intel_pmc_core.h
>> @@ -25,6 +25,7 @@
>>   #define SPT_PMC_MTPMC_OFFSET			0x20
>>   #define SPT_PMC_MFPMC_OFFSET			0x38
>>   #define SPT_PMC_LTR_IGNORE_OFFSET		0x30C
>> +#define SPT_PMC_VRIC1_OFFSET			0x31c
>>   #define SPT_PMC_MPHY_CORE_STS_0			0x1143
>>   #define SPT_PMC_MPHY_CORE_STS_1			0x1142
>>   #define SPT_PMC_MPHY_COM_STS_0			0x1155
>> @@ -136,6 +137,9 @@ enum ppfear_regs {
>>   #define SPT_PMC_BIT_MPHY_CMN_LANE2		BIT(2)
>>   #define SPT_PMC_BIT_MPHY_CMN_LANE3		BIT(3)
>>
>> +#define SPT_PMC_VRIC1_SLPS0LVEN			BIT(13)
>> +#define SPT_PMC_VRIC1_XTALSDQDIS		BIT(22)
>> +
>>   /* Cannonlake Power Management Controller register offsets */
>>   #define CNP_PMC_SLPS0_DBG_OFFSET		0x10B4
>>   #define CNP_PMC_PM_CFG_OFFSET			0x1818
>> @@ -224,6 +228,7 @@ struct pmc_reg_map {
>>   	const int pm_read_disable_bit;
>>   	const u32 slps0_dbg_offset;
>>   	const u32 ltr_ignore_max;
>> +	const u32 pm_vric1_offset;
>>   };
>>
>>   /**
>> --
>> 2.17.1
