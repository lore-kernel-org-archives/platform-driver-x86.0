Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435DB49CF32
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343713; cv=none; b=sA3dVUQaOcPqccRREl1n0rOlTilrrGJx8PS6FMeS38VI/i/T3apqHsH5yiT4n1LoI7rGEFPDN+IDI6/mLvydPpZTxifP66+Clv4tOf0plKrTT/8y5hO4Fw8cXUFB9LzYNWd3VSHF/784BgSMCkpyVN8yirQesjBp21NfQGnZTT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343713; c=relaxed/simple;
	bh=UZwEr8ZxAYs/HWJfjpXBm9NDi8C9MpTYWZMVYdlUCWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDYDBzI9aL0JgkUdBxCwxKJ4NKcxJcWE5bKm5NkZXZp4l1VAVWa7/5l3r2NIbebZ+hCxfv6jzK97HusbzryAmo+yIIcXIRe5/5Ca0Xo80qHSM8CWVy7vdMK9zreadldEW866QuvhpJYRkoAMfiwwWGqhgPpTgLSi5hTLPOtkUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3jzBxJJ; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3jzBxJJ"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-7f4f0dd550aso328026a34.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790343710; x=1790948510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8msee1/YC+m6/bz2byl/iRv2yTCsSoxS43rkyBrLP3s=;
        b=Y3jzBxJJ75j56bBUdJZGv9yCnlBFsZujNvy6v/7p2iy9pi1RUL7K6Day3t0Le/yXgG
         3qHNvkHd8nAFQ99eGlKCZUa0qr5Y+WsIv2BRhVdt0e7EfqW0gSScjlJxep3gbSsXgWgj
         6maus+h41OyOYdzBZV/AboisWr5WiRnAI/2YjU6LYPKRQ7hvpsQow0fZP9aLMhx8Sd+D
         ZYx8NePTfR4A0QBcsep66yaIjOiwGbe8urIR8/kv9mdOrG3ioJVUUTjgaUpw0hJ4BiBl
         sNgDprm/tT360ZEyIY2w4sFNFrXpwSDFXPj+UPEYs64+7pwIyxYxCSKSYezIT1laaTbI
         jMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343710; x=1790948510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8msee1/YC+m6/bz2byl/iRv2yTCsSoxS43rkyBrLP3s=;
        b=lEipbLZmTLVWQk36gkFR8XOwH59bibpoPL0qN/NrFqr+WSpnEi7wj4rLHxbPf7IjIC
         U+1gVsp/B8xKdcRNdlLJ+S9O38/JNpI1SA+nl+Ahe5znDQi78mDQDgtuX+Db7XLbkBGO
         tAP3rHSVK/wYZMz4X2mgK+NQWXkIdKvgU+NsAujw9w+LxHPJKh6Bg47Zdkzpr9M4BPY2
         QUa03QiRB3/FxODGe4RlMmiwjYkkRvZNl6R2NERehZSJSx6jiWQpZAJc2IGVGCw9pAmB
         0pe/3BD1A1LcWwB6Zbcixb7MhIei98bTtGXMc+/h23hQTvhngtd7uUP8TlAIwvA6R90R
         0deA==
X-Gm-Message-State: AFuF++nGgTtRtZPOuCDu7rFkZSeYd//hEPq8YYwQ/3bMFlpxLwXkfSNZ
	oSO+fJ/zLwF2XfIhvZL7EFY1ZakTJzfYxG1PxX/arkazejBmKuf6N2Y56kRNjrnM
X-Gm-Gg: AYBFou2dO+B0XjWnzwFUCegOww6weILFqitrFdXBcJbt1woHh6+t+x+YKs76rfkp+Nb
	Tixqo33BlgBBIBNikrk8oH0VVHHQQdWOnuVb5t+bcpQ7t8w1OmLItoPON3CWsHjDNufv9aJa2pS
	V4FZyAfoP6NR9qnWScz1bW8UaOgNwA5dfZL/MCugOp0ftWNbV7PkNDnG+u3teridoeO5hg0RtqB
	cI7nOtLms/TzGYUHbku76DAC9CicATlOVbe2V7fj95hwpKzv03wndoV7l5/9ESYJ6vHMJBI16l4
	coj1wXfsetbU2EdwpCnMK1yN7jjVpnJ3lNRReqDVeSmvmHXpv7pSZdpZoUuvGFcgPDVw6iRO60H
	G1dTfD3Zzs9XPf8xR3w7+46Jnykp2DwNVumqeRnpVuzYR4PYg6g5dOPD9yPyXaC0O+wF3wqqvXF
	iJY1ZEfVQbt7THPlbhPRX27a2QgIE34NQuQ3sEOhXec+v6WCUhoH+WA4kubvcpXvUGSOAT1UQQc
	z68GgJTA0UhJOBwrDBxaBh2p97Wn9TqMllL/taIRIG6ucLW
X-Received: by 2002:a05:6830:82d3:b0:814:aa56:6f34 with SMTP id 46e09a7af769-81917f49300mr2560736a34.30.1790343709954;
        Fri, 25 Sep 2026 06:41:49 -0700 (PDT)
Received: from horydNAS.tail6ca24e.ts.net ([35.11.35.209])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e33f6714sm2166916a34.0.2026.09.25.06.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:41:49 -0700 (PDT)
From: BurningHoryd <sjunhyuk1@gmail.com>
To: linux-usb@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [BUG] HP OMEN Transcend 14 (board 8E41): GPU power ceiling on 65W USB-C charger is non-deterministic
Date: Fri, 25 Sep 2026 09:41:48 -0400
Message-ID: <20260925134148.435774-1-sjunhyuk1@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <arVGfB1PV7kt2Llq@archlinux>
References: <20260922192312.40607-1-sjunhyuk1@gmail.com> <20260922213218.5334-1-sjunhyuk1@gmail.com> <arVGfB1PV7kt2Llq@archlinux>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Krishna,

Thanks for taking a look. The acpidump is already up -- BIOS is still
F.05 (same as when I captured it on 8E41), so a fresh dump would be
byte-identical to what I already have; no need to redo it.

Full acpidump + decompiled SSDT23 (the table with the NPCF device) is
attached to my earlier comment on the NVIDIA issue:

  https://github.com/NVIDIA/open-gpu-kernel-modules/issues/1162#issuecomment-5779711336

Same topology as board 8D40 from that issue: NPCF sits under \_SB as a
peer of the GPU rather than as its PCIe child, which is why the open
kernel module's NPCF binding misses it and Power Management Object
stays N/A. That explains why >50W Dynamic Boost never works here, but
it's a separate mechanism from the 25W/65W split on the 65W charger --
PMO is N/A in both states, so it can't be what's flipping that.

Happy to attach the raw acpidump/ssdt23-acpi.zip directly to this
thread instead of linking out, if that's easier for you to work with
-- just say the word.

Thanks for flagging the missing Signed-off-by on the other 8E41 patch
too.
