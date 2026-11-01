Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.62.234.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793496933;
	b=oQ0rWc/UCMWbG6STUHuw+T5WnwDOPS+p6jSqM51rmwTy6Tp6n2KQceMh29AWyMA4Er4H
	 pJkk5x1GdCSR0inNbJLDQh11pfy4+AZvbYu252RoFpbxObxow77fcS/vkUzh+K4E/lcgc
	 2V0R3bMiMYZT7YOMusfC2O+VCV1kcfSl7oXjyj2eTB8j0p4Oav4Q1ZDbvxWxXnEX4v2v8
	 C3VIt4j3HL+stRdLlgX+fY2A77v+vghYdmNo6kzPIhcg2gL5FN7vPItKrgjyzEt5iGtSE
	 /1ACaYEabiVaoCce7/l1gWBdG9ssFrm2kHshZofDRtFuW/5Vn1J7czQsYoYqF4asM6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793496933;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Gm-Message-State:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:X-PPP-Message-ID:X-PPP-Vhost:
	 X-Virus-Scanned:X-Virus-Status;
	bh=yXkHV2gyJkiBHe7HEUTutNxGECI3yoPsH7ahipfJ9/M=;
	b=UmGGaH2rnZ4NrX+72sVFL0NKwvmUafDhlasmqWX51gpqIqXY8y4+HM0EMQUao5OmjooK
	 ickYxB+iy/BXgiqFjY0mST9RrPpkIdC6kmNQlxjvI2k8YZnFuG8d6efGIBzPPyLARHAR0
	 jDPAWkryhsYQsQUvCWOdTMgWzTOesRqjZDMS299yJIHhoO2IJ92ChcOS7S0e/vKpiaVP5
	 EDgrFZpzTQg5NZ97bFNE8Ej0qcAvJ+fRJ2HSTzyijs84WSrlXCQuWp4hwjVzJqgv2qOv5
	 4Qvkiu7lOEKlnXRDSWv6Rxm6ZXZj7wva6b6h5Zf+qvrLmEXeHfw9nifahlut4JoKdqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b="ZPHVm3//";
	arc=none smtp.remote-ip=46.62.234.254
Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1E606A31A
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 01:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=ZPHVm3//
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 70AD63EDA7
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 01:35:24 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id 7E3AF3ECC2
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 01:35:23 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 0A581200CCC
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 03:35:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793496922;
	bh=yXkHV2gyJkiBHe7HEUTutNxGECI3yoPsH7ahipfJ9/M=;
	h=Received:From:Subject:To;
	b=ZPHVm3//856BszF8+uQPumSZZ4fStAnnTHVdTSkH95hhDolVqlryP2nD7d7DJK5AG
	 NOnjVmAV46VkQzjrln0zx9ejsYq6ssQmYH7fYloJQDatmHpp33Oxqe5NdvnAA9w0ow
	 fAcV73VbQgw8jgXa3Od4tkipEPleJuEZ6d6n1b9+eq9XNW6MrXmxnyn3O9LjRh/R/5
	 jdJLLb6N4ukfQRBqSuvYVdMIviwpXQTCrIG2Z+p8DxpSl4b/wIkvG6nNVpjuE+W7lF
	 HBJKd5StWej8GiO9JBkZnUr59KwO/sOM1bjXUCV+gFz5Uodg+uqQEle9/3ngmPn+fH
	 +LiznbXObwxRQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.172) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f172.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2e946155442so16773935ad.3
        for <platform-driver-x86@vger.kernel.org>;
 Sat, 31 Oct 2026 18:35:21 -0700 (PDT)
X-Gm-Message-State: APuU4Z+zHZxHBr5Bm36KPuJKHlCPEyoBNkPS1rvX6e8YbFQ+BDC0UTIs
	VcatCxzBGf2GL/d2GOngXB9BkmeGIC0Jnwi0V/BZjwleRukdTeAxb/XNUO8QksNbFJdRiQ0eiFG
	L4AgR32iNeUxhDCovjMGIhbyZLEqKYeE=
X-Received: by 2002:a17:902:ef03:b0:2d9:216a:cdd3 with SMTP id
 d9443c01a7336-2eb3649be94mr64436225ad.18.1793496920012; Sat, 31 Oct 2026
 18:35:20 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: 
 <TY7PR01MB1374656B7810521751CB248D4DB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY7PR01MB1374656B7810521751CB248D4DB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 1 Nov 2026 02:35:08 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGDo4ae4WV=7Ko0vtW+JLCFTZcnZ6z=zQcRE2qXUBJt=g@mail.gmail.com>
X-Gm-Features: AclHuK8bhwHnpHnTEhfJWPJ1fTYpKUXKG9L8Z_35_j_VWjTA10L90Ny46P7Fb5c
Message-ID: 
 <CAGwozwGDo4ae4WV=7Ko0vtW+JLCFTZcnZ6z=zQcRE2qXUBJt=g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: oxpec: add OneXPlayer X2 Mini (G3E) DMI
 entry
To: Jiajun Leng <adolphpi@outlook.com>
Cc: platform-driver-x86@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179349692248.1287785.200540870470072427@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 1 Nov 2026 at 02:26, Jiajun Leng <adolphpi@outlook.com> wrote:
>
> The OneXPlayer X2 Mini (G3E) is the Intel variant and reports DMI board
> name "ONEXPLAYER X2Mini".

> It is not covered by the existing "ONEXPLAYER
> X2Mini PRO" entry, which is the AMD board using oxp_fly.

Obviously. Remove.

> Map it to oxp_g1_i, the profile used by the ONEXPLAYER 3, which has the
> same Intel EC layout.

Keep. Move up to the first paragraph.

> Verified on Bazzite 44 with kernel 7.2.11-ogc4.1.fc44.x86_64:

Drop. Broadly speaking we don't care, and I could ask you to test a
mainline kernel now. But it is not necessary.

> reading, manual PWM and charging control work.

Move to the initial paragraph

> AI assistance: Claude (Anthropic) was used to draft this changelog and the
> diff. The submitter reviewed the change, built it as an out-of-tree module
> and tested it on the hardware.

Also drop. if you want to mention you used AI, do it after the
trailer. The assisted-by tag is not used anymore.

> Signed-off-by: Jiajun Leng <adolphpi@outlook.com>
> ---

/\ this is the trailer

Best,
Antheas

>  drivers/platform/x86/oxpec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index c4c4babe8e30..50d169302fc3 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -230,6 +230,13 @@ static const struct dmi_system_id dmi_table[] = {
>                 },
>                 .driver_data = (void *)oxp_g1_i,
>         },
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X2Mini"),
> +               },
> +               .driver_data = (void *)oxp_g1_i,
> +       },
>         {
>                 .matches = {
>                         DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> --
> 2.53.0
>
>

