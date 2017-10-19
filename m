From: "Edward O'Callaghan" <quasisec@google.com>
Subject: Re: [PATCH v9 17/17] tools/wmi: add a sample for dell smbios
 communication over WMI
Date: Thu, 19 Oct 2017 14:12:14 +1100
Message-ID: <CAD584itLkB5Mu30TBrFz6sG4M+hepDqdao_J=eugNK619Kw_nA@mail.gmail.com>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <a60ca82dca6e453f7bd920c082de48ea4378b7d2.1508259916.git.mario.limonciello@dell.com>
 <20171018072915.xowh23m5vr2amqcp@pali> <e225d842e0274a1897c63089444a0814@ausx13mpc120.AMER.DELL.COM>
 <53c8c8aa295046d3a10b2bc8aeb6b610@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53c8c8aa295046d3a10b2bc8aeb6b610@ausx13mpc124.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: pali.rohar@gmail.com, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, rjw@rjwysocki.net, Matthew Garrett <mjg59@google.com>, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

Just my 2c, I like this simplification Mario.
Reviewed-by: Edward O'Callaghan <quasisec@google.com>

On Thu, Oct 19, 2017 at 9:27 AM,  <Mario.Limonciello@dell.com> wrote:
>> -----Original Message-----
>> From: Limonciello, Mario
>> Sent: Wednesday, October 18, 2017 8:56 AM
>> To: 'Pali Roh=C3=A1r' <pali.rohar@gmail.com>; Greg KH <greg@kroah.com>; =
Alan Cox
>> <gnomes@lxorguk.ukuu.org.uk>
>> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
>> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org=
; Andy
>> Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysocki.net;
>> mjg59@google.com; hch@lst.de
>> Subject: RE: [PATCH v9 17/17] tools/wmi: add a sample for dell smbios
>> communication over WMI
>>
>> > -----Original Message-----
>> > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
>> > Sent: Wednesday, October 18, 2017 2:29 AM
>> > To: Greg KH <greg@kroah.com>; Alan Cox <gnomes@lxorguk.ukuu.org.uk>
>> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
>> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.o=
rg;
>> Andy
>> > Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysocki.net;
>> > mjg59@google.com; hch@lst.de; Limonciello, Mario
>> > <Mario_Limonciello@Dell.com>
>> > Subject: Re: [PATCH v9 17/17] tools/wmi: add a sample for dell smbios
>> > communication over WMI
>> >
>> > On Tuesday 17 October 2017 13:22:01 Mario Limonciello wrote:
>> > > diff --git a/tools/wmi/dell-smbios-example.c b/tools/wmi/dell-smbios=
-
>> example.c
>> > > new file mode 100644
>> > > index 000000000000..69c4dd9c6056
>> > > --- /dev/null
>> > > +++ b/tools/wmi/dell-smbios-example.c
>> > > @@ -0,0 +1,214 @@
>> > > +/*
>> > > + *  Sample application for SMBIOS communication over WMI interface
>> > > + *  Performs the following:
>> > > + *  - Simple class/select lookup for TPM information
>> > > + *  - Simple query of known tokens and their values
>> > > + *  - Simple activation of a token
>> > > + *
>> > > + *  Copyright (C) 2017 Dell, Inc.
>> > > + *
>> > > + *  This program is free software; you can redistribute it and/or m=
odify
>> > > + *  it under the terms of the GNU General Public License version 2 =
as
>> > > + *  published by the Free Software Foundation.
>> > > + */
>> > > +
>> > > +#include <errno.h>
>> > > +#include <fcntl.h>
>> > > +#include <stdio.h>
>> > > +#include <stdlib.h>
>> > > +#include <sys/ioctl.h>
>> > > +#include <unistd.h>
>> > > +
>> > > +/* if uapi header isn't installed, this might not yet exist */
>> > > +#ifndef __packed
>> > > +#define __packed __attribute__((packed))
>> > > +#endif
>> > > +#include <linux/wmi.h>
>> > > +
>> > > +/* It would be better to discover these using udev, but for a simpl=
e
>> > > + * application they're hardcoded
>> > > + */
>> > > +static const char *ioctl_devfs =3D "/dev/wmi/dell-smbios";
>> > > +static const char *token_sysfs =3D
>> > > +                 "/sys/bus/platform/devices/dell-smbios.0/tokens";
>> > > +static const char *buffer_sysfs =3D
>> > > +                 "/sys/bus/wmi/devices/A80593CE-A997-11DA-B012-
>> > B622A1EF5492/required_buffer_size";
>> >
>> > Greg, Alan, could userspace expects those paths to be part of kernel
>> > <--> userspace ABI? Looking e.g. at "dell-smbios.0" name and I'm not
>> > sure if this is something which is going to be stable between kernel
>> > versions and forever as part of ABI.
>>
>> In my sample application to be distributed with the kernel these are
>> hardcoded paths, but if more dependencies were used, I would
>> expect all 3 of these paths to be discovered using udev.
>> I do include a comment for that point specifically.
>>
>> >
>> > Also if everything is part of smbios API, would not it better to provi=
de
>> > everything via IOCTL over /dev/wmi/dell-smbios? I think this code is t=
oo
>> > complicated, just because for correct IOCTL buffer size it needs to re=
ad
>> > other properties via sysfs, etc... For me it looks like that it is not=
 a
>> > good API for userspace developers.
>> >
>> > --
>>
>> This does give me an idea, how about a read on the character device
>> will return required buffer size instead of needing to find a sysfs
>> attribute?  This seems more intuitive to me.
>
> So as to not send the whole series again only to get this idea shot down,
> this is what it looks like (minus documentation updates).
> Thoughts?
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index c7de80f96183..922a87d7cf34 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -799,23 +799,12 @@ static int wmi_dev_match(struct device *dev, struct=
 device_driver *driver)
>
>         return 0;
>  }
> -
> -static long match_ioctl(struct file *filp, unsigned int cmd, unsigned lo=
ng arg,
> -                       int compat)
> +static int wmi_char_open(struct inode *inode, struct file *filp)
>  {
> -       struct wmi_ioctl_buffer __user *input =3D
> -               (struct wmi_ioctl_buffer __user *) arg;
> +       const char *driver_name =3D filp->f_path.dentry->d_iname;
>         struct wmi_driver *wdriver =3D NULL;
>         struct wmi_block *wblock =3D NULL;
>         struct wmi_block *next =3D NULL;
> -       const char *driver_name;
> -       u64 size;
> -       int ret;
> -
> -       if (_IOC_TYPE(cmd) !=3D WMI_IOC)
> -               return -ENOTTY;
> -
> -       driver_name =3D filp->f_path.dentry->d_iname;
>
>         list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
>                 wdriver =3D container_of(wblock->dev.dev.driver,
> @@ -826,6 +815,52 @@ static long match_ioctl(struct file *filp, unsigned =
int cmd, unsigned long arg,
>                         break;
>         }
>
> +       if (!wdriver)
> +               return -ENODEV;
> +
> +       filp->private_data =3D wblock;
> +       nonseekable_open(inode, filp);
> +       return 0;
> +}
> +
> +static int wmi_char_release(struct inode *inode, struct file *filp)
> +{
> +       return 0;
> +}
> +
> +static ssize_t wmi_char_read(struct file *filp, char __user *buffer,
> +       size_t length, loff_t *offset)
> +{
> +       struct wmi_block *wblock =3D filp->private_data;
> +       size_t count;
> +
> +       if (*offset !=3D 0)
> +               return 0;
> +
> +       count =3D sizeof(wblock->req_buf_size);
> +       if (copy_to_user(buffer, &wblock->req_buf_size, count))
> +               return -EFAULT;
> +
> +       *offset =3D count;
> +       return count;
> +}
> +
> +static long match_ioctl(struct file *filp, unsigned int cmd, unsigned lo=
ng arg,
> +                       int compat)
> +{
> +       struct wmi_ioctl_buffer __user *input =3D
> +               (struct wmi_ioctl_buffer __user *) arg;
> +       struct wmi_block *wblock =3D filp->private_data;
> +       struct wmi_driver *wdriver =3D NULL;
> +       u64 size;
> +       int ret;
> +
> +       if (_IOC_TYPE(cmd) !=3D WMI_IOC)
> +               return -ENOTTY;
> +
> +       wdriver =3D container_of(wblock->dev.dev.driver,
> +               struct wmi_driver, driver);
> +
>         if (!wdriver)
>                 return -ENODEV;
>
> @@ -886,6 +921,9 @@ static long wmi_compat_ioctl(struct file *filp, unsig=
ned int cmd,
>
>  static const struct file_operations wmi_fops =3D {
>         .owner          =3D THIS_MODULE,
> +       .read           =3D wmi_char_read,
> +       .open           =3D wmi_char_open,
> +       .release        =3D wmi_char_release,
>         .unlocked_ioctl =3D wmi_unlocked_ioctl,
>  #ifdef CONFIG_COMPAT
>         .compat_ioctl =3D wmi_compat_ioctl,
> diff --git a/tools/wmi/dell-smbios-example.c b/tools/wmi/dell-smbios-exam=
ple.c
> index 69c4dd9c6056..a5f97647c9c5 100644
> --- a/tools/wmi/dell-smbios-example.c
> +++ b/tools/wmi/dell-smbios-example.c
> @@ -31,8 +31,6 @@
>  static const char *ioctl_devfs =3D "/dev/wmi/dell-smbios";
>  static const char *token_sysfs =3D
>                         "/sys/bus/platform/devices/dell-smbios.0/tokens";
> -static const char *buffer_sysfs =3D
> -                       "/sys/bus/wmi/devices/A80593CE-A997-11DA-B012-B62=
2A1EF5492/required_buffer_size";
>
>  static void show_buffer(struct dell_wmi_smbios_buffer *buffer)
>  {
> @@ -147,15 +145,13 @@ static int activate_token(struct dell_wmi_smbios_bu=
ffer *buffer,
>
>  static int query_buffer_size(__u64 *buffer_size)
>  {
> -       char buf[4096];
>         FILE *f;
>
> -       f =3D fopen(buffer_sysfs, "rb");
> +       f =3D fopen(ioctl_devfs, "rb");
>         if (!f)
>                 return -EINVAL;
> -       fread(buf, 1, 4096, f);
> +       fread(buffer_size, sizeof(__u64), 1, f);
>         fclose(f);
> -       *buffer_size =3D strtol(buf, NULL, 10);
>         return EXIT_SUCCESS;
>  }
>
>
>>
>> Token information is provided over sysfs for multiple reasons.
>> 1) It's applicable to all dispatchers.  Even if the WMI dispatcher wasn'=
t
>> used it's useful for userspace to query through.  For example the SMI ca=
ll
>> to get tokens in libsmbios can be simplified to just read sysfs files.
>>
>> 2) it's information not coming from ACPI-WMI.  This series is setting
>> precedent for how to interact with ACPI-WMI methods in userspace.
>> putting in random data on the IOCTL that is not used in the ACPI-WMI
>> method or provided by the WMI bus doesn't fit.
>>
>> 3) It is static information that won't change until you reboot.
