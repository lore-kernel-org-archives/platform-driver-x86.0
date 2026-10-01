Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0051C326
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 18:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878609; cv=none; b=grusLY8r4A2XYnBEj7uATvythCFtOiNjDSTOrcWmFp1nMPT1z/TjztIfqZuk4F7r6s2mjm1RcvV1oYbuAgH8eMzt+h0IzFwiU4r2q1+l4Urt/8ZHBIFB9zp22pb0GJOdsqaYgE5Ltga3lp/ft1HPp8Gc34X/HRfrbfDWLmWvxuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878609; c=relaxed/simple;
	bh=KILrO5C2pN82m6mxD22TjUAkf2TJhwYe9y4RpURq5V4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WITPqT/ZrzYjnfthistXgt2LSTnfqeVA2WyngYgqt9ES4k39ka/ADkKQfrdnWapP+7iashlyT1ARiK0zX4w5O9M2TH9bJNkLoBdnAT4A/az4NYqrOzU2jXryeke86xyaIBQVG6O7HYApGy2HLiv28/yO5NXyXXzCYfaLB+Bwi4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7uRVcPq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7uRVcPq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so38805555e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790878602; x=1791483402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KILrO5C2pN82m6mxD22TjUAkf2TJhwYe9y4RpURq5V4=;
        b=i7uRVcPqfZY0di1GOTj5XQhALY1tXdaLkpXkUfWTa/pijub4czHhP02khT0xHEyQGU
         oaq9Nq7ktZFpuH3Vn90v4v1EKbzVrNT0cmo9eiyXU5UShIzTGytuXEqiE9bBLXgygMUi
         0IcPB94OE86YACJNAA48YO2+ktattQ8B/95RlaExYPwGqUIHhwA0zwJGuWSufeC99Rim
         mU2UptBUvWzN6MCS9Cc6+k0FGe+GPjyZaNyBpqzupTkpB29E8G9H1i660xSwiJayHJYV
         fBilbmLj64kAnh/0dp8jet25l9gPIkucDbo7HB8O0+l9nqyDhLqi0Rne2NjSVW1AyUZf
         p8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878602; x=1791483402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KILrO5C2pN82m6mxD22TjUAkf2TJhwYe9y4RpURq5V4=;
        b=mvIX47c44lJJBwAHdgbb+kqelzwr+qv5I/bvYKFJbaXPeaDW7rAoAXUuCEVMJlQwtx
         Kjga8hzd2GRXzgEmVNTRQVlipSwStJeJ+BDk7Ff7OhZu/Zx4csM6G6pl5fx13Czkas7N
         U0BASr28pHxyoD9xLecu0YFySJlkqDSmEw3fQi6pSz08uphuVdOLD0xCbSHVdaiAsSa7
         lXUH2Z/zKYcxGIQ9eX8EprTDvPMN8/h210QC/f/mZWb9nTsjFL3LfVqrLJuEdNRpzIZD
         w1gg3ieXyOeIHb5yff5n7mWp9YNufwg/afa62f/6vDfI6Ucy+338L3MJLaB6+LuGF4Xj
         rG/A==
X-Forwarded-Encrypted: i=1; AKwUvBxAATYZcDIjysEJ+nt41W7E2+RYQtKcjM/bWpH/C97n+SA/SmqqKmDUu4AcPiZuSkP8bo1JAH/NeNKT4ygMEvHeRcUb@vger.kernel.org
X-Gm-Message-State: AFuF++nwPp9SimSEF12tdzVUiqzOaE6JxuchX9suaNMqUOouKO53L5sG
	6iAV9wjYpSK0JVS7MxXC0U1XrgQ57ZkAErz9+3f7qUgukE/J1LwJy0o=
X-Gm-Gg: AYBFou0FjzxbeKfMLk/fE3fbtum3wCShD8KhaUoXLH9gvnjR8tLujEdRYBrEQD1wN5p
	ybrPQFx4pRhCCOue39QZxpimaQGEJ6od9y8yx/Nu4t1FjM288ep5NeUZNfDfcrb46pBJYT9/K+I
	/N2tCctt5/DYHxhxO/6ZPz0otHvDHLmZm4BLrkuVSQmI3/PBjA18Am8KiyL0S8P30WbzlBhSizN
	LUNGgjqQUMc8ja1vy5U3cJMccgZI2Y3l/qYwxItoAH2YM0wfwMWG8IgEMgL9jext5Rily8F4cW1
	KIgp+QvfMf/54jdxWNuIYAvtZIkIgGznj4iGtEOBwm04lMFE0ykuHvzOWLrrwyNQw8pA4swvw67
	HWVLS+Zjbzcm6P22mg3fX4xf8z/wgyByWecB4qEfC+nehf2eftVUnGZtHMI1Fvaj8BWG2P6sDKB
	fsUcXILSF7bq6QXZZFDgGX26mHja7IyV1ELUXJfZOUvH5p5TLmSmTvw2DEcbKxZ6N8z2rlBt6xa
	wRan2ln/akQ0SPLlyrfENNYW4OWnNTeMbdX/DSdw/aOjlQ9QWwSVDq21DYGcHKACw==
X-Received: by 2002:a05:600c:16d3:b0:4a0:263c:7064 with SMTP id 5b1f17b1804b1-4a0275758admr5878605e9.11.1790878601918;
        Thu, 01 Oct 2026 11:16:41 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770fe4csm8482415e9.7.2026.10.01.11.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:16:41 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Thierry Chatard <tchatard@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v11 2/9] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Thu,  1 Oct 2026 20:16:39 +0200
Message-ID: <20261001181639.1788077-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ar4GYJvy_w-ZMJb4@ashevche-desk.local>
References: <20260930214321.600863-1-tchatard@gmail.com> <20260930214321.600863-3-tchatard@gmail.com> <ar4GYJvy_w-ZMJb4@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 1 Oct 2026, Andy Shevchenko wrote:
> > Assisted-by: Claude Code:claude-fable-5-1
>
> Assisted-by: LLM

Author of 2/9 here: agreed, and thanks for catching it.
coding-assistants.rst reserves the optional fields for analysis tools
(coccinelle, sparse), not for the model, so plain "Assisted-by: LLM" is
right. Thierry, please just fix it in v12 — no need to check with me
about editing the trailer.

Thanks for carrying the patch.

D. Manresa <dmanresa@gmail.com>
