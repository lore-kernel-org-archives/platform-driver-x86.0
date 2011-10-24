From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: blacklist Thinkpad edge E520
Date: Tue, 25 Oct 2011 06:22:47 +0800
Message-ID: <1319494967.17773.156.camel@linux-s257.site>
References: <1318488718-4744-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1318488718-4744-1-git-send-email-ike.pan@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Joey Lee <jlee@novell.com>
List-Id: platform-driver-x86.vger.kernel.org

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-10-13 =E6=96=BC 14:51 +0800=EF=BC=8CIk=
e Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> BugLink: http://launchpad.net/bugs/836865
> BugLink: http://launchpad.net/bugs/826784
>=20
> There are reports say that acer-wmi is loaded on Thinkpad E520 which
> cause wireless connection hard blocked and we can not unblock it. It
> will be better not to load acer-wmi on this machine.
>=20
> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
> ---
>  drivers/platform/x86/acer-wmi.c |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index af2bb20..dc9a116 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -325,6 +325,13 @@ static struct dmi_system_id __devinitdata acer_b=
lacklist[] =3D {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
>  		},
>  	},
> +	{
> +		.ident =3D "Lenovo Thinkpad Edge E520",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "114320U"),
> +		},
> +	},
>  	{}
>  };
> =20

Unfortunately didn't see any useful EC register for unblock wifi rfkill=
 in acer-wmi, let's=20
add this device to blacklist.

Signed-off-by: Lee, Chun-Yi <jlee@novell.com>


Thank's a lot!
Joey Lee
