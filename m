Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540307;
	b=IUdfTtke3ACTrVHvcroYE0sDlIhN1tqxz9ahawXFbiUQbEgC5H0rAaRn1MfizUrERKzF
	 nTwC21a3eFoBRdO5c0fbqInoMQbsQllbMMZ8q9qqZLEnrpTHraEdT0k0iN4NprVDhmOth
	 kxNDOseIb8bdX7Rh1sv3BfAIbxzUJu7EPLEH59fXgqOZAWAh9tb6s++iF0TtTVBECD0CA
	 sdEHWzs2N4B+PuNm4DSNLAa7Xkpq40PCpiVph1LViADItu+4pHPbSbQZEU0xEvhaiV+MU
	 hwGcsjmtIx2A+7BLa4pTzeW7dzwx19jcpe/2yQVHrb9JcZsnCAtZovUwKl4o3alN/VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ijcnsg3rlqY0tuQKo+fPFV0fN+EvRT1DffY9jaRZoeE=;
	b=a1cnMiLDmHxSg0ARxyDEkkByAJvkwTNFgjyXXX14KoE0w14NAW8LxaddVg+nm79EQhqI
	 PhehJETvtbOy/pXN4MJQFLRl8kF3RvWLIavoZAsuJ5oKW75ezEGt3sc1pcxJro51mjXb8
	 nKZMJ+uplV0Yz7tzXw7jL/8dV1ZIi9ZllSMqrFwuUb/yPPqOv8bhXVfvG4FfizCbqUZzz
	 mSbK9N6DF0lNHbdpbro4mInKc109PEv3Qgll0vY4IRGkD8D5JNOfE5RwOAxVrVz6RWbGw
	 Eu8uP8wP/2SG0QCMeb/1CVPAz0V5ngluBDnZXKzAlvHwE+BO+rjbeJ5OZMwK1FWGsUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fepyxWRg;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C20606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 23:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C20606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fepyxWRg
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eaa1b5b84aso186728e0c.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 16:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540306; x=1793145106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ijcnsg3rlqY0tuQKo+fPFV0fN+EvRT1DffY9jaRZoeE=;
        b=fepyxWRgJcSdVl6zjdX6AmtGxYkz+a9yM9MW2XFX8lVagULItZJyVBsM3QX+e3dOKZ
         AmUAzMrU3FDN49gvwuvc0zqNFSOjXrftQBKKd+LtrwJLTmlvWMzog3xVdPUxpzOqTbwU
         XEXRf9PoGLbyLix6wibqY7PG9bYppYfT9DsWxtC0TGeUUw8/ugbtWG8fDXtl8HLJ8TsO
         4pKrUvMXm7ZC2hisqIqUarbKgy5uQd6rMVFRUVxY5zekcYnO3TE1bM6YCX5NHLdmAaj5
         7dQJdSmRIgjNVlmR8toWT7xh2ShbXOVsdCUzkoBptfnWCh/sx8DE/XeX2CetjRkOT+he
         oIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540306; x=1793145106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ijcnsg3rlqY0tuQKo+fPFV0fN+EvRT1DffY9jaRZoeE=;
        b=scBSow6RStGOU5XSn8LAgZaZq2bqHN2U5gN3QNQIgyTfPPorWqdt6MY5knJBobKWRH
         qZfd4/d7bA9Dfu8bMbEHzN/NZRU1AKr4QnWVcvDOVTfoTLxk3XRgulR3th+fmo3bRyA1
         BP1HQWYZyN+Vak5YR5YFl92Mt2EvWD5tEPakMFynTzxzePrCD+MdEeqrg71UetTWtbhi
         lJQ4JYFwuvU6zauZYj7TwbvqlfDQrzu2+E/6B0kQTXAw8G58KNq56sqwuV+K8gPBjJt6
         5ZU0D6/ersRcdvfYQjn9AnbCKeq+oCJ0nnSLSmdHVCCRYfOylCdLWylFpenXsnlICWZP
         CfEg==
X-Gm-Message-State: AFq9FYLsM5HyrwguuCCt0RiPajjLi7apb4F5dRkdzU9Awg0U99a3IbgQ
	Z4tfo0pzfAQCjadTo9/dm2GcBkuRL4iyTOLNkX0maeS6+2j6qSYA5LKsBOX0J5yQ
X-Gm-Gg: AYBFou19Jl0fiKjg6v2E1m794ASPGmzUpYhPRetxzFnG8zX3PjWbZ1/lnknV/rNhfD+
	BVtmtTiAXTNL+HqmhnmHZj21N6MfBlyAOWdrGyDfMvoNCcMSC5/+O/av6oNSeEfYPW1iI5e4nYz
	Vh+f2HZRg4eUEMyctZgptPnJto36R2OeXMIciDHCjOYCcc6VUHwV3lRYv0aFmZbFcYaIOAiCmJ4
	0bSHKYky02EZYfEeAgRFdqcMgulMWp1YJGj+A3HAncMLJcXsFYhDm9woJ2AOOu9IkdxaBZpUVoR
	pAvIQeCDakr6JK9sEJ6RJFMRLAMUsPuVSl+L8KD2YSIr00zkqEkGx9a519jRppS6pu407Id7xmM
	qE4DTw6s9uP6AUp4j+Af8JmBRWZ1F4VYC36FxqW+3KCh0bXBqyWyZ2doF/kOMi9KumFCJRdfOUu
	d9bM3KrB5HWMYBEAXMuO0GIg6CYpma4JF2hsbglM9uj6mCMc2DXuOPz3MAqm5OZ6/x/B2sCifiQ
	h9LwhBHFfoGzbuv/JASYbpbxAPCclqoI12CRQ==
X-Received: by 2002:a05:6122:8f8d:b0:5ea:c984:5ad4 with SMTP id 71dfb90a1353d-5eaebc1b88cmr122893e0c.2.1792540306067;
        Tue, 20 Oct 2026 16:51:46 -0700 (PDT)
Received: from tutebook.tail57d09c.ts.net ([2803:9800:a0a8:8014:618c:a663:bfd0:635e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae983a9aesm1172772e0c.16.2026.10.20.16.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:51:45 -0700 (PDT)
From: TuteMthCD <matias.civadda2342001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	chris@miget.com,
	TuteMthCD <matias.civadda2342001@gmail.com>
Subject: [PATCH v3 0/2] platform/x86: bitland-mifs-wmi: Fix TM2107 profile handling
Date: Tue, 20 Oct 2026 20:49:25 -0300
Message-ID: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series fixes platform profile handling on the TIMI Redmi Book Pro 14
2022 (TM2107), using the quirks infrastructure from Mingyou Chen's v12
series:

https://lore.kernel.org/all/20261012133648.132363-1-qby140326@gmail.com/

Both patches apply on top of all six patches of that series. The first
fixes the response payload copy size, as pointed out by Chris. The second
adds the TM2107 profile mapping and response-layout quirks.

Changes in v3:
- Rebase onto Mingyou Chen's complete v12 series.
- Reuse the existing quirks infrastructure instead of introducing
  separate response handling and profile tables.
- Add the payload copy fix as a separate patch.

Tested profile switching on physical TM2107 hardware.

This is my first submission using a dependent patch series.
Please let me know if I missed anything.

TuteMthCD (2):
  platform/x86: bitland-mifs-wmi: Fix response payload copy size
  platform/x86: bitland-mifs-wmi: Fix TM2107 profile handling

 drivers/platform/x86/bitland-mifs-wmi.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)


-- 
2.56.0

