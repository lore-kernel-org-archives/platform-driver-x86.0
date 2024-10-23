Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A1D15ECDF
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 08:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672619; cv=none; b=QMsMN71cakjZ6vpG7N97mkq8DGu23YMaw55LKJ1wofUwzygragGOq/fYgqCyiQvdURknY8X3mN2plnHTABjb1M9O0WWzNyp4iBcfB3xaNFsbuWcxbWsP44y/6CRlz7dUmFygfWu7JWviTGdq6L/l7bUmkkdidLDmDULr6x8MLzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672619; c=relaxed/simple;
	bh=3Bu1KXEDCF3c3c5kulhmDYB2gdDiQ5wwcgs8n6YN+Zw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tmF7C1m0dF9yW+zmrFrWPHYhhDa4s2NYcCFbEL7m6pSxuYmOmNyr8PWTshZUX1CTS90cAKqZkfhkn2/ztmOCSSDwBXcAZam2h6nF+K9JeVkLpA6P+SZjuEjE/0beL3ZtQog0lWmrI89X4CQ6/tQQv96/71XgrcvwqW44K4gRouI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eR932j7I; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eR932j7I"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so5026814f8f.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 01:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729672616; x=1730277416; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Bu1KXEDCF3c3c5kulhmDYB2gdDiQ5wwcgs8n6YN+Zw=;
        b=eR932j7I7FysGOFLLNYwRXliGAra2pCWceHteFue+dhnqeh+uNJJPDtN/Yf//2dN3F
         iui2AWjXNbwSIjVrO7U2IDFQulF/aSPOj+u1f+AZACaU5epeesj7eC4jh3+AptXnpbCK
         kJLHjGFjTP9ud3PaqkgA5xLrhp9SpsupyTP0KMk4KRw8Js6N7GRWGfqf/xI3tB6RQQOn
         Wu/6YmRmipirGdecsc3NNJfB6tF2YVpycxByXP5a0IYgjVbgyGnZQC70dDBAy46s60XZ
         O5/RLzfncQmmvav94i0p9nkgXZxybmb3edeSPwcnllNla+rWPEiFimWyqqtZnNjScepV
         g1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672616; x=1730277416;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Bu1KXEDCF3c3c5kulhmDYB2gdDiQ5wwcgs8n6YN+Zw=;
        b=DGiTJMN2i/VY7TdiaRmlPZaKPciEwSjopPvCGE0mYLZG5RUKjHJYWYPBMGwK17nMCk
         9sR46YMHUN8wPbpqC/8/Xk9hqJXnVL8pj7UE8nN0o5pV0Wf36tkTtGnZSL5mAR3lKjuF
         bGIEROBCjeCOQqf3aoFj765yXORFmWWJ9OHcVdIEVVrOen04RdkPr7tSO6C2ecUjnnhj
         Cj284mZDdoGNbpP2y6EIdrYboj8BcwKclS0oKkqRtMKMXvjbJfkArz0Tb/0pqH/c6AmS
         mH9VOYh4b5B8cbbtnmWMQlOmnPmOzKOCxgU8av+ojpXDxvcd7azjr02nP2hcjMlWx0h4
         mnNA==
X-Gm-Message-State: AOJu0YyTTtkedsIjYYdL6jSOVS1uz7S3F674j7YZkxEGfvw1dWQ35S17
	mvtupPE+2Dr8bKOOdtNuR/kIArzzzHbCPehCCcgONUj136mB7jXYBS0ZwMUPemZEExrCynpGVWx
	AIZ7oF7oEbHO1Ct89evQVDIB8GXHFacor
X-Google-Smtp-Source: AGHT+IE2rrQrQVgALVNR1xB5917O3cxU6YjQw9OagvFulRmNTMekCat2l2R3tZFSEMn+yYJYcsPdPkVcwg7usamiUas=
X-Received: by 2002:a5d:4ec9:0:b0:37d:4cd6:6f2b with SMTP id
 ffacd0b85a97d-37efcf0c694mr1090784f8f.14.1729672615553; Wed, 23 Oct 2024
 01:36:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mischa Baars <mjbaars1977.backup@gmail.com>
Date: Wed, 23 Oct 2024 10:36:44 +0200
Message-ID: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
Subject: amdgpu 4k@120Hz / HDMI 2.1
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I recently purchased a new television that is capable of 4k@120Hz
resolution and refresh rate, but when connected with the proper cables
to an AMD Radeon RX 6500 XT that does support HDMI 2.1, the maximum
resolution and refresh rate I get is 4k@60Hz.

I've 'spoken' to AMD about this, and all they do is recommend
switching to Red Hat / Suse / Ubuntu and using the official closed
source AMD drivers. If it is supposed to work after that, remains
unclear.

Did someone get the desired 4k@120Hz / HDMI 2.1 resolution and refresh
rate to work using the in-kernel amdgpu driver? If not, why does it
not work or when will it work? I have other vendors with other
hardware that have different restraints on the number of operating
systems that I can use, and they do not go well together.

Kind regards,
Michael J. Baars, the Netherlands.
