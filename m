Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.27.248.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793497090;
	b=HMGlCpODBiImA/l+Ff1J9I5J1fSi3XvYjMU/5F6dQx5v9kpJf3xC+A5C1Yf7S8mkkYd5
	 GhEDgSZxFkK69Aw97+hkn0S4/1frfX5kfEznsarOGruICDUW+cDzVzd/P861i5JeRYZqu
	 Nf50uhAIZRIM0ZmNfPgJt2uD5tHlfCeYX5HHqpmZQhnkAbd7IAdre2Fury8aw0XRFMVVg
	 Kcn8aY35bMAEBJJmsaRZLtNLH3670eHeECHDKzzUKigLHIH2R8cKhvIq5BUtINSxL4uiq
	 XSzv2JzDL4vp3XhZfq3jBt5WltA1WdCmpKBIo9DbOxR03DU9meWsDPltyn+C+knPiog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793497090;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Gm-Message-State:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:X-PPP-Message-ID:X-PPP-Vhost:
	 X-Virus-Scanned:X-Virus-Status;
	bh=AbVV6hXFymPLGqPqc/r4VXUug2rta/ReY0oIgq5dhJQ=;
	b=pSCbnkpoaoxtghnpjyAQVESr4OKdwurgGtpsFF/QYxeJa4VKVrVoLdcKlDIQ/cKUx12B
	 PX3sdO1Enhe92Vfw/Ab53OOW5apHdNg8peZdpUrTXMR6CFV5pBEiK5foiSKpfOyovuLAq
	 HMKMdS/0t3iupqzR228qbU3EwaizqxZeh2GrXOCQwwHCCsywe6DgTFdsc0w0Abt+1eccf
	 fG9qG3jZ6bijZQxNDVf0AJKv5/ZaSijEgaUlq1Y5KcVz7NVk32bwi1GUru9rkJoCsUz15
	 f4jSjpl/12P5VpCuM1zo4TyVTzRGONKq3RpfZVXv6NJrQ/Vky+nKHEg7F0I6+nI6hRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b="Zm/qZ9ne";
	arc=none smtp.remote-ip=37.27.248.198
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72C5606A31D
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 01:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72C5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=Zm/qZ9ne
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id B3BF03FC03
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 03:38:01 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 08BC53FA98
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 03:38:01 +0200 (EET)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 979A3200CD8
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 03:37:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793497080;
	bh=AbVV6hXFymPLGqPqc/r4VXUug2rta/ReY0oIgq5dhJQ=;
	h=Received:From:Subject:To;
	b=Zm/qZ9nerCx2m3mDip3AWl6igpuRx6ilXiZ7UgSHmdzue8jnY0vM3HBVp1MdRjms9
	 /3704/qiJukGpzXyf+GoJHD9IGiwCwuZvOr+O1WUSZ5Ikc8nswybTOA5ubKb8rpaSr
	 rS2MGp6V+hewaQLmPAJcBWtNTvuesAGQTjFOv7+k6AdWfrs6AvL5CjBbDKNBSrW/HN
	 52A8KL7JLFZDVk+UDy0t0XYsTjB44IkGHwVSgQmQWJQpj53agOJaJN5BFHCiAlsQsv
	 5wITBQNS9F5+Wt6qt34ishtTUdh49vDYg8kBhuNeFiFJj0srFXvKz4UFMcp81J0iqb
	 boqJYMxs9t/zQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.174) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f174.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-cc751eddf25so1123371a12.3
        for <platform-driver-x86@vger.kernel.org>;
 Sat, 31 Oct 2026 18:37:59 -0700 (PDT)
X-Gm-Message-State: APuU4Z/Y4JYNzNTRusv8aV+Dqmf53IElzAEOGFc+n9AGTC3DiZsclDlA
	ehLnoLBiy+W7BReNRS7PN0bQjBDF6fEVDv0lp+6LI1gtVWj8IG1I7MJpAR6Fo59QeuSUFiZ3+i0
	p+DXdeXlvE0PF3FSdMe/kTdB31VruJKM=
X-Received: by 2002:a17:90b:528d:b0:3ae:5525:dc25 with SMTP id
 98e67ed59e1d1-3ae89850a1amr5314180a91.51.1793497078050; Sat, 31 Oct 2026
 18:37:58 -0700 (PDT)
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
 <CAGwozwGDo4ae4WV=7Ko0vtW+JLCFTZcnZ6z=zQcRE2qXUBJt=g@mail.gmail.com>
In-Reply-To: 
 <CAGwozwGDo4ae4WV=7Ko0vtW+JLCFTZcnZ6z=zQcRE2qXUBJt=g@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 1 Nov 2026 02:37:46 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFqNXuwepO80H2uJu3-21TkAx-0Xva9XPTf5tVyXp=oQw@mail.gmail.com>
X-Gm-Features: AclHuK-ZBEnNg-PxRUfvRk5pEnqd-SLiJgdGWd2YOlAcClDZkXSge4mXI7KBUbg
Message-ID: 
 <CAGwozwFqNXuwepO80H2uJu3-21TkAx-0Xva9XPTf5tVyXp=oQw@mail.gmail.com>
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
 <179349708051.1294877.823317800617943464@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 1 Nov 2026 at 02:35, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Sun, 1 Nov 2026 at 02:26, Jiajun Leng <adolphpi@outlook.com> wrote:
> >
> > The OneXPlayer X2 Mini (G3E) is the Intel variant and reports DMI board
> > name "ONEXPLAYER X2Mini".
>
> > It is not covered by the existing "ONEXPLAYER
> > X2Mini PRO" entry, which is the AMD board using oxp_fly.
>
> Obviously. Remove.
>
> > Map it to oxp_g1_i, the profile used by the ONEXPLAYER 3, which has the
> > same Intel EC layout.
>
> Keep. Move up to the first paragraph.
>
> > Verified on Bazzite 44 with kernel 7.2.11-ogc4.1.fc44.x86_64:
>
> Drop. Broadly speaking we don't care, and I could ask you to test a
> mainline kernel now. But it is not necessary.
>
> > reading, manual PWM and charging control work.
>
> Move to the initial paragraph
>
> > AI assistance: Claude (Anthropic) was used to draft this changelog and the
> > diff. The submitter reviewed the change, built it as an out-of-tree module
> > and tested it on the hardware.
>
> Also drop. if you want to mention you used AI, do it after the
> trailer. The assisted-by tag is not used anymore.
>
> > Signed-off-by: Jiajun Leng <adolphpi@outlook.com>
> > ---
>
> /\ this is the trailer
>
> Best,
> Antheas
>
> >  drivers/platform/x86/oxpec.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> > index c4c4babe8e30..50d169302fc3 100644
> > --- a/drivers/platform/x86/oxpec.c
> > +++ b/drivers/platform/x86/oxpec.c
> > @@ -230,6 +230,13 @@ static const struct dmi_system_id dmi_table[] = {
> >                 },
> >                 .driver_data = (void *)oxp_g1_i,
> >         },
> > +       {
> > +               .matches = {
> > +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X2Mini"),
> > +               },
> > +               .driver_data = (void *)oxp_g1_i,
> > +       },

Also, move above X2Mini Pro to adhere to alphabetical sorting.

> >         {
> >                 .matches = {
> >                         DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> > --
> > 2.53.0
> >
> >

