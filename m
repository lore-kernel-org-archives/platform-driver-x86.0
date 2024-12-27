Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A39A7F477;
	Fri, 27 Dec 2024 04:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735275486; cv=none; b=u+9ktnlb2ncNaVlzrYAen5CMrdPHQzJlxJWh/SGzT0k/ainXbwJxHekeHjHrvvahtSOYh1yJy9ESIQ3bhMm5ZopjqXS1hOHePfn/6WhPs7hW+WzD3EfnnhOXO1cuI0fvGYHiQc7nL/jrRe3+pK9Ceg6E8xzChieSk87N/7QhqnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735275486; c=relaxed/simple;
	bh=h1Sq0M9C73S+iawO7cDGIdKHtbKkHGVTFf7LOSvrPGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyZoFG9RE1PI0fKMEC78o1fPO/uuegkHZfiMwf1z0bsYySAdqgyxiC1K92aSCwsRcismP6eb1T9E7xXSfoObYmD4facDkGeU7IB+vXAFQaWZCZ2dY7dHjwoumwGa4p5fcFmvJihnFl/MkVmvTdjxYskX4VLh/dEhSKr9CLcbfWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahIeR2m/; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahIeR2m/"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e53a91756e5so6091646276.1;
        Thu, 26 Dec 2024 20:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735275483; x=1735880283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYtUE1o3oAbyct1sLW/tqWIiwZzMs6sqHsO7vIGvXzk=;
        b=ahIeR2m/BAdPlHYNG+Ne9SyKjFNhBAZBGmCm8TjduzmA2+MLbbsgD+GORgEDdiGoLh
         d7rqj9R89jHiQF6Tf+unXbLbYwO4XbIl39ylreP34a36LfcJZAOdglTtmpIL5ufj8kxx
         fqlb228Tv6r2g1qd+lAPpjunIPBbnyHr9GNvifmYGCYJRczjCbqT2F0WmF3ZE/NOvKMk
         0QZ1wJv/RPhW17AgJ/hLexu2s3qKRlVtOZBOWXSeFjORK5XltMMLj3/uHv+a0LIr5bW5
         Ase8wMNUuXg3qWsaD2McktRkpZhUZK1RbUxH9bXvjNvhlYavGb1Klma+5A+exrNWRIyX
         a/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735275483; x=1735880283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYtUE1o3oAbyct1sLW/tqWIiwZzMs6sqHsO7vIGvXzk=;
        b=Rd+7D/1k5dWelukks89Xob/mYPI7mCezIcA6sC/5jZa6ZpZFo0MjJ4zx4Av73Vtkh0
         p+9atTPnrEt4QtNb5dpm2I7IEbbXr6azz3hVaLtdlmFBtyr/X3LkhENTJsQx2WfyiSI7
         VmzoxW8md51z7vnU+tMOHOebiF9BRZ66dRIlq9PULgb3UJndwIvpYq7jgr2mV1pga/6P
         38PKA9vI/LWry3tYud6OEOAEkgrC4Tx9UF24iJ9YxL1B5v96Z4LJM/FswJX7RpWkAx0j
         gyyL3DDipEP5V84mBVhjuqgHORfRwi93FSGcPWyTj6XIVzEJpPK0l4a22CH7G90pIqB4
         FLFg==
X-Forwarded-Encrypted: i=1; AJvYcCWqCA0oQBJpeFQPdCxSHZ756sF/D24BL5wKPpt2CW8WKbhlMmweuegFztvdLE9oq8BDwKsrB4pyMLrR+3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZpKHQi1lMLlbervvD4LaiYYjZuLpvHaP7jXUJfJ4vEmj6pCoN
	wb79UPBFIrIr5r6644NyqLxgOdnBorNjoJfZcVE4loE96uewkMGf
X-Gm-Gg: ASbGnctUilqxBLdujdqq5nMyNjpUO0wRAwjU0SMRz9SFUvkACDtzJSKkoLa2TnQoGVF
	Yb5Of6gZjeGGEqZb/W34PL3VF+HiGlnFDW/ix9VHS+aSQK9U3IdnXlqo3895IgwbSA98eghCSFn
	/GfdvsllbZbYxfTZsHEjLGUjwCA+lwZMBIBRYOmhEeXyh0UxYOPHAWr9UYK3Jm0PPEJzuA3QBWU
	wEp07x+uaSGFZjmWDnU12Y6du6VoKd/2QAgWiA53bboIrBpUbxUWA==
X-Google-Smtp-Source: AGHT+IEHO/RVujKLcNLhYrfFDhkXWDeR9oRQg4BpJPiccNDS1INSBcqwKihC5vNlKyjQfJo5u/i7Cw==
X-Received: by 2002:a05:6902:1542:b0:e20:25bb:7893 with SMTP id 3f1490d57ef6-e538c3f98cemr18892765276.46.1735275483105;
        Thu, 26 Dec 2024 20:58:03 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e928sm4398054276.17.2024.12.26.20.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 20:58:02 -0800 (PST)
Date: Thu, 26 Dec 2024 23:57:59 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 18/20] platform/x86: dell: Modify Makefile alignment
Message-ID: <rrkvtxufsi5jrpohcttt2lpqjl5a4kujh6gmy4c45pu6vyqtt3@meggfkpyozo3>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-19-kuurtb@gmail.com>
 <1ea940dc-7a75-4011-bcac-7f56a6960129@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ea940dc-7a75-4011-bcac-7f56a6960129@gmx.de>

On Fri, Dec 27, 2024 at 05:05:30AM +0100, Armin Wolf wrote:
> Am 21.12.24 um 06:59 schrieb Kurt Borja:
> 
> > Add one more TAB to each line to support upcoming changes.
> 
> Please merge this with patch 19.

I'm almost certain I read an email in the lists, in which a maintainer
asked these to be separate changes.

I have no problem with stashing them tho.

> 
> Thanks,
> Armin Wolf
> 
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/Makefile | 48 +++++++++++++++---------------
> >   1 file changed, 24 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> > index 03ba459f3d31..d5718ef34c48 100644
> > --- a/drivers/platform/x86/dell/Makefile
> > +++ b/drivers/platform/x86/dell/Makefile
> > @@ -4,27 +4,27 @@
> >   # Dell x86 Platform-Specific Drivers
> >   #
> > 
> > -obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
> > -alienware-wmi-objs			:= alienware-wmi-base.o
> > -alienware-wmi-y				+= alienware-wmi-legacy.o
> > -alienware-wmi-y				+= alienware-wmi-wmax.o
> > -obj-$(CONFIG_DCDBAS)			+= dcdbas.o
> > -obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
> > -obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
> > -obj-$(CONFIG_DELL_RBU)			+= dell_rbu.o
> > -obj-$(CONFIG_DELL_PC)			+= dell-pc.o
> > -obj-$(CONFIG_DELL_SMBIOS)		+= dell-smbios.o
> > -dell-smbios-objs			:= dell-smbios-base.o
> > -dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
> > -dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
> > -obj-$(CONFIG_DELL_SMO8800)		+= dell-smo8800.o
> > -obj-$(CONFIG_DELL_SMO8800)		+= dell-lis3lv02d.o
> > -obj-$(CONFIG_DELL_UART_BACKLIGHT)	+= dell-uart-backlight.o
> > -obj-$(CONFIG_DELL_WMI)			+= dell-wmi.o
> > -dell-wmi-objs				:= dell-wmi-base.o
> > -dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)	+= dell-wmi-privacy.o
> > -obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
> > -obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
> > -obj-$(CONFIG_DELL_WMI_DDV)		+= dell-wmi-ddv.o
> > -obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
> > -obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
> > +obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
> > +alienware-wmi-objs				:= alienware-wmi-base.o
> > +alienware-wmi-y					+= alienware-wmi-legacy.o
> > +alienware-wmi-y					+= alienware-wmi-wmax.o
> > +obj-$(CONFIG_DCDBAS)				+= dcdbas.o
> > +obj-$(CONFIG_DELL_LAPTOP)			+= dell-laptop.o
> > +obj-$(CONFIG_DELL_RBTN)				+= dell-rbtn.o
> > +obj-$(CONFIG_DELL_RBU)				+= dell_rbu.o
> > +obj-$(CONFIG_DELL_PC)				+= dell-pc.o
> > +obj-$(CONFIG_DELL_SMBIOS)			+= dell-smbios.o
> > +dell-smbios-objs				:= dell-smbios-base.o
> > +dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)		+= dell-smbios-wmi.o
> > +dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)		+= dell-smbios-smm.o
> > +obj-$(CONFIG_DELL_SMO8800)			+= dell-smo8800.o
> > +obj-$(CONFIG_DELL_SMO8800)			+= dell-lis3lv02d.o
> > +obj-$(CONFIG_DELL_UART_BACKLIGHT)		+= dell-uart-backlight.o
> > +obj-$(CONFIG_DELL_WMI)				+= dell-wmi.o
> > +dell-wmi-objs					:= dell-wmi-base.o
> > +dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)		+= dell-wmi-privacy.o
> > +obj-$(CONFIG_DELL_WMI_AIO)			+= dell-wmi-aio.o
> > +obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+= dell-wmi-descriptor.o
> > +obj-$(CONFIG_DELL_WMI_DDV)			+= dell-wmi-ddv.o
> > +obj-$(CONFIG_DELL_WMI_LED)			+= dell-wmi-led.o
> > +obj-$(CONFIG_DELL_WMI_SYSMAN)			+= dell-wmi-sysman/
