From: =?ISO-8859-1?Q?=C9ric_Piel?= <eric.piel@tremplin-utc.net>
Subject: Re: [PATCH] hp_accel: Add a new PnP ID HPQ6007 for new HP laptops
Date: Tue, 05 Mar 2013 12:49:41 +0100
Message-ID: <5135DBD5.1070702@tremplin-utc.net>
References: <s5h4ngz56yg.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailservice.tudelft.nl ([130.161.131.5]:35976 "EHLO
	mailservice.tudelft.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754746Ab3CEMIH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Mar 2013 07:08:07 -0500
In-Reply-To: <s5h4ngz56yg.wl%tiwai@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 26/02/13 18:19, Takashi Iwai wrote:
> The DriveGuard chips on the new HP laptops are with a new PnP ID
> "HPQ6007".  It should be compatible with older chips.
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
Hi,
Sorry for the delay. The driver is able to detect the actual type of=20
accelerometer behind, so indeed it should work fine.

Thanks for the patch, here is my:
Acked-by: =C9ric Piel <eric.piel@tremplin-utc.net>

Matthew, could you pick this patch into your tree?
Cheers,
=C9ric
>
> ---
>   drivers/platform/x86/hp_accel.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/h=
p_accel.c
> index e64a7a8..b6c4305 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -77,6 +77,7 @@ static inline void delayed_sysfs_set(struct led_cla=
ssdev *led_cdev,
>   static struct acpi_device_id lis3lv02d_device_ids[] =3D {
>   	{"HPQ0004", 0}, /* HP Mobile Data Protection System PNP */
>   	{"HPQ6000", 0}, /* HP Mobile Data Protection System PNP */
> +	{"HPQ6007", 0}, /* HP Mobile Data Protection System PNP */
>   	{"", 0},
>   };
>   MODULE_DEVICE_TABLE(acpi, lis3lv02d_device_ids);
>
