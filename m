From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] x86/wmi: delete unused wmi_data_lock mutex causing gcc
 warning
Date: Wed, 25 Mar 2015 10:26:35 -0700
Message-ID: <20150325172635.GA19129@fury.dvhart.com>
References: <1427133697-7228-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427133697-7228-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 23, 2015 at 02:01:37PM -0400, Paul Gortmaker wrote:
> In commit bff431e49ff531a343fbb2b4426e313000844f32 ("ACPI: WMI: Add
> ACPI-WMI mapping driver") this mutex was added, but the rest of the
> final commit never actually made use of it, resulting in:
>=20
>  In file included from include/linux/mutex.h:29:0,
>                   from include/linux/kernfs.h:13,
>                   from include/linux/sysfs.h:15,
>                   from include/linux/kobject.h:21,
>                   from include/linux/device.h:17,
>                   from drivers/platform/x86/wmi.c:35:
>  drivers/platform/x86/wmi.c:48:21: warning: =E2=80=98wmi_data_lock=E2=
=80=99 defined but not used [-Wunused-variable]
>   static DEFINE_MUTEX(wmi_data_lock);
>                       ^
>=20
> A git grep shows no other instances/references to the wmi_data_lock.
> Delete it, assuming that the mutex addition was just a leftover from
> an earlier work in progress version of the change, since the original
> dates from 2008.
>=20
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Queued, thank you Paul.

--=20
Darren Hart
Intel Open Source Technology Center
