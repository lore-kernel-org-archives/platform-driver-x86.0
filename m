Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369993;
	b=jg7+2npTHQg+XklZQAvgWg6stLR9Yn5vc69HkJlmbWKVlV/uhbl8TddZQN+X6sFJvGL3
	 jNTfF9hhECiMdTakeuD6dwv/nItwlgB9VLr4MshrbPEOGymXGezj3vjAwdooCGBxW219R
	 H5uYgGUHabjyys9js/h9YxDMtbM6KsepbHSBG3rAxsZcFmOcWJgFgn5IY+bJm1w5zg0a0
	 AFI6mwNbiyZ2ZakH2/q3ql4l1n9WyWx9H83lwRHN28oS+XBI8kinl8AZbOXl+Pct3Nqnj
	 zAT+vXGEaJeFA+UpqQKylxiWzkRINwEGt/VLHJP/AQ+bB/XpfwqGFasUohnjDEjgPhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p9fPZ+LCiHt3/sVO4bGMi7Aql+oiaX1TL5wqWCNtlyU=;
	b=l5mVRNT1cSJmy/kzh8RmbHQ7DCNcoN123tCHFloIBXr3e14vuiFpHHTU8ZD0zDavwwD1
	 PsRbbjeiGqFn7mIF4Htj81wexaH/KfFoutL1c80OJ2qRKiwY1z3Vr9vSTgOsMNeGQ28mX
	 VU4R1Wo0hs7Xe/NZz2F/RVW4U+rFvehvyRmCYcreztlG4S2u/wYnNTV6BlIFeb79/t8q0
	 X0jI+1Wjcq9DfZx5RFYdqhWahHuRdM4D7Fx9r5El0+YDVkp4LzCpv3Um2Q1Z8/LAHDiIP
	 rU7jtJUsfENAD4SrTRbubpsKMZDQ49QO/5s8ozc50i02qmEv4vG43DCTFjoQgWoDnMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTyj+OT4;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A1F606A31A
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 14:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTyj+OT4
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-18cdcfc05ffso971510c88.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793369993; x=1793974793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9fPZ+LCiHt3/sVO4bGMi7Aql+oiaX1TL5wqWCNtlyU=;
        b=mTyj+OT4IlkRSTys635A2QOK6ljyq58pMszpmMXXL/5kt3PAWGL7IbqarqtQwBW3Xw
         aAxDbV51hJHcm5ZlqENE8XbTwhwDv7S5g9H49TojZ5Joxa7fyb+aiHEYNwLtSr9tQb2x
         KRM7PH+qQp4/vk0XlrrXHzdcYp9xsofoPW8cnt6l9BIv+jQSMqwsIImJlQzM99jdNylK
         siCgqoXeqy45LSxU/Dc17AjXkRbu93/FtcEjxpUQQgpSUG+Ev5z2Pf3ExpG6XCluJ1kE
         KUdKI4ki5ewj1xGfHuDs5pgTH5iyg2liYTALX0Ei0lCEV7l9ujDs/dI8kW+zdSm9u6fH
         QcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369993; x=1793974793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9fPZ+LCiHt3/sVO4bGMi7Aql+oiaX1TL5wqWCNtlyU=;
        b=db2Ye/JX3SEEAzcGUBVYI/9lfFY6v+hLYgVjiKRpxdkLQ4brGWVGYuyqW437mOud+o
         0HRdEygJ3OfM5fSDIJqROXZo9UHLaQ9jHcJ38rS+A+f/h5hDRueBmFh2OclWO3A8ZkpL
         rm0kn6g+TlwjGMxzCUUdxZ+jyLGjUfjy0JOy+wGnYDuPstoGRS0RKEC1ymf/aMV9N3ZE
         kV6IOyf/4oskbeq9xrQtn5xTirM9X6XvFlPNvvtp5UeBv1OYlWHZNq0FvEXAx1Ks8ApR
         KMyKhB5ytvY21L43XTY0r/emHgPswWeB7JPKco1QgvRHw4Bn4kANdKMXezqfr6nNE1eI
         E2+g==
X-Forwarded-Encrypted: i=1; AKwUvBxohRZ/t0yQbysp1aLH/msQrN3jec77uRUBCN7B306Ahy1EqgC8MfyQ5gwOENM3UCtaoYUc19fNbmocgUOvGuaPWDkf@vger.kernel.org
X-Gm-Message-State: AFq9FYL9HeUU/vPMuzkEkJmCmzthjJEEl5ajtvs+DiUmkUPlePyPw+9O
	ikt2EFAI/sw7EF6vVDR7C3FZcyk4MIVmvH3doRv2yA3uUdnXPoPyECHJ
X-Gm-Gg: AYBFou1mY/CG0Qt3flxCrMMa5YNC8BfoEind4S8LgUUJ6D9foxNEHCHB395W4qfwuVD
	HuPrNcsGrDdoiuWwLwXZchi2uMP7VVX7nzQGTyzNP3MEcvvqLrKOnlfgRqXbPb1oEkOxk6WGSir
	s6CpwzDgOV0lWtuSgX3n9/8o3ga6e4lSqEI3lf/kRTKk28GzsRsxT1IUkZgExNA5MAvAC7Hf02A
	XtzPRhPjHXf0lw2Llic3goBi7eFZ6BSz2SSOgCoxZxu3JTJTHUndyZsnUVBDTzuOTKpRIUUpwiZ
	oRZ8B2DXi9PQ/Tnf4J/APa2JvY7G8+9hWYjipswr4lIfy8Q5B4pmXpG+Tpfn2ssV2FFtJ5BMXaV
	xhNP/vhzqAnagDos2Svamie6u4Why5U/T0mUKzNgdnCfzhnGW2i8RgwWJL/1V1s0tOqIjoLXsf1
	jMlN7I+4IIv0NeBGPoMRniw0QW9wCunHSzGA1a/ePOeblBweelDuOSRLByBbDxkQSZe9T4mMjJ7
	bxTtweTbq+o+NKbXbAFDF/R/dj/Qa7qLgnJBmCVnkVtaoPBnPFleW47NdvOLjb7GBNB+yLFD8IF
	8HyJkIFg92yLEIuY/nEZ/fLHq3FdeabBP0ukrfBfFsDb+PowAD8YI4cIX2yX2Yq4R/+IaOlaaOD
	2yAlUDsiijYVMZw==
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr3267265c88.26.1793369992492;
        Fri, 30 Oct 2026 07:19:52 -0700 (PDT)
Received: from chitransh.. ([2401:4900:94f3:523c:2656:c517:2c59:5ecc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm12667871c88.10.2026.10.30.07.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:19:52 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: Re: [PATCH v4 0/2] platform/x86: dell-uart-backlight: handle stray EC byte in responses
Date: Fri, 30 Oct 2026 19:49:20 +0530
Message-ID: <20261030141920.310681-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017073704.606497-1-chitranshmandhaniya@gmail.com>
References: <20261017073704.606497-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Hi Ilpo,

Hope you are doing well.  Just a friendly follow-up on this series
at your convenience.  Please let me know if there is anything I
should revise.

Thanks,
Chitransh
---
