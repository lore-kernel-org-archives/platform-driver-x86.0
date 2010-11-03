From: Chris Bagwell <chris@cnpbagwell.com>
Subject: Re: [PATCH] eeepc-wmi: fix compiler warning
Date: Wed, 3 Nov 2010 13:43:57 -0500
Message-ID: <AANLkTi=4U_kE6+V13=wJM+_7=iZW3NGew=jWcddDMO+m@mail.gmail.com>
References: <20101103181400.GA12818@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:43459 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932420Ab0KCSn5 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 3 Nov 2010 14:43:57 -0400
In-Reply-To: <20101103181400.GA12818@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 3, 2010 at 1:14 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> This fixes the following:
>
> =A0CC [M] =A0drivers/platform/x86/eeepc-wmi.o
> drivers/platform/x86/eeepc-wmi.c:322: warning: initialization from in=
compatible pointer type
>
> Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
> ---
>
> =A0drivers/platform/x86/eeepc-wmi.c | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
>
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/=
eeepc-wmi.c
> index 462ceab..0d50fbb 100644
> --- a/drivers/platform/x86/eeepc-wmi.c
> +++ b/drivers/platform/x86/eeepc-wmi.c
> @@ -298,8 +298,8 @@ static void eeepc_wmi_notify(u32 value, void *con=
text)
> =A0 =A0 =A0 =A0kfree(obj);
> =A0}
>
> -static int store_cpufv(struct device *dev, struct device_attribute *=
attr,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *buf, size_t =
count)
> +static ssize_t store_cpufv(struct device *dev, struct device_attribu=
te *attr,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *buf,=
 size_t count)
> =A0{
> =A0 =A0 =A0 =A0int value;
> =A0 =A0 =A0 =A0struct acpi_buffer input =3D { (acpi_size)sizeof(value=
), &value };
> --

Opps.  Sorry, I missed that warning.  ssize_t is obviously correct retu=
rn value.

Reviewed-by: Chris Bagwell <chris@cnpbagwell.com>
