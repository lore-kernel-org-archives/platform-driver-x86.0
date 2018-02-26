From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v4 01/12] drivers: base: Unified device connection lookup
Date: Mon, 26 Feb 2018 11:34:43 -0800
Message-ID: <3a6850c4-7c54-c889-a7d0-347b8df65d31@infradead.org>
References: <20180226183919.24353-1-hdegoede@redhat.com>
 <20180226183919.24353-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180226183919.24353-2-hdegoede@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 02/26/2018 10:39 AM, Hans de Goede wrote:
> diff --git a/include/linux/connection.h b/include/linux/connection.h
> new file mode 100644
> index 000000000000..0b4430eae53a
> --- /dev/null
> +++ b/include/linux/connection.h
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#ifndef _LINUX_CONNECTION_H_
> +#define _LINUX_CONNECTION_H_
> +
> +#include <linux/list.h>
> +
> +struct device;
> +
> +/**
> + * struct devcon - Device Connection Descriptor
> + * @endpoint: The names of the two devices connected together
> + * @id: Unique identifier for the connection

Hi,
 * @list: <description>
is missing above.

> + */
> +struct devcon {
> +	const char		*endpoint[2];
> +	const char		*id;
> +	struct list_head	list;
> +};


-- 
~Randy
