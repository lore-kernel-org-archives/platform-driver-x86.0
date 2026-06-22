Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1638351C3D
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 20:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782159919; cv=none; b=MvkBqzjMyvdLngMXlmA2IdjfAgYDYMNqgiMF4Ih/K3+SWY5td1qdOZ69MOp3njTEHTmyMgXO4dDh7aRc8iEiBRW4IO6sMSbP2dLUzPK5e8r3thMb9hxd6p8S7pFAycRi1nj40bHMfnKNmf5vpH2dXWAKFIwGqlFaaXFAqxf8cO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782159919; c=relaxed/simple;
	bh=ClrZrjxVwXYuXS4Ew8V1x9Vq3DZCbpN6sFcZJZNzDxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cImt8E0XjAcA3LKDWLtw0pMGLzWMUUqImHuW+A6kcmaCfGbw9yCCYTH5a7ETK9Komwbh2NW83hMHzch18592L4HIjgg6teJwdB2f5TPZRydL7gPX4ec2B3tm0Gq5J7uNjWPx+PlDm0MjID2Pgun2rP/UdrrEE51i5nTkoGkDYJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU5/rgdi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU5/rgdi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-461edb387ddso642455f8f.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782159916; x=1782764716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyKtbDLz+CZpHdtJKCRG+ThMRKtcjXWTRnrYGreiWAI=;
        b=HU5/rgdi6w7GoP52j+chrIYDQxm/eTZWMitUB7amZ+USNEOYeMAlALVjSK6TNasAYh
         NjPyCjw2ZHzDDtOTq8TaKs73zzikNELn4bCy7SaFeDc5wEMnFZ8BWi5L3qih/4UIgwBo
         KxnlOJxEhJppO4+dPE3UlmgJPGO+oltwERuqZNppVG3/EgJUApZuM/OFbHDHmzPke7+f
         2ZuXfjuxt5ibVZgT+QbRigtUkZLs4JCRmUvaW69KeBzfLAiNPRAW1qvAaxH9S2vzvlXa
         yeQAXJbti1rz8Im/gfHpc1iOWC7eK2NK3lqYogeJiCQaAlqMb4dUYAYse8K2qPwf8AWp
         gacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782159916; x=1782764716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hyKtbDLz+CZpHdtJKCRG+ThMRKtcjXWTRnrYGreiWAI=;
        b=CKJYy7tUnPXBxoqE2fypyKM2i8Ihu0J4b4HOHhVGQduudYKhFhIRQ2/MGCZjwfWXAq
         4HhW5ZiZ1fhkMFg+tjOrTgk2DkNo/Pe1W3VlabBs7/gjna/sGIfnr5Aukn4EgyK2JHIu
         RXZAgf5uos2eTvO+N7RbhpaNk+v19rMmALlVdyABeeac73BULAKP1Te9j3moTvpJhh99
         rtSvPiRxsrBG/pZFZSCUiaFVda+YMNP/dSy3q6dPIfTIMYfH8iV3vYWNmXaIfW0QoZnF
         5hcCrXh0cJIS5p8QDtKLjgtKZOcpHohrGJ+lOCJGUkgnYH0B74C+6AMHr0kowVYkC698
         ShBA==
X-Gm-Message-State: AOJu0YzHvbPk7PqxILrenYvKyj4DLXfdrJOhPsUk5hk3huk9aGlWqVK/
	Yi9rBUm63TQoBv22ThyIcpjVu/5VI4/4gX+mIJbmUimvwJa8i61AHxjn
X-Gm-Gg: AfdE7cmdgIznezQWKR1IpEnt2D/R2SwYVkM5kwUQivvOVjh6KQEH0jYL9+7fQ8TRrgD
	2Vmolvqf+Pz3+FdPy9XqxLMcLHJjo4T0NQKWe5n5UlyfiS7snnZHPSGTJC56T2ELPP4SIJAxr/0
	kENFcPAJyt4ue7AZpvhaZgGdbaChhWXvErkHvOzit4REQeXNEElARLl7J5lvz2+le73KbvNmowR
	/OvWqN5V1Y6/dIFQdR+K7m7LwIOtw8WKIOwOQuyK0sM9UYeQt8HHCUYj/BltamxQF4aw8NgZsSz
	sVKsfLWxLfPX5wmjo9F7PA1kvNFQpkQqjANTdAO3xsAUUBRih0Z9Rjl7WeHIy8NR7haYvotZSK7
	6byDVJzsRiPui/A4M9LdZL0Au2VvaL+diNrACTce4JGR6cSVxAbRasKdQScPHluAvSEfR/fLukx
	9ZH3FlPwY+z5w=
X-Received: by 2002:a05:6000:490a:b0:46a:41d3:deba with SMTP id ffacd0b85a97d-46a41d3ded3mr3009729f8f.43.1782159915997;
        Mon, 22 Jun 2026 13:25:15 -0700 (PDT)
Received: from user ([104.28.155.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666cea9581sm27317307f8f.0.2026.06.22.13.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 13:25:15 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re [PATCH v3] wmi/core: fix use-after-free in wmi_add_device()
Date: Mon, 22 Jun 2026 23:25:13 +0300
Message-ID: <20260622202514.41504-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <f0cf19db-7ef0-41f7-884f-92002627e147@gmx.de>
References: <f0cf19db-7ef0-41f7-884f-92002627e147@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin,

As per the documentation, The automatic cleanup is only
triggered if the supplier probes or unbinds

      Similarly, when the device link is added from supplier's ``->probe`` callback,
      ``DL_FLAG_AUTOREMOVE_SUPPLIER`` causes the device link to be automatically
      purged when the supplier fails to probe or later unbinds.

To my understanding, the cleanup won't activate
here because we don't unbind pdev nor does the
probe fail.

Best regards,
yahia
