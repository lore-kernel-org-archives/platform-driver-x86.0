Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792562317;
	b=MepTxfI/qnlpMBoMDn+O0f//G7U0GR1Op5kOWayIPPUdIdEpRN3t83CBKGjcM+QuDJ7L
	 cORPcdBwSkSX55rvyH0m0R9kzaTLRN1Q/mjhKv2M1kJFnc1bQwd66bgYQqnvQf89g6QnJ
	 BAgWgGps7qm1EeGKYexbxz7Ytqfi1+CXAgXEnZ1mzw1SKgxIHQJSffBRqUHrFx8Jt8BXy
	 8hL0MgwwhAge8w4rW+m686kfNPtzsSy3EDt/J4K1WwMCASYJqLTEnKRmakZsMPQ+YMukv
	 VkUP80hcNwBjZEvWJJ2FPiBGmGjQI5HhzRsTymZGJKABEhVLOkUFaltOKSwWdwSrt7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cDTft4oCYYFLnSmAGGawpHgZJuk+rVPSatHBqJxDTuY=;
	b=GkTjMEhcCk7YFRkVAujf+6ivdk4tr3hk9BC7cOvDeDWU3bjnVaqb/lnSYKgfApDbELP9
	 Kh3D4RRWnZYwBa1P09bnUIso0Cdw0b0FGdLH6cdxrk5yzV8Dzgz6TqmDNAEOo0iuTKqm3
	 ge7sdcQgga8x/rKTGpMLwP/DQ/vrCV/I9RF1zgsyxUKKWLic91unW8NDoDM3pObSCNjEa
	 IMq/vkVASyhY9Bq+xy8MeZMdxwjlzeBlfHyXnGHVIQVPGoBEayZzlVQnmmcpzezr6G8C3
	 ODjB19PeiavVu/IqGBUFPiWtMEZPNUT9P5mogNGJGg+GZRiOYJ1RTibdDEereYbAsRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QdeVr4lO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4230606A319
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 05:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4230606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QdeVr4lO
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c418e215671so32389266b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 22:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792562315; cv=none;
        d=google.com; s=arc-20260327;
        b=lsFI3qfkcF2Pj/ptcIOoO2Z3AoVHlcFKtNnEU9Lr39IG+ufZqKW5igEQANyucDxfQT
         xd104zcZGe5wMM+fVRkL7+OMlKb1ifyBiR67AkoOYcm6HS1bNnlFL0cJrfaGA+q6pbm6
         5MdDwfVrZsCnbTlMpAejaH9YIXXSapRnckvzpIPc7dSFekKtGJYw+aJpNGsHX/vQiVyZ
         kkc3/angbjoyVUoM8vZoVxeC0B6BXP5roG0LmLVkQdtJLRdjQdp311CUt8cWy+t63am0
         uVoqBiZH4R5JrzukBiidtWP9xSmcNniXi8FXwqgsAd/O1EC9A/76ogG6DlXl8Eqn0UB3
         D3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cDTft4oCYYFLnSmAGGawpHgZJuk+rVPSatHBqJxDTuY=;
        fh=B10QInrV9dlDIKGCGyl9xs9/3WWutk3p9qRbgHI8tDU=;
        b=hsF8qly8a4LPdWT/80NdM7Hkg88JFpX0vD3Q37ODptNnv1xiGOxDzs4K8Qfb0T3ShQ
         axKR1Ymn0OUw9g4+85dPswNjS8Qq1YgWf4RkKBWMMPC+GY7NcrKzeanB/2e2TNzQz7T3
         My3WCk0zlA/oII2t06PTRxP83S1dxalTNMrS/Nw9WoOueK+1CuFjbF3sDU8XEjl2eL/n
         g8RhF4XT2sMIgRWDywbFxJJjCrjeMcCxc4XKd6Qu4Jl3W8GaTZQdK2bu6xT9XTOBEwpx
         CnKQqq3CYn/HQ0DYAFC1djwwrpT5nBZl5o6U/0LCuN8RYYZKA/1JcAvgW4pii7aw3oCF
         50uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562315; x=1793167115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cDTft4oCYYFLnSmAGGawpHgZJuk+rVPSatHBqJxDTuY=;
        b=QdeVr4lOTL6AxWWcpOsY3zAqJ3qggfXrol95yDDKMyqSdO1nXV28EV6UpznchG4Hze
         o5xTDHUdwD7FLsPMnWeONBCXZy7Si+S3CCi+Th6e9DOgh78ObJ9xxTYA4CkUlYxkfGAG
         /VEPLmtAcBeti5Xj2A1I48feHuAFOsbuzqzvxvKqUb549nYP0BY8cg3ybwCGBAsiItaS
         pDgg46yMxRxGeD2sdOiXHAjDJ6hMZ5wcJCcZTnNb6PNPC6EgwWEbVFINsBqvDqfXhNDP
         WGYBXp/30TXPlSk7zmgVGgKK5vNnnGVI7ohd3UaPlRwTe06LC2y1bNQTJHmtfc7nc2Ee
         ZKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562315; x=1793167115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDTft4oCYYFLnSmAGGawpHgZJuk+rVPSatHBqJxDTuY=;
        b=jfPQKFO0mw01un5NiQRA6zo7zrReCHN79IXJbc4FQnacmWAJ1WTqznUkQ730knqPmQ
         lKlRgnhKV63sHUf47vPnIN1cUHspxek4E6el3xP3ryrU7tNz26oaajJN3+B5urd3NlV8
         d6hDur7GtMNklv56BNvSTUchE+wJP2iLvKEXuzrVNtbg1pP+CjXxSOEQxgpjM7TMTMAh
         Yn2ht4TZuCr6tIUci9nlfex1b5tB879txM7zR+O2XIcw4tg5uMNs/NMzMdjHUfDWRf5i
         MgML5cK3FisF+r8nq3QOfdfDJZooHJZW1StloNHnaHw8Llx0GxNEAbysTFQrAFGdkAQ2
         AZoA==
X-Forwarded-Encrypted: i=1; AKwUvBwXBycg9OyDxnlR487tE9hROKzilRkShMBMa9H2lj0WCf2cfCwqo9tsFlkwBrQPXgGCq61ihozNbSpwpcdP/pfXFBpF@vger.kernel.org
X-Gm-Message-State: AFq9FYJsTj/mGSI+AhhTx9TGWnt4EmiqmLqJOD34mvU/kdJ75zfH1SLo
	UaHowh+ZEcSb1rHVpRXvGkWbuFDXrr4ep2hKoJ/logkZcqNW0DGhiw8p8C46Ytl/Afl9fvZPLpL
	iTDsHp+CIWJBgIJyD/5J7SS1FCNY+dUQ=
X-Gm-Gg: AYBFou2li3Puwqc/lqc0iCwU3wL6LxLIcMNJFZLAnodTaqo9WQXAZ1g5+wLxhZXn/zp
	6NCUo5sdG7KOI0DuCPjFkUkYNEE7nA+r8sY8vkAVBb2qxnCJtRaxz7CAjz9TYESqbaYBu80xmD6
	nqc+vM/p9jiXcI9y7JJpc/VgnVJv+Tb858noz3bUwy6GJnRuM9wzOqKvvRMSIfp84qKiTbG9HJz
	hvjBBFu7Jp/uf+PWRE5WBQBwbK4yqYgJTq5hQxylpMbrqEFG1xaAU6JmCPqsgpRP5CZ1rdKDHy3
	D/66PBChM4N4u6PwsiVfUnm8YWRJk4CoqI3uEhGE608t8VwqOYpV1GW+gvbldwCugJxnyGF3uQO
	09sF4WNXdj7GNDWsJA9Lfdac9z5/ivm8fIc/0HbKJnr+N4ZcH0E3tynIkkQ8T+Sr6ZFLQ1fA0tj
	vTqsqJB4gaxkk8FELYZatONB6wgKuCd6OMz2IT/LavNK1wHGkPes4wEB5Pi5Yo0w7VMGS8pS3wF
	N9dWsApYXesxn8bunnhn7zpxe8lbe6DuxRcnw==
X-Received: by 2002:a17:907:97cc:b0:c42:e6c8:e496 with SMTP id
 a640c23a62f3a-c46797a19f7mr70958666b.36.1792562314818; Tue, 20 Oct 2026
 22:58:34 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com> <20261020015001.15672-3-patrakov@gmail.com>
 <atcpXzA6KQfgiD7J@kekkonen.localdomain> <atcs_nK50gJ3dBRX@ashevche-desk.local>
 <atdaMqiA3RSb5GEs@monoceros>
In-Reply-To: <atdaMqiA3RSb5GEs@monoceros>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Oct 2026 08:57:58 +0300
X-Gm-Features: AclHuK-PF5pOS0r7ZZClhjL5fCAFIawvnh7U4tmrV2llCBHRZIaHJ4fecWq7QXw
Message-ID: <CAHp75VeoH8FMcwx1Q2C_KhxUrVCEKxetBq53BNwotgPMA714ww@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Alexander Patrakov <patrakov@gmail.com>, 
	johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org, 
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, 
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:13=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
> On Tue, Oct 20, 2026 at 11:57:34AM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 20, 2026 at 11:42:07AM +0300, Sakari Ailus wrote:
> > > On Tue, Oct 20, 2026 at 09:50:01AM +0800, Alexander Patrakov wrote:

...

> > > >  #include <linux/gpio/consumer.h>
> > > >  #include <linux/i2c.h>
> > > > +#include <linux/mod_devicetable.h>
> > >
> > > #include <linux/device-id/acpi.h>
> >
> > No, this has to be part of i2c.h on par with device-id/of.h
>
> Well, <linux/i2c.h> includes <linux/acpi.h> which in turn includes
> <linux/device-id/acpi.h>, so <linux/i2c.h> already provides
> acpi_device_id.
>
> > Uwe, can we get this fixed, please?
>
> With the above said, there is nothing to fix, is there?

I believe it's just a coincidence. We need to include both explicitly
(I mean -id/of.h and -id/acpi.h). Do spi.h and platform_device.h
include acpi.h as well?

TL;DR: we have an inconsistency behind this, so it's definitely
something to address.


--=20
With Best Regards,
Andy Shevchenko
