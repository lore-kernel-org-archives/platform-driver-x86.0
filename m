Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB97445AE3
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433872; cv=none; b=Pv8L/W9INreKdBVE/hJgFXAOWWPZY7tCq9+EwfxyqWteawqp3FGBcSiAcZFONJJc8uPNMhna1WNO1b6MTow1dOofBADaJtTASTt4U3JTv4WywSJ+qOsfdgcfrnnFRqY8eTNogPaEFu/RSEQ0bAwIXpyuUmU2y63ND887kRXYfxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433872; c=relaxed/simple;
	bh=JH6hsjls9JydjGFy5kjk9vbQ51X4fHKxbbTELzjZMP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3PYQOA9lPLFnXdUngnprYkodFEY6FvZ1wTp3wRdKRwbWUnZxSdNc4x31GutMOjN6Sb9HEEGojl5Wb+83COdkkzQOptVts+niIE+deh8LSIx6ICa9E5fkuXmkiLvu8pd8vkPhIZ1eN+DvconNhKRNbHkpsPX3xU+tKUKtHbKt3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=LMrNz/oD; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="LMrNz/oD"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 94F653FD8B
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:45:27 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id CB4883FDF2
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:45:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 2A9D41FFA31
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 20:45:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1785433526;
	bh=HckcJC5F4amsiET1kX8Y/JDQ29iUOP1Y2b7kjHUX+q0=;
	h=Received:From:Subject:To;
	b=LMrNz/oDTFEaupzZMJpOZ+JNJz5piSe8nWYIoHTPSi/IZgBZYuUpnaKLxVCsWZvEy
	 pO5v4hTc4ibQ+tpDwSKbboeUfY5tmkoD4xcvnREyEvGoFCm/ss5A+SYuargsfp4csg
	 vyZFua85VmXFKYshx9ZqZCYpbcBJy0DDGCqFTcyMRIv5AMGtvs7rS7ulMyDrCHi5iG
	 eb0pD1xUvBZJ0UFPoqGUWQA8v1QZyMgH/ZXcbaKtVIfoaZk/3+xaLycgt2LIvRL3gY
	 rH5LpEybO+rKYZUJQSGqBr8BeJsUh5a28NwVY35h/GD9sSgd3ae+Fl30csIEGxCSdL
	 hDMiWViUrXYKQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f178.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2ccf2360620so441315ad.3
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 30 Jul 2026 10:45:26 -0700 (PDT)
X-Gm-Message-State: AOJu0YwAsdBg3y0SywkZ9w4WHlwRPWNEDcZyrgtpyp39SN8qSVJjeutY
	dn+GsP0bDkcRCoDrZH+/URl1RpPy18zF6B/Wd3+JsncfNhyOkc5EQnidPPdJaSTbK7eRtG4o/0W
	JgyaioQK9WZVE6Ami4IMx3P64fy7VyF8=
X-Received: by 2002:a17:903:144b:b0:2c9:97a7:f543 with SMTP id
 d9443c01a7336-2d035cf0b4bmr34013575ad.41.1785433524729; Thu, 30 Jul 2026
 10:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727215947.118292-1-begeebe@gmail.com>
 <20260728083529.329772-1-begeebe@gmail.com>
 <20260728083529.329772-2-begeebe@gmail.com>
In-Reply-To: <20260728083529.329772-2-begeebe@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 30 Jul 2026 19:45:13 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFabg2UU65RX2R9ZV75eBzCUn0hUM3d0YME0Sb2TZHrQQ@mail.gmail.com>
X-Gm-Features: AUfX_mx4ry5Y0Pl_PV6FmyKsTG6ssdAKrEfoMdOcbHhL7kFlhPr4W2J13EmQz4Y
Message-ID: 
 <CAGwozwFabg2UU65RX2R9ZV75eBzCUn0hUM3d0YME0Sb2TZHrQQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: oxpec: Distinguish OneXPlayer Super
 X board
To: Alexander Egorov <begeebe@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, derekjohn.clark@gmail.com, samsagax@gmail.com,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <178543352635.1618405.4247688130911007912@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.5 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 28 Jul 2026 at 10:36, Alexander Egorov <begeebe@gmail.com> wrote:
>
> The Super X currently shares the oxp_g1_a board identifier because its
> existing EC functionality matches the G1 AMD.
>
> Give it a dedicated identifier so model-specific functionality can be
> selected without also enabling it on the G1. Preserve the existing G1
> AMD behavior for the new identifier.
>
> Assisted-by: Codex:gpt-5.6

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

> Signed-off-by: Alexander Egorov <begeebe@gmail.com>
> ---
>  drivers/platform/x86/oxpec.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index 99c0dfc..df29e41 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -50,6 +50,7 @@ enum oxp_board {
>         oxp_x1,
>         oxp_g1_i,
>         oxp_g1_a,
> +       oxp_super_x,
>  };
>
>  static enum oxp_board board;
> @@ -210,7 +211,7 @@ static const struct dmi_system_id dmi_table[] = {
>                         DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>                         DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER SUPER X"),
>                 },
> -               .driver_data = (void *)oxp_g1_a,
> +               .driver_data = (void *)oxp_super_x,
>         },
>         {
>                 .matches = {
> @@ -345,6 +346,7 @@ static umode_t tt_toggle_is_visible(struct kobject *kobj,
>         case oxp_x1:
>         case oxp_g1_i:
>         case oxp_g1_a:
> +       case oxp_super_x:
>                 return attr->mode;
>         default:
>                 break;
> @@ -374,6 +376,7 @@ static ssize_t tt_toggle_store(struct device *dev,
>         case oxp_fly:
>         case oxp_mini_amd_pro:
>         case oxp_g1_a:
> +       case oxp_super_x:
>                 reg = OXP_TURBO_SWITCH_REG;
>                 mask = OXP_TURBO_TAKE_VAL;
>                 break;
> @@ -420,6 +423,7 @@ static ssize_t tt_toggle_show(struct device *dev,
>         case oxp_fly:
>         case oxp_mini_amd_pro:
>         case oxp_g1_a:
> +       case oxp_super_x:
>                 reg = OXP_TURBO_SWITCH_REG;
>                 mask = OXP_TURBO_TAKE_VAL;
>                 break;
> @@ -516,6 +520,7 @@ static bool oxp_psy_ext_supported(void)
>         case oxp_x1:
>         case oxp_g1_i:
>         case oxp_g1_a:
> +       case oxp_super_x:
>         case oxp_fly:
>                 return true;
>         default:
> @@ -649,6 +654,7 @@ static int oxp_pwm_enable(void)
>         case oxp_x1:
>         case oxp_g1_i:
>         case oxp_g1_a:
> +       case oxp_super_x:
>                 return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
>         default:
>                 return -EINVAL;
> @@ -669,6 +675,7 @@ static int oxp_pwm_disable(void)
>         case oxp_x1:
>         case oxp_g1_i:
>         case oxp_g1_a:
> +       case oxp_super_x:
>                 return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
>         default:
>                 return -EINVAL;
> @@ -689,6 +696,7 @@ static int oxp_pwm_read(long *val)
>         case oxp_x1:
>         case oxp_g1_i:
>         case oxp_g1_a:
> +       case oxp_super_x:
>                 return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
>         default:
>                 return -EOPNOTSUPP;
> @@ -725,6 +733,7 @@ static int oxp_pwm_fan_speed(long *val)
>         case oxp_mini_amd_a07:
>         case oxp_mini_amd_pro:
>         case oxp_g1_a:
> +       case oxp_super_x:
>                 return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
>         default:
>                 return -EOPNOTSUPP;
> @@ -757,6 +766,7 @@ static int oxp_pwm_input_write(long val)
>         case oxp_fly:
>         case oxp_mini_amd_pro:
>         case oxp_g1_a:
> +       case oxp_super_x:
>                 return write_to_ec(OXP_SENSOR_PWM_REG, val);
>         default:
>                 return -EOPNOTSUPP;
> @@ -796,6 +806,7 @@ static int oxp_pwm_input_read(long *val)
>         case oxp_fly:
>         case oxp_mini_amd_pro:
>         case oxp_g1_a:
> +       case oxp_super_x:
>         default:
>                 ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
>                 if (ret)
> --
> 2.55.0
>
>

