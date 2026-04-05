Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54ED33AD8A
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775381253; cv=none; b=JZT5VIxXfAl1Wik1LcGNJpk/3sIOGvMfH1pLuJHP6ixah3cu7zugsGcHEl+pKwjAvEi+OAYlipEaCk4aC0Qerb2y515Wupnet3pOsqa4/XJws6SNIJI3PhyZYRV7v4wJxF2VZhepy1QsZCPwv9B5yoe42Kxr1t2o9p1SeBI64tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775381253; c=relaxed/simple;
	bh=R4JHJOpcZ3k5Uofec7kARlSA2Tji4pJsIxwT1H/DBII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hxFH6rW5syxW/YPfHMDjoJbYK8eKbhjflqhObjgOUsUdhX/xiNgQ3jby7O8+UPQQ1R48tpPQdF2rCBSY4aH2qIKI4oX9Ur5lyTbfzXZiAHlAn2PHJOLC7zEjccw6IFZUbNx3V18ZNzCe+I9IVmRJbLPJTf41U1z1Hj3SwCKRkKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJmb2weU; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJmb2weU"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso1530787b3a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Apr 2026 02:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775381252; x=1775986052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4JHJOpcZ3k5Uofec7kARlSA2Tji4pJsIxwT1H/DBII=;
        b=cJmb2weUoFWB/fI+GRJd1GzXTCaJ+9wjbvTr5TULpNt55Zssd3mWQ+0gk52IqVHmlj
         2EMnl3JHvePTnLV+h7V3Ez8XYdvMgqTmMQ1vkWs1/fdJfXLsKOzaCUphidaIgeyrqXTw
         PiHMaSAazJg6yDbi+NF6XdMwdRcLYGILKLPyESpKYlGePkrVaOAzDcuHZgb6cqQY8eOx
         PNYx4Z6HijLpXQ9nFQo1ocykVOhaJPk2xo8dsUHnhSTN0m4m0OZY7EH3ZN8LM8XecNCy
         JypsMt2n4PEev69oM2g9QeUCthL3ckzn97G0hKcmtvILoO3yMCdoIInzi3mRdrnwN7pw
         0xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775381252; x=1775986052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4JHJOpcZ3k5Uofec7kARlSA2Tji4pJsIxwT1H/DBII=;
        b=PfKBi9DVABeOoDH/hB+VZLeuBgYArDVO6M+nf1UGZGZewtd5EZjfzDzUBw0qRtvzwt
         xYLKZSVpRsBu6VG6c4RdOtWCvkIetgUmXHkOFrAWfpLCzVJieAPYywGzT1V5WuHNAMxa
         LfOxx6w8i8GaZLqka96X/HXx2GZakCNarf+foaMAZhyJZCqtHhdyuThNe887EP4jOVYe
         mcrhH3pEgjoJLeRvjhltmaOFuvRZnx+Xkp9TaICZLtutVw9q5DLJbGFyeuJ9ktiJftB6
         vM/0cPWjm8NXLibNyA9I9UAJasA3+iWTb4F44J7Fg7J3e791M2PlW5p054I6Gk2Lszh1
         OEHA==
X-Gm-Message-State: AOJu0YyKMhQd8jA1dajj/3BjpEtsqad/929uGjev3ivh+StT6FY+I6pE
	I795c2KKljP0z3jjyH/rpF1jOKgc42JxdBFpixh5xUqANcVmXZoDq8Yl
X-Gm-Gg: AeBDieuq3nhkBjv5XmdA3dlCLkNCViQFixQzcFKlJoN9t5cSymXCXW/1mOfs6zm1wQk
	5hwvGZ7Go3/Hi9BlPmNY49WWHM8RicHcMuQQOcQTmVSLqD+q0ncNpfyq2nKiK1SsV4HAR2c2nBw
	sZPU8zW32f8ctlPhlDHfvpOm+jLBDV7ooO/H8WTNp3TN0b6iGlGuUA9lRS4N236HayoQQ2jNgEx
	9GuRfGcFUwBtUz7RCfuKqZKEQwERDey4WtiHEFQYi3QZD+64xAOAfObjWHwanfXwHWQcdfkIyzd
	CCuMZ0yagv/eAdB+eFuhwM56kNHU38jhZ4sG3MSaElxmwt01vcVJcUvOx2WDZ1QWCogxYuZdodj
	Fvop9/femx7VcTbfzP2NnoKB9XkBBtX7YErFwZVe7mnYJN4aw17B6sVMfoChNQgg8Cpd6dOQO3B
	txMuwK7LQbXb0qSuUuhgKm+KI=
X-Received: by 2002:a05:6a00:4005:b0:827:2c6b:897f with SMTP id d2e1a72fcca58-82d00235695mr10083046b3a.9.1775381252045;
        Sun, 05 Apr 2026 02:27:32 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:d639:9368:51aa:bf9c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca14b3sm12324396b3a.54.2026.04.05.02.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:27:31 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: int3472: Handle GPIO types 0x02 and 0x12 for Lunar Lake
Date: Sun,  5 Apr 2026 14:57:14 +0530
Message-ID: <20260405092714.6203-1-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adIk5GhZ9ZXj1kt9@ashevche-desk.local>
References: <adIk5GhZ9ZXj1kt9@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasu Hansalia <vasuhansalia05@gmail.com>

After checking the mainline kernel source, I found that
INT3472_GPIO_TYPE_HANDSHAKE (0x12) is already defined and fully
handled in mainline. So no v2 patch is needed for mainline.

The fix just needs to be backported to the Ubuntu OEM kernels
(6.11-oem, 6.17-oem) where affected users are running Ubuntu 24.04.

Should I send a backport request to the Ubuntu kernel team, or is
there another process you would recommend?

Regards,
Vasu Hansalia
