Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089775;
	b=JjmSCC/455jRQ/MfCOhRDXK0pxeGINI/pi88eUK5e5/sXtBQ/LbJbw3SCxnCMLaWwiJo
	 nny9BQx6LkgGLCJSp6bDwrhdjzu+PFLdyaEpdGpF+XX+8NsCFV3aAfkbqI+QFr4J9Su20
	 eYP3d+5et1BcneWgg3mxZc5PFNMdV/2E75ry/kB8eU/3fNO6QmDyn+yOyikKjqmZqEDLu
	 C9qCGN9MqAGgA7QSoXHXQ5kPtzpSIgyJyUl7v56/Nl90c2liU1R6/GHY1aYDo6Of6btml
	 wr62Mdl2eTYqLZNrvFaW56G1gmi8d6jkBaMST1JYqbwTsPHDuOv4CbH520pST40YN0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MGzHH13ZWFaAze8jomr5kn6NEKQkF5IKK+VbX0oc3KM=;
	b=ej8f6LmvnDa4k0rxnJf3fh1I0geIX4tneEqKnTfa3hD551B3J9bBy/Arayj4JjB4W/ph
	 RxrYIarlgZkhG+4SRZNRud8j9964CCIflK9gGtVz696ssTt1+9A8qR377Dw81A9V2czsY
	 assIHEhYHo7FhNBd0Slvp5CcwzfnlfAj0JI1eRgHhkiU9GXFWTmO1PoF7L76w1KUjf3QE
	 L/cfPqWIC9B6daexsS/rtsmSdi/hGNf0K0XGSJWHjIpNjGLCjwFbYgqYUiyeM2tqRb5RG
	 o3ZMM1v0TXa+tncvS4HfMbk67M2lwWrdbzecPvPFx6DznXgODOnUhbiN2VbUVSTh4Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UfpuVEy5;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA41C606A31F
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 08:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA41C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UfpuVEy5
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35d0be18c71so904862eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793089774; x=1793694574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGzHH13ZWFaAze8jomr5kn6NEKQkF5IKK+VbX0oc3KM=;
        b=UfpuVEy5veyu7vgwxb5ILNxC7fDxcHBEy9NAS0QZtpUfc9NKoNx9N92KGbm8ljPN5p
         6B4ZWPtqtXoCo4As62q9vysEjY1yGXImUkkdvr0rrv649HBeJLo5zIj/BQoDNws3rYwV
         kWGL6ZVM/cJN5Eyywyvsy2jQAwMqHdw4yV6r+xsST+4TLBkZTgU3GfFkJKgxumU3P8yQ
         2pdteBDfSYWRmIyfHkgdGY5MX+fKQ4/LvsGuN5l9iYg7iy9N9jcf4iRqT/iyx7WVoroJ
         ZRdJpYpMGgHIR7+pt8EMnM4UpfnFgcgwrJeHS7hUJaISQmYniNvrK4MZpzG6EYiiZxJ5
         Ce+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089774; x=1793694574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGzHH13ZWFaAze8jomr5kn6NEKQkF5IKK+VbX0oc3KM=;
        b=e5s7zmPnPi1z6iJQchUC/W3ouVesCfX1aNGo2rUTJd6SiLPsJbFHJSMpKsuGaigBDp
         8F4cyPUGkZYcQ7yzDU5NqQrwUy3r1ODo6G3XCUUDYeAF9Hwdteg8dgpw1SkRTGitin2L
         HHaL+WyP03jouuznMmAf+wy5BunbTclMUKgWVvl0PxTcp8XR2J/XH4yvdXwN+dR4frzg
         iViIeEh9o04E5zzO6iX2Hd2qI9TZuJgC263phT8f4xAMwXMPaLtekNSKFhKMQ2ND+A7q
         Fn105OnjjnURoTcTZSOnTqS0QFC15fhYFH11DWJwQqhPGV7r4vwZqxx5cEczIpPNHLg2
         p2zw==
X-Forwarded-Encrypted: i=1; AKwUvBzUHNHYAcsVRsIlRyBDQ+L3UeKkVuf/uB6TB9nioilwaFh3VgRSSHwKm2a8huUM0eTIsG6omyG3S5UxZgK+aAuetjgv@vger.kernel.org
X-Gm-Message-State: AFq9FYLAD0kntjTSxh3ELddJwm3A/1EhkKiFABBfeHQII/RIKdeMXqoC
	vkzhfkQ1UTfYD+Kc6Xag01tL0whSzxqZs5LSX7/Xac5MLO8BZxbR5gA=
X-Gm-Gg: AYBFou3IZQaWzKD8gRKnfxYTgHl3WEF380Rj+ta7n9FQ9+I0JLUlhjhxdtl3MPyI9k9
	VNwSsNoTWbel0V10f5N50CvnBNBG1K3a1/T0bXXi8R5Je7ipNuJCe3B2x300UUPl9k/Pb6l7D+V
	5a14mUmRGqfvtWBMSxv3FYsyDrhE+8T4eClpB/CwtwiPqJFkp0Omepw2pObqzk724VUnD4JYcFh
	25Sf0FFyT1nkeGKWyTP6tuEuPvHgKXHLjWklYBhC3WFVTb9OdVorszC19wT8bOn1x31Zv96RCWP
	Vf3ax/jyS/nqnHIg6k88qdSfE4EV8Oxq3kNL7j7OE/YpHArwhuS/6j50iTXrUt8ts3bpJ2VAP0i
	GL7QjJn+PYP8lVACeUI/x4qcD0CWcJ5EQPo4CHwg2RjWLKpcD6Sj9kgqtP496erE0sasfdVv+4d
	d98FoKL9h+wI/FX0NtmXVahFYbCv+jtlnjtM7z8KP/GnB4GBIGj3e7NKlQZsSEu+v9/mTBtpeUq
	NgY4g2rnAvjgHMVfrzPZCYai15lzXBK08PI5gATmjkGCmA63UcY2haPMMfp5XAn9iqP+SAE0dLT
	4payfcYoF0Nb
X-Received: by 2002:a05:7022:eb51:10b0:144:eb3f:563a with SMTP id a92af1059eb24-1a3c84c3867mr2805885c88.15.1793089773456;
        Tue, 27 Oct 2026 01:29:33 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.26.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm43895151eec.19.2026.10.27.01.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:29:32 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: alexdeucher@gmail.com
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	christian.koenig@amd.com,
	dave.hansen@linux.intel.com,
	dev@deq.rocks,
	dri-devel@lists.freedesktop.org,
	hansg@kernel.org,
	harry.wentland@amd.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	kenneth.feng@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mingo@redhat.com,
	platform-driver-x86@vger.kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 10/13] drm/amdgpu: Catch register access while GMUX keeps the GPU off
Date: Tue, 27 Oct 2026 04:29:13 -0400
Message-ID: <20261027082913.8002-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_O2tEUHOcbiKL8c4UHpy3AmOWtmM7A8o3jP2qLwkx2jUQ@mail.gmail.com>
References: <CADnq5_O2tEUHOcbiKL8c4UHpy3AmOWtmM7A8o3jP2qLwkx2jUQ@mail.gmail.com>
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

> You can drop this.  Nothing about this is GMUX specific.

I agree, but there needs to be another variable. Using pm_runtime_suspended
or using any other pm function will not work, as amdgpu_pmops_runtime_resume
also requires hardware access and even though hardware is accessable by then
pm core will show that its runtime suspended.

