Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E512F37DE8A
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775031624; cv=none; b=JzSNVrZ9B7+YYlPJ5rbS7/rkOFhatpwZLjUt4uvePbpH5yesFb3kF2EuXIflfXqXZnABwHB554VvgH2I5cq3Ss0XVJm4Z9kxUBVyK0NPR+8M6SEiVN9b9IU14qsRrBA1F2UEiP59/Ta0cJQv6VtjRNitiBFFm+rdbEZWdPhbhsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775031624; c=relaxed/simple;
	bh=q2RWRVLQpudqmq/pOfIN1+QRGoxJlhzYXE+M8o7jPRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bAfwwdwQcnrIon1crkT5rqZAsBxFSYUflnNnmBoQzE74v9jZ8XJr8gYOQTP1QZwno1oMybc/U2blWylfHbkEX76eE32CzeRGBxuNO28xRrqClc5Ks4s+gkIhpDCiP1Dh+1SMjuPstNq9bdLM4B0nWCKnzIKnPZvZcloWrqXyc8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=k8vuK+w8; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="k8vuK+w8"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 0C464BBFD9
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 11:13:35 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 46E1EBBF63
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 11:13:34 +0300 (EEST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id BBA61202517
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 11:13:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1775031214;
	bh=ipKGBxYWE+LzxroPElf867PRuXVp1hMr42p7MosVa70=;
	h=Received:From:Subject:To;
	b=k8vuK+w8IJ1wq2En1lf3vrq6QmJjj3veVU7amEuaiDG1y7RqiOVmuJ5Cf+L8G7eZL
	 otFklxgLiRGjXkmS2tXIp0KbCpiGbyC4cWPulhQbZFhIL8h7fXWP1Z7Wde9kv6b52P
	 6AlAzFxiRIJG66BpRb+PS59ARhGAf5I1USr/EGHSY5nRYqx8dPHD+xJu9VQRPby2BF
	 BfD0DcSp0w2xPksYaFAX2NIh17qbloQk7HCvIRGqrZShkYlD+3hCcmVToM3H1fNFDv
	 osgOrtPuHCowpXSjV2v3sE0ae7R0MY5Lmg+G5yHKrv1Tfgo2i4I9steDYG7noI+wPN
	 IVsQ+qdLuzzsw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-c70fb6aa323so2454011a12.3
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 01 Apr 2026 01:13:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXU3cLOZb7dZbyt36xXPeZ0iokk2V2RJGRmoCp/btNyxRDlB+/GPZ3vFM/Q1rPmTYoWNGGXdY0iRlz0T4jN56CvcZEx@vger.kernel.org
X-Gm-Message-State: AOJu0YwMtvOPKCzrZl+viZBSV8ZAThJKHFKY5C7n0eFm/Qhg7avGuS4t
	GrlR4FEfd0smWL5q9upGQb/yqV2dHqg/DDB2zBkyI8kn5GEQ7yUutrRiqfJGIBnswY7cFMnBpHx
	E6VL8ruOIoP9LlUABwPoe2HQkpQpT4js=
X-Received: by 2002:a17:903:6ce:b0:2b2:4e70:631c with SMTP id
 d9443c01a7336-2b269c7a136mr17439295ad.28.1775031212346; Wed, 01 Apr 2026
 01:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329215348.56185-1-begeebe@gmail.com>
 <20260330101028.876277-1-begeebe@gmail.com>
In-Reply-To: <20260330101028.876277-1-begeebe@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 1 Apr 2026 10:13:20 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEttELNe1wXXugZiSOPxV2W16rneHfTRMvzU+HdUyddfQ@mail.gmail.com>
X-Gm-Features: AQROBzDl5fI03rRBldCeXUAaBndzDdYAe1tWOvkdiMI5HiO9HiX7qLzTG-QQzWQ
Message-ID: 
 <CAGwozwEttELNe1wXXugZiSOPxV2W16rneHfTRMvzU+HdUyddfQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: oxpec: add support for OneXPlayer Super
 X
To: Alexander Egorov <begeebe@gmail.com>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177503121395.753206.12929257701151756740@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 30 Mar 2026 at 12:11, Alexander Egorov <begeebe@gmail.com> wrote:
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
>
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

Hi,
did you check if the superx board id is needed or if you can piggyback on g1_a?

If you can, I'd rather you do that. In either case:

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

Also, for this V2, you missed Derek's Reviewed-by. Resend the patch
with both my and Derek's reviewed tags, use -v3 in the makepatch
generation to include V3 in the header, and cc Ilpo who is the x86
subsystem maintainer so they can merge this patch. Before you do that,
check if you can use g1_a though.

Best,
Antheas

> Signed-off-by: Alexander Egorov <begeebe@gmail.com>
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
>         case oxp_g1_a:
>         default:
>                 ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
> --
> 2.53.0
>
>

