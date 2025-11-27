Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35FC223DE8
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251303; cv=none; b=eQbFv7eXJy8ow8v0kTOf40Nef+z9nnGk273LCnXLl9OizMMzglmphdjQi8xiMccQRyRR6eoORnjVLk25lRzL4ZLoJuI+QQTvY/p2CG8B8q4vEewzerd0hN0foAfkgJyW1KfUZ5gutgTYT2hcsVjf5v2sm7bbcAq875uedDAv1pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251303; c=relaxed/simple;
	bh=uaVm51pAfA+7BtceViMdoGw/achxdyKv4cZ8WrD61Jg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqJ8aY2RlqVF5HOcOfjogUUi7f5K8+h8XDqGw7Y1DIMc23BlB1zRFB48CL+cph3Nxu47Z95NJdGCV1day9GPZENwyhN2joe4vvQ9E3lYdeujfxqy7+7MrelbnpbLWPSHZKAIXPLAq5AQVL+RbCu/Emjhr+OafmAcpFVCFS9Mepo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i02WFtvh; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i02WFtvh"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-595819064cdso1222377e87.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 05:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764251298; x=1764856098; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G07GekTGY4SC2iSrWnFuwKzI1N7AFmcaYb52fmGR7rY=;
        b=i02WFtvhCeLzn92sa9e6xhLxGCy5Sim19nT058tNigw8epvH/gu95hf6cLoCMwaNKY
         IqDKAGXh9dHQ/dGJmuBfIuL3x/3mQmdidgbmfcIKIjLBeAG7tUFDR0YBRsGW0Q1IIWCk
         8BuLjnJel7z1JJH+LbF6Le/w1hwgX1kygRLXlZuPD8EGkDB3tvxTix82fUhYx1k6zGAF
         WYPTVg29Fu6D0wGZWAe3AaCoPL1SrCyRd+L5F+8XRBLDTLLH+h0GNs9EAqP9xQuJU9hr
         2RtSX9K2ugisuqMpl+ZtNhMiLL6v8ebRDa+i7wN7d6DHi3DpAxXVwwbzJUy6U9og1UQx
         LF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251298; x=1764856098;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G07GekTGY4SC2iSrWnFuwKzI1N7AFmcaYb52fmGR7rY=;
        b=WW7N5x0F7KMo599+8JNog38uqJXMolTT8WH9L4h9NWyWpALPNBDpul7+kXVg6My0QR
         As41MbY9IGLu6hZpiulHBYG8huHQIKRuFU+nir46FE37LWzB9jfzKCJjJFK4VC3f4XCP
         aTpE2VQcZI3ZUyPDUAQsJkuvIJygYK9l+eFzvBKj+JhboO7fT/5i5SbShTMrcuQ5yIXL
         c2kQPL+1Ck6Zs0HmDIQcJ9hdA/oYRQgAidWw5qUhfj7NZMYRlAAAKZIAgQ5Ivbyq73tz
         BZmtCLDp2tKVq4xwKH6WZuFV5HSPvMdywbpzKmce2CgTXp7aAdFMyWEjUdxbyqG/Bhei
         t3hA==
X-Forwarded-Encrypted: i=1; AJvYcCUfTRbdoGIvBI/YmPyqecsfs0H7/tZBMCWEO9YMtyRE9l212PlyCl6nwv2tu/t9q7XLJkensdoEfPibKR+rtxqoQTUm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgj7PBFqKMeiXTXheezA8DHQWTlk/c/xhYkffadAJHzAp7Ggty
	EEDloc31O2dFQnIqma3QjupjYHfOsyH6uQK+1Av2g2ZF7HhweAnaz0RUSwMvaGTmOCPa0cRHU6a
	U3xbWpz5P1PkhkWnmkZsLyNIBvckixNyFqA95e2YfFA==
X-Gm-Gg: ASbGncsHz/FpHr6w1xMex1WCrGMQCkLi25mcCCTR5LDAWXZo0FF7X9d2qbhAc7MNqga
	BZJrTNiY04TiwwLViAA88JCUTjbAuIk4grRCrdWOtQE/nw8biIRLlHgnz9B6LFFNdm7AkziTWLk
	6YLApG8MvM0hlhHyBfWdUinzXPcaOK9cs96BorLAvdlKKc4/euXnktUXT4iQoJ+Y9FwgqlbffET
	VMq+5j+Kxz8tc7USxI/DIuOzjzJAiwHGEdcCmIUhCpH07HqVoFlWz1frrydxXP7qDliVFDr8gTQ
	7s4DeOZR7g95uE83hAP2abD7rgM=
X-Google-Smtp-Source: AGHT+IGvFI8L5fGXcjZ+qNvP8EZkHInkEP3SOQcYofhj+ZFeXXcaPdCECdiTD+YtbO/uvB+N8tYFM9k+NWHSnM4EQ3k=
X-Received: by 2002:a05:6512:6d3:b0:594:37bc:f40c with SMTP id
 2adb3069b0e04-596a3749dfcmr8511591e87.10.1764251297792; Thu, 27 Nov 2025
 05:48:17 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:48:16 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:48:16 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251125-pci-m2-e-v2-7-32826de07cc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com> <20251125-pci-m2-e-v2-7-32826de07cc5@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 05:48:16 -0800
X-Gm-Features: AWmQ_bk0-XCJTQ6PapzzNjyRg3LPIzKuWTKtDYqS86NfBbxq1eZ_R5ABgi6vUTk
Message-ID: <CAMRc=Mck-Vx6SSDSp4+jFWeobQ3fzf9P=zJa_bQoEe6T6R_VHQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] serdev: Do not return -ENODEV from
 of_serdev_register_devices() if external connector is used
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 15:45:11 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> If an external connector like M.2 is connected to the serdev controller
> in DT, then the serdev devices may be created dynamically by the connector
> driver. So do not return -ENODEV from of_serdev_register_devices() if the
> static nodes are not found and the graph node is used.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/tty/serdev/core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> index 8c2a40a537d9..fba7b98026bb 100644
> --- a/drivers/tty/serdev/core.c
> +++ b/drivers/tty/serdev/core.c
> @@ -12,6 +12,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -581,7 +582,13 @@ static int of_serdev_register_devices(struct serdev_controller *ctrl)
>  		} else
>  			found = true;
>  	}
> -	if (!found)
> +
> +	/*
> +	 * When the serdev controller is connected to an external connector like
> +	 * M.2 in DT, then the serdev devices may be created dynamically by the
> +	 * connector driver.
> +	 */
> +	if (!found && !of_graph_is_present(ctrl->dev.of_node))
>  		return -ENODEV;
>
>  	return 0;
>
> --
> 2.48.1
>
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
