From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] asus-wmi: enable resume on lid open
Date: Fri, 18 May 2012 08:25:50 +0200
Message-ID: <CAHR064hLYACoOcguo8pJcOmfXJ37fPcKpZVVk+Xo0p4C7hKC1A@mail.gmail.com>
References: <1337233684-9370-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:60915 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755479Ab2ERGZv convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 May 2012 02:25:51 -0400
Received: by bkcji2 with SMTP id ji2so2077870bkc.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 May 2012 23:25:50 -0700 (PDT)
In-Reply-To: <1337233684-9370-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Thu, May 17, 2012 at 7:48 AM, AceLan Kao <acelan.kao@canonical.com> =
wrote:
> According to the ASUS WMI spec., to enable resume on lid open should
> use the device ID(0x00120032), but it doesn't work indeed.

I suppose this ASUS WMI spec isn't public at all ?

> After discussing with ASUS' BIOS engineer, they say wake on lid open
> doesn't have a uniq device ID(0x00120032) in the BIOS. It shares the =
same
> device ID with deep S3(0x00120031), and the deep S3(resume on lid ope=
n)
> is disable by default.
>
> It's reasonable to resume the system while opening the lid, so add it
> in the asus-wmi driver and tested the code on ASUS X100CH and ASUS 10=
15CX.

If there there a way to know what the current settings is and if it's
available ?
If yes, could a sysfs file could be added to configure the behavior ?

> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
> =C2=A0drivers/platform/x86/asus-wmi.c | =C2=A0 =C2=A06 ++++++
> =C2=A01 file changed, 6 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index beda7fc..30e978d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -137,6 +137,9 @@ MODULE_LICENSE("GPL");
> =C2=A0/* Power */
> =C2=A0#define ASUS_WMI_DEVID_PROCESSOR_STATE 0x00120012
>
> +/* Deep S3 / Resume on LID open */
> +#define ASUS_WMI_DEVID_LID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x00120031
> +
> =C2=A0/* DSTS masks */
> =C2=A0#define ASUS_WMI_DSTS_STATUS_BIT =C2=A0 =C2=A0 =C2=A0 0x0000000=
1
> =C2=A0#define ASUS_WMI_DSTS_UNKNOWN_BIT =C2=A0 =C2=A0 =C2=A00x0000000=
2
> @@ -1487,6 +1490,9 @@ static int asus_wmi_platform_init(struct asus_w=
mi *asus)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asus_wmi_set_d=
evstate(ASUS_WMI_DEVID_CWAP,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asus->dr=
iver->quirks->wapf, NULL);
>
> + =C2=A0 =C2=A0 =C2=A0 /* Enable resume on lid open */
> + =C2=A0 =C2=A0 =C2=A0 asus_wmi_set_devstate(ASUS_WMI_DEVID_LID, 1, &=
rv);
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return asus_wmi_sysfs_init(asus->platform_=
device);
> =C2=A0}
>
> --
> 1.7.9.5
>



--=20
Corentin Chary
http://xf.iksaif.net
