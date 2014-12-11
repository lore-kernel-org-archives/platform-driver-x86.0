From: =?windows-1252?Q?=C9ric_Piel?= <eric.piel@tremplin-utc.net>
Subject: Re: [PATCH] hp_accel: Add support for HP ZBook 15
Date: Thu, 11 Dec 2014 11:26:07 +0100
Message-ID: <5489713F.9050408@tremplin-utc.net>
References: <1415908657-26477-1-git-send-email-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtpfb1-g21.free.fr ([212.27.42.9]:35535 "EHLO
	smtpfb1-g21.free.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751131AbaLKKfT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 11 Dec 2014 05:35:19 -0500
In-Reply-To: <1415908657-26477-1-git-send-email-tiwai@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Darren Hart <dvhart@infradead.org>
Cc: Dominique Leuenberger <dimstar@opensuse.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 13-11-14 20:57, Takashi Iwai wrote:
> From: Dominique Leuenberger <dimstar@opensuse.org>
>
> HP ZBook 15 laptop needs a non-standard mapping (x_inverted).
>
> BugLink: http://bugzilla.opensuse.org/show_bug.cgi?id=3D905329
> Signed-off-by: Dominique Leuenberger <dimstar@opensuse.org>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
Sorry, it got a be delayed... but it looks completely fine :-)

Signed-off-by: =C9ric Piel <eric.piel@tremplin-utc.net>

Darren, would you wind picking up this patch via your tree?

Cheers,
=C9ric


> ---
>   drivers/platform/x86/hp_accel.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/h=
p_accel.c
> index 13e14ec1d3d7..b268f4e48471 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -237,6 +237,7 @@ static const struct dmi_system_id lis3lv02d_dmi_i=
ds[] =3D {
>   	AXIS_DMI_MATCH("HPB64xx", "HP ProBook 64", xy_swap),
>   	AXIS_DMI_MATCH("HPB64xx", "HP EliteBook 84", xy_swap),
>   	AXIS_DMI_MATCH("HPB65xx", "HP ProBook 65", x_inverted),
> +	AXIS_DMI_MATCH("HPZBook15", "HP ZBook 15", x_inverted),
>   	{ NULL, }
>   /* Laptop models without axis info (yet):
>    * "NC6910" "HP Compaq 6910"
>
