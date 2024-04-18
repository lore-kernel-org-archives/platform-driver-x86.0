Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906CD39FD4
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713423691; cv=none; b=fOjhtEAS/VxbXMq55x7k7kZDPFTmd1O9EmQB366+rNQ9agcJfMAPMfAunrbLUlMlOdZtpDKJPs6WhpwC3WFTrMJkxHKy5lG4y10oPAzhCdLk6xHuc/+5H5/aiMvJ5Ld3VjxFDakgBRkX3ddLNin/mRswUqnGOpjf5uMR1V+7+4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713423691; c=relaxed/simple;
	bh=aBa+Zd4DOsCV5bBQi56SDbzPnQQrs8wGfyaz6qAplIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crJuDrYwK6GeYG+xepgNtCK9Czsik/t5Dy83FJYLO2sj9IjVijhuw0MB2pGj324Z++wyz6olr+QNcf3tGjlTp+syK4F775/9Z35mFtpp4m40h3d3QQ0Y1ZTdlaaN5zZhTy21WGY8vfOypkBNZKB0PbVTGPYyjD6y6iZi+Hc71F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JuC0AOrs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JuC0AOrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713423688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCeGODggKk984bbqSwADAeFH8dPaC8yv8N2n7Vqmn3A=;
	b=JuC0AOrsvDg+pJtKzB6gVK8+dA/zR9P3/7bBX403ez4s13DDzajh+W6KBneMkx6+Flr8L3
	CAe6pILwJajW6mhFM5w7+ISgs7oj259VRGf5zNfRtLZKdfucC0E620b8Lh73ThyrZhXTQF
	oL/uqwkqQaYF24I2uMzUtsVCpGIJ6Ok=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-A_CODTLMOb-Y8CABNOtYVQ-1; Thu, 18 Apr 2024 03:01:26 -0400
X-MC-Unique: A_CODTLMOb-Y8CABNOtYVQ-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6ee09c3404bso935094b3a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 00:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713423685; x=1714028485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCeGODggKk984bbqSwADAeFH8dPaC8yv8N2n7Vqmn3A=;
        b=rFjjy4dBxn4mQ25KqJfD/KHaOu2cjdIPdnhho+fsYb9XrXfG70AwmNixZVO/N8XtmU
         d4Jm/9zCE0Cu9BQjXoYn9fu35Nm4aQSThbPgTppGiDVJYzW71qN6/bG8gUrCtWTGqVuG
         MUCoF+6qWqFK3MxSxTu4lvv/Ioa2KArTaEfRNtO05e4pNUtwK+Aj+PuIr4/4MnFVGq5a
         lpmcLFelRojl1jvldtWU7GmDRZrJ2pQZPGUKosZom6sVjT1wpymOoLV5PA/Xc+QaBSCK
         2X1hQdMBjKoUcRISQCqLpZjry94yyU7R0ukVQixURXIdb88nXHZCCkTnlDcSEbcj+eSg
         x4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgnds0853oOMvfDxSBTNTF+Kd+6fi5YpiwaM2qWDtzFnYjPBOJBEAsF7lL1HbfjkW/wWfvoIRrYvBEaKmctNV6YXvtHP2mfV68wGyPgxu95pZVYg==
X-Gm-Message-State: AOJu0YwTP/2/L3sRoPsVzoyTtPeevxUUvKtN87+zGWsNzo8j1QxNOV/7
	nVy3S237l4q889hBsoqHDePJqfQZVGwK8vjLlUCCkEx8x1zjKWxR83ZFdn8dCTo+bV2L5CM6azL
	JC6/ZPEEEeOwOJzS3cAvjcBP7eQTYgpY2TYCF0Lz65RrYuarcM88BXE4guqAJ47jwzMDBYuvhOW
	g1yWYxzyzSIygAPeJ7zYsfoEEmvQYPLJOcfyFpP9UzuDR3jw==
X-Received: by 2002:a05:6a20:1588:b0:1aa:5984:d3 with SMTP id h8-20020a056a20158800b001aa598400d3mr2813385pzj.6.1713423685034;
        Thu, 18 Apr 2024 00:01:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9LpK02ULWJ6ZvpKG3pyD3OiboVfLCBcf9kyYEbDUPg0rA+sYUJZ9rBRQ1cKRvIYIB81qkbkXpr0XQAKD8VfU=
X-Received: by 2002:a05:6a20:1588:b0:1aa:5984:d3 with SMTP id
 h8-20020a056a20158800b001aa598400d3mr2813354pzj.6.1713423684648; Thu, 18 Apr
 2024 00:01:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416053909.256319-1-hpa@redhat.com> <20240416053909.256319-4-hpa@redhat.com>
 <CAHp75VdRgBqaX4NNvABS-90O34OtRf5t85JOjpG=tOw2SHr_tw@mail.gmail.com>
In-Reply-To: <CAHp75VdRgBqaX4NNvABS-90O34OtRf5t85JOjpG=tOw2SHr_tw@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 18 Apr 2024 15:01:13 +0800
Message-ID: <CAEth8oEtb+m_2DKF6Z5W1m1fbBxnP_dgS1tNS9iJMUgg4ZRhnw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] leds: rgb: leds-ktd202x: I2C ID tables for KTD2026
 and 2027
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy

On Wed, Apr 17, 2024 at 1:32=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 16, 2024 at 8:40=E2=80=AFAM Kate Hsuan <hpa@redhat.com> wrote=
:
> >
> > This table shows the maximum support LED channel for KTD2026 and KTD-20=
27.
> > The 3-channel LED controller KTD2026 controls R/G/B three LEDs. The
> > 4-channel LED controller KTD2027 controls R/G/B and a flashing LEDs.
>
> and flashing

LEDs should be LED.

>
> ...
>
> > Link: https://www.kinet-ic.com/uploads/KTD2026-7-04h.pdf
>
> Make it Datasheet: tag
Okay
>
> >
>
> and drop this blank line (to ensure the Datasheet will be recognised as a=
 tag).
Okay
>
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
>
> ...
>
> > -       .shutdown =3D ktd202x_shutdown
> > +       .shutdown =3D ktd202x_shutdown,
> > +       .id_table =3D ktd202x_id
>
> Exactly good example to show what the difference is between
> "terminator entry" and "last field in the initialiser" and why in the
> latter it's better to keep a trailing comma. And hence why the stray
> change in the previous patch. So, id_table also should keep a trailing
> comma.

Thank you for reviewing it.
Lesson learned. Now I know how to manipulate the comma correctly.

>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
BR,
Kate

