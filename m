From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v1] platform/x86: wmi: Switch to use new generic UUID API
Date: Fri, 4 Aug 2017 08:01:34 -0700
Message-ID: <CALCETrU1vJXGUXhbwNkW1qi9c73tgxT0vWN7eO=ee21BrvNq0Q@mail.gmail.com>
References: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> On Aug 2, 2017, at 9:28 AM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>
> There are new types and helpers that are supposed to be used in new code.
>
> As a preparation to get rid of legacy types and API functions do
> the conversion here.
>
> While here, update Copyright to reflect this change along with previous
> one for the topic.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> drivers/platform/x86/wmi.c | 56 ++++++++++++++++++++++++----------------------
> 1 file changed, 29 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index e32ba575e8d9..7b8fac7067dc 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -7,6 +7,8 @@
>  *   Copyright (C) 2001,2002 Richard Russon <ldm@flatcap.org>
>  *   Copyright (c) 2001-2007 Anton Altaparmakov
>  *   Copyright (C) 2001,2002 Jakob Kemi <jakob.kemi@telia.com>
> + *  ...replaced by generic UUID API:
> + *   Copyright (C) 2016,2017 Intel Corporation.
>  *
>  *  WMI bus infrastructure by Andrew Lutomirski and Darren Hart:
>  *    Copyright (C) 2015 Andrew Lutomirski
> @@ -53,7 +55,7 @@ MODULE_LICENSE("GPL");
> static LIST_HEAD(wmi_block_list);
>
> struct guid_block {
> -    char guid[16];
> +    guid_t guid;

NAK.  guid_block is a firmware interface, so opaque kernel types don't
belong in it.
