From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: ACPI ambient light sensor
Date: Sun, 21 Oct 2012 19:05:49 +0100
Message-ID: <5084397D.8050103@kernel.org>
References: <CAObPJ3PctmLP56NvmLvJd+4w9e4xeOGSyz24FyBDXBQQVhDhxQ@mail.gmail.com> <4FFADCC2.6080006@cam.ac.uk> <CAObPJ3ORe_MGbmEHzZ4SGqZkn3HCQs+ocSw=Ttb7LbCTNCDkAQ@mail.gmail.com> <201209111121.34205.marex@denx.de> <CAObPJ3PB0VYNE9vhrwJRA9jpWX6p7_Kw8T2eCMgj0M0zJ9feUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAObPJ3PB0VYNE9vhrwJRA9jpWX6p7_Kw8T2eCMgj0M0zJ9feUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWFydGluIExpxaFrYQ==?= <marxin.liska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, joeyli <jlee-IBi9RG/b67k@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, pavel-ynQEQJNshbs@public.gmane.org, Jon Brenner <jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On 10/21/2012 06:02 PM, Martin Li=C5=A1ka wrote:
> Hello,
>    my kernel driver is still unable to start capturing in a proper wa=
y. First step for listening is
>
> /* echo 1 > /sys/bus/iio/devices/iio\:device0/scan_elements/in_illumi=
nance1_en*/
> /
> /
> but
>
> /*cat /sys/bus/iio/devices/iio\:device0/scan_elements/in_illuminance1=
_en*/
> /*-1*/

That is 'odd' to put it lightly.  That should just call iio_scan_el_sho=
w which
in turn calls test_bit on a bitmask.  I'm not sure that can return anyt=
hing other
than 0 or 1. This is then fed directly into an sprintf call.
Could there be a permissions issue or something similar?

> /*
> */
> I tried to decorate all result codes with printf.
> Dmesg dump:
> /[    0.927335] XXX: trigger init called/
> /[    0.928148] XXX: acpi_als_allocate_trigger: 0/
> /[    0.928275] XXX: acpi_als_trigger_init: 0/
> /[    3.255305] XXX: getting data for filling buffer/
> /[    3.255352] XXX: buffer is ready/
> /[   27.423650] XXX: getting data for filling buffer/
> /[   27.423698] XXX: buffer is ready/
> /[   30.444120] XXX: getting data for filling buffer/
>
> Do you have any advices how to figure out where is problem?
Yes, put some printk's into the core code and see what is going wrong.
Right now that cat giving you -1 is certainly suspicious.

Please do get your email client to handle patches nicely!
>
> Thank you,
> Martin
>
>
> /*
>  * ACPI Ambient Light Sensor Driver
>  *
>  * This program is free software; you can redistribute it and/or modi=
fy it
>  * under the terms and conditions of the GNU General Public License,
>  * version 2, as published by the Free Software Foundation.
>  *
>  * This program is distributed in the hope it will be useful, but WIT=
HOUT
>  * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or
>  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Lice=
nse for
>  * more details.
>  *
>  * You should have received a copy of the GNU General Public License
>  * along with this program.  If not, see <http://www.gnu.org/licenses=
/>.
>  */
>
> #include <linux/module.h>
> #include <linux/interrupt.h>
> #include <trace/events/printk.h>
> #include <acpi/acpi_bus.h>
> #include <acpi/acpi_drivers.h>
> #include <linux/err.h>
> #include <linux/mutex.h>
>
> #include <linux/iio/iio.h>
> #include <linux/iio/buffer.h>
> #include <linux/iio/sysfs.h>
> #include <linux/iio/trigger.h>
> #include <linux/iio/trigger_consumer.h>
> #include <linux/iio/triggered_buffer.h>
>
> #define PREFIX "ACPI: "
>
> #define ACPI_ALS_CLASS"als"
> #define ACPI_ALS_DEVICE_NAME"acpi-als"
> #define ACPI_ALS_NOTIFY_ILLUMINANCE0x80
> #define ACPI_ALS_NOTIFY_COLOR_TEMP0x81
> #define ACPI_ALS_NOTIFY_RESPONSE0x82
>
> #define ACPI_ALS_OUTPUTS3
>
> #define _COMPONENTACPI_ALS_COMPONENT
> ACPI_MODULE_NAME("acpi-als");
>
> MODULE_AUTHOR("Martin Liska");
> MODULE_DESCRIPTION("ACPI Ambient Light Sensor Driver");
> MODULE_LICENSE("GPL");
>
> struct acpi_als_chip {
> struct acpi_device*device;
> struct acpi_als_device*acpi_als_sys;
> struct mutexlock;
> struct iio_trigger*trig;
>
> int illuminance;
> int temperature;
> int chromaticity;
> int polling;
>
> int count;
> struct acpi_als_mapping *mappings;
> };
>
> static int acpi_als_add(struct acpi_device *device);
> static int acpi_als_remove(struct acpi_device *device, int type);
> static void acpi_als_notify(struct acpi_device *device, u32 event);
>
> static const struct acpi_device_id acpi_als_device_ids[] =3D {
> {"ACPI0008", 0},
> {"", 0},
> };
>
> MODULE_DEVICE_TABLE(acpi, acpi_als_device_ids);
>
> static struct acpi_driver acpi_als_driver =3D {
> .name =3D "acpi_als",
> .class =3D ACPI_ALS_CLASS,
> .ids =3D acpi_als_device_ids,
> .ops =3D {
> .add =3D acpi_als_add,
> .remove =3D acpi_als_remove,
> .notify =3D acpi_als_notify,
> },
> };
>
> struct acpi_als_mapping {
> int adjustment;
> int illuminance;
> };
>
> #define ALS_INVALID_VALUE_LOW0
> #define ALS_INVALID_VALUE_HIGH-1
>
> /* ------------------------------------------------------------------=
--------
> Ambient Light Sensor device Management
>    ------------------------------------------------------------------=
-------- */
>
> /*
>  * acpi_als_get_illuminance - get the current ambient light illuminan=
ce
>  */
> static int acpi_als_get_illuminance(struct acpi_als_chip *als)
> {
> acpi_status status;
> unsigned long long illuminance;
>
> status =3D acpi_evaluate_integer(als->device->handle,
> "_ALI", NULL, &illuminance);
>
> if (ACPI_FAILURE(status)) {
> ACPI_EXCEPTION((AE_INFO, status, "Error reading ALS illuminance"));
> als->illuminance =3D ALS_INVALID_VALUE_LOW;
> return -ENODEV;
> }
> als->illuminance =3D illuminance;
>
> return 0;
> }
>
> /*
>  * acpi_als_get_color_chromaticity - get the ambient light color chro=
maticity
>  */
> static int acpi_als_get_color_chromaticity(struct acpi_als_chip *chip=
)
> {
> acpi_status status;
> unsigned long long chromaticity;
>
> status =3D
>     acpi_evaluate_integer(chip->device->handle, "_ALC", NULL,
>   &chromaticity);
> if (ACPI_FAILURE(status)) {
> ACPI_DEBUG_PRINT((ACPI_DB_INFO, "_ALC not available\n"));
> return -ENODEV;
> }
> chip->chromaticity =3D chromaticity;
> return 0;
> }
>
> /*
>  * acpi_als_get_color_temperature - get the ambient light color tempe=
rature
>  */
> static int acpi_als_get_color_temperature(struct acpi_als_chip *chip)
> {
> acpi_status status;
> unsigned long long temperature;
>
> status =3D
>     acpi_evaluate_integer(chip->device->handle, "_ALT", NULL,
>   &temperature);
> if (ACPI_FAILURE(status)) {
> ACPI_DEBUG_PRINT((ACPI_DB_INFO, "_ALT not available\n"));
> return -ENODEV;
> }
> chip->temperature =3D temperature;
> return 0;
> }
>
> /*
>  * acpi_als_get_mappings - get the ALS illuminance mappings
>  *
>  * Return a package of ALS illuminance to display adjustment mappings
>  * that can be used by OS to calibrate its ambient light policy
>  * for a given sensor configuration.
>  */
> static int acpi_als_get_mappings(struct acpi_als_chip *chip)
> {
> int result =3D 0;
> acpi_status status;
> struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL };
> union acpi_object *alr;
> int i, j;
>
> /* Free the old mappings */
> kfree(chip->mappings);
> chip->mappings =3D NULL;
>
> status =3D
>     acpi_evaluate_object(chip->device->handle, "_ALR", NULL, &buffer)=
;
> if (ACPI_FAILURE(status)) {
> ACPI_EXCEPTION((AE_INFO, status, "Error reading ALS mappings"));
> return -ENODEV;
> }
>
> alr =3D buffer.pointer;
> if (!alr || (alr->type !=3D ACPI_TYPE_PACKAGE)) {
> printk(KERN_ERR PREFIX "Invalid _ALR data\n");
> result =3D -EFAULT;
> goto end;
> }
>
> ACPI_DEBUG_PRINT((ACPI_DB_INFO, "Found %d illuminance mappings\n",
>   alr->package.count));
>
> chip->count =3D alr->package.count;
>
> if (!chip->count)
> return 0;
>
> chip->mappings =3D
>     kmalloc(sizeof(struct acpi_als_mapping) * chip->count, GFP_KERNEL=
);
> if (!chip->mappings) {
> result =3D -ENOMEM;
> goto end;
> }
>
> for (i =3D 0, j =3D 0; i < chip->count; i++) {
> struct acpi_als_mapping *mapping =3D &(chip->mappings[j]);
> union acpi_object *element =3D &(alr->package.elements[i]);
>
> if (element->type !=3D ACPI_TYPE_PACKAGE)
> continue;
>
> if (element->package.count !=3D 2)
> continue;
>
> if (element->package.elements[0].type !=3D ACPI_TYPE_INTEGER ||
>     element->package.elements[1].type !=3D ACPI_TYPE_INTEGER)
> continue;
>
> mapping->adjustment =3D
>     element->package.elements[0].integer.value;
> mapping->illuminance =3D
>     element->package.elements[1].integer.value;
> j++;
>
> ACPI_DEBUG_PRINT((ACPI_DB_INFO, "Mapping [%d]: "
>   "adjustment [%d] illuminance[%d]\n",
>   i, mapping->adjustment,
>   mapping->illuminance));
> }
>
> end:
> kfree(buffer.pointer);
> return result;
> }
>
> /*
>  * acpi_als_get_polling - get a recommended polling frequency
>  *   for the Ambient Light Sensor device
>  */
> static int acpi_als_get_polling(struct acpi_als_chip *chip)
> {
> acpi_status status;
> unsigned long long polling;
>
> status =3D
>     acpi_evaluate_integer(chip->device->handle, "_ALP", NULL, &pollin=
g);
> if (ACPI_FAILURE(status)) {
> ACPI_DEBUG_PRINT((ACPI_DB_INFO, "_ALP not available\n"));
> return -ENODEV;
> }
>
> chip->polling =3D polling;
> return 0;
> }
>
> static int get_illuminance(struct acpi_als_chip *als, int *illuminanc=
e)
> {
> int result;
>
> result =3D acpi_als_get_illuminance(als);
> if (!result)
> *illuminance =3D als->illuminance;
>
> return result;
> }
>
> static void acpi_als_notify(struct acpi_device *device, u32 event)
> {
> int illuminance;
> struct iio_dev *indio_dev =3D acpi_driver_data(device);
>         struct iio_buffer *buffer =3D indio_dev->buffer;
> struct acpi_als_chip *chip =3D iio_priv(indio_dev);
>         s64 time_ns =3D iio_get_time_ns();
> int len =3D 2;
>
> u8 data[sizeof(s64) + len];
>
> printk("XXX: getting data for filling buffer\n");
> get_illuminance(chip, &illuminance);
> *(int *)((u8 *)data) =3D illuminance;
> *(s64 *)((u8 *)data + ALIGN(len, sizeof(s64))) =3D time_ns;
>
> printk("XXX: buffer is ready\n");
>
>         if (iio_buffer_enabled(indio_dev)) {
> printk("XXX: pushing to buffer\n");
> iio_push_to_buffer(buffer, data);
> printk("XXX: push to buffer called\n");
> }
> }
>
> static int acpi_als_read_raw(struct iio_dev *indio_dev,
> struct iio_chan_spec const *chan, int *val, int *val2, long mask)
> {
> struct acpi_als_chip *chip =3D iio_priv(indio_dev);
> int ret =3D -EINVAL;
>
> mutex_lock(&chip->lock);
>
> switch (mask) {
> case IIO_CHAN_INFO_RAW:
> case IIO_CHAN_INFO_PROCESSED:
> switch(chan->type) {
> case IIO_LIGHT:
> ret =3D get_illuminance(chip, val);
> break;
> default:
> break;
> }
>
> if(!ret)
> ret =3D IIO_VAL_INT;
>
> break;
> default:
> dev_err(&chip->device->dev, "mask value 0x%08lx not supported\n", mas=
k);
> break;
> }
> mutex_unlock(&chip->lock);
>
> return ret;
> }
>
> static const struct iio_chan_spec acpi_als_channels[] =3D {
> {
> .type =3D IIO_LIGHT,
> .indexed =3D 1,
> .channel =3D 1,
> .scan_type.sign =3D 'u',
> .scan_type.realbits =3D 10,
> .scan_type.storagebits =3D 16,
Doesn't matter as only one channel, but I'd prefer to see
the scan_index specified here.
> .info_mask =3D IIO_CHAN_INFO_PROCESSED_SEPARATE_BIT |
> IIO_CHAN_INFO_SCALE_SEPARATE_BIT,
> },
> };
>
> static const struct iio_info acpi_als_info =3D {
> .driver_module =3D THIS_MODULE,
> .read_raw =3D &acpi_als_read_raw,
> .write_raw =3D NULL,
> };
>
> static irqreturn_t acpi_als_trigger_handler(int irq, void *p)
> {
>
> struct iio_poll_func *pf =3D p;
> struct iio_dev *idev =3D pf->indio_dev;
>
>
> struct acpi_als_chip *chip =3D iio_priv(idev);
> struct iio_buffer *buffer =3D idev->buffer;
> int i, j =3D 0;
>
> printk("XXX: TRIGGER handler called :)");
> iio_trigger_notify_done(chip->trig);
> return IRQ_HANDLED;
>
>
> /* TODO: remove */
> u8 b[64];
>
> for (i =3D 0; i < idev->masklength; i++) {
> if (!test_bit(i, idev->active_scan_mask))
> continue;
>
> // TODO: read
> j++;
> }
>
> if (idev->scan_timestamp) {
> s64 *timestamp =3D (s64 *)((u8 *)b +
> ALIGN(j, sizeof(s64)));
> *timestamp =3D pf->timestamp;
> }
>
> //buffer->access->store_to(buffer, (u8 *)b, pf->timestamp);
Well not storing to the buffer is certainly not going to help.
Also there is a iio_push_to_buffer for this.
>
> iio_trigger_notify_done(idev->trig);
> return IRQ_HANDLED;
> }
>
> /**
>  * acpi_als_data_rdy_trigger_set_state() set datardy interrupt state
>  **/
> static int acpi_als_data_rdy_trigger_set_state(struct iio_trigger *tr=
ig,
> bool state)
> {
> printk("XXX: set_state called\n");
>
> struct iio_dev *indio_dev =3D trig->private_data;
>
> dev_dbg(&indio_dev->dev, "%s (%d)\n", __func__, state);
>
> return 0;
> }
>
> static const struct iio_trigger_ops acpi_als_trigger_ops =3D {
> .owner =3D THIS_MODULE,
> .set_trigger_state =3D &acpi_als_data_rdy_trigger_set_state
> };
>
> // TODO
> static const struct iio_buffer_setup_ops acpi_als_buffer_ops =3D {
> .preenable =3D &iio_sw_buffer_preenable, // TODO ?
> .postenable =3D &iio_triggered_buffer_postenable,
> .predisable =3D &iio_triggered_buffer_predisable,
> };
>
> static struct iio_trigger *acpi_als_allocate_trigger(struct iio_dev *=
idev)
> {
> printk("XX: allocate trigger called!\n");
>
> int ret;
> struct iio_trigger *trig;
> struct acpi_als_chip *chip =3D iio_priv(idev);
>
> trig =3D iio_trigger_alloc("acpi-als");
> if (trig =3D=3D NULL)
> return NULL;
>
> trig->dev.parent =3D idev->dev.parent;
> trig->private_data =3D idev;
> trig->ops =3D &acpi_als_trigger_ops;
>
> ret =3D iio_trigger_register(trig);
> if (ret)
> return NULL;
>
> printk("XXX: acpi_als_allocate_trigger: %d\n", ret);
> return trig;
> }
>
> static int acpi_als_trigger_init(struct iio_dev *idev)
> {
> printk("XXX: trigger init called\n");
>
> struct acpi_als_chip *chip =3D iio_priv(idev);
> int i, ret;
>
> chip->trig =3D devm_kzalloc(&idev->dev, sizeof(chip->trig), GFP_KERNE=
L);
>
> if (chip->trig =3D=3D NULL) {
> ret =3D -ENOMEM;
> goto error_ret;
> }
>
> chip->trig =3D acpi_als_allocate_trigger(idev);
> if (chip->trig =3D=3D NULL) {
> dev_err(&idev->dev, "Could not allocate trigger %d\n");
> ret =3D -ENOMEM;
> goto error_trigger;
> }
>
> printk("XXX: acpi_als_trigger_init: 0\n");
> return 0;
>
> error_trigger:
> iio_trigger_free(chip->trig);
> error_ret:
> return ret;
> }
>
>
> static int acpi_als_add(struct acpi_device *device)
> {
> int result;
> struct acpi_als_chip *chip;
> struct iio_dev *indio_dev;
>
> /*
> if (unlikely(als_id >=3D 10)) {
> printk(KERN_WARNING PREFIX "Too many ALS device found\n");
> return -ENODEV;
> }
> */
> indio_dev =3D iio_device_alloc(sizeof(*chip));
> if (!indio_dev) {
> dev_err(&device->dev, "iio allocation fails\n");
> return -ENOMEM;
> }
>
> chip =3D iio_priv(indio_dev);
>
> device->driver_data =3D indio_dev;
> chip->device =3D device;
> mutex_init(&chip->lock);
>
> indio_dev->info =3D &acpi_als_info;
> indio_dev->channels =3D acpi_als_channels;
> indio_dev->num_channels =3D ARRAY_SIZE(acpi_als_channels);
> indio_dev->name =3D ACPI_ALS_DEVICE_NAME;
> indio_dev->dev.parent =3D &device->dev;
> indio_dev->modes =3D INDIO_DIRECT_MODE;
>
> result =3D iio_triggered_buffer_setup(indio_dev, &iio_pollfunc_store_=
time,
> &acpi_als_trigger_handler, NULL);
>
> if(result) {
> printk("Could not setup buffer for iio device\n");
> goto exit_iio_free;
> }
>
> result =3D acpi_als_trigger_init(indio_dev);
> if (result) {
> printk("Couldn't setup the triggers.\n");
> // TODO
> //goto error_unregister_buffer;
> }
>
> result =3D iio_device_register(indio_dev);
> if (result < 0) {
> dev_err(&chip->device->dev, "iio registration fails with error %d\n",
> result);
> goto exit_iio_free;
> }
>
> printk("ACPI ALS initialized");
>
> return 0;
>
> exit_iio_free:
> iio_device_free(indio_dev);
> return result;
> }
>
> static int acpi_als_remove(struct acpi_device *device, int type)
> {
> struct iio_dev *indio_dev;
>
> indio_dev =3D acpi_driver_data(device);
> if(!indio_dev) {
> dev_err(&device->dev, "could not get indio_dev for ACPI device\n");
> return -1;
> }
>
> iio_device_unregister(indio_dev);
Not relevant to your problem, but you need to unregister the buffer.

> iio_device_free(indio_dev);
>
> return 0;
> }
>
> static int __init acpi_als_init(void)
> {
> return acpi_bus_register_driver(&acpi_als_driver);
> }
>
> static void __exit acpi_als_exit(void)
> {
> acpi_bus_unregister_driver(&acpi_als_driver);
> }
>
> module_init(acpi_als_init);
> module_exit(acpi_als_exit);
>
> On 11 September 2012 11:21, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org <mailto:marex@=
denx.de>> wrote:
>
>     Dear Martin Li=C5=A1ka,
>
>     [...]
>
>     > +static int acpi_als_write_raw(struct iio_dev *indio_dev,
>     > +     struct iio_chan_spec const *chan, int val, int val2, long=
 mask)
>     > +{
>     > + return 0;
>     > +}
>
>     Simply set write_raw =3D NULL below (aka. don't put it into the s=
tructure at all).
>
>     > +static const struct iio_chan_spec acpi_als_channels[] =3D {
>     > + {
>     > + .type =3D IIO_LIGHT,
>     > + .indexed =3D 1,
>     > + .channel =3D 1,
>     > + .scan_type.sign =3D 'u',
>     > + .scan_type.realbits =3D 10,
>     > + .scan_type.storagebits =3D 16,
>     > + .info_mask =3D IIO_CHAN_INFO_PROCESSED_SEPARATE_BIT |
>     > + IIO_CHAN_INFO_SCALE_SEPARATE_BIT,
>     > + },
>     > +};
>     > +
>     > +static const struct iio_info acpi_als_info =3D {
>     > + .driver_module =3D THIS_MODULE,
>     > + .read_raw =3D &acpi_als_read_raw,
>     > + .write_raw =3D &acpi_als_write_raw,
>     > +};
>     [...]
>     Best regards,
>     Marek Vasut
>
>
