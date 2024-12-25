Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D341DA21;
	Wed, 25 Dec 2024 20:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735159008; cv=none; b=fly2AQJZej0WCqNdN3GdwX1iW4QzKfclf0pRpJCDMwgnC7t7aX2qvr6qpShyibCcZVC+8oXDVQ/rGdcEU45qTO61TaAWZIXN9vGNU3ZopKFC58TG1rjbriWxIHZk4GMJuNMvOk6cwlSOOgvnOHCjbKP8ed7WRwIdH3NrE8wMpM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735159008; c=relaxed/simple;
	bh=NvdY4eAqwSedZTcGtcTpJdDjRKDe4xJ3RxzFVwmjk6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FD5HVqCZ9p7eW8e4ZYJh8n5Y21N0P2fIOjkFl0/n82G4dwrotg/kk175RvzOyuefoupjS5V1/Rq6V61RG+iCLfQqx8d3r4K1lzNn9cL1AQpdMP0s5AcU9rIsDPa+yZbD0GZMIQ9tN4vFTD5rRFnExiDl7QBikRMNG4QU3PR0frc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HP1Lr8fs; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HP1Lr8fs"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e479e529ebcso5639259276.3;
        Wed, 25 Dec 2024 12:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735159006; x=1735763806; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A7Bm7T2HPELM28oNd3NoQAGIueqyuQAnfW8bW1Ft5Vo=;
        b=HP1Lr8fsmObiXwlHtOypXYihhzAEwOEnucUe6LEDUQ5xzl+tYa/XWfbO3ObKRNl7hx
         60zAin/MmZH2r1emFSzAU5YQ+1SziGu0d3G4jYei5cJo7pPFXBtFUM2HexDvWZb8SR4U
         QnsA874/R+U1RRy6UeyWg7lToeY+y2aZYXFs0EgYUpMRLlMnwdNMTSikxPUVkDWfMGx5
         9WF3Xf7ZMK0qdmnBLcbNf33T/04lrjLa3VMpH0W9wYNmSeAZCygmdNQU86yjaDpFV5Xj
         VKxohtFfDzn16vpNVLUJoaZLdERPwChRjhh3R72VNiIPIPHd5NrDUEO8+o2Ss0tYt4Kk
         xcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735159006; x=1735763806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A7Bm7T2HPELM28oNd3NoQAGIueqyuQAnfW8bW1Ft5Vo=;
        b=sBPvtVPbpWV4YfG3s3pnDnCd9QaEcFIizsZH62B17J2FhSFC95pr6WhXOBiy4ixSp2
         sIEqH1lIBDb6+UaOpzEmbqv4RlD4tBaQbZVlDlgJul+IjYqNVRLWC55TavDXGFB162vf
         dncmVafQVoTTSw9GCbEEyHU1PU1HobpNzgkMkydZBitF6KABetUiE3i2Abmtqu9EBQht
         D75IUsctmvF57XI3woIRQHWjGAgf70k/0Gmg8eRi4fKWnacED/+XbuOt+jlhdPU5Mcn+
         Rg+tzwYPqcVnxYmp+m0QKYZIofT+knpCyidlNGpXgD5Iaxt4nwIn2Qxamak2kposu5J9
         GVgA==
X-Forwarded-Encrypted: i=1; AJvYcCXS9tV2gWx5oPAiX+GG/60WEPq8zRytWsRHAE6h3TraidqgU3qEon5DIr+8u3/EK/miDx7Qj9haU8n7hg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRXaPwlgzCtLDg8ujbXs6M3ACM0ewQlVFfVhIBkeHEelyQRHTv
	aV4oKvbEVACzdaRKrvSFNvXffqxJDlusIcmqnmvc+Czfzm10T2xZ
X-Gm-Gg: ASbGncvfg9B0ByXGjWNhb9hPW8y2A3SIUylKfDst6SCnQl6QHJIx+rs3NJtOpWd3ppe
	q6/yb+Zv/hXNKeQRq2sPEffV9JkoCuRiKCOZ52jOCn9065CTkH8mwOe1cOxz617jpAPVMou1QtD
	NO9hauqQYVqhu/YXVFTLKTHa3MkjDahklCB69pZHz2mD/RNUpUa7tG3Vizp2UqOrNxE2n0U7UvI
	UpDsOZcP/EyprqyD+DweytOZ9kuxkQ8Wm4n7BehbpxEOa/MlXlbGg==
X-Google-Smtp-Source: AGHT+IFT/ONuxPMD048F6dUG3DLfuwWWncdWy3rWnx21afLHAh98YaUgaGIslWhwXOit75mP+AsmKw==
X-Received: by 2002:a25:5803:0:b0:e4d:89e9:6a7f with SMTP id 3f1490d57ef6-e538c41ab61mr11140044276.50.1735159005718;
        Wed, 25 Dec 2024 12:36:45 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc7336bsm3590273276.25.2024.12.25.12.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 12:36:44 -0800 (PST)
Date: Wed, 25 Dec 2024 15:36:42 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 00/20] alienware-wmi driver rework
Message-ID: <q57x6dxz5u4vgdhgnowcaxdwczlfam43rf2pwqhvtis665iudf@hrq6d5glx5os>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <66005d6f-e47e-4799-b90e-48751bff52fc@gmx.de>
 <d2251554-593e-4830-895a-d4c0317589a0@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2251554-593e-4830-895a-d4c0317589a0@gmx.de>

On Wed, Dec 25, 2024 at 09:25:35PM +0100, Armin Wolf wrote:
> Am 23.12.24 um 00:06 schrieb Armin Wolf:
> 
> > Am 21.12.24 um 06:58 schrieb Kurt Borja:
> > 
> > > Hi :)
> > > 
> > > Hopefully these series are quite complete now. Your feedback is much
> > > appreciated!
> > > 
> > > Previous discussions:
> > > 
> > > [1]
> > > https://lore.kernel.org/platform-driver-x86/6m66cuivkzhcsvpjv4nunjyddqhr42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb/
> > > [2]
> > > https://lore.kernel.org/platform-driver-x86/20241205002733.2183537-3-kuurtb@gmail.com/
> > > 
> > > Comments
> > > ========
> > > 
> > > Patches 14 and 20 are proposals. Feel free to NACK them.
> > > 
> > > ~ Kurt
> > 
> > Nice work, i will take a close look at those patches tomorrow.
> > 
> > Thanks,
> > Armin Wolf
> > 
> It seems that i overestimated my time schedule during the Christmas holidays, sorry.
> I will try to review those patches till new year.

Thanks, no worries :) Happy holidays!

~ Kurt

> 
> Thanks,
> Armin Wolf
> 
> > > 
> > > ---
> > > Changes since RFC:
> > >   - Incorporated comments from Ilpo which include style and organization
> > >     issues
> > >   - Instead of splitting functionallity blocks, split WMI drivers
> > > (Due to
> > >     Armin's comments)
> > >   - Replaced most of the patches near the end because of the above
> > > change
> > >   - Some patches were squashed into eachother where it made sense
> > >   - Rebased on top of recent platform_profile changes!
> > > 
> > > Kurt Borja (20):
> > >    alienware-wmi: Remove unnecessary check at module exit
> > >    alienware-wmi: Move Lighting Control State
> > >    alienware-wmi: Modify parse_rgb() signature
> > >    alienware-wmi: Improve hdmi_mux, amplifier and deepslp group creation
> > >    alienware-wmi: Improve rgb-zones group creation
> > >    alienware_wmi: Clean variable declaration in thermal methods
> > >    alienware-wmi: Add a state container for LED control feature
> > >    alienware-wmi: Add WMI Drivers
> > >    alienware-wmi: Add a state container for thermal control methods
> > >    alienware-wmi: Refactor LED control methods
> > >    alienware-wmi: Refactor hdmi, amplifier, deepslp methods
> > >    alienware-wmi: Refactor thermal control methods
> > >    alienware-wmi: Split DMI table
> > >    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
> > >    platform/x86: Rename alienware-wmi.c
> > >    platform/x86: Add alienware-wmi.h
> > >    platform-x86: Split the alienware-wmi driver
> > >    platform/x86: dell: Modify Makefile alignment
> > >    platform/x86: Update alienware-wmi config entries
> > >    alienware-wmi: Update header and module information
> > > 
> > >   MAINTAINERS                                   |    4 +-
> > >   drivers/platform/x86/dell/Kconfig             |   30 +-
> > >   drivers/platform/x86/dell/Makefile            |   45 +-
> > >   .../platform/x86/dell/alienware-wmi-base.c    |  721 ++++++++++
> > >   .../platform/x86/dell/alienware-wmi-legacy.c  |   89 ++
> > >   .../platform/x86/dell/alienware-wmi-wmax.c    |  526 +++++++
> > >   drivers/platform/x86/dell/alienware-wmi.c     | 1269 -----------------
> > >   drivers/platform/x86/dell/alienware-wmi.h     |  103 ++
> > >   8 files changed, 1491 insertions(+), 1296 deletions(-)
> > >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
> > >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
> > >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
> > >   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
> > >   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
> > > 
> > 
