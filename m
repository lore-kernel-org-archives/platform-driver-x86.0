From: sathya <sathyaosid@gmail.com>
Subject: Re: [PATCH v1 1/2] platform/x86: intel_pmc_ipc: Use MFD framework to
 create dependent devices
Date: Sat, 27 Jan 2018 20:27:26 -0800
Message-ID: <e14429dd-f526-6228-c371-43f4d7f05167@gmail.com>
References: <fc6780c09de2218908db79fe5d77919710155a74.1516913386.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75Vd1agJyw6wz+62A+AJuoKJts8RLUAaxBe=DK5L2EBCP0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:42910 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753266AbeA1E13 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 Jan 2018 23:27:29 -0500
In-Reply-To: <CAHp75Vd1agJyw6wz+62A+AJuoKJts8RLUAaxBe=DK5L2EBCP0w@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Zha Qipeng <qipeng.zha@intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Andy,

Thanks for the review.

On 01/26/2018 08:17 AM, Andy Shevchenko wrote:
> On Fri, Jan 26, 2018 at 12:53 AM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> Currently, we have lot of repetitive code in dependent device resource
>> allocation and device creation handling code. This logic can be improved if
>> we use MFD framework for dependent device creation. This patch adds this
>> support.
> Thanks for an update. My comments below.
>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> First of all, I barely remember what I did to this patch.
Sorry, I know I took a long break. But its over now. I will be active in 
coming months.
> In any case
> this one is redundant since it will have mine when I push it to our
> repo.
>
>> @@ -508,7 +492,7 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>          ret = devm_request_irq(&pdev->dev, pdev->irq, ioc, 0, "intel_pmc_ipc",
>>                                  pmc);
>>          if (ret) {
>> -               dev_err(&pdev->dev, "Failed to request irq\n");
>> +               dev_err(&pdev->dev, "Failed to request IRQ\n");
Will split these renames into a separate patch.
>>                  return ret;
>>          }
> Split this kind of changes in a separate patch.
>
>> +static int ipc_create_punit_device(struct platform_device *pdev)
>>   {
>> +       static struct resource punit_res[PLAT_RESOURCE_MEM_MAX_INDEX];
>> +       static struct mfd_cell punit_cell;
>> +       struct resource *res;
>> +       int ret, mindex, pindex = 0;
>> +
>> +       for (mindex = 0; mindex <= PLAT_RESOURCE_MEM_MAX_INDEX; mindex++) {
> '<=' ??? (Why = is here?)
Good catch. It should be only <. I will fix it in next release.
>
>> +               res = platform_get_resource(pdev, IORESOURCE_MEM, mindex);
>> +
>> +               switch (mindex) {
>> +               /* Get PUNIT resources */
>> +               case PLAT_RESOURCE_BIOS_DATA_INDEX:
>> +               case PLAT_RESOURCE_BIOS_IFACE_INDEX:
>> +                       /* BIOS resources are required, so return error if not
>> +                        * available
>> +                        */
> It's not the network subsystem, please, do a proper style for
> multi-line comments.
Will fix it in next release.
>
>> +                       if (!res) {
> Would the following work for you?
>
> if (res)
>   break;
>       dev_err(&pdev->dev, "Failed to get PUNIT MEM resource %d\n", pindex);
>       return -ENXIO;
> case ...:
> ...
> if (res)
>   break;
> default:
>   continue;
>
> memcpy(...);
> ...
If you move memcpy outside the switch statement, then it will be called 
for cases (non punit cases) like PLAT_RESOURCE_TELEM_SSRAM_INDEX or 
PLAT_RESOURCE_ACPI_IO_INDEX which is logically incorrect.
>
>> +                               dev_err(&pdev->dev,
>> +                                       "Failed to get PUNIT MEM resource %d\n",
>> +                                       pindex);
>> +                               return -ENXIO;
>> +                       }
>> +               case PLAT_RESOURCE_ISP_DATA_INDEX:
>> +               case PLAT_RESOURCE_ISP_IFACE_INDEX:
>> +               case PLAT_RESOURCE_GTD_DATA_INDEX:
>> +               case PLAT_RESOURCE_GTD_IFACE_INDEX:
>> +                       /* if valid resource found, copy the resource to PUNIT
>> +                        * resource
>> +                        */
>> +                       if (res)
>> +                               memcpy(&punit_res[pindex], res, sizeof(*res));
>> +                       punit_res[pindex].flags = IORESOURCE_MEM;
>> +                       pindex++;
>> +                       break;
>>                  };
>> +       }
>> +       ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, &punit_cell,
>> +                                  1, NULL, 0, NULL);
>>
>> +       dev_dbg(&pdev->dev, "Successfully created PUNIT device\n");
>>
> Wrong. If ret is not 0 the message is misleading.
> Just remove it.
>
> Same for the rest cases.
I will remove it.
>
>> +       return ret;
>>   }
>> +static int ipc_create_wdt_device(struct platform_device *pdev)
>>   {
>> +       static struct resource wdt_ipc_res[2];
>> +       static struct mfd_cell wdt_cell;
>>          struct resource *res;
>> +       int ret;
>>
>> +       /* If we have ACPI based watchdog use that instead, othewise create
>> +        * a MFD cell for iTCO watchdog
>> +        */
> Style.
Got it. I will be fixed in next version.
>
>> +       if (acpi_has_watchdog())
>> +               return 0;
>> +       ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, &wdt_cell,
>> +                                  1, NULL, 0, NULL);
>> +
>> +       dev_dbg(&pdev->dev, "Successfully created watchdog device\n");
>> +
>> +       return ret;
> What Heikki meant is to fill cells by those helper functions and call
> mfd_add_devices() only once.
Ok. It will be fixed in next version.

I could not find the actual BUG reported by Heikki. So I did not 
understand the reason behind his proposal.
>
> See lpc_ich.c as an example.
>
>>   }
>> +static int ipc_create_pmc_devices(struct platform_device *pdev)
>>   {
>>          int ret;
>>
>> +       ret = ipc_create_punit_device(pdev);
>> +       if (ret < 0)
>> +               return ret;
> Is it fatal? (Hint: it's quite likely not)
Logically not. But this logic exist in originally driver. I did not want 
to change the behavior without knowing the full details. Let me know 
your opinion.
>
>> +       ret = ipc_create_wdt_device(pdev);
>> +       if (ret < 0)
>> +               return ret;
> Is it fatal?
Same as above.
>
>> +       ret = ipc_create_telemetry_device(pdev);
>> +       if (ret < 0)
>> +               return ret;
> Is it fatal?
Same as above.
>
>> +       return 0;
>>   }
>> +       ret = devm_request_irq(&pdev->dev, ipcdev.irq, ioc, IRQF_NO_SUSPEND,
>> +                              "intel_pmc_ipc", &ipcdev);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "Failed to request IRQ\n");
>> +               return ret;
>>          }
>>
>>          ret = sysfs_create_group(&pdev->dev.kobj, &intel_ipc_group);
>>          if (ret) {
>>                  dev_err(&pdev->dev, "Failed to create sysfs group %d\n",
>>                          ret);
>> -               goto err_sys;
>> +               devm_free_irq(&pdev->dev, ipcdev.irq, &ipcdev);
> Why do you need this one?
This was added by you in one of the previous submissions.

I think you added it because we have a separate device remove function 
in this driver, and not explicitly freeing IRQ could mess up the 
resource cleanup order.
>
>> +               return ret;
>>          }
>>
>>          ipcdev.has_gcr_regs = true;
>>
>>          return 0;
>>   }
> And to the main question, what this is doing in PDx86 now? There
> should be a patch to move it under drivers/mfd.
Drivers like drivers/platform/chrome/cros_ec_dev.c already use MFD calls 
outside MFD framework. I am not sure what is the norm.

If you agree with the move, I will submit a patch for it.
>
> In _any case_ I need an Ack from Lee.
>
