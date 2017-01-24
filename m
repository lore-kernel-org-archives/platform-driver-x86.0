From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: Add IMS/ZII SCU driver
Date: Tue, 24 Jan 2017 23:08:25 +0200
Message-ID: <CAHp75Ve-ejXG+SJk-b=qPbkd2k-5hSdo=7iEk9z0joCXLusp=g@mail.gmail.com>
References: <20170111212644.9217-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170111212644.9217-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Chris Healy <cphealy@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Darren Hart <dvhart@infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 11, 2017 at 11:26 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> From: Guenter Roeck <linux@roeck-us.net>
>
> This patch adds support for the IMS (now Zodiac Inflight Innovations)
> SCU Generation 1/2/3 platform driver. This driver registers all the
> on-module peripherals: Ethernet switches (Broadcom or Marvell), I2C to
> GPIO expanders, Kontrom CPLD/I2C master, and more.

Here additional comments to previously shallow review.

> +config SCU
> +       tristate "SCU driver"
> +       depends on DMI
> +       ---help---

> +         Enable SCU driver

Be more verbose here, list platforms it supports, etc.

> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

Please, remove this snail address.

> +struct __packed eeprom_data {
> +       unsigned short length;                  /* 0 - 1 */
> +       unsigned char checksum;                 /* 2 */
> +       unsigned char have_gsm_modem;           /* 3 */
> +       unsigned char have_cdma_modem;          /* 4 */
> +       unsigned char have_wifi_modem;          /* 5 */
> +       unsigned char have_rhdd;                /* 6 */
> +       unsigned char have_dvd;                 /* 7 */
> +       unsigned char have_tape;                /* 8 */
> +       unsigned char have_humidity_sensor;     /* 9 */
> +       unsigned char have_fiber_channel;       /* 10 */
> +       unsigned char lru_part_number[11];      /* 11 - 21 Box Part Number */
> +       unsigned char lru_revision[7];          /* 22 - 28 Box Revision */
> +       unsigned char lru_serial_number[7];     /* 29 - 35 Box Serial Number */
> +       unsigned char lru_date_of_manufacture[7];
> +                               /* 36 - 42 Box Date of Manufacture */
> +       unsigned char board_part_number[11];
> +                               /* 43 - 53 Base Board Part Number */
> +       unsigned char board_revision[7];
> +                               /* 54 - 60 Base Board Revision */
> +       unsigned char board_serial_number[7];
> +                               /* 61 - 67 Base Board Serial Number */
> +       unsigned char board_date_of_manufacture[7];
> +                               /* 68 - 74 Base Board Date of Manufacture */
> +       unsigned char board_updated_date_of_manufacture[7];
> +                               /* 75 - 81 Updated Box Date of Manufacture */
> +       unsigned char board_updated_revision[7];
> +                               /* 82 - 88 Updated Box Revision */
> +       unsigned char dummy[7]; /* 89 - 95 spare/filler */
> +};

Perhaps gather all comments to one nice description of EEPROM structure?

> +struct scu_platform_data {
> +       const char *board_type;
> +       const char *lru_part_number;
> +       const char *board_part_number;
> +       enum scu_version version;
> +       int eeprom_len;
> +       struct i2c_board_info *i2c_board_info;
> +       int num_i2c_board_info;
> +       struct spi_board_info *spi_board_info;
> +       int num_spi_board_info;
> +       void (*init)(struct scu_data *);
> +       void (*remove)(struct scu_data *);
> +};
> +
> +struct scu_data {
> +       struct device *dev;                     /* SCU platform device */
> +       struct net_device *netdev;              /* Ethernet device */
> +       struct platform_device *mdio_dev;       /* MDIO device */
> +       struct platform_device *dsa_dev;        /* DSA device */
> +       struct proc_dir_entry *rave_proc_dir;
> +       struct mutex write_lock;

> +       struct platform_device *leds_pdev[3];

3

> +       struct i2c_client *client[10];          /* I2C clients */

10

> +       struct spi_device *spidev[1];           /* SPI devices */

1

Is it by design in hardware, or it might be changed in SCU firmware?
Would be nice to have a comment for the fields.

> +/* sysfs */

Kinda useless.

> +static int scu_update_checksum(struct scu_data *data)
> +{
> +       unsigned char checksum;
> +       int ret;
> +
> +       data->eeprom.checksum = 0;
> +       checksum = scu_get_checksum((unsigned char *)&data->eeprom,
> +                                   data->pdata->eeprom_len);
> +       data->eeprom.checksum = ~checksum + 1;
> +       ret = nvmem_device_write(data->nvmem,

> +                       0x300 + offsetof(struct eeprom_data, checksum),

Magic.

> +                       sizeof(data->eeprom.checksum),
> +                       &data->eeprom.checksum);

> +       if (ret <= 0)
> +               return ret < 0 ? ret : -EIO;

> +       return 0;

if (ret < 0)
 return ret;
return ret ? 0 : -EIO;

?

Though I think ret == 0 case would be handled by caller.

> +static ssize_t scu_object_store(struct scu_data *data, int offset,
> +                               const char *in, char *out, ssize_t len)
> +{
> +       char buffer[12] = { 0 };

Do you need initialization for it?

> +       strlcpy(buffer, in, sizeof(buffer));
> +       /* do not copy newline from input string */
> +       cp = strchr(buffer, '\n');
> +       if (cp)
> +               *cp = '\0';

Perhaps better to move it after you get new len.

> +       if (len > sizeof(buffer))
> +               len = sizeof(buffer);
> +
> +       mutex_lock(&data->write_lock);

> +       strncpy(out, buffer, len);

Does it need to be protected?

> +
> +       /* Write entire eeprom if it was marked invalid */
> +       if (!data->eeprom_valid) {

> +               offset = 0;
> +               /* Write checksumed and non checksumed data */
> +               len = sizeof(data->eeprom);
> +               out = (char *)&data->eeprom;

Maybe just do a call with different parameters?

> +       }
> +

> +       ret = nvmem_device_write(data->nvmem, 0x300 + offset, len, out);

Magic.

> +       if (ret <= 0) {
> +               data->eeprom_valid = false;
> +               if (ret == 0)
> +                       ret = -EIO;

Since you are using this idiom you might consider a wrapper for this.
It would perhaps hide magic number as well.

> +               goto error;
> +       }
> +       if (offset < data->pdata->eeprom_len) {
> +               /*
> +                * Write to checksummed area of eeprom
> +                * Update checksum
> +                */
> +               ret = scu_update_checksum(data);
> +               if (ret < 0) {
> +                       data->eeprom_valid = false;
> +                       goto error;
> +               }
> +       }
> +       data->eeprom_valid = true;

> +error:

error_unlock: ?

> +       mutex_unlock(&data->write_lock);
> +       return ret;
> +}

> +static umode_t scu_attr_is_visible(struct kobject *kobj, struct attribute *attr,
> +                                  int index)
> +{
> +       struct device *dev = container_of(kobj, struct device, kobj);
> +       struct scu_data *data = dev_get_drvdata(dev);
> +       umode_t mode = attr->mode;
> +
> +       /*
> +        * If the eeprom has not been processed, disable its attributes.
> +        * If it has been processed but is not accessible, disable
> +        * write accesses to it.
> +        */
> +       if (index >= 1 && !data->eeprom_accessible)

> +               mode &= 0444;

return mode & 0444; ?

> +
> +       if (index >= 4 && data->pdata->version == scu1)
> +               return 0;
> +
> +       return mode;
> +}

> +/* platform data */

Useless.

> +       for (i = 0; i < ARRAY_SIZE(data->leds_pdev); i++)
> +               platform_device_unregister(data->leds_pdev[i]);

Sign of MFD.

> +static int scu_gpio_common_setup(unsigned int gpio_base, unsigned int ngpio,
> +                                u32 mask, u32 is_input, u32 is_active,
> +                                u32 active_low)
> +{
> +       int i;
> +       unsigned long flags;
> +

> +       for (i = 0; i < ngpio; i++) {
> +               if (!(mask & (1 << i)))
> +                       continue;

for_each_set_bit()

> +               flags = GPIOF_EXPORT_DIR_FIXED;
> +               if (is_input & (1 << i)) {
> +                       flags |= GPIOF_DIR_IN;
> +               } else {
> +                       flags |= GPIOF_DIR_OUT;
> +                       if (is_active & (1 << i))
> +                               flags |= GPIOF_INIT_HIGH;
> +               }
> +               if (active_low & (1 << i))
> +                       flags |= GPIOF_ACTIVE_LOW;
> +               gpio_request_one(gpio_base + i, flags, NULL);
> +       }

Use BIT() macro

> +       return 0;
> +}

I might assume that GPIO library has some helper for that.

> +static void scu_gpio_common_teardown(unsigned int gpio_base, int ngpio,
> +                                    u32 mask)
> +{
> +       int i;
> +
> +       for (i = 0; i < ngpio; i++) {
> +               if (mask & (1 << i)) {

for_each_set_bit()

> +                       gpio_unexport(gpio_base + i);
> +                       gpio_free(gpio_base + i);
> +               }
> +       }
> +}

And something telling me that it would much easier to do this.
Existing helpers / drivers?

> +static int scu_instantiate_i2c(struct scu_data *data, int base,
> +                              struct i2c_board_info *info, int count)
> +{
> +       int i;
> +
> +       for (i = 0; i < count; i++) {

> +               data->client[base + i] = i2c_new_device(data->adapter, info);
> +               if (!data->client[base + i]) {
> +                       /*
> +                        * Unfortunately this call does not tell us
> +                        * why it failed. Pick the most likely reason.
> +                        */
> +                       return -EBUSY;
> +               }

Shouldn't i2c core do this for you whenever adapter is probed?

> +               info++;
> +       }
> +       return 0;
> +}

> +static int scu_instantiate_spi(struct scu_data *data,
> +                              struct spi_board_info *info, int count)
> +{
> +       struct spi_master *master;
> +       int i;
> +
> +       /* SPI bus number matches i2c bus number (set by sc18is602 driver) */
> +       master = spi_busnum_to_master(data->adapter->nr);
> +       if (!master) {
> +               dev_err(data->dev, "Failed to find SPI adapter\n");
> +               return -ENODEV;
> +       }
> +       data->master = master;
> +
> +       for (i = 0; i < count; i++) {
> +               info->bus_num = master->bus_num;
> +               /* ignore errors */
> +               data->spidev[i] = spi_new_device(master, info);
> +               info++;
> +       }

Ditto (spi core).

> +       return 0;
> +}

> +/*
> + * This is the callback function when a a specifc at24 eeprom is found.
> + * Its reads out the eeprom contents via the read function passed back in via
> + * struct memory_accessor. It then calls part_number_proc, serial_number_proc,
> + * and dom_proc to populate the procfs entries for each specific field.
> + */

Hmm... Sounds like a stuff on top of EEPROM chip(s).
Can it be separate module?

> +static void populate_unit_info(struct nvmem_device *nvmem,
> +                              void *context)
> +{
> +       const struct scu_platform_data *pdata = &scu_platform_data[unknown];
> +       struct scu_data *data = context;
> +       unsigned char *ptr;
> +       int i, len;
> +
> +       data->nvmem = nvmem;
> +
> +       ptr = (unsigned char *)&data->eeprom;
> +       /* Read Data structure from EEPROM */
> +       if (nvmem_device_read(nvmem, 0x300, sizeof(data->eeprom), ptr) <= 0) {
> +               dev_err(data->dev, "Failed to read eeprom data\n");
> +               goto error;
> +       }
> +
> +       /* EEPROM is accessible, permit write access to it */
> +       data->eeprom_accessible = true;
> +
> +       /* Special case - eeprom not programmed */
> +       if (data->eeprom.length == 0xffff && data->eeprom.checksum == 0xff) {
> +               /* Assume it is SCU3, but report different board type */
> +               memset(&data->eeprom, '\0', sizeof(data->eeprom));
> +               data->eeprom.length = cpu_to_le16(SCU_EEPROM_LEN_EEPROM);
> +               goto unprogrammed;
> +       }
> +
> +       /* Sanity check */
> +       if (le16_to_cpu(data->eeprom.length) != SCU_EEPROM_LEN_EEPROM) {
> +               dev_err(data->dev,
> +                       "Bad eeprom data length: Expected %d, got %d\n",
> +                       SCU_EEPROM_LEN_EEPROM,
> +                       le16_to_cpu(data->eeprom.length));
> +               goto error;
> +       }
> +
> +       /* Update platform data based on part number retrieved from EEPROM */
> +       for (i = 0; i < ARRAY_SIZE(scu_platform_data); i++) {
> +               const struct scu_platform_data *tpdata = &scu_platform_data[i];
> +
> +               if (tpdata->lru_part_number == NULL)
> +                       continue;
> +               if (!strncmp(data->eeprom.lru_part_number,
> +                            tpdata->lru_part_number,
> +                            strlen(tpdata->lru_part_number))) {
> +                       pdata = tpdata;
> +                       break;
> +               }
> +       }
> +
> +unprogrammed:
> +       data->pdata = pdata;
> +       /*
> +        * We know as much as we will ever find out about the platform.
> +        * Perform final platform initialization and instantiate additional
> +        * I2C devices as well as SPI devices now, prior to validating
> +        * the EEPROM checksum.
> +        */
> +       if (pdata->init)
> +               pdata->init(data);
> +
> +       if (pdata->i2c_board_info)
> +               scu_instantiate_i2c(data, ARRAY_SIZE(scu_i2c_info_common),
> +                                   pdata->i2c_board_info,
> +                                   pdata->num_i2c_board_info);
> +
> +       if (pdata->spi_board_info)
> +               scu_instantiate_spi(data, pdata->spi_board_info,
> +                                   pdata->num_spi_board_info);
> +
> +       len = data->pdata->eeprom_len;
> +
> +       /* Validate checksum */
> +       if (scu_get_checksum(ptr, len)) {
> +               dev_err(data->dev,
> +                       "EEPROM data checksum error: expected 0, got 0x%x [len=%d]\n",
> +                       scu_get_checksum(ptr, len), len);
> +               /* TBD: Do we want to clear the eeprom in this case ? */
> +               goto error_noclean;
> +       }
> +
> +       /* Create sysfs attributes based on retrieved platform data */
> +       data->eeprom_valid = true;
> +       goto done;
> +
> +error:
> +       memset(&data->eeprom, '\0', sizeof(data->eeprom));
> +       data->eeprom.length = cpu_to_le16(SCU_EEPROM_LEN_EEPROM);
> +error_noclean:
> +       data->eeprom_valid = false;
> +done:
> +       if (sysfs_create_group(&data->dev->kobj, &scu_eeprom_group))
> +               ;
> +       if (sysfs_create_bin_file(&data->dev->kobj,
> +                                 &scu_eeprom_test_scratchpad_file))
> +               ;
> +}


> +static int scu_probe(struct platform_device *pdev)
> +{
> +       struct proc_dir_entry *rave_board_type;
> +       struct device *dev = &pdev->dev;
> +       struct i2c_adapter *adapter;
> +       struct net_device *ndev;
> +       struct scu_data *data;
> +       int i, ret;
> +
> +       scu_request_modules(true);
> +
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, data);
> +
> +       data->dev = dev;
> +
> +       mutex_init(&data->write_lock);
> +
> +       /* look for ethernet device attached to 'e1000e' driver */
> +       rtnl_lock();
> +       for_each_netdev(&init_net, ndev) {
> +               if (ndev->dev.parent && ndev->dev.parent->driver &&
> +                   !strcmp(ndev->dev.parent->driver->name, "e1000e")) {
> +                       data->netdev = ndev;
> +                       break;
> +               }
> +       }
> +       rtnl_unlock();
> +
> +       if (!data->netdev)
> +               return -EPROBE_DEFER;

Can it be that it never appears?

> +
> +       /*
> +        * The adapter driver should have been loaded by now.
> +        * If not, try again later.
> +        */
> +       adapter = scu_find_i2c_adapter("i2c-kempld");
> +       if (!adapter) {
> +               ret = -EPROBE_DEFER;
> +               goto error_put_net;

Ditto.

> +               .owner = THIS_MODULE,

Do we need this?

> +static struct platform_device *scu_pdev;

-- 
With Best Regards,
Andy Shevchenko
