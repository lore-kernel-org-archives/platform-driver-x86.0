Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22AB1E501C;
	Tue,  7 Jan 2025 23:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736294108; cv=none; b=jAF+8hB84SBEvUI2Y/V5vaY27QeePZuKVbiOfPS5UcSwAd9KhPFtj33E2jPLdgrHceBF21yj3a9O92KUbr/9Th38UalSLn4g7aKHceZ3dPZVGJ3FoozFKghMNYs9Gu4F5YiI/MBF2bOaruPg9hup8HdDfA3G2VpeEMAHQ6xxw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736294108; c=relaxed/simple;
	bh=ys1P1XHkex6K43m1+J8HnrsBVR3b7eB7bgs1QSer42Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLndPZDY+lkdSafvBCxBd8h8uRL9bb9P2MHiNqyLcxeyx5P5MnR31s1X0UwuDzeubRTlVO6dQ9Ud9NtJWGDcd1shW2OaiGlvDt9bMCuKIyT66+NGfXpNIlPa2oaGLgUvm/m+eGkeX7T5JQkYpO1FP+jPdya6o7awsX16LDN0gqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyM+1/wz; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyM+1/wz"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4aff78a39e1so4655771137.1;
        Tue, 07 Jan 2025 15:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736294105; x=1736898905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4c5wQNHhQ/puZm+Vhhxkj+Bj0ZZhUMCl3+u+zMGX2HI=;
        b=YyM+1/wzvoPbnlNssuN1FCram9w+NtBwoOsxU7uwicwfELDgVvCDSFJqVBH1Fg1u88
         u6iwCLm/GwDesTNVTl4tnsRQ3WLTyHlgGLxB/Dk0tCODX4A+Op88phXwoJ9tg1G9CGN+
         9MrNn5nXaK3L+njTCDkRzkHJmddK8tsoc+jLQLf8IrmDM206agK8Y3kNgTO/gBnBb9bO
         HgT9K4QEn4BntWKsLps3JfqOca3G3X+zj9KLdz6m5GwcsVLyR3qs2MuoZ/snkA9YruEy
         PeypoYWilGe5vXcoolL9gJWxY9f873f7AAeutgb8Rb53IO8BOdW+eH/l6IG4TVz71gNH
         eyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736294105; x=1736898905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4c5wQNHhQ/puZm+Vhhxkj+Bj0ZZhUMCl3+u+zMGX2HI=;
        b=G9iWeeR+8PXFSYi8X1BmcdcLKn84C232Vb6q9KeNvpcdjrf+3nfCAti2sgIbc96aKJ
         48+IaovKKbtXWlsFChrYOFJ+YMSvnzP5YnQ7Dne2nElXi7QGN2I0L/dvZ5LtLPNcpRE+
         0HE6zPd9SPIz0Q0R9ZSdzFETfJ0x7bPub/kQfNjQXMyt5iAUk8vBvoXxlK5QMbw15g8i
         nErzAOEp08w45XRKUbRRMV7ZphJjuCTXTN0JIZEAeOg9kMYEC9wbDxlxRsYdZbUxW80F
         cR8RElUSKbrE8F4ra4DOyTzdkuf7bsSXnJo3JQ0SLN1RQ0dOC4k61xJFe91cj7VZoSCd
         MQ6A==
X-Forwarded-Encrypted: i=1; AJvYcCXD46IGocA9gKPX7c96HUxyLMBU7iqo9RznyBjVzL2pbBgBiiUCkZs6H8b1xM7Yn0jr4oL/SxujlMsswwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNOgfFEmSTCoBLx4xiB1i+zDb+PsXIZe5TDFgAb96m7YDIlCTc
	+fUPUdmz5p7KwR3btkMJRnR+lfpYGwDWLBPbleZTmv7Qcn36vRcL
X-Gm-Gg: ASbGncscqBXzHp8IUrIWNfaNx9/1ZJg+sd0Q5u11DG2sVg3jeGiJn/O3SOYIWtt+SgT
	KTqtyvAiVv4UVObMvUIrIiBmVNzr5Gg8kBw07hWkFrn3Y9ubUKlNKdmjFRq5f+6ke5s7Owh2RJ+
	RwDDWLebr/ypAdbpeqaE/bs58EoMi11w5FFx86umUwj4OREeX5OHRnFO3Fd+VftlUjMCv2X3WHe
	QgUX/ia8QCaZFGGE1T+/LKTviBRlqGTJRRtWot+QHqUu24uc6PNCzOd
X-Google-Smtp-Source: AGHT+IF67ipnmFEUARJQPOaBMWefKC0GUEWAKgzyDEJltQFY1tBeX1EFxqAguTvdTekBcgqXlkKDPA==
X-Received: by 2002:a05:6102:c12:b0:4af:a216:c0d0 with SMTP id ada2fe7eead31-4b3d0e08150mr867425137.0.1736294105489;
        Tue, 07 Jan 2025 15:55:05 -0800 (PST)
Received: from alphacentauri ([2800:bf0:179:113e:f067:4e25:4298:6451])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac1d4bbsm8151150241.2.2025.01.07.15.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:55:04 -0800 (PST)
Date: Tue, 7 Jan 2025 18:55:01 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	w_armin@gmx.de, hdegoede@redhat.com, Dell.Client.Kernel@dell.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 20/20] platform/x86: alienware-wmi: Update header and
 module information
Message-ID: <cajjadvbgzt2fus5eimyuppmofyf5hfrqzrun7u7f6xr6fa6du@flxjaxvkywwv>
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-22-kuurtb@gmail.com>
 <4ac2d62e-f452-4fcc-9f76-363f70a21f9a@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ac2d62e-f452-4fcc-9f76-363f70a21f9a@amd.com>

On Tue, Jan 07, 2025 at 03:30:06PM -0600, Mario Limonciello wrote:
> On 1/5/2025 09:30, Kurt Borja wrote:
> > Update module header and description. Additionally add myself as a module
> > author.
> > 
> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you very much for reviewing these series :)

~ Kurt

> > ---
> >   drivers/platform/x86/dell/alienware-wmi-base.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
> > index 78101952094c..c98c65341233 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> > @@ -1,8 +1,9 @@
> >   // SPDX-License-Identifier: GPL-2.0-or-later
> >   /*
> > - * Alienware AlienFX control
> > + * Alienware special feature control
> >    *
> >    * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
> > + * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
> >    */
> >   #include <linux/acpi.h>
> > @@ -13,6 +14,7 @@
> >   #include "alienware-wmi.h"
> >   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
> > +MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
> >   MODULE_DESCRIPTION("Alienware special feature control");
> >   MODULE_LICENSE("GPL");
> 
