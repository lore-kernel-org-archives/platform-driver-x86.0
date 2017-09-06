From: "Kuppuswamy, Sathyanarayanan" <sathyaosid@gmail.com>
Subject: Re: [RFC v2 6/6] platform/x86: intel_pmc_ipc: Use generic Intel IPC
 device calls
Date: Tue, 5 Sep 2017 22:27:01 -0700
Message-ID: <7d0dbcce-0863-cfb0-6012-2c3ac0fc3c27@gmail.com>
References: <1504401889-113524-7-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20170905073849.eeeo3kbncozzer46@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170905073849.eeeo3kbncozzer46@dell>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, sathyanarayanan.kuppuswamy@linux.intel.com
Cc: souvik.k.chakravarty@intel.com, x86@kernel.org, mingo@redhat.com, qipeng.zha@intel.com, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Lee,


On 9/5/2017 12:38 AM, Lee Jones wrote:
> On Sat, 02 Sep 2017, sathyanarayanan.kuppuswamy@linux.intel.com wrote:
>
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> Removed redundant IPC helper functions and refactored the driver to use
>> generic IPC device driver APIs.
>>
>> This patch also cleans-up PMC IPC user drivers to use APIs provided
>> by generic IPC driver.
>>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> ---
>>   arch/x86/include/asm/intel_pmc_ipc.h          |  37 +--
>>   drivers/mfd/intel_soc_pmic_bxtwc.c            |  24 +-
>>   include/linux/mfd/intel_soc_pmic.h            |   2 +
> I'm a bit concerned by the API.
This is not a new change. Even before refactoring this driver, we have 
been using u32 bit variable to pass the DPTR and SPTR address.
>    Any reason why you're not using
> pointers for addresses?
I think the main reason is,  this is the expected format defined by 
SCU/PMC spec. According to the spec document, SPTR and DPTR registers 
are used to program the 32 bit SRAM address from which the PMC/SCU 
firmware can read/write the data of an IPC command. if we are not using 
SPTR or DPTR, we need to leave the value at zero.
> pointers, you should be using NULL, instead of 0.
>
>>   drivers/platform/x86/intel_pmc_ipc.c          | 364 +++++++++-----------------
>>   drivers/platform/x86/intel_telemetry_pltdrv.c | 114 ++++----
>>   5 files changed, 215 insertions(+), 326 deletions(-)
>>
>> Changes since v1:
>>   * Removed custom APIs.
>>   * Cleaned up PMC IPC user drivers to use APIs provided by generic
>>     IPC driver.
