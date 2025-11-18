Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029702FFDEC
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471048; cv=none; b=YvBWmHZMMC8oyQDlRD6WRe5/8xyrfeXEZB1LoVmKwDIMF5M5gWGXCbzhbYKLyKUEr8qULe0mV050Ch9x3WcPxe+LI7QurzkSojIl/cerThRvtYXaZYtaHHNA0QjhJCAMOePyZxtj/XfRK1n6hO2vyAz4P8hQJozgi8gtwwRN4PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471048; c=relaxed/simple;
	bh=QY1OIrfV7wJNhoLm6jftQrdDzbys+UOJ7sTIBabxKQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yc6ayQPAy/wNhyFNtFWvW9myCbTDCghtH/A8NfhHnvg9WvcxpAqE3pehzMrH8bBqcZq9MRWjwZRgZXU/a2NsYqUCH0xnAJnzXwdG49mgzw8RnKGMFbVNoIXqi2fJk/kn7YUk2oCdUHm9c2W8pagJ3reS4EiRBfHSRD9xIWZm/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2GlKoIt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2GlKoIt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7466EC4CEFB
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 13:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763471047;
	bh=QY1OIrfV7wJNhoLm6jftQrdDzbys+UOJ7sTIBabxKQU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u2GlKoItMJmHaVMk+xJCWjri/h/6DT5jmQV2tSOURUiQsiO6d8zkZKxsPH20AW6sV
	 5Z1joZBBDOh5nVs0ntTpZ7ZYgqOHDnMrBdBJI/2DUKWJZwWOdNbvuhy5UcGCcRYPrW
	 N++dHysn+E4rzbOYqoE9ytuG/iPqk9TlCpoVZSnC1sE88o684eUdrrhlnDOPzIcr9f
	 +Zlt8n7JI8twIlapfNkdv7j43z8ZC7ylPX5TvoDYyWJLTDVVUGS6peDV1WQk3zr8/5
	 3ThuQ6GqlhxrDnmsslarDFpOg1IMAv/HA9U/lczrx3FUPkSS/OKwMh5Bc1mS2pcjgE
	 lg6+KfxLIY8mA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso8761223a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 05:04:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxZtieS+bwukxzQgkQ20obpmMFJpyCv2BVszw65VunhY31Jri3UKazVoG7PytT2rLeJioiFXa5Ftv3CkcTMbFQMr5B@vger.kernel.org
X-Gm-Message-State: AOJu0YzX/2Ws/qt526JpmNTtM+2Gken66HZ+aB79mHtvVLZHM5S90EqW
	ooWAkZ8+GE6YacWoTD6rFEmz9UccKthaTjnCrNCIc+LNzKGisBNfgCgw4B8EMxt28RDKxNiYF5Q
	35rbc4mxHpwVMKuQcRozAmayiZpZuhQ==
X-Google-Smtp-Source: AGHT+IGzaPWs9CO2/QqJ2lcK3lJrPrwRYsH8Qm8HjBS/YlxbWZYRORJiSB2uoxSx80hvbGBnIei2bDGhcwM4UJKc8fE=
X-Received: by 2002:a05:6402:2809:b0:63c:2d72:56e3 with SMTP id
 4fb4d7f45d1cf-64350e8e003mr14781379a12.23.1763471043426; Tue, 18 Nov 2025
 05:04:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-pci-m2-e-v1-0-97413d6bf824@oss.qualcomm.com> <20251112-pci-m2-e-v1-6-97413d6bf824@oss.qualcomm.com>
In-Reply-To: <20251112-pci-m2-e-v1-6-97413d6bf824@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Nov 2025 07:03:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKBcXH0EWguto3EFY2cJ5p=8VUZczMHz1u5fNFocv-AmA@mail.gmail.com>
X-Gm-Features: AWmQ_blGP-_XDvdtj3MDVFdTuQEWnKJrtZXKQUPHlGxcSMsdX4Hk0jJFpfTnlMY
Message-ID: <CAL_JsqKBcXH0EWguto3EFY2cJ5p=8VUZczMHz1u5fNFocv-AmA@mail.gmail.com>
Subject: Re: [PATCH 6/9] serdev: Skip registering serdev devices from DT is
 external connector is used
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 8:45=E2=80=AFAM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> If an external connector like M.2 is connected to the serdev controller
> in DT, then the serdev devices will be created dynamically by the connect=
or
> driver. So skip registering devices from DT node as there will be no
> statically defined devices.

You could still have statically defined devices. You are just choosing
to probe them later from the connector driver.

>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  drivers/tty/serdev/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> index 8c2a40a537d93f4b9353a2f128cdf51b521929b1..1378587d386356ca4415fa455=
b2ee722b5e44d3e 100644
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
> @@ -560,6 +561,15 @@ static int of_serdev_register_devices(struct serdev_=
controller *ctrl)
>         int err;
>         bool found =3D false;
>
> +       /*
> +        * When the serdev controller is connected to an external connect=
or like
> +        * M.2 in DT, then the serdev devices will be created dynamically=
 by the
> +        * connector driver. So skip looking for devices in DT node as th=
ere will
> +        * be no statically defined devices.
> +        */
> +       if (of_graph_is_present(ctrl->dev.of_node))
> +               return 0;

Where's the schema that allows graph nodes?

Rob
