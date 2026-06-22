Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6CF30B521
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 20:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161868; cv=none; b=Xu0mMmQk7RIUVx/R1GA5BiTyJzE9tjI9msNCmjlocAUh/TfjMcQz9h3L74eIwQF7rx5Txv2MYsUe/T91Iv+koIBrG6S9bYEnHttniX7fE//AM7u6sOFmVXAczDZEjcMpOXHXUNCIqjzPqgu9YPe+Y2JlnzM26Lx+lYtFkAzvI2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161868; c=relaxed/simple;
	bh=gOgVhP64TjVZIdfikdeyau25XvSxY6HUMq6rUwO/0ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1yekFaUOeKL7yYcUD0QLlVosnOOAoiucjVHhFxZVWzb7LuavlrwISWEkxBe4pg1TvCz29wVpgotNV9PCpPg6FIBdGVIZ/YZdMLquOrOzlNlmzhpymWlUBr1+8hXsRMg1N+n1D/WgDIXiowSMgTBK33Va7oNPRnoPzTeOvOCx4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6NB+5si; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6NB+5si"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so38392575e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 13:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782161866; x=1782766666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOgVhP64TjVZIdfikdeyau25XvSxY6HUMq6rUwO/0ng=;
        b=j6NB+5sisHBaKzIwrgCCvtU8yUJbLNR9pJ0TpH6Nqv7uVbCo9l61c6MkE30BHCJ3mk
         Jn+TehVotMuiick978SD4O8xPauobl9hvtUG1F6QTSdUcOFFIO2gsoZK76ufypj92OQD
         9Op9Kl5xvY3ZLaPgrN66mfozX7KcYLV9lV4O21+MRsiZgCvZNdgtbXpFpVzeJvEE1XFj
         wpLrAoD6yp9j657gTWwGc1b4jdT/POPHMGJay8Tl2T4L6dG6xFQKT41kIvOCSeh2j9Lv
         VTtevUE2UB3sUrCWRT9SXKX6ojGD1GLl6XKsRm82inQl7Em6CG+IZUTsGta0Uz8LiyGt
         dM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161866; x=1782766666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gOgVhP64TjVZIdfikdeyau25XvSxY6HUMq6rUwO/0ng=;
        b=EktqV81HaJexzWWhXAMa3/GWqA3FHbHOCdom+w591sM/YPs2iVgkRDY282xMDq+eVw
         +ny9cHMQNcDNHrIUF6JO8ZOZgj00GmQAomDpMO86FZqjJedIGM/TU58/F2niJ/W9srpE
         J+ea4p4XNWOhlJ+T6wr5etdQh6z+vBwXPEXW2RWq3ZglxpNS962xHnpnS0Ztd1TV/m9n
         BXj/Wha7KbYA/180sTqvMxxBVbAf/MQ4I+U16vj/PwIeGVXbOCWtQDcKB3RG/nJ0Kac3
         KS6/k6/yZg/FjltkgNmhkwMykoIC/vfu4i8V8lR3LrlVuWvgDRfwh5YktY7sy04eImfA
         B1MQ==
X-Gm-Message-State: AOJu0YymQmx+HP25AKvcmKq2HCluCy1lPcj04+eIPTrKk/yZ1+kK93TI
	BGC7kkuu4+wi/0aziD2+MD9hTyKNPnG0WVQ+621t4PWC9FSa9DZ3eu1WTSjDJJ482hY=
X-Gm-Gg: AfdE7clPHnve9Qc918yjnZinkt4SMBAx4lK8/7hd3uOVW7rT0fwbAgp17VLPRSovOHK
	tmWr/vod/TAdWk/SSGYZaLrff407t1xA3GYxxn29rZ+JcI7sj6zsQEaYas91VUzq2OF3hqRkyP/
	CfpQ2H0KdmxABXrYWuAwvOkpNNTet2yLtgQD0hPyzIRb7Odf1omp8AUN62FujPa+zaLp76dBedr
	DvaEHJPy6+bH7PF9P31A05aAOoZOC2PteVCXWI9ZkMKb/yumVy34zEEVQBsq6pNGKE3GZBOaYWJ
	SWLL6X7IlYDKAmZxLEawAxpSdttRANN6Je4z8i69N1FJ5y50MaBg15m7K8Dm+R9bPWc2uPQJw78
	RFc5zOJagNSaJvszXwaj8yvcETq4c11PoEsuxDgNORYY2qdX31vRVYkQM18Ydr4PWWH+LDz1U8l
	/ZOAy2iYWlUXQ=
X-Received: by 2002:a05:600c:8b37:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-4923f5827d4mr251234715e9.25.1782161865509;
        Mon, 22 Jun 2026 13:57:45 -0700 (PDT)
Received: from user ([104.28.154.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788302sm25558460f8f.20.2026.06.22.13.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 13:57:45 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re [PATCH v3] wmi/core: fix use-after-free in wmi_add_device()
Date: Mon, 22 Jun 2026 23:57:43 +0300
Message-ID: <20260622205743.46192-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <12f6446b-2f5a-4c9a-8f89-93b8db94b818@gmx.de>
References: <12f6446b-2f5a-4c9a-8f89-93b8db94b818@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin,

Thank you for your clarification, I am
completely on board with the idea of changing
the flags though I dont get whether you mean
change DL_FLAG_AUTOREMOVE_SUPPLIER in favor
of DL_FLAG_AUTOREMOVE_CONSUMER or do you have
a different idea in mind?

Best regards,
yahia
