From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] toshiba_acpi: Remove bluetooth rfkill code
Date: Sun, 3 May 2015 12:19:55 -0700
Message-ID: <20150503191955.GC16105@fury.dvhart.com>
References: <1430166654-15010-1-git-send-email-coproscefalo@gmail.com>
 <1430166654-15010-2-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49483 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361AbbECTT4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 15:19:56 -0400
Content-Disposition: inline
In-Reply-To: <1430166654-15010-2-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 27, 2015 at 02:30:53PM -0600, Azael Avalos wrote:
> This patch removes all bluetooth rfkill related code residing in
> the toshiba_acpi driver.
>=20
> Separate patches will add (and adapt) the code to toshiba_bluetooth
> (where it belongs).
>=20
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Hi Azael,

With this applied the driver as build warnings:

=2E..
  CC [M]  drivers/platform/x86/toshiba_acpi.o
drivers/platform/x86/toshiba_acpi.c: In function =E2=80=98toshiba_acpi_=
add=E2=80=99:
drivers/platform/x86/toshiba_acpi.c:2636:7: warning: unused variable =E2=
=80=98bt_present=E2=80=99 [-Wunused-variable]
  bool bt_present;
       ^
drivers/platform/x86/toshiba_acpi.c: At top level:
drivers/platform/x86/toshiba_acpi.c:358:12: warning: =E2=80=98hci_write=
2=E2=80=99 defined but not used [-Wunused-function]
 static u32 hci_write2(struct toshiba_acpi_dev *dev, u32 reg, u32 in1, =
u32 in2)

I presume these should be removed as well?

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
