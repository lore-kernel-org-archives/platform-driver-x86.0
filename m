Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793150374;
	b=5ObyuAJeNrwqW7/daLF6iVocXdDD9d8e9ClJTdB0P6UphV0QI3Y22xWGSOt5SeEsHZjt
	 0/pQ+zPDqzxLzq6Hd7nUoXwyuvjb0o6BZlrscAQewGYGUK5ihIySpT2ouFggxu2fzCF7V
	 d7Q8HXwWzHsLiSpAj6ucR9HUcLM/P7SE1kiJOKXlwtGAhQ6Th9f/r7jkAeJ+uIdkX42aq
	 UeoTNSsgntUy6SLUPGUhzoi2HjE58pwtKFgMIJMyrfD87hnl/wT+XkJSvIY9FgF/cbJPC
	 +lPCQz+cEmKbd3lU/I7aEKsCA++dUxIUYjtUKP7FlQ96oNVst0zPsCXPFMDnh+GoDHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793150374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QGQE3LAYpEwlaN5IMebgHt/LGKiGCVPD/r8B3CD/Y/o=;
	b=bSq154qY8OXZbRn4IadSoRrwfXulKHgDs6DEvru7m7GQ/ZUZF5yfN2MB5P9Ur4v71EO8
	 uo/meObLS8S5z7o48Laoimr9LClQ4ScVhmS7Sl7UE3OFUt3iE+XLQU3wSBBygaJ2Qfi03
	 niV2KL4hhzttl9F0YwbUwUv+FRreZ4BrzKGiUTSzewn8nUSoVjxdNMf+WmLpeUWrROlDL
	 aM9aA/QUML1Py+BoAKTUVwSn+NpBQIkw9h4L22iC5e1zCAIAN8OODoE8ZMilMP7/wpVHB
	 dGunSci5A9DzPqgsRgehuTOzaNMlW7I9bMQyOLPPK+Ng/3KmAz23sVoRbit4T2dJdOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C61606A31E
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 01:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C61606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso699970eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 18:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793150368; x=1793755168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGQE3LAYpEwlaN5IMebgHt/LGKiGCVPD/r8B3CD/Y/o=;
        b=h1TpY2BsShnknbHatxj/gkM/Q/3/CKzKz9pjSzaP3JN3Y1TA9yMEzkHEavgQ67JW4/
         7LLgSzyonsaWbGqdcnfcmRG0M9ffhLCRiyY3tchJ/wF9CBKKhLpNImF3K4uPUkuGCGIi
         GCnGGdOicWsqzQiNokqoYkglKfShaQyctGxrpBNIwAbQqMB79X7rI+miRj/m+RAJZLcZ
         Hq1tFtkbVIYR9dVRj/JUE/VyF4Vt49WaHsnGLoERz9//rfjinmkFBga5zTY5dNkf4CBj
         xxqhXoDA3AuAiNi1Wss+Xa84OHvM1p0h24CezQWiqaU21d78gh1Ka2S6lTcGBzqwLSoW
         fDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793150368; x=1793755168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGQE3LAYpEwlaN5IMebgHt/LGKiGCVPD/r8B3CD/Y/o=;
        b=sOOX6zGEGH0Q5S6lmpgY2MJ3PfoGoqSFXYSBkyTEIjKtmwQ8+Ih5ucdeHUblUyBMLq
         DKFacsSd6WFrz+h4BxyDBv7DTx7OGQBXZaK5EY5c2PGxBGt9pr1D54lyUptltYJbvgH8
         40CDdsuN9tfYQG2Ac/kfmMMBkim2/tYChdnI9AEI2LIW0VWkf8gzjzlzx68Bd33SHbKP
         EK2N9g2ELSrznSw1+t2tRqXU5dE9OC3LF0HEfrGAKJv80Bub+H3X2umapY6OKrSI5/ct
         6wGJreIOEZh3XdhETudcVscrxbrMR3Sm00R7GZSq9n8GzyRjt1eOlb4s1+3y8OI0DbXu
         LE0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxp0j7LLw2CiKf3QEm578lABthJzi9gRJmMXs3JY58L3/QGnL+vLWjHwsqNcKrthJ8av0927JwcD3CpOWmpAsDcjHLp@vger.kernel.org
X-Gm-Message-State: AFq9FYJtNYpvDNPzP6KxAaZVv7HzmMhvjKv27gtmBf2CqfNts1WKsBdh
	ePnD9d5nvaI7OlAoNYE2UN4a7pKJARfW48Qe64l1bt4crDae360rSiw=
X-Gm-Gg: AYBFou1YbVhbygLqTWM6HidqAn1tPWuM49X14oLzNDVBDroPDn5CzyH1NfXsPL6plv4
	Jwb1ApMeuFw0PUhwdYB0dlkhkXM+s5YYdMZVOtHb4Nie5IxvwJhWmVl3/UIbowlAJoSD37lQu+P
	lOcNlduwQl9fk/pmNArFC77TJq9ce5E3AMTKc7Cf52msEqS0QLVDAwBzsSS4LsP2CahEfiWl51K
	PCa3GWLV8Gx+XqBdaEe9468s0i0dOhvQ7LBw0VTdOH3jrdf8L2C8F5Cc9t52m7yduF17gokgiJv
	sr3TIEIWUXJnU7SYDXj14qG9JzfwqmBGsbwIfZTixx9LdOEiG9sK832JqUgGL8ZrxWzrfK94ZGZ
	I5A0lJpSXMpNN53/qeOLCyPnlrpH26zedcjXr0kNRn5ioUxpWvpPYsCXgb7EhaQS88onsEAPsUr
	MMQXEKLGpefIj/voR4pAPEBRZ8oEoBGsjA8qeetGnRQINhFxsscWib6cx/pAQsHOvk1BAC0gclZ
	KozPQ/EoYZrnDhcpuoh7blWshub/khnGTxVotk5qxfIuaZKrlMYlBva+qy/y0pmQ34DSz5UZNZI
	ycqABufv8tMmHnwsdpGm2fMXI7il+jPyvyduFFQSOiADvf9tIfBWTyXgTo6BbMft0XeiPx3cfK/
	mMUBJDiUeQnk7
X-Received: by 2002:a05:7300:fd0f:b0:367:363f:6fe4 with SMTP id 5a478bee46e88-36a20440ad5mr1939920eec.32.1793150368183;
        Tue, 27 Oct 2026 18:19:28 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.115.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2392ecfdsm821863eec.17.2026.10.27.18.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:19:27 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: atharvatiwarilinuxdev@gmail.com
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	bhelgaas@google.com,
	bp@alien8.de,
	christian.koenig@amd.com,
	dave.hansen@linux.intel.com,
	dev@deq.rocks,
	dri-devel@lists.freedesktop.org,
	hansg@kernel.org,
	harry.wentland@amd.com,
	helgaas@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	kenneth.feng@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mingo@redhat.com,
	platform-driver-x86@vger.kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 02/13] PCI: Disable pcie port and access on D3 on specific amd devices
Date: Tue, 27 Oct 2026 21:19:14 -0400
Message-ID: <20261028011915.8217-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028000841.6816-1-atharvatiwarilinuxdev@gmail.com>
References: <20261028000841.6816-1-atharvatiwarilinuxdev@gmail.com>
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

> I did not know about, i will try to remove the ignore_access code, and
> will tell you the results, i added it as a failsafe

I tested, and yes it works without ignore_access code, but we still need no_pcie_port.

