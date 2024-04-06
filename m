Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D20E374FF
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Apr 2024 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712413214; cv=none; b=Wdp3rTpP3dv36Cpx2aRBMd7PnWzkc4+9yHyytflDYO0f9onspIYptxmRN13IylHAI3I9Dssk1NFWAI5ZVgLfHA+v3MV19jPXwEyQrVaOc/gPubdg3yTBJkiXWkYaiBtkEOCzayfuhOaLWq9nWKAM8XGy+UjunX9zoitAsKG+c+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712413214; c=relaxed/simple;
	bh=ECbK3xatL6wXw9wjqjwkNtbB7GCywJZJOZs2Uc3W4X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/c00hUN0BXep/vY9E8ou+NpB5B6/TOqCJwnHhx0XD6vN66FaPI3eaZlTDfH0Gy9n4ZO1Cb8sLAtS6W7Y6PYcQnt2c+rJll5W5akm5YqjrWTNIMjjIuFclrdH+oS/D6pYYi8Rmksts6zLbMQCEVPl/NafAUrBrf4dF8DOa1xenk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/v5tmzW; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/v5tmzW"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a51c308acdaso20861066b.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 Apr 2024 07:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712413211; x=1713018011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyWw2Bn+anOmgWqNfGVghigNQCR9JhDn1qHN697EVS4=;
        b=d/v5tmzWhX6tdSMr+PpRMm2gmDze9XJlBD4GJFr78xRdSDu2UetzGveftkUWEAm9W1
         tt8CK4iDK3pkHw8+xa/5ZncSoxLK8RdePqOfwdUGDH/+sI0qYg+/oSTD8Vlr8KSKEvv5
         pMtWVnbiYq/5kAhAgs3bw8NbhZpnTqd29Fu6s/ERk5gDQbCYJy/y8JizdncaEKEaAWyK
         paZvS1zLMSumWObCwtlIZi6ltkm1fZBMLATEBb49oMNQ9D+v3eMIJiSPXs7kYXcrJpKC
         6TCoRzFFCqI1eG4UBDbpkp/j8YDgHL0nLM/SU+sBg3UaFu08NtzM6PCE+EemJ9iOXMle
         POiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712413211; x=1713018011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyWw2Bn+anOmgWqNfGVghigNQCR9JhDn1qHN697EVS4=;
        b=HETkpF2r0Pj4sYA13fD0WIfeP2XW4UjjEAEB/PWVBBvvIT5WsfTcgrdAuwDM45B6fR
         lqN02Cc632VaksiT+yoWz0D8f8z9cuLOYa3uz10lca/D69/bgDwDGhEDSRgeCdNSjqo7
         kA9B1jrsOyFxL3uzgm/qN7XyZ/V5Y6ul3WIByD/vpMj2d42rLMIlCZEvlEXdQf+TOAav
         Wy5pR1ICk2NIqJRExS1BL0WTkONizKFW4AG/y9UXWiUYubCOdosxd8c+ko4h+iR+mQZS
         ROLyxRgfsn+VEcp5WxahHbJcG5uzmaDfouxCXYVZjNdy9d/D383oVjcuTeTr1rzN7P1O
         4Hog==
X-Forwarded-Encrypted: i=1; AJvYcCXkxcgpeeKIf/vvDCHEGo3rvkpn/9n3udfFtodmmgJS3yeftPWtLESZffV6H8LcgnMTWcIYz+DF+6NYOxT3hzpED5AB3q58uI7hEuZKqr35HWl4lg==
X-Gm-Message-State: AOJu0YwqIT+BW7fEt5tCrJldVP9Wh7TWC6rej1X6gQuAy44Zmx99hAJ0
	JMb+YA5rxWOjeOYPl+evTLGTCmrNC3IuQe6ez029QniM8DWot5VcE9meADeHitDnMSQWBsJS7uh
	niLKEbL6pYkMS0yOnztTtDLMDMCEPpoUb6fQ=
X-Google-Smtp-Source: AGHT+IH8DYkm/ViAGWbBjLhWV/odYvhKS1/vPsOub/gL8T+18kv+roh8OTYWeaXXwgExLhAZbnpzmrCfvGrtn2Lna3Q=
X-Received: by 2002:a17:906:da8d:b0:a51:c1e0:3049 with SMTP id
 xh13-20020a170906da8d00b00a51c1e03049mr747659ejb.12.1712413210573; Sat, 06
 Apr 2024 07:20:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240406125058.13624-1-hdegoede@redhat.com> <20240406125058.13624-3-hdegoede@redhat.com>
In-Reply-To: <20240406125058.13624-3-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 6 Apr 2024 17:19:33 +0300
Message-ID: <CAHp75VdXbFxzwDas6z=oRW5hKJ9=CHW3SxVEtqaFTLq6yJQP-g@mail.gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger
 driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 6, 2024 at 3:53=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Add a new driver for the custom fast charging protocol found on Lenovo Yo=
ga
> Tablet 2 1380F / 1380L models.

...

> +#include <linux/delay.h>

+ err.h
+ errno.h

> +#include <linux/extcon.h>
> +#include <linux/gpio/consumer.h>

+ mod_devicetable.h

> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/machine.h>
> +#include <linux/platform_device.h>
> +#include <linux/serdev.h>

+ types.h

> +#include <linux/workqueue.h>
> +#include "serdev_helpers.h"

...

> +#define YT2_1380_FC_PIN_SW_DELAY_US    10000
> +#define YT2_1380_FC_UART_DRAIN_DELAY_US        50000
> +#define YT2_1380_FC_VOLT_SW_DELAY_US   1000000

Hmm... perhaps

  10 * USEC_PER_MSEC
  50 * USEC_PER_MSEC
  1 * USEC_PER_SEC

?

...

> +static bool yt2_1380_fc_dedicated_charger_connected(struct yt2_1380_fc *=
fc)
> +{
> +       int ret;
> +
> +       ret =3D extcon_get_state(fc->extcon, EXTCON_CHG_USB_DCP);
> +       return ret > 0;

This and other functions can be shorter by eliminating the ret
variable, but it's up to you.

> +}

...

> +               ret =3D serdev_device_write_buf(to_serdev_device(fc->dev)=
, "SC", 2);

Hmm... I would replace magic 2 in both cases by strlen("SC") or so.

> +               if (ret !=3D 2) {
> +                       dev_err(fc->dev, "Error %d writing to uart\n", re=
t);
> +                       return;
> +               }

...

> +static struct platform_driver yt2_1380_fc_pdev_driver =3D {
> +       .probe =3D yt2_1380_fc_pdev_probe,
> +       .remove_new =3D yt2_1380_fc_pdev_remove,
> +       .driver =3D {
> +               .name =3D YT2_1380_FC_PDEV_NAME,
> +               .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +       },

+ .id_table =3D ... (see below why)

> +};

> +MODULE_ALIAS("platform:" YT2_1380_FC_PDEV_NAME);

The _standard_ MODULE_ALIAS() is not an excuse to have no ID table.
Just provide an accurate platform device ID table instead.

--=20
With Best Regards,
Andy Shevchenko
