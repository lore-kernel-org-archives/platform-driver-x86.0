Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECCB495041
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 11:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631889; cv=none; b=IjR1jsP4gZDChQZV66WB/caEkWg8G3ym5ludMl1dnWNPuJAkpO2RiwlWTt55E7Npl88KkqTdBquCtl0lhtS38n0l3MlrLrJLNsnHuplWVm2wPoOrxnCSIZs9XRRyRiMS7ZvoX0X7XXYvU+okTI3/JAlBp3O3UR/SzoE5CfTamZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631889; c=relaxed/simple;
	bh=Es+dBV7DIZIeEMX6pKpx1DQ3lWrpAte1IyrZLYZ2vJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZH/DNI8Uzm0wW/TdI/sOyvmayT4C6APskwllv/J857kipH1BUt2lO34EhT2Fs34xveF3SPfC+gMaYXjRBndNkbiNfvR+x1F3yNOjHhE51HFbWe1VJ4LixKXNkasaWFeHJMwsA6YIKCxgPlZjRFslC4vhf+lsSBXltUiYoSSYJPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSnd7Upb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSnd7Upb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so5278375e9.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 04:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791631885; x=1792236685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Es+dBV7DIZIeEMX6pKpx1DQ3lWrpAte1IyrZLYZ2vJ0=;
        b=ZSnd7UpbfCXgZqmFdH7yiOsV5Op7IkwIarhwClaWT2TKvXPxl52KnmclpSBeMehD3W
         3ztxGtskF17bKD1Fgnn8kQfPEPxVzKPmBVYsu5u3Hv9JuXMSAw4kHWl9tmfBP9hgPfFq
         S3tZoD6EJVlB0aVCma7ajJW1W7kvnwOdjJQ8lQWzjtMuZqBu5xEIM+dguSRHJSNia6y9
         j/2ZGEh5tlRHcCgapyeikF8qJ0J1CXxAcGjcWJ6xHAbyqwej3pu73pNlATVuaTI27R8h
         /pFMcBjNxWQnsn/Z2wXK79BLjNZf3W150w8qpxHNG1s4PifQlmWRpFV3kG/I9Qx4eXts
         Shkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631885; x=1792236685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Es+dBV7DIZIeEMX6pKpx1DQ3lWrpAte1IyrZLYZ2vJ0=;
        b=L3ygF2IM7+nSGA+4t5C9KKVjDaHRJdT4Q00FlpOJ9/Y8MfpLUgVlI22gLg9tc/NOwn
         qp7GJxaXrpG8ggPECGRhyp4wcokAUe7neR4Z1qCUuqolVWCOj6HY9fdYoRkaYYTxVBfZ
         WtE+D5tI/oeb9hCDHNX0fKDOCWuXIPNP7h7Dlu+N7pCwhu4cVjEVJsBgK59N9ZOfRKoq
         hR4WjLAZfEHYNarY/Z5xDmPpVvtat9zowZKFn8+Xx+N75uK/8IlR0BU8K9PX6hkMIuFt
         3MAP0E1f/n7GiRTB8EOXJ2Fr0v5jhsmxWmrcvONwlBp7h6Xxuu6aC2+lLoT8dg6jw9vF
         J7Iw==
X-Forwarded-Encrypted: i=1; AKwUvBw0D6Xl/1tC14SMONP6nGvclgGjbL/0dEyR9LuMjZ5cXsIPt6Y6AHuKBBEecU5mHfNOITH/s3z3lQPi3Kk1Lcirdk/J@vger.kernel.org
X-Gm-Message-State: AFq9FYLbo6Q/IbDwpTGEB/wBhBUaNM54atzkFW6Qbi0egcDUa4/cduiv
	zCf8J07eiiREkvhUbvCO8qKX4sR4sKjZnljUx/cczOu+B3rukgMT5L51
X-Gm-Gg: AYBFou3dqfp2Vw+KYk2grZIZgi9CaMpqYY2Mh2qj64huepCl1B1ku0vsHvkqP+ok/14
	5X0VwHAQ+a9KsWZqxZ4MzaKIWUJojQm+BuDyTwMxIBe0IebtSqyHv1lBBtYOFsEVKL9ivNo6IPi
	caN4rUzCvHl9eGgoGTMrrXBML32Ddvpnsq2QRGgcU/CU/UiB46pux4cMCTPWt466EkOiC+BfY7d
	QjLThVtyikH6YcmSZ757r8jMEsVqladNMcTPDLPJUq+XLA9VE8kBiQHS0xNGN2P1wQVtNGjHJAR
	QmhzYy4m3BaWF6bxib67SE/IFbx8Ga12Xrzfp54uKmVW/GbIujs6z9uv9nnglr/eV2QUxBTZAyS
	AgRDGuC/layLXXjHuX3W8RSuXo7GUO4MmFY1AuUdHWOm1NvDKbZun8HgtK2xvoFByqo2bdZLZ8W
	1s2d4msngP3CL1sbl2XCuoD+CEJ0eYdM0Ve6l4HxrAkXiIZoxnWPUY338/cgFogC8hg1zQV9Qwm
	7BEEM9PgwqcqIO0V5tR78otiC++tJS/cfs7NbCv+qHP2I8=
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a18e4a5355mr105108215e9.10.1791631884527;
        Sat, 10 Oct 2026 04:31:24 -0700 (PDT)
Received: from Cachy-OS (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2e0dbsm133458045e9.11.2026.10.10.04.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:31:24 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: dan.scally@ideasonboard.com,
	dev@berg.pm,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	platform-driver-x86@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	German Pablo Lindo <germanpapulindez@gmail.com>
Subject: Test for [PATCH v3] media: i2c: ov13858: add regulator, clock and reset GPIO handling
Date: Sat, 10 Oct 2026 13:30:55 +0200
Message-ID: <20261010113055.31715-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260831130312.26296-1-lsa.uz@pm.me>
References: <20260831130312.26296-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed in https://lore.kernel.org/linux-media/20260913144127.17995-1-germanpapulindez@gmail.com/ this patch is necessary for the proper functioning of the camera ov13858 but not the only one needed for this camera to work

Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
