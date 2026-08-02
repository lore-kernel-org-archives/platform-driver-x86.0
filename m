Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F1E48989D
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Aug 2026 05:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785646933; cv=none; b=K+ku2EtBjGYHq2QD1IvXXl05YPN/8pPzukADwdT2Iaaa3DfokE5W7ttpZrpjWxYD5Quz6PxG3uHmWAo9Mm/AZiy86RlazbNf8+lYolhcZmP+NkwJdgiXYcUZlYEdsxUhmP5C8iEnsBBo4w9hAYsi31JKSu1fHui/B/KAlVyYw1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785646933; c=relaxed/simple;
	bh=I55829sHPB4NO9/GicuprAYBuKSlrzRQRXK3N30EGU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YItPYLay2i8TWYIUKLu3naz8CxPwOG0Rxf94gdQrn3W/qXlvSNOtFoueaeEJ61D7MHqcN7zWaFNtqCw4fp4Jtqvuapc5OEXR1Dr7TXwnHyZTak8Y+bb+Bqth4NQKifC1nVEOqmXAUsV0jmhgpH5qpNlqsN6cdHcQ6Hx6UDwzylU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmDnBc5/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmDnBc5/"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47362928f65so2307905f8f.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 01 Aug 2026 22:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785646930; x=1786251730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I55829sHPB4NO9/GicuprAYBuKSlrzRQRXK3N30EGU8=;
        b=EmDnBc5/wbmJIN660p335/3u7+JsYY0IqunYwKj/yJk0IZpbm2kvxBcWPI9E1BmVh+
         FcUeMoccxDRyl/VosXxW0DH5p7coBZeqxjaUB0zjUcz4awRLUBKCzmq+58gn3DE+/mX9
         WD5mq8ukRl3pxqKBkZ9bugjxY83QoicQcfMUn9vdFM8O/Tedqc6t/KOdRK8gh3YR0wPt
         Ki8UIAFkN70bOoMmKL9/nZlf2LnmO4e59tG63YWRiOiD4KjAp1+GIfTm2comzUGiSpbh
         HWEilUnx7lqmcunRqUbmv3o8NFFH0JED4CuB/W2lazt5w/9Idmb0Xo26Heslcaws26gh
         YqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785646930; x=1786251730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I55829sHPB4NO9/GicuprAYBuKSlrzRQRXK3N30EGU8=;
        b=pyVIRW8zMWqhf/AWc9SFwSLIiBUMsAlsA0Q+iWbWP1GdbT/mEA0Yf817/63QQe9z5k
         6IdFXSBa4rWmar3jw2beUkOV3NdHxx3jDwevPn9QS7LyrvuyCXpjLvv3jPv4pe/4SvaB
         Pz9vkBNhTT8EcJKhaWr1raIKPmka0YuyO4pk8bC/UUtltc3bGpyxFunMZtgNZUYFqQVH
         ZQ4pIVOqO8GA4KRILykSnUyLkp7rYysoZqjvqr0ig2+Mqs1l3PJ8AM+ZU+Opqrt9AzHm
         5iK9MruktHhUTqckPWpcE6hqsblL7iOSY22Eu23t2APlVc+1KqDH/Nh9HzgVMjlf0vM/
         v/xQ==
X-Gm-Message-State: AOJu0Yw8274bhfJEYAJmI4zpQL2eeZz/RY+EpX5WDZFZPq2Auf2UP0If
	zq5U6chRi9uPt8aAOl9kKxorKo1ZMw0FxDqUkApmOcukBDnXRg+5BR+M
X-Gm-Gg: AR+sD13JKPHNl/bvUTlIEQsazaDySZz+YVGBCR7dA1QQvwj4p2j3IvGfhlh/UvXg4Nm
	NI2BBXPIOxLwT4suYPrKAYa+ffJPQ3qpsxN3eFGICpL4v9orcobgyfoQl08xQvyQ4qEU4/wPA31
	+coTS/DkHIvIRrEKo8oNwVEbPEP8xZO6H5M6BVNUcfCg+gI6haPwxoJloiPyRSYN7fXazb8PCPs
	lTdKb8ilOaFFEHHGk+0WLNDGkTMRb7fr+cY51dF5DEZy0MYUQ8DxlDfGGQh5weFnnP74cbuRtrW
	kZUGJVSCwtay/H2QG15hJcmo73xu3s9Qh/LiFXdWLY6ONMD6dNuYQQT7ciD3O7Xg/7z7ylF3sa2
	dYNdUz6qdWJewFwazYlRAbokBqhR6hrjMNj2tQ411OF7NVc9HLhGLsf1zu9DJAXWPaYSVYhMt1d
	dObjyUt9za+VcwrcrN6jODnUqGgl2I5JOpaD/sxWmiO0Lt6tQPPBROsEcpcwLMIfUA81RjQGVtR
	CwACWbzCsd1UosVGKIxkMZfMk20Q58cTqn2TWLq4h8ELbnlJhb5wiJ80d4vj5XP951EHide
X-Received: by 2002:a05:600c:608e:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-4980c64a978mr119580685e9.7.1785646930225;
        Sat, 01 Aug 2026 22:02:10 -0700 (PDT)
Received: from fedora.cable.virginm.net (cpc89770-stok19-2-0-cust13393.1-4.cable.virginm.net. [86.23.116.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808199f2csm149070625e9.5.2026.08.01.22.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 22:02:09 -0700 (PDT)
From: yahia ahmed <yahia.a.abdrabou@gmail.com>
To: W_Armin@gmx.de,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Subject: Re [PATCH 1/2] hp-wmi: Modernize hp_wmi_perform_query() to use the modern API
Date: Sun,  2 Aug 2026 06:02:08 +0100
Message-ID: <20260802050208.6657-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <885672f8-d47c-4453-9ef6-41884c1093ca@gmx.de>
References: <885672f8-d47c-4453-9ef6-41884c1093ca@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for bringing up the shared GUID with hp-wmi-sensors, I agree we
should setup up a small driver that registers with the GUID and both
register as notifiers but unfournately i don't have the hardware to test
hp_wmi_sensors, So I think for now to just drop the patch till someone
who has the hardware does it.

Best regards,
yahia
