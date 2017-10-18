From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 17/17] tools/wmi: add a sample for dell smbios
 communication over WMI
Date: Wed, 18 Oct 2017 09:29:15 +0200
Message-ID: <20171018072915.xowh23m5vr2amqcp@pali>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <a60ca82dca6e453f7bd920c082de48ea4378b7d2.1508259916.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a60ca82dca6e453f7bd920c082de48ea4378b7d2.1508259916.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 17 October 2017 13:22:01 Mario Limonciello wrote:
> diff --git a/tools/wmi/dell-smbios-example.c b/tools/wmi/dell-smbios-example.c
> new file mode 100644
> index 000000000000..69c4dd9c6056
> --- /dev/null
> +++ b/tools/wmi/dell-smbios-example.c
> @@ -0,0 +1,214 @@
> +/*
> + *  Sample application for SMBIOS communication over WMI interface
> + *  Performs the following:
> + *  - Simple class/select lookup for TPM information
> + *  - Simple query of known tokens and their values
> + *  - Simple activation of a token
> + *
> + *  Copyright (C) 2017 Dell, Inc.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 as
> + *  published by the Free Software Foundation.
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/ioctl.h>
> +#include <unistd.h>
> +
> +/* if uapi header isn't installed, this might not yet exist */
> +#ifndef __packed
> +#define __packed __attribute__((packed))
> +#endif
> +#include <linux/wmi.h>
> +
> +/* It would be better to discover these using udev, but for a simple
> + * application they're hardcoded
> + */
> +static const char *ioctl_devfs = "/dev/wmi/dell-smbios";
> +static const char *token_sysfs =
> +			"/sys/bus/platform/devices/dell-smbios.0/tokens";
> +static const char *buffer_sysfs =
> +			"/sys/bus/wmi/devices/A80593CE-A997-11DA-B012-B622A1EF5492/required_buffer_size";

Greg, Alan, could userspace expects those paths to be part of kernel
<--> userspace ABI? Looking e.g. at "dell-smbios.0" name and I'm not
sure if this is something which is going to be stable between kernel
versions and forever as part of ABI.

Also if everything is part of smbios API, would not it better to provide
everything via IOCTL over /dev/wmi/dell-smbios? I think this code is too
complicated, just because for correct IOCTL buffer size it needs to read
other properties via sysfs, etc... For me it looks like that it is not a
good API for userspace developers.

-- 
Pali Rohár
pali.rohar@gmail.com
