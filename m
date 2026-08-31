Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70683DA7D2
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172048; cv=none; b=tq8EC+EaKO3GHqmF0vYuHyQo2WjgUrqSA23KQLszXE0E2U/5Olv+CXON60jqb3cUXhk1iF0zX0NEN6BJHWwyvTDLPsTos4YbW0LuirJQAl/OwHXSC9rIoiglRtjATsqqRslyj2U8pK/VGpISbP9QlpcfhhG2UlxzNfhZUj6fPw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172048; c=relaxed/simple;
	bh=Q9UNHoecROtPaQiLQsMqsFJ37l8ESBY5tWC76cAlEw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSXZWusYXoinoPdxMYjQHCav0cdDMvEwN5ZW9F1K1FY/cScDXGtQaP7sLJf4/1vZgzWOAyAMTcAcpUSZ+nQWJCSeBTuxR2mAWB0FABF/jv2/YDWujFMXQlPbFjucA628FeMjQNHfrlTsHBJ5GA4c6VagqQSvi2F++5oGkkv5Av8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCYzUFi+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCYzUFi+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso32667615e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 03:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788172045; x=1788776845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lT1qQQf3sNAXskUhzvBOK+ZfyN55r+y/3b2wCQVAtnU=;
        b=WCYzUFi+x9SfMJ5BalRvgkCLDRnUM38PVDXsqxLBGgdqK1mQ+wMi05i8fw4YT/2yDA
         1zK+ZS4Pdp4K1AYe5Ji/2FrNaWwclD8ODum4N2cBGn/ZkknSCWEDqGflUgAyAJ/BhloW
         ct5du6e8iK1woV1d1OfzRpO7y9sPmUppvSwY80WedTmV8ID20iUc47NEqYkMtG0AKcL/
         BmbPgmGLryXDE6AdaYaQGEljKwY2sJgvJA/B2xGbSEYsdk9jhfzPl+sSDm0B8o1gf3cC
         ziC6wuEc4lR6EidxTRjTUpblndJz70AfPS967b0EJsJS58XQGow9Caqc6NMdrSn7wbyj
         0xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788172045; x=1788776845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lT1qQQf3sNAXskUhzvBOK+ZfyN55r+y/3b2wCQVAtnU=;
        b=sdAVU1TnwoXI4pdbyywDo2v2wicjp1lpD21vri0OpztqMxmZ/Jkw0lndcqqMnu24o/
         PCwH1k30x9dO6yotQ6z7wGqXrPfsh2p8BY4HrJHUdEiP8AQlsE68ZZzJoBHqhEicJ3Lk
         i482GWu6EqFp4Beh0Q15Jh44p54J27K78zIjnbNa0mWgNLJDFBvnyFuR4Yghd+VDFfby
         acf0QAx5GtbDBqgxKBacZQzeOwZ32tX4QASWB6mw1hMTQb+YmND3fkYVe3fNCLt0Bi+P
         elZhjoJeQGyGtPGPohlnI59knSDFTH87PQp+jabkoXDBJie2nUgO7oT1aUcRe4P/ftzQ
         HMLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmRv93pYBfKcq1DIOMLBXAhHxV6YFQh5Gnvv8uySJ5iWsd5uWUqKgZ+7tvYkoM6jWKCJpbYjOFBsfw3we4nOG6XYzz@vger.kernel.org
X-Gm-Message-State: AFuF++kKqbsHIMl2XUN0zslZKtjPJGEC4OARXCNIWfhXCtTUItljETmp
	ryWUjnp2pOZnFUUDFw/8Fm+Z+yyH8hn5GV0wZOnFJMg+wyKVo1myMDo=
X-Gm-Gg: AR+sD12hq8AYf3T3RkVtpHra7dzXs1ec0gO07EaAGZRLwl+vD/uVyPkBSUXyByoX4KL
	OAoeLlJrwUmlqWEjo3Fij6TMag0z12nNfaQBLvDgfWDOKax5bRANMiJtx3w6Z44MfyixV9xaJaW
	+0a+UONSoZ+mXHE2a3vZdehnbJ7dwELJR7kMmsoSSqyjL7n6F7NXRo/rrFYqW3L75cyh74LJxQG
	Hqt4IEYz7fqMfr0OBj/JqT2FA8w9mfLYXkm79GWGWnt0ZK6oAWOURZ1sKRWyiWGgQdKoohsxoOK
	oGs/ZPWGvCvI0dZzSivCqoJrbJZjheZYwiou5XR1WTmyC///Zxxt/dLZ/TdyniOaVoH4CKTClBI
	63Sbcf7LNBWTRE3gjBTuGf/j6/gm9T3iN6GkN/87TzIRf6twslATjQyfUTYV5+yMoms1IPiN4DA
	n576GiGzbsKBOz5+qnTJU7+kXVTNRwEfbLdW15tZrf2VPQoJI9gyjFNvbEVud++gBjF7yZLE1t8
	U42huB+8OLe/CFUVSvR1lykbHSE5DhIvXH1JmXCE89LkyjxbwNwIGs=
X-Received: by 2002:a05:600c:1d8c:b0:49b:916f:1471 with SMTP id 5b1f17b1804b1-49b91c1df21mr423200195e9.3.1788172044349;
        Mon, 31 Aug 2026 03:27:24 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961939ddsm129217405e9.4.2026.08.31.03.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:27:23 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: int3472: discrete: 4-char GPIO supply name limit and unhandled vendor GPIO type 0x08 leave OV8865 unpowered (Surface Pro 7+)
Date: Mon, 31 Aug 2026 12:27:22 +0200
Message-ID: <20260831102722.37615-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <daa8e671-adb3-4b67-93c4-d3779985d89b@kernel.org>
References: <20260827232634.93131-1-dmanresa@gmail.com> <9b07fedf-57a4-4291-9db5-415dca5ad480@kernel.org> <20260830150025.268353-1-dmanresa@gmail.com> <daa8e671-adb3-4b67-93c4-d3779985d89b@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 31 Aug 2026, Hans de Goede wrote:
> I wanted to review your patch for this, but that link does not work and
> lore.kernel.org does not have any patch with the mentioned title ?

You found the reason yourself a few minutes later on the patch thread: the
patch never reached the lists. A mail tooling error on my side was dropping
the Cc: headers on some sends (while keeping To:), so v1 went only to the
people named in To: and lore never saw it - hence the dead link. Same error
hit two of my replies on the ipu-bridge thread; all fixed now.

Resent as

  [PATCH v2] platform/x86: int3472: map the ov7251 power enable GPIO to "vdda"
  https://lore.kernel.org/platform-driver-x86/20260831102306.36610-1-dmanresa@gmail.com/

with platform-driver-x86 on Cc and your Reviewed-by collected - and thank you
for reviewing it from the direct copy despite the missing list posting.

D. Manresa <dmanresa@gmail.com>
