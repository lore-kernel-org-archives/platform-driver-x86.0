Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5152F26C3A2
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 07:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771226544; cv=none; b=BL+Zda4h15nAdhwzGJKhr626jbE8UFIgOkzJyy6G1ym/YBXXLaCe0zhpSXIzN5bKnP0YYYiIvJLPLewOskGQDFyCYjGT8nUYhXG4CkSKM43FHajPNd7oQduFA8+KpVCWy4X5/l1coR0S/Dgryha7yXH+1HIluwwBxa5rWtnOaw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771226544; c=relaxed/simple;
	bh=uF56CRjM3Qr6B0oZg/Hi+Z2mMBmD/fhhleiDvXPrpIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxomKlGwBMSwtsVMl3Wl1oatnUDE8LYa/PZc3Jnfj0KXadS1rkOp2pwV4kwzS1iRxwQ29cUAWj5Z+aTxbav57QcMwv7n44x4qvdA3d/xJKhkomCNJFJ8fQPtseq5FtM2kRpcOJzBb5rVQ3P7pt0Eq1lRCvKMIj6oK8PR57MdQX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9+405oG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9+405oG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07610C2BC87
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 07:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771226544;
	bh=uF56CRjM3Qr6B0oZg/Hi+Z2mMBmD/fhhleiDvXPrpIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R9+405oGiUkIBtPSutHrLSLJgsFnonX5ks2qGaoeCo1hbD0GQ06YEI4NJJursz42u
	 vZhXzOHJ49o60/DO2jOWcq5I9jY1fXq+jjPfA7ujh615Zateo8tNvB7xqGAWn2Sgst
	 BUJte6ZIEXsC7pPMDhSrmS57oEKaJOwToYJFBYhBmldpLhj6PLLf788+m82+S0OFTH
	 k5GrWvOi4s/TWvycfhyX1aECFE4Pwz9zAdbzOvkaABzfQSF5lIM1+afMiU37L5DHRH
	 g59n2VcCNccDajk7VG54iCN8+6e2Hh/l/sSgL09W7SHSNSjuz/ZlJBSJFC88ukmaXv
	 XLL13cvGYsQkA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38709888abbso23572531fa.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 23:22:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKqBIT3QsM8uC1hQgsS0jOI+WuieI2bHUjWo+F4JVh/IUzkbcr5UURxzeWDziWcp0t6jbGLKNy65SBzVQC97rOVvHc@vger.kernel.org
X-Gm-Message-State: AOJu0YyVWq/N+I7WMQTH+Bsykitv6TTUddMDJcncXr8TptGQdQmk9Wja
	SSWmm4w8LLkrHOZVF5krrYkKNwZk6NzPAp6u4bgAtS9/c9l7ELAWbeZBs5jnuWAeU/0FIlPkys4
	5c2IQxHHdGwkus8hNQEZCQ/zjU+m4U+S+2q42nb400A==
X-Received: by 2002:a2e:bea5:0:b0:387:12e6:9c56 with SMTP id
 38308e7fff4ca-3881069dc3dmr21783111fa.41.1771226542644; Sun, 15 Feb 2026
 23:22:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aY-oAVI0TubcaD2K@google.com>
In-Reply-To: <aY-oAVI0TubcaD2K@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Feb 2026 08:22:10 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc6vEM+s__heofvPkucFM-mhByHx5ypHWB1qLxcq3-coA@mail.gmail.com>
X-Gm-Features: AaiRm539VAuO63N7h2oFFisNNdO4S_waps1iT1AAN1DxUZvVQYQYQLB_4iMTlrw
Message-ID: <CAMRc=Mc6vEM+s__heofvPkucFM-mhByHx5ypHWB1qLxcq3-coA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: pcengines-apuv2: attach software node to
 the gpiochip
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 11:40=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> GPIO subsystem is switching the way it locates GPIO chip instances for
> GPIO references in software nodes from matching on node names to
> identity matching, which necessitates assigning firmware nodes
> (software nodes) to GPIO chips.
>
> Attach apu2_gpiochip_node to the platform device representing the GPIO
> controller.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/pcengines-apuv2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x8=
6/pcengines-apuv2.c
> index 3b086863c6ac..3f19589d1ba0 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -294,7 +294,8 @@ static int __init apu_board_init(void)
>         }
>
>         apu_gpio_pdev =3D apu_create_pdev(AMD_FCH_GPIO_DRIVER_NAME,
> -                                       id->driver_data, sizeof(struct am=
d_fch_gpio_pdata), NULL);
> +                                       id->driver_data, sizeof(struct am=
d_fch_gpio_pdata),
> +                                       &apu2_gpiochip_node);
>         err =3D PTR_ERR_OR_ZERO(apu_gpio_pdev);
>         if (err)
>                 goto err_unregister_swnodes;
> --

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
