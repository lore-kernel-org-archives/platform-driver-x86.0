Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C7D273D68
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Aug 2025 03:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756263956; cv=none; b=B+6jNYHfKa/9SmI1ia+8u8V49H2+vefgVxaWK1LkLx7wMwxcst1EsxQC/1qGmZvBoREZ60CSGPzCDvWtF5946oZNesH5S7vD9dJR3x3gEKaq0e+FPP4FELw8TQ8rBnJCPvWEnAetIStn5gp4ro8FHq2UJ90z326BADHjF6rO3RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756263956; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uehysOl3f0EkElJ8m/Lx55D5SiVb2y0FMtd0ZZfVC/9kccFXmyPb4wKDtrmirwmmUsVutOK/0zyr44MNWhvdS4N5NsIZRyld1HCaVSZy6RPS6SDcvE5MvvRSZ2tnBqk6uVBtWTesPwLrhr9CmVTHfdXjnE4S7ZJr70C2egfgCcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQ1yyaEj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQ1yyaEj"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2465cb0e81bso29997665ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Aug 2025 20:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756263953; x=1756868753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=jQ1yyaEj6uaZwSgu4dlDt8ZgPF8XTRBkFq4smnfvlp7ytCM03C2BRUu+elpKQ6DI2Y
         pqT6vQSeihSTVVdxAS/gXeMCH4L7yH4F3EtRPHLcx0YSYVVs203ac+uvVBH/cQ/vARQZ
         3wqmsLlcOlxtFix8w6Yb3K6HMImLFiWHbywPyr7re5feq1HdzX6aHirGaaSO50mCfsXI
         /3r+/iCIOL2+Kd+WqvElzMHZ0RDNnTMCecS2wIyaSyeaUsT4n/jdLm6gok8nZEx+OPQG
         RxsqDrR1IgB/Ynim0GcZDAazblA4BndlbppX2B63kkCuSoIzqT6qXjXDNjrZfXmoaFBI
         1cvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756263953; x=1756868753;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=rPC8wi2DDmTzBUP13Iva8a0juO9gBzck1PJLyRo6yR+kmjnqEmd9c+ewwxpjOOmhL1
         7UTqbe6xMD2osN3GbvQhxIyEx6WOR3sG87YFCMjFF80rAFFSacYFGYWRChDZQodVS2nV
         MxKG10THA3FD+baOtPmF3OHJmMmFBP3lOuLyIdr4QKI7RzGwu2bDd8M5egjOnN5A2YKt
         Gwp279PIw/QBlw1slFDwtmni0avwgb/kPMGynG0+COpFzWtfey7cMxJYvxPIMA+Ydygl
         qDtdbjZbdqvwTnS93QzUkqeLqfw9FGy4sKh2TZ/6Dr661GTmdaPJjqOSe1LNZ7xufth0
         1P/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwO/w7ZpGynGaMVfsjHthyHN5g9G20Zp74SCLhG1O9DtBPgtOb0tus+/crlDTI0Y88ejTM50go7bhHVrqwBZJN0uGg@vger.kernel.org
X-Gm-Message-State: AOJu0YwVr5fP7gSnrhXNXhJicyegUXj7AsidihpeEnR6IbvZF2GBoQ8O
	646mXZUPsSRkjD/764Tg1dWek8GbTz/hCfq+hyZov6PEbEb5m5MvGDq+
X-Gm-Gg: ASbGncvgfUWHIKVx6ZKJOyxz174fuyXcn9FBduJB4ohy8z9u87UgvMriVfqk6BWIrcC
	0u+ocPkfQomeIichDGVWTT/FTXP+9yMoqib7Dvb1Q3QkYNNly3Y5FX5MsT/rKFB8M/XIe9q6XKS
	EyUT6fxjfEM4dSo7U8VqS4d0C59hC9tN5NSiA1hufvdyC7re3wqOPAfnSBbSqQagtjb+Qteaf6B
	lXpZmbkmyi72RxpEQN7cxIMkuKlGqNvlG7Y0Wz4Ox848GDg5YC9WBtZV3w7IzZteamIDtHzRetL
	0gpP03Lr+iEje68M2lvY+g5h8lvQRrqkemzsLEtfbtyi2f5pwbLKcHI8IntFLdaBvWGt0i5XNxB
	VXMAVpMde+ANJm0Mr5VRhjIAYinHSVc8=
X-Google-Smtp-Source: AGHT+IFR55A6ksZyBz4FR41Szg/qxRchZQ1DXlRDcsoBRYQCIQ/2Nsu0CQ3lVMJhhsm7ofKhW80nHA==
X-Received: by 2002:a17:902:f611:b0:246:60d4:8708 with SMTP id d9443c01a7336-24660d4883amr224790385ad.49.1756263952937;
        Tue, 26 Aug 2025 20:05:52 -0700 (PDT)
Received: from nowy-laptop ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2487928c46dsm24555485ad.68.2025.08.26.20.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 20:05:52 -0700 (PDT)
Date: Wed, 27 Aug 2025 12:05:49 +0900
From: SungHwan Jung <onenowy@gmail.com>
To: lynne@bune.city
Cc: W_Armin@gmx.de, platform-driver-x86@vger.kernel.org
Subject: Re: PROBLEM: acer-wmi driver fails to initialise with Linux kernel
 >6.14
Message-ID: <dpojcqi5dsuxswhjnc46zorbb32n7cm4y24eyinnek3dl5noun@qej5nqcsky5f>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <290b8e1a-1d7d-48a3-a8e2-0cba711f6848@bune.city>

