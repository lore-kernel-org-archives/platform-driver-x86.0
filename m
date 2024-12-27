Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883B5AD21;
	Fri, 27 Dec 2024 05:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735275680; cv=none; b=sw1WQBQ4N97htZVzZeHodi9IjzIIkZWVwTIuVE+A6yDIdtUy3K2HapuumGMMAG//QP8VD/QrJxHMia6ilLqrym134PMi/0Yh5H7ZIY0qvSWkh4lEV/i6xjHRNC881rwae49riwN+cJpE3z3msv5pR2jZGTuYpDc12ooInbPV2ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735275680; c=relaxed/simple;
	bh=0aP7ZLDC+qrDtruOlqL8bl99glimkZOrkoK4p2seBsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7rs8V/FVFyioxiXejSEo4AMimb7oR1ys5sQaSp/OWXz2VHFDCMB0HgBQZkbOcyb0y+EC4tug8XMROLk9MB9ZOjlBRpUxXi2TJHAKl3HlvC46UXyrgD7AKw73GY1U56zKYdVz0l2mOLVDGm5OmOVPqc3uskghSXBGQHTZrpwlig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGbphETv; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGbphETv"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86112ab1ad4so1799593241.1;
        Thu, 26 Dec 2024 21:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735275677; x=1735880477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nLLGzq91re/H5W1TmTf/ks1QrFq73PflCFT2L38ptVw=;
        b=dGbphETvhkU5jXJ9AHn9ony4SpjrF2vPDH56uQWmCirgw4ZCWeHWncH4h6ARmvnwca
         oLnf02QDeKHDZ3Z7/vgozMBoUYd+7puIJRRJ5tHXBBJrgsPxA6aghsIyb8Dtc07+IFpp
         fTnxjLpFGQR8FD5GOK2EANatgcaVH9Cn6omwlaHppSLzloOvfNGDt+jZXw7WHHLytP40
         GFDtoCdKCl+NUVZ4eq6R+rgvyHrgHijiDkX72dxlIXq80ungl9Dnm1TUj7XfXTNKnwEL
         ywKqEP5ZrDr33vOQIVzPMRhqOsQwKjysOx5wN4jJr3Cmy9J+Z+ZzMgVVvuTZpSYPbq1O
         9qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735275677; x=1735880477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLLGzq91re/H5W1TmTf/ks1QrFq73PflCFT2L38ptVw=;
        b=bAHN/fEh5gHVmTqRdAWy0+6/nldZa0x7kKw56Tb0J7ZN4dHUL3tyXS0B/Obv4twf2o
         5Tx6hLnwc/kvK5hMod87KApaGOfQkNBM6VMrI4eCE+zi8BKI5T+DUlP75g4UtP4k1f2R
         I1O1H0ZzhMUl9yX7ZADcMyjun/t4dIQhCCohzWy7QIkQ9vzhM+YCfkEU2imHwp6QAAE7
         0qEi1W5JS1UXH7jrkCZupIGRVz0NPIp0Yvj0W3m/6xv8aOonSAmbMDke4G6TlhkM0Bq4
         6fJY10ehuj77dujZwiL65vc3QgHKCLavu0TK0YFlQoagUmB7ZrAeavovIzQM8XO6aff8
         h5pw==
X-Forwarded-Encrypted: i=1; AJvYcCVUCuntO5SL5rkzJU7hWZvhLYI5rbeIsarObV7zyxH7FlQ/2EgdrMyoyrdaibNTdgjHyYuuhZaV4SEx31U=@vger.kernel.org
X-Gm-Message-State: AOJu0YziRo1KBZKrUB4kkvA+95swKe3l1RJf7hX7eoXFss210RZp4l/Z
	N+pVns7autS95I6iN4QCIfvaFEbzHFrfSDILmp2nSPcYZlCP5tbm
X-Gm-Gg: ASbGncsAsYG6IuViNA25Z/sCKM0ITTQ+7g0KkEYyQ+EKYopYSLbpCIlKzwfPM3QKx+N
	IW+QALzQoPhPJg+N9xrMPCBllHBV2lahwa85XXaG1rOGiLVox/tSxKcceX3MtilBrx9ezKDN2lA
	oXb3MKaLVzGSxfOZgJR4YZ8c7VfEAh6LZyBwjbLn+0EfKdCxwRLXZp0W7XEUy8s6LUFUPsjE2ox
	biOpwPW2FxEpJGf42c8y0ylIzySZ9xXRmQhNDqG4oD9PyTyOxplQw==
X-Google-Smtp-Source: AGHT+IHeSLPpvOJA7ZLJlRywudU+hsFLchUHB9WGaL5cwB4BiyIS5SGf4ir/yooajiYW8gUGn+bYlg==
X-Received: by 2002:a05:6102:5122:b0:4af:adb2:5133 with SMTP id ada2fe7eead31-4b2cc49acdemr18617567137.23.1735275677395;
        Thu, 26 Dec 2024 21:01:17 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf9c7ca1sm2968501137.16.2024.12.26.21.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 21:01:16 -0800 (PST)
Date: Fri, 27 Dec 2024 00:01:13 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 20/20] alienware-wmi: Update header and module information
Message-ID: <67ui6qoilcuvbxyh2htvy6smynopxdssvclstzxo7lu4inqteg@bhjp3cansnzp>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-21-kuurtb@gmail.com>
 <8b05f882-7410-49fd-987d-5bdbb69b1e33@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b05f882-7410-49fd-987d-5bdbb69b1e33@gmx.de>

On Fri, Dec 27, 2024 at 05:08:58AM +0100, Armin Wolf wrote:
> Am 21.12.24 um 06:59 schrieb Kurt Borja:
> 
> > Update module description and add myself as a module author.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>

Thank you so much for your detailed review Armin! :) I'll submit v2 in a
couple of days.

~ Kurt

> 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi-base.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
> > index 450ba0a48004..e8ccf9b277fa 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> > @@ -1,8 +1,9 @@
> >   // SPDX-License-Identifier: GPL-2.0-or-later
> >   /*
> > - * Alienware AlienFX control
> > + * Alienware special feature control
> >    *
> >    * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
> > + * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
> >    */
> > 
> >   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > @@ -15,6 +16,7 @@
> >   #include "alienware-wmi.h"
> > 
> >   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
> > +MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
> >   MODULE_DESCRIPTION("Alienware special feature control");
> >   MODULE_LICENSE("GPL");
> > 
