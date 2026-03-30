Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2528F5
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854923; cv=none; b=cIfj/0u9NlrOyoCG/HqMC/P/Jk0eOa4WYLIgQE+WnDLzbCGWzC0Aixk8DBa4R0CYOR0xxTXb737bxMOLHJ6s5fA3BBK+uF3P+SEwMNAxlkR5wsSRywCax61HNTg9JIYMQB8Vd8TrQslTicO2QVovSqFdq3FEoS1Vauh57l7RMPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854923; c=relaxed/simple;
	bh=E3ubMljP6kye9OcPoa4uP87kpxK+z2QDLyEcRgG17PA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMldI/AVJ0ainmyadrJ/MYUSQUQXLx3qbyKJOD8AbX6kJMylHNvBl/1Imt0CfLOorKFMcL7LYosrEwwj1Pl1hzs2x28IkCPoKFfnf65Bcfu+PV3ltuun6FnqJqpudCv5j8YvgY6fU4rerM/VO6BQDQEtFz0OOYgJGJwNetZFmxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=WGygv6z5; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="WGygv6z5"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id A2F9840AA6
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 07:05:20 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id 751AF41DAC
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 07:04:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B08561FE3A3
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 10:04:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1774854287;
	bh=pL9OI6yHEA/Fm6m2o3GnAu6ALQI2T97QCEsy7UNOF1g=;
	h=Received:From:Subject:To;
	b=WGygv6z5QKyjd7gxMaH9/D4DGNJMYQXUI8zDVnRKN4eDkiow2L4OsFJC7xgAOrT9v
	 nucIsjUbJc9C5dTsUNsTI2Shaf+J3Lgw/vhStKVJnfDC5X6LzZWUNChdNzqsipLSG4
	 xlPNyZx+Uyx6Sa8Ppg9gq40D5Epw7AhMvE0IQFmNfxMEJUe5zvAj1k+3PZfTUIq4/L
	 0BHO8nheNSYyO/bQWPNRrAAGE1nm29RuyAfZiBHGrb6L47T66YQlZYejiNZEQnsJeV
	 sHWhwm4v0m6913klNkHGRCrrYUTm5tX1LhuGbKxpw+KXjnONNLnfuE1hKQShUi3nvp
	 NYVyVJmrzfvHA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2addb31945aso32261815ad.1
        for <platform-driver-x86@vger.kernel.org>;
 Mon, 30 Mar 2026 00:04:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXtVfkPIPUZxhRi7tT2lHcptg3EQEboocYjZVx3fFWi3vDFAtm+7YffmUX+so422zf5+Ep3BRwPmx6UxAY5r2xEcKgj@vger.kernel.org
X-Gm-Message-State: AOJu0YwJgTeP61xpPgNIPGebdAblPWvvr6OpfixD4hOI0baLAsB5BrQ2
	aCVsc0t2MxxWKTOByfTBEKOSN5Vzoa70lREFkVPycnBJhCcPtAdaV4+YPh+O1m9GPxEjsBExKF9
	kSoVsN4D8ANsX36F+QkxIjDvbbcDlxVU=
X-Received: by 2002:a17:903:98d:b0:2b0:60f1:de58 with SMTP id
 d9443c01a7336-2b0cdcfae43mr122223825ad.45.1774854285155; Mon, 30 Mar 2026
 00:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329215348.56185-1-begeebe@gmail.com>
In-Reply-To: <20260329215348.56185-1-begeebe@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 30 Mar 2026 09:04:32 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFM0HQ7hXeHpG=CkUTDH1J0F-eqNwZJ4hKdUyzj-GV0OA@mail.gmail.com>
X-Gm-Features: AQROBzDR6E7a8Xv39D_SHVXxmyBbWtk95w2WG4DjfRWb3K5lFi9jTQyjILM627o
Message-ID: 
 <CAGwozwFM0HQ7hXeHpG=CkUTDH1J0F-eqNwZJ4hKdUyzj-GV0OA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: oxpec: add support for OneXPlayer Super X
To: Alexander Egorov <begeebe@gmail.com>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	platform-driver-x86@vger.kernel.org, ps1x <ps1x@users.noreply.github.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177485428692.733741.3299468852806373388@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 29 Mar 2026 at 23:54, Alexander Egorov <begeebe@gmail.com> wrote:
>
> From: ps1x <ps1x@users.noreply.github.com>
>
> OneXPlayer Super X identifies itself via DMI as:
>
>   board vendor: ONE-NETBOOK
>   board name:   ONEXPLAYER SUPER X
>   product name: ONEXPLAYER SUPER X
>
> Current mainline oxpec does not contain a matching DMI entry for this
> system, so the in-tree driver is not auto-loaded.
>
> On the tested Super X device, the working EC layout matches the
> following handling:

Hi,
thanks. Some minor issues with your patch we need to go through first

> - fan RPM is read from OXP_SENSOR_FAN_REG (0x76)
> - pwm1_enable uses OXP_SENSOR_PWM_ENABLE_REG (0x4A)
> - pwm1 uses OXP_SENSOR_PWM_REG (0x4B) with direct 0-255 writes
> - turbo toggle uses OXP_TURBO_SWITCH_REG (0xF1)
> - charge-limit / charge-behaviour uses the same battery extension path
>   as the X1 family
>
> Add a dedicated oxp_superx board id, a DMI match for OneXPlayer Super X,
> and route the fan, PWM, turbo-toggle, and battery-extension paths
> through the validated Super X handling.
>
> Tested-on: OneXPlayer Super X

Drop this tag

> Signed-off-by: ps1x <ps1x@users.noreply.github.com>

AFAIK kernel requires real names and emails although in the past there
have been some pseudonyms.

Using Alexander Egorov <begeebe@gmail.com> would be better since you
used this for the submission anyway.

> ---
>  drivers/platform/x86/oxpec.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index 6d4a53a2e..d366c398d 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -48,6 +48,7 @@ enum oxp_board {
>         oxp_mini_amd_a07,
>         oxp_mini_amd_pro,
>         oxp_x1,
> +       oxp_superx,
>         oxp_g1_i,
>         oxp_g1_a,
>  };
> @@ -282,6 +283,13 @@ static const struct dmi_system_id dmi_table[] = {
>                 },
>                 .driver_data = (void *)oxp_x1,
>         },
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER SUPER X"),
> +               },
> +               .driver_data = (void *)oxp_superx,
> +       },
>         {},
>  };
>
> @@ -336,6 +344,7 @@ static umode_t tt_toggle_is_visible(struct kobject *kobj,
>         case oxp_mini_amd_a07:
>         case oxp_mini_amd_pro:
>         case oxp_x1:
> +       case oxp_superx:
>         case oxp_g1_i:
>         case oxp_g1_a:
>                 return attr->mode;
> @@ -366,6 +375,7 @@ static ssize_t tt_toggle_store(struct device *dev,
>         case aok_zoe_a1:
>         case oxp_fly:
>         case oxp_mini_amd_pro:
> +       case oxp_superx:
>         case oxp_g1_a:
>                 reg = OXP_TURBO_SWITCH_REG;
>                 mask = OXP_TURBO_TAKE_VAL;
> @@ -412,6 +422,7 @@ static ssize_t tt_toggle_show(struct device *dev,
>         case aok_zoe_a1:
>         case oxp_fly:
>         case oxp_mini_amd_pro:
> +       case oxp_superx:
>         case oxp_g1_a:
>                 reg = OXP_TURBO_SWITCH_REG;
>                 mask = OXP_TURBO_TAKE_VAL;
> @@ -507,6 +518,7 @@ static bool oxp_psy_ext_supported(void)
>  {
>         switch (board) {
>         case oxp_x1:
> +       case oxp_superx:
>         case oxp_g1_i:
>         case oxp_g1_a:
>         case oxp_fly:
> @@ -640,6 +652,7 @@ static int oxp_pwm_enable(void)
>         case oxp_mini_amd_a07:
>         case oxp_mini_amd_pro:
>         case oxp_x1:
> +       case oxp_superx:
>         case oxp_g1_i:
>         case oxp_g1_a:
>                 return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
> @@ -660,6 +673,7 @@ static int oxp_pwm_disable(void)
>         case oxp_mini_amd_a07:
>         case oxp_mini_amd_pro:
>         case oxp_x1:
> +       case oxp_superx:
>         case oxp_g1_i:
>         case oxp_g1_a:
>                 return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
> @@ -717,6 +731,7 @@ static int oxp_pwm_fan_speed(long *val)
>         case oxp_mini_amd:
>         case oxp_mini_amd_a07:
>         case oxp_mini_amd_pro:
> +       case oxp_superx:
>         case oxp_g1_a:
>                 return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
>         default:
> @@ -749,6 +764,7 @@ static int oxp_pwm_input_write(long val)
>         case aok_zoe_a1:
>         case oxp_fly:
>         case oxp_mini_amd_pro:
> +       case oxp_superx:
>         case oxp_g1_a:
>                 return write_to_ec(OXP_SENSOR_PWM_REG, val);
>         default:
> @@ -788,6 +804,7 @@ static int oxp_pwm_input_read(long *val)
>         case aok_zoe_a1:
>         case oxp_fly:
>         case oxp_mini_amd_pro:
> +       case oxp_superx:

All these matches are above g1_a, do you need to add another enum? If
not, re-use the g1_a to compact the patch.

Thanks,
Antheas

>         case oxp_g1_a:
>         default:
>                 ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
> --
> 2.53.0
>
>

