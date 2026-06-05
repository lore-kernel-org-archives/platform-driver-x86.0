Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDBA3368A0
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670917; cv=none; b=MpId9AyjTTfZYQRFx1dV0OtWAxEpSPiGJtgMzVb8vC4DPKdXeGynXcC/AQDz4Xexwk6Jb5WvhkkunSU2gyLaUm/zzb63kZIMUNUEuyBCIiouvVZxGIVW8iU7wZA4RR+qjMw9+8Pm71W3vLybLsSXTThtCFk9kg1bVG5OvKjchmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670917; c=relaxed/simple;
	bh=e5dPMhhFH2AfBllmXmaDlcMkzIqzpKi41QO0AFlgUus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iU68Ns6/Nk7OJJHGzZgbKHmVXlvGINQ+foNyI31AQGuOtWF/SAeX4nn8BKr6qfoIWFhN8/FT+AGN2qLmGYu4ghkhtdeu20l/N7EpdX6+fngY8+tobA32QcPer3JmSVakQJ/asZ+kwX6EGzFfh0EDDe7w+Ho7cH2XYW7yIxW3hLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3NBo46x; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3NBo46x"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8583b8fd89so1224067a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Jun 2026 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780670916; x=1781275716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJdsROLKIGDzDBo8Nuz1gajVC6OddtcytC0v3fEOu7c=;
        b=X3NBo46xEzjkTFl0tXcSB+f7S6IOkxpleiJfELHyGYNHfkmZTEr+AeEKCapOS9T3W2
         B8ju1CpapHnqZqu9jVhN8cctCtY29XH7uVZZlUwU+Mlum50y3agvtvaT4gLVwW7ZPEOa
         4++cnYTHU0e21Dzk9k5VXEaFMJv+oeTEgVj7/RGkOnRCwDwMTwI5o2uPUcdkJ+Fch13r
         rarEKMaOcRFVsaavXRqmBY3rDymSOH1+iVKw6njhylyp7Qv6P6qAfj9ytuOx/Clo4P3v
         GqMqG+1lXBeyntIvo5gzhHMS+03btAfvfMQ3meYkNj02U7EiJcsGLZFM/9Y6MPdeaylj
         V12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670916; x=1781275716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GJdsROLKIGDzDBo8Nuz1gajVC6OddtcytC0v3fEOu7c=;
        b=jPXM0UveLywoUMOlSORfm6CT/XO+DcKls7jliXJtPfcB0FjHHQjwU2nUF8LQzZDXVB
         Riq5KFZw4/OZzYbugHP4wrAf7mMfLTxP4v4nloMfHJvj5JyJgsTSOa0NUC1Rh23LkW1Y
         7VYCaUCAGNkh1CIuSOfpBVQxyjXhSjvSaTvNuhTeCwruIZPK6QrXhN+vxO5mXdG63NY/
         8biGj2Sus9zbGhpD8dwn/9aLc9TRMrzJBfpdSa8E8r8dTs6y4Cp+dsELwXmZjmciAICQ
         Z6IR5mg1lZ7KSb2nrYIrJGZNnne5akMjJcLTD5Kn+xsUwiiqYusqAgE05CAuR870RFce
         s/ww==
X-Gm-Message-State: AOJu0Yz9OdX50m1Iy8okUUIlevC1IO5EWWyEQ0zRh4I89Bz+/h9kigKA
	PmSFiXt3tln7Jd8fcvazTKdJjLC5dU5ZGvrCZeuAK+Zf5olHxh2kDL2g
X-Gm-Gg: Acq92OFi/oQ1ZparhqeRW+fWzYdmtNRm6KlbTK4XLOencxo82NBtRdwK9JM9yIPh5hj
	Z31YoiHptttHMi4DXTEqr58QIVGRUmHZEXPB3G1mToR2nF2P7ntzPAXnww9lQby3BgOfiFaxrqj
	szGN5Jh9PCvVbmjp8vsT8G/HKSt6ik+ep4rTQDP3Kwwl7qVETHmGGIWVIM85lOnLXPECIGgyszW
	QYXOQig1WAk+Krxw/4t3f9lJwhlcn10cvtuph0gndTptdmNmkcCvUuYFeF0L79aWgUOyd1Enm0a
	9vF6GAK+0yUqcFnLEHKCAXlm0Ug0F9oAX7AUr3iQ0MrvF6hrYFgwybSt4YRowHo7Zk7gQY9cDSL
	7yoxptYhsxZdnh4+BRcVMAiUzQpLhRGg5o8THi7K4d3ZHAxk2RbM/7nQJ3PCDtbRxywRYAyOjLT
	IXU8PmVRLWlBuEBmKot3+Gq0oo9WhhilvU3pS3AMO0RdNTSCm+D7PB55ahze0tYWFRrbpUcS1nP
	SXTW1pEXJsAIJJNZgmp8I2LL9s=
X-Received: by 2002:a05:6a00:10c4:b0:842:4982:81c with SMTP id d2e1a72fcca58-842b0d5d2e7mr3869942b3a.20.1780670915851;
        Fri, 05 Jun 2026 07:48:35 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428706fa9asm8969685b3a.45.2026.06.05.07.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:48:35 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Armandas Kvietkus <armundunelis@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Don't warn when fan curve method is unsupported
Date: Fri,  5 Jun 2026 23:48:31 +0900
Message-ID: <20260605144831.60839-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605045724.6907-1-sammiee5311@gmail.com>
References: <20260605045724.6907-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This duplicates an earlier patch by Armandas Kvietkus:

  https://lore.kernel.org/all/20260503174752.26288-1-armundunelis@gmail.com/

I missed it before sending, sorry for the noise. Ilpo already reviewed
that patch and suggested using pr_debug() instead, so please disregard
this patch.

Thanks,
HyeongJun
