Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC952332904
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766050381; cv=none; b=Qo2qvgUPcsrYtdW2OzEhUl+R7PSy6eKYociwbyGww+68S1Xkv9Ji2t4BxoSvstNP9r3CY9k3qS6SkXApIrNUu+c425jZvvc595LuPMxOs4LCmTmrm/gl2ERIHad2gkx4x0csgXcIwJ69q6QA2XFncelstuk1OUtQk1qbhQsgHnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766050381; c=relaxed/simple;
	bh=ETCrNGhrxoZWlEiQq//UovDI5PS60LbxoY3w67jEZnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDu9t/DWWWlJ+88ytVj3LTmgze5ZiGD7Pz54gq8+9m2K6Pl7YDZJ2EEbh9FXrwXS+ydpiNk1Aj9Yb9zANsLYcP0xoyjShlLQiMXBeIjJB8rEBO0uCXa/vls/u1ozT80uZlAIjwcpJg98abuGmOT+oVjB2Kfsu2rS42UFnehtsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDk5ICXS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDk5ICXS"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29f0f875bc5so5931515ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 01:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766050379; x=1766655179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ETCrNGhrxoZWlEiQq//UovDI5PS60LbxoY3w67jEZnU=;
        b=BDk5ICXSmHe4Svy42NdepFw1Ufczlhyl9Fp8GyoRuQ16Q43r1SwksZS3dqGrxtUdex
         7TPt4k3tg1wnjzKLN1y3ouuq2u/pfB7UPNJ8nIf9pDzskVAFxpiL5wnsSCOhQNH7HKJi
         TI8DWMvyLf7vp2tnLybhnCL/JXP4e7WHVvlAK7XC57TD3Et0bIgwZ0LISqrDUnYz0nDr
         EmESklnh0KypK+brRkUbwO8ZYvZRm8qCMMCX3NjL8KkUqjIS0ETra/AGxtmh2kk9EcYA
         yx0HwPRCmi6vcqpqJpYopu3xxQC1JW6IzcaE6KIkskWDJ4cQeKmHOHEq/Zi9a77PSBVE
         xLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766050379; x=1766655179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETCrNGhrxoZWlEiQq//UovDI5PS60LbxoY3w67jEZnU=;
        b=fQn2QRJgqI777jB2sFfcx+4vqR6v7MRfEhVhJq6DifHDevHjoiKmYThfpXur69Emi1
         y0kfqCmo2VzkbztSs7XuXPjUrQGM2NHHE3tQg35KYXZBFrwXpLOBn+qwpMz0H4/pPXKb
         yJUzzfQnGA1k0BbCGT02uV4Tyj5QaH/5OinVeWf8tKWzeNxsVpicGHUGOwWrUZDV4YtK
         ZvgoXe/xxlKr9/hYcjySlEDrfphH3sH+mR6Jrwi18kZt6/QVpRBEuK+zmYeWxE7/cniT
         M/IO/YSJYW1HrvJuW7/RD3+97PwFJNAR1DPuxwJgJqMhC36YdqPv40rCL53l11d1QPGg
         NlWA==
X-Gm-Message-State: AOJu0Yzvw4Vb6jQtGpEi+YXZ46nvH5jrbVPBx0aIbFUEKMXXR86NWA+A
	ka+h2g+OUOTG2vc+gD/ZJGpyOCeDbk9ay0RRbs4dXQsrPYewm9itwbMR
X-Gm-Gg: AY/fxX6Sz4avzX/Mthfqk6M2pYiy8fwWhGzrTShBL90/jyMjXTRVfQYJp6rvrJPhwpI
	1OvbBHz0OjinpcfK+gWC1auNOnRUpNyhSn4XkaUHEBnT5BlZ577jvZGC0JqBvCzqdq7cTpTK1Zq
	39hdTaley8NK0244kh71sOc0Ic2PmmSTajkaQVeFU3ONw1JNylIQiioNuT0erUrLssWM+GYZWpZ
	Lt47axG5+BLuzVq94ZnYMCZMrwP1P2p2Ue2ARqFjepH4NXz7VxIJWnPInf3hyu81n7AFk6eAcxk
	MnsgPGCnVH93918RA3qoV5hxEkBxOOJC8YStITkF4UIeBhoEgjajFKArLTMRgZsUNH+YRhO+1K7
	PKSq8M5S6+Z4PiCiK5WAbVomWXS0KFvAmShuppkIb1BCXLObjdjowVlQEWA2MlzMtMlRjSh5M/e
	nEL0IgbjPmEwBpwd+fwieW73ASR53W9A==
X-Google-Smtp-Source: AGHT+IGUlt8EUB9iVAa9EhM2ZyTZvNoC8tcqhtVFDqWsSb/Z9C3ToMopUY+592RbQr3gO3ABU9cl6w==
X-Received: by 2002:a17:902:ef44:b0:2a0:a9f8:48f7 with SMTP id d9443c01a7336-2a0a9f849f9mr172303795ad.55.1766050379142;
        Thu, 18 Dec 2025 01:32:59 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d0888fbdsm19609675ad.32.2025.12.18.01.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 01:32:58 -0800 (PST)
Date: Thu, 18 Dec 2025 15:02:50 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, 
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: Re: [PATCH v3 0/2] Fix Omen 16-wf1xxx thermal profile and add EC
 readback
Message-ID: <aUPIztp4uffvYmc3@archlinux>
References: <20251218082629.567911-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20251218082629.567911-1-krishna.chomal108@gmail.com>

Hi,

Please ignore this v3 series. I have identified a logic issue which
causes hp_wmi to fail to load, the first time after boot. I will send
the fix for v4 soon.

Thanks and apologies for the noise.
