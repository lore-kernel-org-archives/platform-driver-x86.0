Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B641C3F34
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940037; cv=none; b=IFfpAvai5Psb2Lpgb2ZU1pktuVaThNwAs5/bUNcL8axICD/GlDkABJO0BZr6NDjMCAuJF9lmi6LTURyboCZoFv9R1Liu4gyieMKFKBpaQJsoUjXvQl6967zoYdyp6x2YKxK5yKuVPcgElM86P0v9+SxDZUk9QO3qSa2PQx7Jabk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940037; c=relaxed/simple;
	bh=fiMQ1DPKZt2LWmJuFW2wtuHfk4/I6PZeqo5hxkn/bZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHY3Ykiv1DsOBIPQi1TUVOcWh825dLifIp0FhRW6CaXxwXTeU5Hf+L5gBZgkYV2GvNl3zgSjHOgTJGkRbAEJDYHBdiBVMMbONd8ytFrYxW2viy1l39YABgzTuoZDUn7AIjgtfuUF8T4w+4VfOtNRkGnHaSEryBzM5FbcNoQWVXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UlEMAvKp; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UlEMAvKp"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476b89782c3so79055961cf.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745940034; x=1746544834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RWbv5yzCOVANLY2CAT+CSRi7Gk+e2J+QjKpNE2bVG+4=;
        b=UlEMAvKpC1dll367GyLudfoGvWCk9xPsdN2IWpwJClKiGIKvP6+hHW01pTx+RZ88/w
         zX7F7YnBWgLg0FHZsaBwFNGAoj5TdXKUwFBv5EPBAt4puDjJ1rbBlR0C9USnP+pSMoux
         SUlQPzG87peK4jvgsRcslScadaIOtcRcD3IJWr5autbwrIfnBKb2pvwcVeSTe2p0dg35
         juFABPwkh9bas4TmE+9DrU2cRampomBdrFYz5w6DACBvw/n24gzqKHJ3RBeKJ8C8TeZC
         XXaexs1Mmeifn9sq+/AXMGCL3zTyUjire5Hh4P0zKFbzB5jzbtJYqCpHQL+NWvyf7/PG
         aoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745940034; x=1746544834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWbv5yzCOVANLY2CAT+CSRi7Gk+e2J+QjKpNE2bVG+4=;
        b=lW9zbPAUceGsrvVUOLUX9zv8gHW+wdhDYkEWW/72N7sa45NQOHi2vnnyztYxv+R9Uo
         B4G1s4kPcEFCO4USHQfjlH9VKRPw5wfq8meT+o2uW0rbX8SbUSBBMhjFaMPPNsAd99xb
         MVZVjY2+M4bbQaLNUV0UJM3UVXP3mR8nmj4tC61G4/SagVXi4s0rRdhW8bnW6YbeC/i3
         0KA2XXoeqy4zUt5/YhBdBjXVmWXYcPSiFnijmwNvT0IJ3JJFFNPtonbEFndHdfRMx3fs
         5lhWg+cFj2qWEQ1/RQRYdoMr13atBWjo6gPJelPSmUZfdohzFHKSmqBK29rAFfCVexeV
         bnzg==
X-Forwarded-Encrypted: i=1; AJvYcCV/m8M6MfkasE78PIBAcAxmE+QcTSAcoyIiv+Nmbuvnw9VBMCC0a/BaBXWaZ1TDIJmAI1MoGyxdAXE7ZnhodURay5hj@vger.kernel.org
X-Gm-Message-State: AOJu0YypOmrGt8+22Qrv2b3MCe3i97W2Cm/AAKeFM4jijU14umVQU4lt
	HmEbCH5xuGf+5rMLwjQaiQPR/08IOkEPhEMTM0OVQFq263UbWoQ4RIJseFrPIrrlEFHaS8IyIIj
	/
X-Gm-Gg: ASbGnctMt0dwVMGSg/aVI6LQDFmDSfzwx4zZGsGo0bV+ZAHSKxj6CurNgF1pORiNsfe
	cCLLBDudYlIgtbKhMpxk/Vhii2eX3+oP8BGDJoRAb9LT0Q2Ljkv5HORDnFyIWued3giZR53JUGv
	HdU3jwx0qaIWKYiQy8ZR7on3XzTWv+aYA6LicazLHdwstIp9S6I/gTdqJJ3HXvTv+E5cJE7pX1g
	BahawfiYzgnQTxRRo71fuJoD5+I4EGkv0Y/uLsNeKHVRKuqx/Ls4W2LwkdHEaJvuuE/u+0cNbfh
	oWu1pAUcyg+uXZ6pRPrjqanWxGnXdSz937c6C1wTZnim8OCkHj5UR3fFwYqpYPWfNfbBuapuFYo
	Jy3bPtxafFsxDg+ViZvsWK4VSfgGVOZtXDQ==
X-Google-Smtp-Source: AGHT+IFYrzbUr2tysTWUWraoqV7yNCquxNAGGUC5SnHa7Nb/jAKBb4j/viE2kVUpOipT5TxDHkk5pQ==
X-Received: by 2002:a05:622a:4184:b0:474:f97d:51c7 with SMTP id d75a77b69052e-488656735b3mr65068331cf.14.1745940034454;
        Tue, 29 Apr 2025 08:20:34 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73d63sm73157016d6.86.2025.04.29.08.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 08:20:34 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:20:32 -0400
From: Gregory Price <gourry@gourry.net>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Suma Hegde <suma.hegde@amd.com>, Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v2] platform/x86/amd/hsmp: Make amd_hsmp and hsmp_acpi as
 mutually exclusive drivers
Message-ID: <aBDuQDsugOylYa56@gourry-fedora-PF4VCD3F>
References: <20250425102357.266790-1-suma.hegde@amd.com>
 <b5e59360-0990-104a-f87c-6acd20dd6b74@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5e59360-0990-104a-f87c-6acd20dd6b74@linux.intel.com>

On Tue, Apr 29, 2025 at 05:35:24PM +0300, Ilpo Järvinen wrote:
> On Fri, 25 Apr 2025, Suma Hegde wrote:
> 
> > amd_hsmp and hsmp_acpi are intended to be mutually exclusive drivers and
> > amd_hsmp is for legacy platforms. To achieve this, it is essential to
> > check for the presence of the ACPI device in plat.c. If the hsmp ACPI
> > device entry is found, allow the hsmp_acpi driver to manage the hsmp
> > and return an error from plat.c.
> > 
> > Additionally, rename the driver from amd_hsmp to hsmp_acpi to prevent
> > "Driver 'amd_hsmp' is already registered, aborting..." error in case
> > both drivers are loaded simultaneously.
> 
> This rename has userspace visible impact through sysfs, no? I'm just 
> wondering what's the expected fallout once this patch goes to stable 
> kernels?
> 

I suppose the real question there is whether these should actually be
different drivers, as opposed to backends for a single front-end. In
which case, some of the split work previously would need to be reworked.

~Gregory
