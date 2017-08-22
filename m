From: sathya <sathyaosid@gmail.com>
Subject: Re: [RFC v1 3/6] platform/x86: intel_pmc_ipc: Use MFD framework to
 create dependent devices
Date: Mon, 21 Aug 2017 22:02:31 -0700
Message-ID: <1b46f01c-9cc8-3541-2f6d-f42c89c627ee@gmail.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <0699a0a5114ae563e6d51ab9352de591779452a4.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VcLs_+CcWMaBwR8ZMpByrNc74j7eF16K6ASF4NxaF0zHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcLs_+CcWMaBwR8ZMpByrNc74j7eF16K6ASF4NxaF0zHg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,


On 08/18/2017 05:29 AM, Andy Shevchenko wrote:
> On Tue, Aug 1, 2017 at 9:13 PM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>> Currently, we have lot of repetitive code in dependent device resource
>> allocation and device creation handling code. This logic can be improved if
>> we use MFD framework for dependent device creation. This patch adds this
>> support.
>> +static int ipc_create_pmc_devices(struct platform_device *pdev)
>>   {
>> -       int ret;
>> -
>> -       /* If we have ACPI based watchdog use that instead */
>> +       u8 n = 0;
>> +       struct mfd_cell *pmc_mfd_cells;
>> +
>> +       pmc_mfd_cells = devm_kzalloc(&pdev->dev,
>> +                       (sizeof(*pmc_mfd_cells) * PMC_IPC_MAX_MFD_BLOCK),
>> +                       GFP_KERNEL);
>> +       if (!pmc_mfd_cells)
>> +               return -ENOMEM;
>> +
>> +       /* Create PUNIT IPC MFD cell */
>> +       pmc_mfd_cells[n].name = PUNIT_DEVICE_NAME;
>> +       pmc_mfd_cells[n].id = -1;
>> +       pmc_mfd_cells[n].num_resources = ARRAY_SIZE(punit_ipc_resources);
>> +       pmc_mfd_cells[n].resources = punit_ipc_resources;
>> +       pmc_mfd_cells[n].ignore_resource_conflicts = 1;
> Please, use static variables instead of allocated on a heap.
I will follow the model used in lpc_ich.c. Will fix it in next version.
>
>> +       n++;
>> +
>> +       /* If we have ACPI based watchdog use that instead, othewise create
>> +        * a MFD cell for iTCO watchdog*/
>>          if (!acpi_has_watchdog()) {
>> +               pmc_mfd_cells[n].name = TCO_DEVICE_NAME;
>> +               pmc_mfd_cells[n].id = -1;
>> +               pmc_mfd_cells[n].platform_data = &tco_info;
>> +               pmc_mfd_cells[n].pdata_size = sizeof(tco_info);
>> +               pmc_mfd_cells[n].num_resources =
>> +                       ARRAY_SIZE(watchdog_ipc_resources);
>> +               pmc_mfd_cells[n].resources = watchdog_ipc_resources;
>> +               pmc_mfd_cells[n].ignore_resource_conflicts = 1;
>> +               n++;
>>          }
> ...and here you do mfd_add_devices() instead of this stuff.
>
> Check how lpc_ich.c designed.
Will fix it in next version.
>

-
Sathya
