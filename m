From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v6 13/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Tue, 10 Oct 2017 13:06:37 +0200
Message-ID: <20171010110637.GB16994@kroah.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <897883f9b8c45dc2cb24de1bb4642513734852d3.1507589249.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <897883f9b8c45dc2cb24de1bb4642513734852d3.1507589249.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 09, 2017 at 05:51:51PM -0500, Mario Limonciello wrote:
> --- /dev/null
> +++ b/include/uapi/linux/wmi.h
> @@ -0,0 +1,19 @@
> +/*
> + *  User API methods for ACPI-WMI mapping driver
> + *
> + *  Copyright (C) 2017 Dell, Inc.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 as
> + *  published by the Free Software Foundation.
> + */
> +#ifndef _UAPI_LINUX_WMI_H
> +#define _UAPI_LINUX_WMI_H
> +
> +#define WMI_IOC 'W'
> +#define WMI_IO(instance)		_IO(WMI_IOC, instance)
> +#define WMI_IOR(instance, type)		_IOR(WMI_IOC, instance, type)
> +#define WMI_IOW(instance, type)		_IOW(WMI_IOC, instance, type)
> +#define WMI_IOWR(instance, type)	_IOWR(WMI_IOC, instance, type)

Are these really needed in a uapi .h file?  Who needs them?  And why not
just use a "normal" ioctl macro in your individual driver .h file?  Do
these really help?

thanks,

greg k-h


> +
> +#endif
> -- 
> 2.14.1
