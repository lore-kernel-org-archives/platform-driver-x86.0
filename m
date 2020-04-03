From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/2] platform/x86: intel_int0002_vgpio: Use
 acpi_register_wakeup_handler()
Date: Fri, 3 Apr 2020 17:03:18 +0200
Message-ID: <873c0209-c335-a9fe-d17b-b8e089bdcc04@redhat.com>
References: <20200403105235.105187-1-hdegoede@redhat.com>
 <20200403105235.105187-2-hdegoede@redhat.com>
 <CAJZ5v0gcRgTTRfCKHS00y599NBhWPgAYQF0RfFo6-vDegYA6Eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAJZ5v0gcRgTTRfCKHS00y599NBhWPgAYQF0RfFo6-vDegYA6Eg@mail.gmail.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "5 . 4+" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 4/3/20 3:25 PM, Rafael J. Wysocki wrote:
> On Fri, Apr 3, 2020 at 12:52 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Power Management Events (PMEs) the INT0002 driver listens for get
>> signalled by the Power Management Controller (PMC) using the same IRQ
>> as used for the ACPI SCI.
>>
>> Since commit fdde0ff8590b ("ACPI: PM: s2idle: Prevent spurious SCIs from
>> waking up the system") the SCI triggering, without there being a wakeup
>> cause recognized by the ACPI sleep code, will no longer wakeup the system.
>>
>> This breaks PMEs / wakeups signalled to the INT0002 driver, the system
>> never leaves the s2idle_loop() now.
>>
>> Use acpi_register_wakeup_handler() to register a function which checks
>> the GPE0a_STS register for a PME and trigger a wakeup when a PME has
>> been signalled.
>>
>> With this new mechanism the pm_wakeup_hard_event() call is no longer
>> necessary, so remove it and also remove the matching device_init_wakeup()
>> calls.
>>
>> Fixes: fdde0ff8590b ("ACPI: PM: s2idle: Prevent spurious SCIs from waking up the system")
>> Cc: 5.4+ <stable@vger.kernel.org> # 5.4+
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Adjust for the wakeup-handler registration function being renamed to
>>    acpi_register_wakeup_handler()
>> ---
>>   drivers/platform/x86/intel_int0002_vgpio.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
>> index f14e2c5f9da5..9da19168b4f6 100644
>> --- a/drivers/platform/x86/intel_int0002_vgpio.c
>> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
>> @@ -122,11 +122,17 @@ static irqreturn_t int0002_irq(int irq, void *data)
>>          generic_handle_irq(irq_find_mapping(chip->irq.domain,
>>                                              GPE0A_PME_B0_VIRT_GPIO_PIN));
>>
>> -       pm_wakeup_hard_event(chip->parent);
>> -
> 
> If the event occurs before the "noirq" phase of suspending devices, it
> can be missed with this change AFAICS.
> 
>>          return IRQ_HANDLED;
>>   }
>>
>> +static bool int0002_check_wake(void *data)
>> +{
>> +       u32 gpe_sts_reg;
>> +
>> +       gpe_sts_reg = inl(GPE0A_STS_PORT);
>> +       return (gpe_sts_reg & GPE0A_PME_B0_STS_BIT);
>> +}
>> +
>>   static struct irq_chip int0002_byt_irqchip = {
>>          .name                   = DRV_NAME,
>>          .irq_ack                = int0002_irq_ack,
>> @@ -220,13 +226,13 @@ static int int0002_probe(struct platform_device *pdev)
>>                  return ret;
>>          }
>>
>> -       device_init_wakeup(dev, true);
>> +       acpi_register_wakeup_handler(irq, int0002_check_wake, NULL);
> 
> So I would just add the wakeup handler registration here.

Ok, will fix for the upcoming v3 of the series.

Regards,

Hans



> 
>>          return 0;
>>   }
>>
>>   static int int0002_remove(struct platform_device *pdev)
>>   {
>> -       device_init_wakeup(&pdev->dev, false);
>> +       acpi_unregister_wakeup_handler(int0002_check_wake, NULL);
>>          return 0;
>>   }
>>
>> --
> 
