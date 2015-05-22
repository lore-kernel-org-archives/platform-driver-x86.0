From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3 2/3] dell-rbtn: Export notifier for other kernel modules
Date: Fri, 22 May 2015 15:45:57 -0700
Message-ID: <CAKdAkRRHZc3qk=gz7_KUwCNJup54gAjdmFn+V0=hQJ-bqkrWsA@mail.gmail.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
	<1431600868-11737-1-git-send-email-pali.rohar@gmail.com>
	<1431600868-11737-3-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431600868-11737-3-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 14, 2015 at 3:54 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:

> @@ -328,7 +408,9 @@ static void rbtn_notify(struct acpi_device *devic=
e, u32 event)
>
>  static int __init rbtn_init(void)
>  {
> -       return acpi_bus_register_driver(&rbtn_driver);
> +       /* ignore errors so module always loads and exports needed fu=
nctions */
> +       acpi_bus_register_driver(&rbtn_driver);
> +       return 0;

Ahem, and if it fails for some reason and you try to unload the module
what will happen when you call
acpi_bus_unregister_driver(&rbtn_driver) in rbtn_exit()?\

Thanks.

--=20
Dmitry
