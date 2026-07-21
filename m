Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595C248C8CA
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784636055; cv=none; b=prxPLTLJcUnARYPwcmkQ2VDfKeGds1GxP5grg5rJRNYg49oX9GE6jTS5/AOABYZ5ddbkwfz1k/EKKb7k5YiRCreOuduYMThgrYdeq6/74/2xtUGCvMUqs+wIwxZSGXx3jHQU7IXTy0ndcKQ26QzSKiopEGmre75Y46p+ob3jPdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784636055; c=relaxed/simple;
	bh=6do2XeidT8JQV/NR2jPW339c0TTNOvPFVBsqscvqfks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvK/v6B6ycqjaRY2kRrEnRTiw72YgyyRnLPVm634RwEA+5MGj27Js4Iarqd2rQINofUabYvW38rngVR/jEUazfEga6t18PwvLJSSWhfqV3ALPl0bW+I52eXVuoBtSfRI1+vRYlVkrcKmNcwaA+OLQX8rLAPHu8Cqahqce7T4VvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jv28WT+I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jv28WT+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB44C1F00ADF
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 12:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784636054;
	bh=+CJT1PR+MkFlE50Rl4PiiTnA/tkQOQ2wS7feDbQvBSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jv28WT+ItPg5RchgH84HpIWgX4zF/Y1GcwWXOlaQM/CRHCWeLpY95Ak3cmT7VYALR
	 c6uDnqyssXm/pfOm2Ucf0CkjnIcHk1igiJzGMGnvRsUIpuhcQfzol5pOvMS7s3RzaL
	 LC591L1L5w+GbWro3XHSZLlsmwCYGX6ARIAUVvJR5s313wR92SBFRcJJQFEXh5uh6M
	 dcr493vm/S+Kuql4Fq27apBT7tbkDAVrKBzviZKQPSAeGCQesnJ/iNF8mKw1s0iFcj
	 cCrpMnHz/NcXrWrR7vtcru41aMfyxt7V9D1SfL6W9OK0rhPOEfabu9HhD3SwxnqeBo
	 p7GbrJwQPtDQw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b0148201fbso6298119e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 05:14:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp129J+EAHRTOGIFuywyudywjX0CKMhl/LCxg0c4je0wp+SLeP5Hw5Wu7HP1PH2dJfAaLcINXz1suuXSnNbjqip1vTn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5aiXtAe2paqpk5UV0lvlGqLxX3LKLYY70stpIqAGtI91Hpw3A
	oXjw5NEN+1U6y5hYARM4mbOuS9Yszxg47iXZyT/vo0FduRPWu4jEfgXNQR06uTy8VbXaxe9mOb7
	hIilwsy3iTETctLIOScY6oKoxovEJXWA=
X-Received: by 2002:a05:6512:2919:b0:5ae:bbe5:2076 with SMTP id
 2adb3069b0e04-5b28f9b0445mr3425673e87.52.1784636052307; Tue, 21 Jul 2026
 05:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DS7PR19MB77247D9AD698CF0FF37DB58BFCC62@DS7PR19MB7724.namprd19.prod.outlook.com>
 <DS7PR19MB772444EB48828D8ED8EB3175FCC62@DS7PR19MB7724.namprd19.prod.outlook.com>
In-Reply-To: <DS7PR19MB772444EB48828D8ED8EB3175FCC62@DS7PR19MB7724.namprd19.prod.outlook.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 21 Jul 2026 14:13:52 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iYgMmxyR-eL1tQbB9_YQepmY9nvck_5no3ArpM-Ekx9g@mail.gmail.com>
X-Gm-Features: AUfX_mwKEnxKi2MIuOv-dcO1-op6YytCZq1R6ngZ5mDdzLPhU6hlMMdEUVCp1Rg
Message-ID: <CAJZ5v0iYgMmxyR-eL1tQbB9_YQepmY9nvck_5no3ArpM-Ekx9g@mail.gmail.com>
Subject: Re: [PATCH 6/8] ACPI/platform: add AWDZ8399 to serial-multi-instantiate
To: Marco Giunta <marco_giunta@outlook.it>
Cc: tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com, broonie@kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, rafael@kernel.org, 
	lenb@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	wangweidong.a@awinic.com, nadim@symbolic.software, imitoy@imitoy.top, 
	munzirtaha@gmail.com, yakov.till@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 3:27=E2=80=AFPM Marco Giunta <marco_giunta@outlook.=
it> wrote:
>
> Register the AWINIC AW88399 ACPI hardware ID "AWDZ8399" with the
> serial-multi-instantiate driver and add it to the ACPI scan ignore
> list so that the two I2C amplifier instances on Lenovo Legion laptops
> are enumerated as separate I2C client devices rather than a single
> ACPI platform device.
>
> The SMI node creates two instances named "aw88399-hda" with
> IRQ_RESOURCE_AUTO, matching the pattern used by CS35L41.
>
> Tested-by: Nadim Kobeissi <nadim@symbolic.software>
> Tested-by: Xia Yun'an <imitoy@imitoy.top>
> Tested-by: Munzir Taha <munzirtaha@gmail.com>
> Co-developed-by: Yakov Till <yakov.till@gmail.com>
> Signed-off-by: Yakov Till <yakov.till@gmail.com>
> Signed-off-by: Marco Giunta <marco_giunta@outlook.it>

The change in drivers/acpi/scan.c is fine with me, so

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org> # ACPI core

and please feel free to route this patch as you see fit.

Thanks!

> ---
>  drivers/acpi/scan.c                             |  1 +
>  drivers/platform/x86/serial-multi-instantiate.c | 10 ++++++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 9a7ac2eb9ce0..4f4552b1551b 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1752,6 +1752,7 @@ static bool acpi_device_enumeration_by_parent(struc=
t acpi_device *device)
>          * by the drivers/platform/x86/serial-multi-instantiate.c driver,=
 which
>          * knows which client device id to use for each resource.
>          */
> +               {"AWDZ8399", },
>                 {"BSG1160", },
>                 {"BSG2150", },
>                 {"CSC3551", },
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/pl=
atform/x86/serial-multi-instantiate.c
> index 1a369334f9cb..3e89fcdd45f7 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -307,6 +307,15 @@ static void smi_remove(struct platform_device *pdev)
>         smi_devs_unregister(smi);
>  }
>
> +static const struct smi_node aw88399_hda =3D {
> +       .instances =3D {
> +               { "aw88399-hda", IRQ_RESOURCE_AUTO, 0 },
> +               { "aw88399-hda", IRQ_RESOURCE_AUTO, 0 },
> +               {}
> +       },
> +       .bus_type =3D SMI_AUTO_DETECT,
> +};
> +
>  static const struct smi_node bsg1160_data =3D {
>         .instances =3D {
>                 { "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
> @@ -405,6 +414,7 @@ static const struct smi_node tas2781_hda =3D {
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
>   */
>  static const struct acpi_device_id smi_acpi_ids[] =3D {
> +       { "AWDZ8399", (unsigned long)&aw88399_hda },
>         { "BSG1160", (unsigned long)&bsg1160_data },
>         { "BSG2150", (unsigned long)&bsg2150_data },
>         { "CSC3551", (unsigned long)&cs35l41_hda },
> --
> 2.55.0
>
