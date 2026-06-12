Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99F12264A7;
	Fri, 12 Jun 2026 03:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781235488; cv=none; b=Vhesz0u5NVkKQNXNdS9BwdaSprU8NuB6OwfumQ6bNN69TaKb+vz6oOdW/R++aqjvMg5WdJ0sdwW8Whh1rbUbx4xe9is0IEM1PmMKdE6WjvTPLe+mkl16zWMzQd/pnXzYV7Z36uMMW3IV0OLJ1DwAVmKUf5LqCnI33s8cbKRNsLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781235488; c=relaxed/simple;
	bh=rvHL5oQtOTvznYnSGUf/8SeXFDFQRVwiB9ztX0IM0Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqrxbrABLuxTCAwD/Tlo4Z6NyDIy3FwxT+unFPmXE+OoGq4H1a/llda7N/Xr370lSLYoYlBnPmz0gWTn7Hu07ziHbRJNgDHka6lu+TqsKDwoUMFklD+7GpTH+LsXbf5/8AMZJSc6/QWECcVodUJKGC3Wgt7W8rddavcfCPvAbt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=dliJPAGe; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="dliJPAGe"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 82FEE40E0217;
	Fri, 12 Jun 2026 03:38:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RjVTGBa9Ysfm; Fri, 12 Jun 2026 03:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781235471; bh=TGq/VELUMGXRkcex9AR4XQIsNuWXHsFOeGODvs7zUJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dliJPAGeiKCwn/IX6auuYN7bx/nYjZdg1TnHPhVsSxKsW4AITdKHEG4nBBe+bob8m
	 Yu43BchSuFSn4rojg+X9dSNHqNHNEvJsS4eSWyr8WzOoTG+nJX8uXeser1QgPMjAmW
	 QGn4DqJ48+Ih02ydz6BzHQhThDhVt2+z1Z9UeKHmlhVwPShuW5NSMpDxdxMY6uBzss
	 v/uK2Tcsbb5OxOVw6qoFZPj5aSmdLYnAZH0pbVvulVRX7eJxQaSN1s5vmvh31gZMCW
	 if2aDZOn1ka9QZrwyr2dY5OhqRzentFS+Jt0pBs874+8Ey3FBIc2uzcuPuq5EiQILH
	 Sn7EU+8k/O7vzcvsrYVPuTU3Bfku2sb6AKeyOBl3TO0neqxDNOE2Dx3fn3yPmQ7boe
	 +AEsrobRvP238BYgJqMSXbGV9ViVJpZYVOM80qb3VwP58O6Rn9wasr8Iu/on9XJIwP
	 2HtA56Ulwr7JqNWiOIdtSWYbS/ZT2QnQ8ztkyjU68iPA/AMauca3KygggiuZE2x7os
	 x7zVXBpOCPpURB7XxnPaHikQRM1aawkNP4vxg0a4GZOIpStVFKs2YTbsamOhqpJeN8
	 kRBonRpUtd9jaa+ncAfaahvSHL9tiAQgNViYaSkOo2mlzm1CHk3viO+BePA5eXLjQt
	 u/HqWZ+bnLrCdCxBzHEp/V1Y=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 52E3740E0215;
	Fri, 12 Jun 2026 03:37:43 +0000 (UTC)
Date: Thu, 11 Jun 2026 20:37:39 -0700
From: Borislav Petkov <bp@alien8.de>
To: bugzilla-daemon@kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Bug 221437] New: asus-wmi: gpu_fan RPM reads 0 on M6500XV when
 dGPU has no driver (fan physically spinning)
Message-ID: <20260612033739.GFait_A1Re69ddPzzJ@fat_crate.local>
References: <bug-221437-6385@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bug-221437-6385@https.bugzilla.kernel.org/>

Forwarding to mail...

On Thu, Apr 30, 2026 at 01:39:35AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=221437
> 
>             Bug ID: 221437
>            Summary: asus-wmi: gpu_fan RPM reads 0 on M6500XV when dGPU has
>                     no driver (fan physically spinning)
>            Product: Platform Specific/Hardware
>            Version: 2.5
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: x86-64
>           Assignee: platform_x86_64@kernel-bugs.osdl.org
>           Reporter: nix.sasl@gmail.com
>         Regression: No
> 
> Summary of the issue:
> On ASUS Vivobook M6500XV with dGPU (RTX 4060) running without a driver
> (D3cold), the GPU fan physically spins under load but fan2_input always reads 0
> RPM. Writing to pwm2_enable fails with EIO.
> 
> Hardware:
> Product: Vivobook_ASUSLaptop M6500XV_M6500XV
> Board:   M6500XV
> BIOS:    M6500XV.309
> Kernel:  7.0.2-arch1-1
> linux-firmware-git: 20260429.56a13f98-1
> Relevant dmesg:
> asus_wmi: BIOS WMI version: 9.4
> asus_wmi: SFUN value: 0x21
> asus_wmi: fan_curve_get_factory_default (0x00110024) failed: -19
> asus_wmi: fan_curve_get_factory_default (0x00110025) failed: -19
> asus_wmi: fan_curve_get_factory_default (0x00110032) failed: -19
> 
> Findings:
> 
> fan2_input always 0 even when fan is physically spinning
> pwm2_enable node exists in sysfs but writes fail with EIO
> asus-ec-sensors rejects hardware with ENODEV
> ec_sys accessible but dump returns all zeros (interrupt-driven EC mode)
> dev_id reads 0x00000000
> 
> Expected behavior: fan2_input should report actual GPU fan RPM.
> 
> -- 
> You may reply to this email to add a comment.
> 
> You are receiving this mail because:
> You are watching the assignee of the bug.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
