From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] platform/x86: Add IMS/ZII SCU driver
Date: Fri, 13 Jan 2017 21:49:13 -0800
Message-ID: <0cf81bff-5dd1-ca73-10cd-5fbddff88c41@roeck-us.net>
References: <20170111212644.9217-1-f.fainelli@gmail.com>
 <CAHp75VcH9ez0AjybBA8mtJ=nSyTTjXeV6d_P_NBA-mZmxjZ+Ng@mail.gmail.com>
 <bb11c1e9-294c-5302-3eb8-f12ecb969855@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bb11c1e9-294c-5302-3eb8-f12ecb969855@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, cphealy@gmail.com, Darren Hart <dvhart@infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 01/13/2017 03:15 PM, Florian Fainelli wrote:
> On 01/13/2017 08:38 AM, Andy Shevchenko wrote:
>> On Wed, Jan 11, 2017 at 11:26 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>> From: Guenter Roeck <linux@roeck-us.net>
>>>
>>> This patch adds support for the IMS (now Zodiac Inflight Innovations)
>>> SCU Generation 1/2/3 platform driver. This driver registers all the
>>> on-module peripherals: Ethernet switches (Broadcom or Marvell), I2C to
>>> GPIO expanders, Kontrom CPLD/I2C master, and more.
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>
>>> ---
>>> Darren,
>>>
>>> This is against your "for-next" branch thanks!
>>
>> I'm going to review this later, though few of comments.
>>
>>> +config SCU
>>
>> No, no. We have enough mess with Intel's SCU/PMIC here, not add more.
>
> OK OK.
>
>>
>> At least add manufacturer as prefix to option and file name.
>>
>> Btw, Darren, would it be good idea to start creating folders to make a
>> bit of order in the subsystem? For first I would move Intel's PMIC/SCU
>> stuff to somewhere (not sure if it should be per manufacturer or per
>> function).
>>
>>> +obj-$(CONFIG_SCU)              += scu.o
>>
>> For file name as well.
>>
>>> +#include <linux/kernel.h>
>>> +#include <linux/init.h>
>>> +#include <linux/types.h>
>>> +#include <linux/string.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/leds.h>
>>> +#include <linux/platform_data/mdio-gpio.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/gpio.h>
>>> +#include <linux/err.h>
>>> +#include <linux/dmi.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/i2c-gpio.h>
>>> +#include <linux/version.h>
>>> +#include <linux/platform_data/at24.h>
>>> +#include <linux/platform_data/pca953x.h>
>>> +#include <linux/sysfs.h>
>>> +#include <linux/spi/spi.h>
>>> +#include <linux/proc_fs.h>
>>> +#include <linux/seq_file.h>
>>> +#include <linux/netdevice.h>
>>> +#include <linux/rtnetlink.h>
>>> +#include <linux/nvmem-consumer.h>
>>
>> Is it possible to keep them in order?
>> Do you need all of them?
>> Does it sound like MFD driver + individual drivers?
>
> My understanding of a valid MFD candidate driver is that is partitions a
> shared resource space into individual resources that can all be managed
> by their respective driver. The KemPLD driver is already a MFD driver,
> here, this is more of a superset of all of that and an aggregate
> x86-based module that has a number of on-board peripherals.
>
>>
>>> +struct __packed eeprom_data {
>>> +       unsigned short length;                  /* 0 - 1 */
>>> +       unsigned char checksum;                 /* 2 */
>>> +       unsigned char have_gsm_modem;           /* 3 */
>>> +       unsigned char have_cdma_modem;          /* 4 */
>>> +       unsigned char have_wifi_modem;          /* 5 */
>>> +       unsigned char have_rhdd;                /* 6 */
>>> +       unsigned char have_dvd;                 /* 7 */
>>> +       unsigned char have_tape;                /* 8 */
>>> +       unsigned char have_humidity_sensor;     /* 9 */
>>> +       unsigned char have_fiber_channel;       /* 10 */
>>> +       unsigned char lru_part_number[11];      /* 11 - 21 Box Part Number */
>>> +       unsigned char lru_revision[7];          /* 22 - 28 Box Revision */
>>> +       unsigned char lru_serial_number[7];     /* 29 - 35 Box Serial Number */
>>> +       unsigned char lru_date_of_manufacture[7];
>>> +                               /* 36 - 42 Box Date of Manufacture */
>>> +       unsigned char board_part_number[11];
>>> +                               /* 43 - 53 Base Board Part Number */
>>> +       unsigned char board_revision[7];
>>> +                               /* 54 - 60 Base Board Revision */
>>> +       unsigned char board_serial_number[7];
>>> +                               /* 61 - 67 Base Board Serial Number */
>>> +       unsigned char board_date_of_manufacture[7];
>>> +                               /* 68 - 74 Base Board Date of Manufacture */
>>> +       unsigned char board_updated_date_of_manufacture[7];
>>> +                               /* 75 - 81 Updated Box Date of Manufacture */
>>> +       unsigned char board_updated_revision[7];
>>> +                               /* 82 - 88 Updated Box Revision */
>>> +       unsigned char dummy[7]; /* 89 - 95 spare/filler */
>>> +};
>>
>> Would it be better to use fixed-width types here:
>> u8
>> u16
>>
>>> +enum scu_version { scu1, scu2, scu3, unknown };
>>
>> MANUFACTURER_SCU_VERSION_x
>> ?
>
> OK.
>
>>
>>> +struct scu_data {
>>> +       struct device *dev;                     /* SCU platform device */
>>> +       struct net_device *netdev;              /* Ethernet device */
>>> +       struct platform_device *mdio_dev;       /* MDIO device */
>>> +       struct platform_device *dsa_dev;        /* DSA device */
>>> +       struct proc_dir_entry *rave_proc_dir;
>>> +       struct mutex write_lock;
>>> +       struct platform_device *leds_pdev[3];
>>> +       struct i2c_adapter *adapter;            /* I2C adapter */
>>> +       struct spi_master *master;              /* SPI master */
>>> +       struct i2c_client *client[10];          /* I2C clients */
>>> +       struct spi_device *spidev[1];           /* SPI devices */
>>
>> Comments are good candidates for kernel doc.
>>
>>> +       const struct scu_platform_data *pdata;
>>> +       bool have_write_magic;
>>> +       struct eeprom_data eeprom;
>>> +       struct nvmem_device *nvmem;
>>
>>> +       bool eeprom_accessible;
>>> +       bool eeprom_valid;
>>
>> unsigned int flag1:1;
>> unsigned int flag2:1;
>>
>> ?
>
> Are you concerned with storage, or what motivates the preference for
> bitfields vs. bools?
>
Four bytes less storage, lots of additional code for each access. Not really sure
if I like that idea. In my scope of responsibility I ask for the opposite.

>>
>>
>>> +/* platform data */
>>> +
>>> +static struct gpio_led pca_gpio_leds1[] = {
>>> +       {                       /* bit 0 */
>>> +        .name = "scu_status:g:RD",
>>> +        .gpio = SCU_RD_LED_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "heartbeat",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 1 */
>>> +        .name = "scu_status:a:WLess",
>>> +        .gpio = SCU_WLES_LED_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 2 */
>>> +        .name = "scu_status:r:LDFail",
>>> +        .gpio = SCU_LD_FAIL_LED_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 3 */
>>> +        .name = "scu_status:a:SW",
>>> +        .gpio = SCU_SW_LED_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +       }
>>> +};
>>> +
>>> +static struct gpio_led_platform_data pca_gpio_led_info1 = {
>>> +       .leds = pca_gpio_leds1,
>>> +       .num_leds = ARRAY_SIZE(pca_gpio_leds1),
>>> +};
>>> +
>>> +static struct gpio_led pca_gpio_leds2[] = {
>>> +       {                       /* bit 0 */
>>> +        .name = "SD1:g:active",
>>> +        .gpio = SCU_SD_ACTIVE_1_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 1 */
>>> +        .name = "SD1:a:error",
>>> +        .gpio = SCU_SD_ERROR_1_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 2 */
>>> +        .name = "SD2:g:active",
>>> +        .gpio = SCU_SD_ACTIVE_2_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 3 */
>>> +        .name = "SD2:a:error",
>>> +        .gpio = SCU_SD_ERROR_2_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 4 */
>>> +        .name = "SD3:g:active",
>>> +        .gpio = SCU_SD_ACTIVE_3_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 5 */
>>> +        .name = "SD3:a:error",
>>> +        .gpio = SCU_SD_ERROR_3_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +       }
>>> +};
>>> +
>>> +static struct gpio_led_platform_data pca_gpio_led_info2 = {
>>> +       .leds = pca_gpio_leds2,
>>> +       .num_leds = ARRAY_SIZE(pca_gpio_leds2),
>>> +};
>>> +
>>> +static struct gpio_led pca_gpio_leds3[] = {
>>> +       {                       /* bit 0 */
>>> +        .name = "SD4:g:active",
>>> +        .gpio = SCU_SD_ACTIVE_4_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 1 */
>>> +        .name = "SD4:a:error",
>>> +        .gpio = SCU_SD_ERROR_4_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 2 */
>>> +        .name = "SD5:g:active",
>>> +        .gpio = SCU_SD_ACTIVE_5_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 3 */
>>> +        .name = "SD5:a:error",
>>> +        .gpio = SCU_SD_ERROR_5_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 4 */
>>> +        .name = "SD6:g:active",
>>> +        .gpio = SCU_SD_ACTIVE_6_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +        },
>>> +       {                       /* bit 5 */
>>> +        .name = "SD6:a:error",
>>> +        .gpio = SCU_SD_ERROR_6_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +       }
>>> +};
>>
>> Hmm... Can you utilize device tree for that?
>
> Not really an option here
>
Yes, that would be a bit tricky for an x86 system.

>> Or built-in device properties?
>
> Not clear what you mean by that, can you expand?
>
Use device_property_ functions to read the values in the drivers,
and [platform_]device_add_properties() to add them.
See drivers/base/property.c.

Last time I looked that didn't support everything that would be needed
here, but it might work for a subset (if the client drivers support
device properties and not just devicetree properties).

Guenter

>>
>>> +static struct gpio_led_platform_data pca_gpio_led_info3 = {
>>> +       .leds = pca_gpio_leds3,
>>> +       .num_leds = ARRAY_SIZE(pca_gpio_leds3),
>>> +};
>>> +
>>> +static void pca_leds_register(struct device *parent,
>>> +                             struct scu_data *data)
>>> +{
>>> +       data->leds_pdev[0] =
>>> +               platform_device_register_data(parent, "leds-gpio", 1,
>>> +                                             &pca_gpio_led_info1,
>>> +                                             sizeof(pca_gpio_led_info1));
>>> +       data->leds_pdev[1] =
>>> +               platform_device_register_data(parent, "leds-gpio", 2,
>>> +                                             &pca_gpio_led_info2,
>>> +                                             sizeof(pca_gpio_led_info2));
>>> +       data->leds_pdev[2] =
>>> +               platform_device_register_data(parent, "leds-gpio", 3,
>>> +                                             &pca_gpio_led_info3,
>>> +                                             sizeof(pca_gpio_led_info3));
>>> +}
>>
>> It really sounds like MFD to me.
>
> It's more of a board description of attached peripherals (all of them),
> more than a multi-function device, the whole module is by nature, "multi
> function" since it has a bunch of different I/Os and on-module peripherals.
>
> Thanks for your feedback!
>
