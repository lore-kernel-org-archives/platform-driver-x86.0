Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF437464
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Aug 2025 03:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756265398; cv=none; b=t2pGworTLtbehC27PncfSwhlusquqmB7Rd/+a3HcpHzOO4AJHudJyuTstpyeti3OoXD4bbEduJRKCSH4W1C+PldPU+RF2E5zrJsGtO9q1QpQaIvMtEfb893FjmxCpBPTHUMzNB3TtOPwFFYSwV7wf+dx6nuP+sGZkHQrJN71Vog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756265398; c=relaxed/simple;
	bh=DJYZ9TjBVzAUvdAanuIsrRfpLYewga3iPjAAuEtDJRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=o5c+rX4j1rHt6Q8LD6vCsIixF1bzxqxeoP8ee2N85+2AzvkBVFSerrV1qK7NMwckshvHuF3tnEypLBUhTOWh3TNER7SY1gcin58UBV9eHGX5ULCULYetZsMggUaOUfryNTZIt7nGbxTQ6mws325mVtqBSVx0u0VVd62eOC+uMzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zu3P63J3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zu3P63J3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-246d8e25f51so20988625ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Aug 2025 20:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756265396; x=1756870196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0I7ZYSajwtsZUN3YsQ/1hmOB05BML8R1PlMcsy+HPxM=;
        b=Zu3P63J3w4Hn4d+Nlr9c6EupO8LF+66/nx9GWfJLKrfLCr+UrKPB+x5ddhaO7ET92V
         EDz9xCBl50ELKQtOMdVIDRKHUaI7sSKd2LOOlYMiuAMMuyWgWNjShtmqNLD8P2X0SKh9
         Wi6Gf7lWkRf7QJmeZ5dGj/CgHlfamLCjXa/QjYFuyD55LfdH7DN8YoVxKE1eAA20iFHB
         gkL7jKLNwt698YuknTqAr5AhvU0182mGMzmlphPidcv89LrfGaGnu2Xil7wF5rbsWxWl
         EBdiaNP9S+lFPVMTVe6KJB+pAp+kioPT1/CQUVxP4Z36ZAiKIikiKZtXWndQLNJol7/2
         oaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756265396; x=1756870196;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0I7ZYSajwtsZUN3YsQ/1hmOB05BML8R1PlMcsy+HPxM=;
        b=ti4TrmfDBWvl4XJJIPOAIxji35wFYAcb7Qj+hIJ9pX4bcxVvRVrtkySAbn48ybfxaC
         7S25dJhqQCDzMKB3KwoMbzy28RSTLbB4Ihc97SiywCQxZlQ5/cUZ92it2CIIF8bzLHKM
         +CLGT0VWHMcy1aNWT5eHnDW7D98E5f5foQix3xtcnd3aPvLDf/3M+Z6o6xgfm1TpU3MQ
         TnxI7GFASbatG6WW6y3p3kaQFfuQDSG/odmAba/v6SN4BTogXOzof4vrZXlGzQ8sqCsU
         kwfCaHWjY8rnVpzogwRv4Cpx/jI57mnitOvWoNLewKBZGKdqCCJSeNJ2pG8koPpcJc+6
         dFTw==
X-Forwarded-Encrypted: i=1; AJvYcCWPeTndeINyBkPLK4fc0yhE1Qsyas9WTZYpvfqNllENl+9qBbZxZ8iyD8mNrWnbDF4Xkqyg0xXCxPR0CifSsJCqErXM@vger.kernel.org
X-Gm-Message-State: AOJu0YwmLWASRsCNo1WgK9YiqHE+W7LVb5qp46nxDwaHL9tuyLKbmjPE
	pyJ7nR/A0UW3SkVL987eSuQAjYYZuVfSFOU1OXzce2XglSsLJFUziXEv
X-Gm-Gg: ASbGncucHjjXIQEcf8DLZ46iK8VysEvhCU+IsBZ3vYXti+uUgmFNLTrsMmWfWW2EOP6
	Bn3iiaOX5T4+UAO0cqTcsTZBUDBHt83KHEHxZilOM35kwKC5GZO8FFjzt3rCMXFpx7nCME0UGoN
	Jn+LFXamNMl2LJllTq5GtPIdwP+CKNKygMJIMovC9NP0xQxwsNImrLo4SioHmV27Masr89+Pw6n
	s70sw+o/FNgo8NTTjoVDErOpWNv+YgngCq2zYSqaDaErIcAZuW4T1g7wn8iaH3SimxEuFe0d18f
	SYRMOY2z8+3zqky/H6jwc+gfmcIgznZld+/ZxBQe/4OPNPeEIJRDsDM/i/+vi4A3D/2KAUzkNEw
	frcwdEqu/fy2khUtSjd35N0sWfH4Qrb4=
X-Google-Smtp-Source: AGHT+IFOHvLqI1x4EFNUeKe41QxxkYINCXO2JBJFxNFcpIhQU5Vk+vFpX5hbzAc5GnqCtGsHRGPRWA==
X-Received: by 2002:a17:902:fc4b:b0:246:76ed:e25d with SMTP id d9443c01a7336-24676edecf2mr181446805ad.50.1756265396497;
        Tue, 26 Aug 2025 20:29:56 -0700 (PDT)
Received: from nowy-laptop ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246e1b6fae5sm64319245ad.140.2025.08.26.20.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 20:29:56 -0700 (PDT)
Date: Wed, 27 Aug 2025 12:29:52 +0900
From: SungHwan Jung <onenowy@gmail.com>
To: lynne@bune.city
Cc: W_Armin@gmx.de, platform-driver-x86@vger.kernel.org
Subject: Re: PROBLEM: acer-wmi driver fails to initialise with Linux kernel
 >6.14
Message-ID: <pyvalwtuobljjedr7e6xn2attiazy6m7ks4uv3zz5zumwsowag@yvkdhmdtgzvb>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <290b8e1a-1d7d-48a3-a8e2-0cba711f6848@bune.city>

The same issue also occurs on other distributions (Arch Linux, Ubuntu), but it 
does not happen frequently. In most cases, it can be resolved by manually 
reloading the acer_wmi module or by applying a delayed load after some time. 
However, on Fedora, once the issue occurs, manually reloading the module does 
not resolve it. In fact, even when it is working normally, manually reloading 
the module causes it to stop working again. (This does not happen on other 
distributions.) Could you test this on the latest live image of another 
distribution?
