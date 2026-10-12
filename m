Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F8338E8BF
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 03:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791775527; cv=none; b=pHo+FRv+r4zPOBM3IYbUmV2VkvuRo8X3a0rwMyRhK43/5qGQhHYYf672tX249Fls93D7F1rEOzA/oAtTREiQOZVb3hDw8+IP1lc9h3s5eT05kKjq4wLVUMD3HkhmbHANdG+fN8Z0N8ga8Ttca91cT4SRChD8cru/DG1YU97YEms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791775527; c=relaxed/simple;
	bh=/zdr0vI7bXYxk9EbrqCZLSzg1E+iQCzgXuNOauDgcec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVGFKwM8pqqbk3bRrceA6raiz/S/jvlrlFPfYginYsS+LE/iSojHIM2MJWoQWEWX3FRoIp4C5qNKC9xs9XZMzH2mqIIpZ1h2kriqU8dVSBkfzgHQKSmCgbHzIzBd2dxXryJTbM+m1sDrcLOqO3sP7Ud93mX3SqOydOhwVPOT1O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g41ZX1jf; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g41ZX1jf"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-34c522572bfso158863eec.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 20:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791775524; x=1792380324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/zdr0vI7bXYxk9EbrqCZLSzg1E+iQCzgXuNOauDgcec=;
        b=g41ZX1jfVmF5LLBKZbkfRBecqfzICZj8Tu9IendGgPZ3xZqjp2N3VtrqS5lMHtEJOT
         c5dUOc2yBAvuM9uq7lhOPKqJ7pVpK2Mk4cwErbWafMX9RxYKJn5Jhdbaw7vXMGMOeTe7
         v2cPP7afGRm3h7Kl13UmLTOp9I7ZmqgKnhG5Jr5xmKfG1uiQjD8u2ymM/JuPo/rtVWQx
         PBAGUxwggtXiKspLDVaoyFxV9Og81GB2dCvQujp6/cgNgtGCPxo43RC55K0cAuHu0yaZ
         D4layb1VjGSfwl+7b9RDV0+ESo4bK8ltPgciIDaxQB7Z/kQD6dzh6kxnK7MJdjLcsTrE
         omNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791775524; x=1792380324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/zdr0vI7bXYxk9EbrqCZLSzg1E+iQCzgXuNOauDgcec=;
        b=da4ooFiMDgQ0LYqoVSo2DQ32M97apJRk1d6W3LhIsnO5OZH97lp3JPdmbNXsdUq3+9
         lNM2+xeKpxf3sZyraunJ2I6jsmz5UdCT2wkPHiNxk0ISotF5JdHZT41bYaF+/TPPnTh/
         RMyWYrPXEFEtiOR+ALyHNBZ/eBdzYS+OOgnKwFZzAtA/vHkfziPXsk31RAQrqAsNbeY4
         K4wOkM/lPzg7UmD2Ls/vfnHAtkamRUWKhSymfL5NouX+gA6Miey+BZ8R4W80ks2wv7gt
         izaa6NgxxorYXsU8TkPT6nAwld8tdRAvWtCLADZTJTDiA4ylRkESQaq1IJzgcMEGaVco
         CW8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxsAnvNPzVSSk8oogaO54awtsRCO5BM/uv6ahSYz15BwjSuwbKt44iCPCnxmve5DGgb2dmZsn9MpuCY/waOxxqEKj5i@vger.kernel.org
X-Gm-Message-State: AFq9FYLNdms6OcSKH7FtFokhTbtoZEx1qWaFx72e7VOb1mINvIu9cSlo
	XUChVOvduFcdeiTKWdqd8qkSW9hhjrwKlmFt7pxddvjY05jmVGxJMvL9
X-Gm-Gg: AYBFou0ECpF8VHRcTPDhTpwdwDwlvBTj/wv5NKy2b7rCEAi3JIfd3o0G479sgXj0ANa
	6hzMC5f5u0+itD8jm0W/nwrqFIR4xcKpw6ZB27W+05MKtQUjeHnRA3jEt9ob8U3YUH9Nd+QSjQR
	X4eZIiH8v2aJ/GeQ5Lwg16Q+kkOsn/3vwOEHvQeDQbkR5vZ6Cyy8PsPCLbjwYn27dgR8im+7g+o
	4zDmk4DmhORWKZLmHBW/mreoBJ4AXzObvRCoLXhkB+UGtrK6hMp/vgFIbvD7NF2bwqBXHwwi6Wr
	4X/52umJ97xivuiUbU4M4cjdN+6GFUXOd1hAUrUKaOsjOIrpEa2Cnfsh0ld6v2LMxVR9+Wi7i7U
	n5EweuGbzCSf/vRNWdPxYGNhwK06TQ+zZY874rNoGXY5EpQ4gcaEnc5ajx6x/kMTGkhuyXWw5Wj
	4DhdqbGAyGaT1pKf7Vhh9CU3SBCJN6UlHZq0gezzTaJ0q/Z8rLH/i4OkZWq94If5Ul0Tufow+v7
	2BKyfa3IsI1nwHnc2C4InV3GTGqVBdt0IEF/xqbCgKyw5gBxlnqFlPQcHBOyD+2s/0K+XRULWcE
	wl8oEqdcIIUzPSWaOA==
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id 5a478bee46e88-358c9f3b260mr12190729eec.1.1791775523805;
        Sun, 11 Oct 2026 20:25:23 -0700 (PDT)
Received: from cachyos-aura ([45.112.149.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm11708053eec.8.2026.10.11.20.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 20:25:23 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Charles <hanker007@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 00/12] platform/x86: lenovo-wmi-{other,capdata,helpers}: Improve robustness on faulty firmware
Date: Mon, 12 Oct 2026 08:55:16 +0530
Message-ID: <20261012032516.15692-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
