Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A4937E2E8
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2026 20:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011653; cv=none; b=HgPlM9q7g/N2uTpCmltm51M+6E7+vFYQ7AHtjU9ESRvUt851gQc0xxLqvWWXGIxdND7jYucgyqeLKcEGZrsn13uBxytw7k5ahb/YaiN9FHPlDERLWJ2RQAc+xS15NggRym4kYEiWhMKoCqeSsmZet869nYnl8k+w3hX7fAGIrrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011653; c=relaxed/simple;
	bh=72OHu7enNqcJFfpBOsKNgC5fc40GMPq9oSc/T3JEAVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkdzmNJCYP5wQb0Q5opNTp2wVVyCUJ2QPf4WQ2k6iNZ1oLDdnHu70itUHtSjZ/F2flt9v0ldH6e8gBQrcSkpLraELcZt1YfDvXWVEa7VgXWNvGmta41J1viM7KlsKE5beUyCG2msgP9b+aqJdxatDEOPFd9i91eHp/Q8MofvhoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYo0wYzc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYo0wYzc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aae4d2d215so3992405ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2026 13:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778011651; x=1778616451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZMEaIxTwwgj3zyVbxHfeuR77dvZtji4RLCiRmy4JEA=;
        b=pYo0wYzcUgdfp2dMrhUrritbC7OF+K2w3WXeYMtk4b69N1QsW91yVPf8RBHaIvKWxC
         nSM2zNz1sfhc4olvDkSC/lMOl6MA0jmtoCtHgjZBz/L/Yr3Lt+QCYEdhA81KTiadOAeQ
         ynSpsP9/8398xYy70xBryUsdLW1I8crA5lkpuS3+AejUeJ6uN+ycnLYfMGHFIlrwHj/a
         NQMFgRsDb5L6eO55Esp6cTDKnAYnXD1F7I1h8wws+N4G+iTB6KuxyqLgRTyT02PsWquf
         rmhR1HSII5uy0wL3dFHXZybTLBKcjgvxPNC+LK+jsB2+Ks7cMhYO1Q0rYuuwwd+Ypayh
         L8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011651; x=1778616451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FZMEaIxTwwgj3zyVbxHfeuR77dvZtji4RLCiRmy4JEA=;
        b=Ut2ahilhF0GP5rmTVKmiPQLv8lw0y83Px5M8dVVZUq6q1mYHm4S25l85lZSMe37WvN
         W70AZlLQPynbwNZzYYNOmCtmUlfje0/ebgEw9HSsYirqOrQmYvxW+WlaaLWRcOwa+WUa
         o3UD1MtslWSCjUWd016hP1PMvvM4j1NFiT77IIzJYnGixe1RRCQF3xebACrm6vB0cxwt
         JU6VgclUtFsA1mn23ieelSM2ABG1af5TPxc2lNfjemhQux843TLeFUHbSeM7CPkPDiNI
         D1COCrGpZ5xK/0Jjo/V8lQniyZkpIQndHzWROkulwB1KhJxb1sJCi0/HMri1ny/g50qm
         zkMw==
X-Gm-Message-State: AOJu0Yzqw2pdomi2+XSQmWUj2MpKp1yQU2DVOFoec1yDCtTWbw1ayV+0
	aK9UOiaX0eXoBe31DrccOi+5URaezm/+r5CWDZtMAhtfW7CJ+nrB99mJ
X-Gm-Gg: AeBDiesVRg+tzs10yXO9t5NDtsJS3U60e4KChN2tbwpUpCmXiZn12Sv/gEfpqrPzhgC
	PsqvtozzBM+sO6PaNPo0b+T5znaD7lNrFmBQbjYQKqBuhoGoiVVhcSRetBASZkQhcQqQGX1lRm/
	TK0C9dJ28dVpuZvq+Dkzc1Rssc2iUzslGRyI1Omtusqjvjaii2TQYBUsgZn4cT21nD2ib4xkTkG
	bk7IVZ0UsMwB4pnaOYDydx2UTSUCBqEMg6kAQ1aybgNKptCKWjmctb+5vULvEAWsP4vc29r3/O5
	YsLRLMlVDzZ+z6QwnmUc6YOb8Gf6Szw1le2sKj4uUfRuzWNe+xbDW3sc4lX6DdOTF5JdKf9S1zV
	Gc3wlQv+tCVT4VXMbv43GrdiDhtoqS06Yz4huotoNYscOeNTlBs7rzvm+vaRKxhYZm9WKRUEQRD
	Y5PegXsEcmlItuDGcB1KTc0qrDfpVi/lPxyQDiwuTp
X-Received: by 2002:a17:903:1a2f:b0:2b9:42a3:6013 with SMTP id d9443c01a7336-2ba7afccfa5mr1584845ad.1.1778011651275;
        Tue, 05 May 2026 13:07:31 -0700 (PDT)
Received: from magniquick ([45.112.148.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca37a5esm659045ad.81.2026.05.05.13.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:07:30 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jorge Lopez <jorge.lopez2@hp.com>
Subject: Re: [RFC] HP laptop charge mode control via POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR
Date: Wed,  6 May 2026 01:37:24 +0530
Message-ID: <20260505200724.158389-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <abfc9469-5d47-4e83-8c3c-03138f1b2ade@kernel.org>
References: <20260427140857.397971-1-navonjohnlukose@gmail.com> <abfc9469-5d47-4e83-8c3c-03138f1b2ade@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I sent the hp-wmi implementation RFC as a standalone thread by mistake
instead of replying here.

The submitted patch is:

  Subject: [RFC PATCH] platform/x86: hp-wmi: Add charge behaviour support
  Message-ID: <20260505200222.157144-1-navonjohnlukose@gmail.com>

Sorry for splitting the discussion. I should have threaded it under this
RFC thread.

Thanks,
Navon
