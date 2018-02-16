From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 04/12] usb: common: Small class for USB role switches
Date: Fri, 16 Feb 2018 10:33:37 -0800
Message-ID: <90191d89-0881-3486-87f9-59b355824927@infradead.org>
References: <20180216104751.8371-1-hdegoede@redhat.com>
 <20180216104751.8371-5-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180216104751.8371-5-hdegoede@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 02/16/2018 02:47 AM, Hans de Goede wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 

> diff --git a/drivers/usb/common/roles.c b/drivers/usb/common/roles.c
> new file mode 100644
> index 000000000000..923e3721d183
> --- /dev/null
> +++ b/drivers/usb/common/roles.c
> @@ -0,0 +1,305 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**

Just use /* since this is not kernel-doc notation.

> + * USB Role Switch Support
> + *
> + * Copyright (C) 2018 Intel Corporation
> + * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> + *         Hans de Goede <hdegoede@redhat.com>
> + */


-- 
~Randy
