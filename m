Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A095382F13
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 06:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936660; cv=none; b=VD8zjd8ixUDj1Jay5+TzkeGm02LuF2Ou7t9P1lGDMS1kRPfifvRL3B4dCJsl/cEVT3Jowf7MDeTeQNhWySpPxFGxv5ePYUSteAsCK+jVxnBfUzNvhaBtl/WtZHrK+7vf5M2aomSdSEGam0BiewM74XHlkjdnhSLhuTD2ZmX7lFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936660; c=relaxed/simple;
	bh=wLDEXefuJ6ysr65joIrk+CDBT5nG781r89dk8ZxIZWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8Xfia1uXaRtma55tzCfwlY0WT1eX/FccqhA6QNPiIU1+O7BvChBPvU4f/0Rx4kYDBl+NbRgIffJhYYbtoMvYSHtXwCwb9lbLjsqRFGCPYwNYn2GCYcgzcvW90MEG/1PWMKcXE62oc9sT9eHWQD6ZRhmZdAhs5r9WbD7lsu4pfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhG8vY9d; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhG8vY9d"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso59058685e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936654; x=1789541454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLDEXefuJ6ysr65joIrk+CDBT5nG781r89dk8ZxIZWg=;
        b=DhG8vY9d+eTinmFNQm775o8Q7jFYyvD1+u3MTW/5lSvEBux2eigyr1PhU5mahAEzcP
         dM/Nt2OYBu262Q5l5hHK86R8Bez+xHclP6auZyDq+STfLywu1/OK0TseoQL1ElVYfvtK
         lSHQbb2s9eCEc/lxd6nzx+mWaQjtyayA3DDq7M80BCSvcebflez85PaMXHgMl9DyOsPg
         ZGv1qBv52krNvgf3OtBtjcn4t9ebevLKaQmNEHoo/hRvmET+0Q5seEqqd9MTev5qjDXv
         BWAorjpAKi5RUnst19QEjks8lkl6QpIHUkDxsN55Rg/dnmq+QP+eUVjf+p7WIYbEMxVk
         8abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936654; x=1789541454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLDEXefuJ6ysr65joIrk+CDBT5nG781r89dk8ZxIZWg=;
        b=qTMEi1PE/ZLHi8Jw/yG34UW7aVOLIAGeA6UgZouU7ui6uVrpAC46MDY1D08+u2x2KW
         3/j9NnVvi3aN09zFRFNJM3g3+f+32dHiLyKBxRobj21c5NuWD60zr73ip3hsPino6MqR
         Kko+fngJSbaxAuZr/Hbn4Z/OhLUlaEi9JFRzzsGkG+F/O/xBjcGFzzPqy+tid2o1k68C
         Hg3+WOXjTS+p4ZUU9P0CFaoOYk8my6aEsGbTB+J1ggXApNyuKjg3skGnkBb/syJ6tQPB
         Cnz9v8ARpPjU+b31oSMgG9ViYkTynSsHvsewXXvRFBeihz3D6dR1oZVzyEfvBjUBr8ih
         HFtg==
X-Forwarded-Encrypted: i=1; AKwUvByPxALISbQz4Dcio4vtcXnIfBN4F2tn0p708qVjYx6wHiA/IOjfXr8Ps3lX8/sBEWQpL+xGwAIqFeVq9FvtFk2k9iUL@vger.kernel.org
X-Gm-Message-State: AFuF++lG+EXJqDXnBoeA6v6mSvcyDGhbLE1esX7A7jP5rYfRhq42C0Dy
	iIVV6b6F6ao3f7q557NCEzn5AmkN7T+kD1uyLYaK+fTNBvmnKr9ojoY=
X-Gm-Gg: AYBFou35DhvMKTbrBeT4nQ/taziCIVfkHkVaLECgs56Z09dZfN1aqTu24QAZIndyeFu
	+2MJutJkShDeBllQQ367jrAceQdq0N2dyM1Ofn/gOiXABOS/vQok9XRfikKt0uQbGvhG2oo8pqY
	cBjUVfcq4N9tM4qyF1iSpmYtIeQvfH8m1PcRUXr9u5AxgGA6VBWAqzH0lAKnNEJC7YXey7Aj2dR
	GwLTizFUeO3sqP9LJy6mbaRVa2b/J5meece14LYmAgwFV6E7i9W017//TtJPh8f+hj5t+fGT0/V
	6Oakjfe0KjohIELqX2D4q83O1/Z4wmTXY8KL8vXbx11tajzQkygupZz7qnn+pMcz+MS733aOPnU
	6L6Oc/DpnRACeGEeX/r6UOwfGQ7wGHDcZ9huTZjrlFceW6qXT6VVlYZsPrUC1EQrx8q95yxKvQo
	zayJNQX7ihgM3ELLiWKdOA+dX+41uqXHN2aCVqm3716+2WDdf99gbw+MkTajm2rc/++ux5M1SNN
	c32QtZuThgvMrQW4XkhBCCs5mq/DYEs6e70WpT6b8af9iqL6yHfceaopYY=
X-Received: by 2002:a05:600c:8715:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49d17d4b01dmr219717855e9.1.1788936653490;
        Tue, 08 Sep 2026 23:50:53 -0700 (PDT)
Received: from latitude7275 (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm443215855e9.12.2026.09.08.23.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:50:52 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Thierry Chatard <tchatard@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Wed,  9 Sep 2026 08:51:04 +0200
Message-ID: <20260909065104.15817-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqDkwTkAsvs8Escx@ashevche-desk.local>
References: <20260831160754.9857-2-tchatard@gmail.com> <20260908161629.335223-1-dmanresa@gmail.com> <aqDkwTkAsvs8Escx@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 9 Sep 2026, Andy Shevchenko wrote:
> Do not fold, just add into the series this one as patch 2, for example.

Fine by me. Thierry, please carry it as patch 2 of v11 with Hans'
Reviewed-by; no need to change anything else.

Thanks Hans and Andy for the quick review.

D.
