From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] platform: x86: add ACPI driver for ChromeOS.
Date: Tue, 1 Aug 2017 18:17:09 +0300
Message-ID: <CAHp75Vd-XK+xEZuTQzYCaXyZkGwN0n1pa=Wib5uoh4J1POZmOw@mail.gmail.com>
References: <20170731130318.22976-1-enric.balletbo@collabora.com> <20170731130318.22976-3-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:38612 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751788AbdHAPRM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 11:17:12 -0400
In-Reply-To: <20170731130318.22976-3-enric.balletbo@collabora.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Benson Leung <bleung@chromium.org>, Olof Johansson <olof@lixom.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Olof Johansson <olofj@chromium.org>

On Mon, Jul 31, 2017 at 4:03 PM, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:

> This driver attaches to the Chromeos ACPI device and the exports the values
> reported by the ACPI in a sysfs directory. All ACPI values are presented in
> the string form (numbers as decimal values) and can be accessed as the
> contents of the appropriate read only files in the sysfs directory tree
> originating in /sys/devices/platform/chromeos_acpi.

Besides what Olof mentioned in reply to cover letter this patch
requires more clean up work.

I would suggest to look how to make code looks better. Try to get what
is done under lib/, what new %p extensions are and so on.
Also some minor typos (comments says -1, function returns -ERRNO).

Few comments below. (Not a complete review)

(Tired to look to this. For PDx86 the quality of this beyond good)

> @@ -0,0 +1,792 @@
> +/*
> + * chromeos_acpi.c - ChromeOS specific ACPI support

No need to put filename here. It makes more useless effort in the
future if, for example, file would be renamed.

> + *

> +static struct chromeos_acpi_dev chromeos_acpi = { };

{} is redundant for global static variables.

> +/*

/** ?

If so, read how to create a correct looking kernel doc descriptions.

Otherwise "@flag - " part (if you not imply kernel doc) looks a bit confusing.

> + * This function operates on legacy BIOSes which do not export VBNV element
> + * through ACPI. These BIOSes use a fixed location in NVRAM to contain a
> + * bitmask of known flags.
> + *
> + * @flag - the bitmask to set, it is the responsibility of the caller to set
> + *         the proper bits.
> + *
> + * returns 0 on success (is running in legacy mode and chnv is initialized) or

> + *         -1 otherwise.

Not true.

> + */


> +static int chromeos_set_nvram_flag(u8 flag)
> +{

> +       u8 cur;
> +       unsigned int index = chromeos_acpi_if_data.chnv.cad_value;

Reveresed X-mas tree order.

> +
> +       if (!chromeos_on_legacy_firmware())
> +               return -ENODEV;

^^^^

> +
> +       cur = nvram_read_byte(index);
> +

> +       if ((cur & flag) != flag)
> +               nvram_write_byte(cur | flag, index);

This looks suspicious. Is flag always a one bit set?

> +
> +       return 0;
> +}

> +/*
> + * Read the nvram buffer contents into the user provided space.
> + *
> + * returns the number of bytes copied,

> or -1 on any error.

Not true!

> + */

> +static ssize_t chromeos_vbc_nvram_read(void *buf, size_t count)
> +{
> +       int base, size, i;
> +
> +       if (!chromeos_acpi_if_data.nv_base.cad_is_set ||
> +           !chromeos_acpi_if_data.nv_size.cad_is_set) {
> +               pr_err("NVRAM not configured\n");
> +               return -ENODEV;
> +       }
> +
> +       base = chromeos_acpi_if_data.nv_base.cad_value;
> +       size = chromeos_acpi_if_data.nv_size.cad_value;
> +
> +       if (count < size) {
> +               pr_err("not enough room to read nvram (%zd < %d)\n",
> +                      count, size);
> +               return -EINVAL;
> +       }
> +

> +       for (i = 0; i < size; i++)
> +               ((u8 *)buf)[i] = nvram_read_byte(base++);

Perhaps provide
nvram_read_array() ?

> +
> +       return size;
> +}
> +
> +static ssize_t chromeos_vbc_nvram_write(const void *buf, size_t count)
> +{
> +       unsigned int base, size, i;
> +
> +       if (!chromeos_acpi_if_data.nv_base.cad_is_set ||
> +           !chromeos_acpi_if_data.nv_size.cad_is_set) {
> +               pr_err("NVRAM not configured\n");
> +               return -ENODEV;
> +       }
> +
> +       size = chromeos_acpi_if_data.nv_size.cad_value;
> +       base = chromeos_acpi_if_data.nv_base.cad_value;
> +
> +       if (count != size) {
> +               pr_err("wrong buffer size (%zd != %d)\n", count, size);
> +               return -EINVAL;
> +       }
> +

> +       for (i = 0; i < size; i++) {
> +               u8 c;
> +
> +               c = nvram_read_byte(base + i);
> +               if (c == ((u8 *)buf)[i])
> +                       continue;
> +               nvram_write_byte(((u8 *)buf)[i], base + i);
> +       }

nvram_write_array() ?

> +
> +       return size;
> +}
> +
> +/*
> + * To show attribute value just access the container structure's `value'
> + * field.
> + */
> +static ssize_t show_acpi_attribute(struct device *dev,
> +                                  struct device_attribute *attr, char *buf)
> +{
> +       struct acpi_attribute *paa;
> +
> +       paa = container_of(attr, struct acpi_attribute, dev_attr);
> +

> +       return snprintf(buf, PAGE_SIZE, paa->value);

sprintf();

How did you test this? Where is the format string?

> +}

> +/*

/** ?

> + * create_sysfs_attribute() create and initialize an ACPI sys fs attribute
> + *                         structure.
> + * @value: attribute value

> + */

> +static struct acpi_attribute *create_sysfs_attribute(char *value, char *name,

Function name needs prefix, otherwise too broad.

> +                                                    int count, int instance)

> +{
> +       struct acpi_attribute *paa;
> +       int total_size, room_left;
> +       int value_len = strlen(value);
> +
> +       if (!value_len)
> +               return NULL;
> +

> +       value_len++; /* include the terminating zero */



> +       total_size = value_len + sizeof(struct acpi_attribute) +
> +                       strlen(name) + 1;

One line?

> +
> +       if (count != 1) {

> +               if (count >= 1000) {
> +                       pr_err("too many (%d) instances of %s.\n", count, name);
> +                       return NULL;
> +               }

Move this outside out the parent condition.

> +               /* allow up to three digits and the dot */
> +               total_size += 4;
> +       }

> +
> +       paa = kzalloc(total_size, GFP_KERNEL);
> +       if (!paa)
> +               return NULL;
> +
> +       sysfs_attr_init(&paa->dev_attr.attr);
> +       paa->dev_attr.attr.mode = 0444;  /* read only */
> +       paa->dev_attr.show = show_acpi_attribute;

> +       paa->value = (char *)(paa + 1);

> +       strcpy(paa->value, value);
> +       paa->dev_attr.attr.name = paa->value + value_len;
> +
> +       room_left = total_size - value_len -
> +                       offsetof(struct acpi_attribute, value);
> +

> +       if (count == 1) {
> +               snprintf((char *)paa->dev_attr.attr.name, room_left, name);

"%s", name

> +       } else {
> +               snprintf((char *)paa->dev_attr.attr.name, room_left,
> +                        "%s.%d", name, instance);
> +       }
> +
> +       paa->next_acpi_attr = chromeos_acpi.attributes;
> +       chromeos_acpi.attributes = paa;
> +
> +       return paa;
> +}

> +/*

/** ?

> + * add_sysfs_attribute() create and initialize an ACPI sys fs attribute
> + *                         structure and create the attribute.
> + * @value: attribute value

> + */

> +static void handle_nested_acpi_package(union acpi_object *po, char *pm,
> +                                      int total, int instance)
> +{
> +       int i, size, count, j;
> +       struct acpi_attribute_group *aag;
> +
> +       count = po->package.count;
> +
> +       size = strlen(pm) + 1 + sizeof(struct acpi_attribute_group) +
> +           sizeof(struct attribute *) * (count + 1);
> +
> +       if (total != 1) {

> +               if (total >= 1000) {
> +                       pr_err("too many (%d) instances of %s\n", total, pm);
> +                       return;
> +               }

Move it out.

> +               /* allow up to three digits and the dot */
> +               size += 4;
> +       }

> +       aag->next_acpi_attr_group = chromeos_acpi.groups;
> +       chromeos_acpi.groups = aag->next_acpi_attr_group;

> +       aag->ag.attrs = (struct attribute **)(aag + 1);

> +       aag->ag.name = (const char *)&aag->ag.attrs[count + 1];
> +
> +       /* room left in the buffer */
> +       size = size - (aag->ag.name - (char *)aag);

> +       if (total != 1)

Perhaps

if (total == 1)

to be consistent with above code for some other stuff?

> +               snprintf((char *)aag->ag.name, size, "%s.%d", pm, instance);
> +       else
> +               snprintf((char *)aag->ag.name, size, "%s", pm);

> +       j = 0;                  /* attribute index */
> +       for (i = 0; i < count; i++) {
> +               union acpi_object *element = po->package.elements + i;

> +               int copy_size = 0;

Redundant assignment.

> +               char attr_value[40];    /* 40 chars be enough for names */
> +               struct acpi_attribute *paa;
> +
> +               switch (element->type) {
> +               case ACPI_TYPE_INTEGER:
> +                       copy_size = snprintf(attr_value, sizeof(attr_value),
> +                                            "%d", (int)element->integer.value);
> +                       paa = create_sysfs_attribute(attr_value, pm, count, i);
> +                       break;
> +
> +               case ACPI_TYPE_STRING:

> +                       copy_size = min(element->string.length,
> +                                       (u32)(sizeof(attr_value)) - 1);
> +                       memcpy(attr_value, element->string.pointer, copy_size);
> +                       attr_value[copy_size] = '\0';

What the problem to supply atrribute value and its length?

> +                       paa = create_sysfs_attribute(attr_value, pm, count, i);
> +                       break;
> +
> +               default:
> +                       pr_err("ignoring nested type %d\n", element->type);
> +                       continue;
> +               }
> +               aag->ag.attrs[j++] = &paa->dev_attr.attr;
> +       }
> +
> +       if (sysfs_create_group(&chromeos_acpi.p_dev->dev.kobj, &aag->ag))
> +               pr_err("failed to create group %s.%d\n", pm, instance);
> +}

> +static void maybe_export_acpi_int(const char *pm, int index,
> +                                 unsigned int value)
> +{
> +       int i;


> +       struct chromeos_acpi_exported_ints {
> +               const char *acpi_name;
> +               int acpi_index;
> +               struct chromeos_acpi_datum *cad;
> +       } exported_ints[] = {
> +               { "VBNV", 0, &chromeos_acpi_if_data.nv_base },
> +               { "VBNV", 1, &chromeos_acpi_if_data.nv_size },
> +               { "CHSW", 0, &chromeos_acpi_if_data.switch_state },
> +               { "CHNV", 0, &chromeos_acpi_if_data.chnv }
> +       };

Shouldn't be outside and marked as static const ?

> +
> +       for (i = 0; i < ARRAY_SIZE(exported_ints); i++) {
> +               struct chromeos_acpi_exported_ints *exported_int;
> +

> +               exported_int = exported_ints + i;

&exported_ints[i]; ?

> +
> +               if (!strncmp(pm, exported_int->acpi_name, 4) &&
> +                   (exported_int->acpi_index == index)) {
> +                       pr_notice("registering %s %d\n", pm, index);
> +                       exported_int->cad->cad_value = value;
> +                       exported_int->cad->cad_is_set = true;
> +                       return;
> +               }
> +       }
> +}

> +static char *acpi_buffer_to_string(union acpi_object *element)

C'mon, acpi_ is for ACPI glue layer, not for some chrome custom stuff.

> +{
> +       char *base, *p;
> +       int i;
> +       unsigned int room_left;
> +       /* Include this many characters per line */
> +       unsigned int char_per_line = 16;
> +       unsigned int blob_size;
> +       unsigned int string_buffer_size;

Reversed X-mas tree.

> +
> +       /*
> +        * As of now the VDAT structure can supply as much as 3700 bytes. When
> +        * expressed as a hex dump it becomes 3700 * 3 + 3700/16 + .. which
> +        * clearly exceeds the maximum allowed sys fs buffer size of one page
> +        * (4k).
> +        *
> +        * What this means is that we can't keep the entire blob in one sysfs
> +        * file. Currently verified boot (the consumer of the VDAT contents)
> +        * does not care about the most of the data, so as a quick fix we will
> +        * truncate it here. Once the blob data beyond the 4K boundary is
> +        * required this approach will have to be reworked.
> +        *
> +        * TODO: Split the data into multiple VDAT instances, each
> +        * not exceeding 4K or consider exporting as a binary using
> +        * sysfs_create_bin_file().
> +        */
> +
> +       /*
> +        * X, the maximum number of bytes which will fit into a sysfs file
> +        * (one memory page) can be derived from the following equation (where
> +        * N is number of bytes included in every hex string):
> +        *
> +        * 3X + X/N + 4 <= PAGE_SIZE.
> +        *
> +        * Solving this for X gives the following
> +        */
> +       blob_size = ((PAGE_SIZE - 4) * char_per_line) / (char_per_line * 3 + 1);

Oy vey!

> +
> +       if (element->buffer.length > blob_size)
> +               pr_info("truncating buffer from %d to %d\n",
> +                       element->buffer.length, blob_size);
> +       else
> +               blob_size = element->buffer.length;
> +
> +       /*
> +        * Three characters to display one byte, one newline per line, all
> +        * rounded up, plus extra newline in the end, plus terminating
> +        * zero, hence + 4
> +        */
> +       string_buffer_size = blob_size * 3 + blob_size / char_per_line + 4;
> +
> +       p = kzalloc(string_buffer_size, GFP_KERNEL);
> +       if (!p)
> +               return NULL;
> +
> +       base = p;
> +       room_left = string_buffer_size;
> +       for (i = 0; i < blob_size; i++) {
> +               int printed;
> +
> +               printed = snprintf(p, room_left, " %2.2x",
> +                                  element->buffer.pointer[i]);
> +               room_left -= printed;
> +               p += printed;
> +               if (((i + 1) % char_per_line) == 0) {
> +                       if (!room_left)
> +                               break;
> +                       room_left--;
> +                       *p++ = '\n';
> +               }
> +       }
> +       if (room_left < 2) {
> +               pr_err("no room in the buffer\n");
> +               *p = '\0';
> +       } else {
> +               *p++ = '\n';
> +               *p++ = '\0';
> +       }

hex_dump_to_buffer();
And remove this custom crap.

> +       return base;
> +}

> +static void handle_acpi_package(union acpi_object *po, char *pm)
> +{
> +       int j;
> +       int count = po->package.count;
> +
> +       for (j = 0; j < count; j++) {
> +               union acpi_object *element = po->package.elements + j;
> +               int copy_size = 0;
> +               char attr_value[256];   /* strings could be this long */
> +
> +               switch (element->type) {
> +               case ACPI_TYPE_INTEGER:
> +                       copy_size = snprintf(attr_value, sizeof(attr_value),
> +                                            "%d", (int)element->integer.value);
> +                       add_sysfs_attribute(attr_value, pm, count, j);
> +                       maybe_export_acpi_int(pm, j, (unsigned int)
> +                                             element->integer.value);
> +                       break;
> +
> +               case ACPI_TYPE_STRING:
> +                       copy_size = min(element->string.length,
> +                                       (u32)(sizeof(attr_value)) - 1);
> +                       memcpy(attr_value, element->string.pointer, copy_size);
> +                       attr_value[copy_size] = '\0';
> +                       add_sysfs_attribute(attr_value, pm, count, j);
> +                       break;
> +
> +               case ACPI_TYPE_BUFFER: {
> +                       char *buf_str;
> +
> +                       buf_str = acpi_buffer_to_string(element);
> +                       if (buf_str) {
> +                               add_sysfs_attribute(buf_str, pm, count, j);
> +                               kfree(buf_str);
> +                       }
> +                       break;
> +               }
> +               case ACPI_TYPE_PACKAGE:
> +                       handle_nested_acpi_package(element, pm, count, j);
> +                       break;
> +
> +               default:
> +                       pr_err("ignoring type %d (%s)\n", element->type, pm);
> +                       break;
> +               }
> +       }
> +}
> +
> +/*
> + * add_acpi_method() evaluate an ACPI method and create sysfs attributes.
> + *
> + * @device: ACPI device
> + * @pm: name of the method to evaluate
> + */
> +static void add_acpi_method(struct acpi_device *device, char *pm)
> +{
> +       acpi_status status;
> +       struct acpi_buffer output;
> +       union acpi_object *po;
> +
> +       output.length = ACPI_ALLOCATE_BUFFER;
> +       output.pointer = NULL;
> +
> +       status = acpi_evaluate_object(device->handle, pm, NULL, &output);
> +
> +       if (!ACPI_SUCCESS(status)) {
> +               pr_err("failed to retrieve %s (%d)\n", pm, status);
> +               return;
> +       }
> +
> +       po = output.pointer;
> +
> +       if (po->type != ACPI_TYPE_PACKAGE)
> +               pr_err("%s is not a package, ignored\n", pm);
> +       else
> +               handle_acpi_package(po, pm);
> +
> +       kfree(output.pointer);
> +}
> +

> +static int chromeos_process_mlst(struct acpi_device *device)
> +{
> +       acpi_status status;
> +       struct acpi_buffer output;
> +       union acpi_object *po;
> +       int j;
> +
> +       output.length = ACPI_ALLOCATE_BUFFER;
> +       output.pointer = NULL;
> +
> +       status = acpi_evaluate_object(device->handle, MLST_METHOD, NULL,
> +                                     &output);

> +       if (!ACPI_SUCCESS(status)) {

ACPI_FAILURE()

> +               pr_debug("failed to retrieve MLST (%d)\n", status);

> +               return 1;

-ENOENT?

> +       }

> +       for (j = 0; j < po->package.count; j++) {
> +               union acpi_object *element = po->package.elements + j;

> +               int copy_size = 0;

Redundant assignment

> +               char method[ACPI_NAME_SIZE + 1];
> +
> +               if (element->type == ACPI_TYPE_STRING) {

> +                       copy_size = min_t(u32, element->string.length,
> +                                         ACPI_NAME_SIZE);
> +                       memcpy(method, element->string.pointer, copy_size);
> +                       method[copy_size] = '\0';

I'm not sure I understand why do you need a copy (same to the previous
similar piece(s))?
Can't you supply method name + length?

> +                       add_acpi_method(device, method);

Btw, name is too broad.

> +               }
> +       }
> +
> +       kfree(output.pointer);
> +
> +       return 0;
> +}

> +static int chromeos_acpi_remove(struct acpi_device *device)
> +{
> +       return 0;
> +}

Redundant.

> +static struct acpi_driver chromeos_acpi_driver = {
> +       .name   = "ChromeOS ACPI driver",

> +       .owner  = THIS_MODULE,

Do we need this?

> +       .ids    = chromeos_device_ids,
> +       .ops    = {
> +               .add            = chromeos_acpi_add,

> +               .remove         = chromeos_acpi_remove,

Redundant.

> +       },
> +};

> +static int __init chromeos_acpi_init(void)
> +{

> +       int ret = 0;
> +       acpi_status status;

Should be

      acpi_status status;
      int ret;

> +       chromeos_acpi.p_dev = platform_device_register_simple("chromeos_acpi",
> +                                                             -1, NULL, 0);

-1 has a definition.

> +       if (IS_ERR(chromeos_acpi.p_dev)) {
> +               pr_err("unable to register platform device\n");
> +               return PTR_ERR(chromeos_acpi.p_dev);
> +       }
> +
> +       ret = acpi_bus_register_driver(&chromeos_acpi_driver);
> +       if (ret < 0) {
> +               pr_err("failed to register driver (%d)\n", ret);
> +
> +               platform_device_unregister(chromeos_acpi.p_dev);
> +               chromeos_acpi.p_dev = NULL;
> +               return ret;
> +       }
> +

> +       pr_info("installed%s\n", chromeos_on_legacy_firmware() ?strscpy(); ?

> +               " (legacy mode)" : "");

> +
> +       pr_info("enabling S3 USB wake\n");
> +       status = acpi_evaluate_object(NULL, "\\S3UE", NULL, NULL);

> +       if (!ACPI_SUCCESS(status))

ACPI_FAILURE()

> +               pr_info("failed to enable S3 USB wake\n");
> +
> +       return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko
