From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 2/3] toshiba_acpi: Change notify funtion to handle
 more events
Date: Wed, 3 Dec 2014 05:12:40 -0800
Message-ID: <20141203131240.GD75099@vmdeb7>
References: <1417675325-14921-1-git-send-email-coproscefalo@gmail.com>
 <1417675325-14921-3-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38499 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932378AbaLEDGL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 4 Dec 2014 22:06:11 -0500
Content-Disposition: inline
In-Reply-To: <1417675325-14921-3-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 03, 2014 at 11:42:04PM -0700, Azael Avalos wrote:
> @@ -1971,41 +2008,22 @@ error:
>  static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 ev=
ent)
>  {
>  	struct toshiba_acpi_dev *dev =3D acpi_driver_data(acpi_dev);
> -	u32 hci_result, value;
> -	int retries =3D 3;
> -	int scancode;
> -
> -	if (event !=3D 0x80)
> -		return;
> +	int ret;

  CC      drivers/platform/x86/toshiba_acpi.o
drivers/platform/x86/toshiba_acpi.c: In function =E2=80=98toshiba_acpi_=
notify=E2=80=99:
drivers/platform/x86/toshiba_acpi.c:2012:6: warning: unused variable =E2=
=80=98ret=E2=80=99 [-Wunused-variable]
    int ret;
          ^

Please compile check each patch.

--=20
Darren Hart
Intel Open Source Technology Center
