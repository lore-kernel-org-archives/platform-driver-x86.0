From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: fix cpufv sysfs file permission
Date: Mon, 24 Apr 2017 12:14:14 +0300
Message-ID: <CAHp75Vf7qKmbzJLfsHJXw_DQ3t8+WKHLEzLHweAq5eE2TTHKNA@mail.gmail.com>
References: <20170422021945.5260-1-jeremy.lefaure@lse.epita.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170422021945.5260-1-jeremy.lefaure@lse.epita.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SsOpcsOpbXkgTGVmYXVyZQ==?= <jeremy.lefaure@lse.epita.fr>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Apr 22, 2017 at 5:19 AM, J=C3=A9r=C3=A9my Lefaure
<jeremy.lefaure@lse.epita.fr> wrote:
> The cpufv sysfs file is defined as readable by anyone even if the
> attribute does not have a show function. The result of every read is an
> IO error. This file should be write only.

Per se patch looks good to me, though would be better to add show()
hook as well?

>
> Signed-off-by: J=C3=A9r=C3=A9my Lefaure <jeremy.lefaure@lse.epita.fr>
> ---
>  drivers/platform/x86/asus-wmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index 8499d3ae4257..0ace471cb700 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1761,7 +1761,7 @@ ASUS_WMI_CREATE_DEVICE_ATTR(cardr, 0644, ASUS_WMI_D=
EVID_CARDREADER);
>  ASUS_WMI_CREATE_DEVICE_ATTR(lid_resume, 0644, ASUS_WMI_DEVID_LID_RESUME)=
;
>  ASUS_WMI_CREATE_DEVICE_ATTR(als_enable, 0644, ASUS_WMI_DEVID_ALS_ENABLE)=
;
>
> -static ssize_t store_cpufv(struct device *dev, struct device_attribute *=
attr,
> +static ssize_t cpufv_store(struct device *dev, struct device_attribute *=
attr,
>                            const char *buf, size_t count)
>  {
>         int value, rv;
> @@ -1778,7 +1778,7 @@ static ssize_t store_cpufv(struct device *dev, stru=
ct device_attribute *attr,
>         return count;
>  }
>
> -static DEVICE_ATTR(cpufv, S_IRUGO | S_IWUSR, NULL, store_cpufv);
> +static DEVICE_ATTR_WO(cpufv);
>
>  static struct attribute *platform_attributes[] =3D {
>         &dev_attr_cpufv.attr,
> --
> 2.12.2
>



--=20
With Best Regards,
Andy Shevchenko
