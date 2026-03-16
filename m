Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8C639F17D
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675481; cv=none; b=ayg1YmMZeh/twLtOIuDmVZgm2ojxbI+cUhBrgBB+QFUNdTrvSLQWLnh6JRA4qYFzJaMX0dCWL5F0ixEPajFLTSnCBM6a3VZo7Krkb6SkOYxUyo5T1LcFAP6zKt+MXoXZ+lvYPn+SBJgNd+u0MARFrk01omFNnZF1qVANZoJZnns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675481; c=relaxed/simple;
	bh=v0oW82FpotuKCXgFZ3w4eNIEz9I/VGt9vHbImFNQbgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DUiNBEnswBeHuGbC2GVtJtuNjsKHc2I8Lkf56LhGvT/Abpy4NkipoZnpnkJPhulxciid59VYbVAmw5puE+jNzB92aBGguzBhVBDfyL9dmTdIhBx8n4ROJWWFX6PRzKTRHrg4kmbGgi82y57B+S5IR0ntXOMe72CDzB9i6gLJr3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCQDWAou; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCQDWAou"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b048527825so11351685ad.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 08:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773675480; x=1774280280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0oW82FpotuKCXgFZ3w4eNIEz9I/VGt9vHbImFNQbgg=;
        b=cCQDWAou3saBq9/5E1kBtfKv4jBVQpsfK6ZyQCvpJcklUvLmXFHmXTtnucCF9EoBN2
         nbchHhEJ84i/t4ifKr18E0KqePJe1n8XlBtPti7ABgtqmKdSgS7pPb5WQiiJzLB7XtbL
         6MtbqsIP0BjF5z7HBtC0XrDRDlSq7GwkG+AZz6sbJiCw+uFpQQ1rbg0zMnGBsSDs7WPo
         tUVabhn1axUJtRasZIV42SMBkiz7ynCW7dXZSGsNu5ic72/NJ2UKWqtqycxqeZu4Wa64
         5mNKgNpxZMSr0RnBQVW4oizS7f+mrfc3mO/lOi9/446VaSjhs3so2Nscf5MvfCnwGhqT
         3fcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675480; x=1774280280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v0oW82FpotuKCXgFZ3w4eNIEz9I/VGt9vHbImFNQbgg=;
        b=bQaJHCYJ3D+b+D60g1lqJIlxwgiGLRPQg7z7YN1OTqwtt3W0tCFV3iP4djD+I7xFT7
         faxFU71swtTBHunmklKVIbA6UJcvgWGvKQq3nPoVUdcxtpoL1zgkTma0ucecR58Xsr0m
         xQwQYWYllw4WrInsSif3FfllXLYHdggce9e+zzM5r0o7CSfswhHFBXcofQi2vQTX5+VW
         HULQExYNoe8zmoQYYCoL8rA+MewoXMQxuDXm2+wiyUx7XT8K3Q9VH7m5n8iaOC5qaOWf
         OujK2M3mBRZwHZFyXme0ekORfssaBqMPt4VaIR35fh/JjIw4ZpOQc/5lbbiH5zv5oSt6
         LmcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/UTilgB4uATEzQjceVO/DTQmomB+LjaOYKniz7zbWtYPc9nlmp2JI8VSdR4hEQUtrLR+FYiJ8Vje1CqjDLlJGJEPk@vger.kernel.org
X-Gm-Message-State: AOJu0YyX0jeh0K/c5miYOtw0+Tet861hDn7P4W9VaWAHFkJ8fMOuSA7c
	JXFZ2sEdHi4yvTkzD1n84td+PSilnxYwm+kGjjLBax60TAZrH74d8Ys=
X-Gm-Gg: ATEYQzwsaODZAuFFc3MjAd/lMxVIaTFkIqnxQ5lTV3bhubxBTBdkYCMuTLfglXcrFLU
	GVfVXtmYWzPANi+tdcHlI0hUaKN5TZuQLsq7y5pK6TcCV5E21AbgzEyXycEwGxPxVG/vE4J/WI+
	D7vAPhffScyGTIRVm0Z5BYHwKuW2ulP75hcW9NJdRYWEujKUuv+NGNDoFDmcERQoRx//i5Y0oNz
	Yr/I85JSuOvIi8gH9P0JihE1rsRw2+FnEHdeEQYkPn2REJwyp/2zzMY0urEY/W67E/KahuMKmjJ
	ibY6pHU/x7fFQD+JdRdiWBeZt6g2xkgbGucXKb3/mfmnL80IvQA48ZEOS3BSbA8qiZT2InsWVff
	01upOoYSu8qNzJpeA8e185jM9bGKacC6TSxqV5eBm1o0D9A+DhZmz+uUPIJ5kCMhCEper9jDA+S
	ka0LSD0CYexJy//ml9PNjd/78ObeWpij/ea/Eh1jwzOuCVRWlDdRLa3+F7ngIhA/s=
X-Received: by 2002:a17:902:cf04:b0:2b0:531b:b3ed with SMTP id d9443c01a7336-2b0531bb555mr51728445ad.2.1773675479621;
        Mon, 16 Mar 2026 08:37:59 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b048527a9bsm69002405ad.14.2026.03.16.08.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:37:59 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: w_armin@gmx.de
Cc: atharvatiwarilinuxdev@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
Date: Mon, 16 Mar 2026 21:07:54 +0530
Message-ID: <20260316153754.1873-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <74508d73-07a8-432a-a106-31a40a17b141@gmx.de>
References: <74508d73-07a8-432a-a106-31a40a17b141@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Such a daemon should also work with other init systems, it only needs to handle SIGTERM.

Even if i create a daemon that works with all init systems, i would still need to upstream the
daemon to all init systems, which will ofc take a lot of time. and also i dont get why embedding
this logic in the kernel is a bad idea.
