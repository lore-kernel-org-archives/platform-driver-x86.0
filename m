Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433725;
	b=0RyxkhrDeig6Cram+ef3x6meXdraF9XVwxWrpVgc4+18VFWEpOiH22Fe7Ji8bzilmi3c
	 JNCVApCYA/M4G5D76GfiKwUq7bvTvsCMVllnsovrmbHfnsXH17i7K33z76xLWc/RIhLGM
	 U8jSRhHHcBAMuchH61gyQoGZdCAiVAUoZVHSJFtUQG8oUZJeCLrZTStzptSe4Jt+KzUwZ
	 IFt0LTfpdlf+jnVO4KoRt2bfQAMX4T46kIHUzpAQgyAg1URoh/t0wuicaVxRD1TkXtYwQ
	 CHsebF9i8/YI1Wc0/rnme4ArgLa5k/NhBJo+78f82NRluZmvNstI1arnwsoZr+Mv1bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KqvT//ywRZvyN5aUarjR+h8osuwosZKu+ejEl3vYsLU=;
	b=Peih0aMZXu9Atc4iWPVcdlmtK5zAI2ONB1j4kuYdXAJo0Ur3nzfJQFNQwiDhLJsW/vju
	 J9OMSbJzo433y559ey/xZl8lcgaUyNZeLbteNyUsQ91UwOAnFH72W1XcDp67BfPoDhPDA
	 USAEOZZy6u80GKeYHnXKepAiTG47l3+dZerag+nlKbz21YzklRjjilrdM3wHRHVzYtUkY
	 d6bBcBmnFKjzoO3GFI7rCL95rD25P2esmgJ51r28O2k7ZtCUbmIFYhtexhxOs36Twm4sm
	 bWHFh1fTegFoOchGtplJlCgowRg4lbrU0ZPYG+etd8XTEpSeHhAZPlnZHERAsuhlL2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ake94c02;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE78606A326
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 21:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE78606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ake94c02
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so2054882a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433724; x=1795038524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KqvT//ywRZvyN5aUarjR+h8osuwosZKu+ejEl3vYsLU=;
        b=ake94c025Pcg8BInjOErVqxBlmWTqqVgqg2H4GFWuVtFOV/VA8AOF5EBhpeakZxZqM
         giPzK+C4b4BCW0QcvuFW+11krFPw8NRmt2qHNei4AJA+wEGJxHcLoCbUetZYQN0+RQEQ
         auoNJD0qDQ1224vXtoxj4YIhPRw3Lwz6jbl+AmvKRfENbmldxiMBKhxW4swAovAv91d5
         xBs1BjwShouGoiwRJcn4uqBK8DGCmnrpCbNWOh8ohmFQSP5pQ7p3KJU5OqgwSdRBgKTm
         AGTXCghXyc0r2OUchoSUzlmzorZbSOFkVWhPW6QPwyDlfQU2bB7OREnhzMFMXYii55Dv
         YgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433724; x=1795038524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KqvT//ywRZvyN5aUarjR+h8osuwosZKu+ejEl3vYsLU=;
        b=0PPNxX9lco54UWp/U1XtuIjoyvSk+8AZTnypeY6rOC1bMYWcNsMkCJHxbK01m01cff
         0WlfHzMOLxhUPTHi6QhcnVO7Q9cNn5/xLeFBzxJe+YaBBzdXMiYczEt3T5335dZz+rk4
         O4BMDbWObE4eP16gq/+6JuZfB9TSEeY8PhrFop1X9iTyQ7rvHbV5lmKgnilbD+yd9yrN
         zFK0XQlzoJPU/FESRw5Q7Yz5j65uQuLAuIDDssxLAk9nBTKXbkav9rx4c4dI7MobmYrn
         wtzZiVC96IC3tljeBijlFiG5GI5Qy9GlxgwnYqmE1rQ3cGywRm7683SPLrF4Ggbcm/UI
         WVtQ==
X-Forwarded-Encrypted: i=1; AL+hErE6DS4ec53ZQbZuH3JLDZCx8uZOdBDsa+0OykfvXFkEDwBQLayOcv2iHk3GnbyJclL07z6lE4/DO9f1LFJgAi8RDEIS@vger.kernel.org
X-Gm-Message-State: APuU4Z/iAeEmxb4JrHCF3AuIQDAkfT1pIVMIVMTIk/8MJvc1nCsXYUjH
	XHMOLY/PT7YK9e9M7UgDttRKBcBO07wTlrml3zu9uVXQ11yCo/pAFfxj
X-Gm-Gg: AYBFou3XMzzip363BN0HB1D577RJseqnJhgr/VsfX0Vf4+Wu3fbQLNSTWdmIbYHAiuD
	e2p+vpQ3hGhlk7wBVx0Out1AUM2tlkJ4dBApf+PSCYUr5+yP8rSoW5WIKmVjInk2yM3NTddHP5C
	3D6qw1Dye1NShoE9uZ9o9512lexqoROOoz0XzeOts2AU8LvBxwNBxoRcPeT8E8ljDAny4VaQgVx
	pHI2V/RLq+xfC5rBYtjQ9CgDfXecv2LKNe7PBHhsYTN5e9oJ8FzqmCBocE8ZR5jTuBJCR/59p43
	VK2o2Q4mkqBQsGGWXC2PW6vI3yBtSQPBWUnvZI5+eW9NePxNpqlnAHQE94G7xROCE+9Ov/XuT33
	FvBRLRpL8ZOiOBfuEcqmxwVx9lBUMYVpXsdpziDczthbzBHCp/MElKBsbzFbyNCZrDGq86j+XcT
	vxmrqxywjT0dQsVYYr9E1rtNnDbe++k4UWqbB6emUW75nz1psw70KXtXscL76gRbY0NA4kYMfy6
	WcIA0efQ0vxTAgzZKr8bJ6JiHRsdxH5qP5+emPpIRDNn6AT/OHG7AOtsChgDTbmxOgaxXJTFLhl
	vEz/MqNaGwVLrbFRN2l6MWsktrTADIREhF+w7ubprBbIRPFTRHZyx/Ntq2ZtTqw0mKBa5fYnlJ+
	a4NY4H6YYnJiUJ6eDIPAp47URHqXxsphFY40iZYGzwPObVFzToMXn8jb/rCkHz7P2Qz22Bup69g
	i4mZRypuvQuRfGRvCkF5sgiIo=
X-Received: by 2002:a17:90b:2649:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b182f235c3mr3064154a91.33.1794433724406;
        Wed, 11 Nov 2026 13:48:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182de1dafsm2754761a91.3.2026.11.11.13.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:48:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] platform/x86: dell_rbu: make usable
Date: Wed, 11 Nov 2026 13:48:24 -0800
Message-ID: <20261111214826.6577-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First commit updates the API to one not disabled by default on many distros.

Second commit fixes upload of firmware more than 4MB in size, which is most
modern ones,

Rosen Penev (2):
  platform/x86: dell_rbu: Use the firmware upload API
  platform/x86: dell_rbu: Allocate large monolithic images contiguously

 Documentation/admin-guide/dell_rbu.rst |  25 ++--
 drivers/platform/x86/dell/Kconfig      |   2 +-
 drivers/platform/x86/dell/dell_rbu.c   | 161 ++++++++++++++++++-------
 3 files changed, 131 insertions(+), 57 deletions(-)

-- 
2.56.1

