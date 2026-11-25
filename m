Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795595080;
	b=a3nlflXsHX1bHOP4KLOXuw29C2T3P7jhqTN6rNn/TPPmwcgqDua0u9ABdIvFrxUDy/Jg
	 gol4miCmRK5TFTuKeNuTBAr+1S5Pj/UGHnv4Sww8hlYJFKfOR935ZRZ8ZBWh8V/K9btWP
	 4e4uVkwk10gj3++4uqS0w8InbT48wq3GMExzJM3lqeCzj+Q46H/C0lW4ADAR1KUk8WsX+
	 T6AhpOCojrDLj3M1Qd+WZ5aVpvSb1sVT8Xvr6mbbJeK383zUdhm4q8csY+fcyuZgFU3WA
	 1kRJovirEkVDfkSMVeIPCv2naNoVZJF7aqa54cm4gB4ufpTqvaaFQr+9aCSfNU3H2wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=+OgTYY8n6yc3qcbD3zimkqKD2AWn/72ixSa4WihkrKk=;
	b=5ZPDiKFwQCxbqN7wSZqYKe8aWjCk8hUyaNEirS5hpbqdeyk8kbNSsm2RT7MxmA8mKtk3
	 Zr2oZCZ2p2hBv1nxr0CJN9CA6mqvRAqvPSPcx+bRaLRCQREXpyAcBXetJ5qcyWXIWn3EK
	 7iFh8fCWmuzckS7Hz+dEO7+vz3msiajb1B+lX2NC5KM9XqKZ2vxywEkbrHxHUAt0h9T8Z
	 EhPrIRuAr1gyEisKoo7mU69VElG0z1Y7upMtq8nEVqTNbYu+VBKgiQ49fLruQUMUs48rd
	 UhzBgNCX5M6fPPRyeS9pyUsVXM04Onx5wRhgpccez1WsNqQ94D483FHcZ1+LPuo1UPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYnBbibw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF257606A323
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 08:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF257606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYnBbibw
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso6743241a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 00:24:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795595078; cv=none;
        d=google.com; s=arc-20260327;
        b=HDjobdMKow3pHSiexb05v/H5vHPhGQBv4W0GPZ4e6j+tlidaTTHry7t1xBOPtoqUS8
         P76etCzKmgygcReemRuB0yXPKsfA+c1JvkcQi6YhLp+qTdG8g2E3fz7DU/t3Nev8Ulp4
         fBw8/ics3ZS5sxvlo9zPSiLCTwCUcFLCygxQxYJJW7i36JpXllw5xHf2C0Wl7UdVg0nN
         yq9Be38UfmhJQThbmIMwmlo+hu3xRKac92DK4rIABRGHxmlyrUGcBn/mcCZSMQLTl/ZH
         33lM9/Ne864I99hzGyu+oeIQSnDokt2BQhbUHPfb+0m6eCMeU+Yuzdi7tD5QbE0gc6Uh
         pNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:references:in-reply-to
         :dkim-signature;
        bh=+OgTYY8n6yc3qcbD3zimkqKD2AWn/72ixSa4WihkrKk=;
        fh=w4BUOj4KFBQxvg/H+PrQ3ktJ8AjMpQXinMO5CCjGuq0=;
        b=BE0/OGXZy/udAkNb0+YYXq23xktFa2uC3POVah2KwJvUwQ57YgQyp9QhU0bC+6Ydlz
         GPAmseTzp8XCwGTR2zqF8+phDkKiK2SQ1tf1JwlYZKViM472LhJEjgCzQrcsDoMuG8rC
         W90qRF1aOnRdzRcD7M2EExmZtgoZCBtYH7ZWG1bEOknuVZz/BxsGPFRY7eppZGJLNkpF
         nmT7L7qk+AZCKhwoSQztKIQ8wXwD89YUV5d9bFR2izcXxUqzSjQilN5xILatBlpIndWR
         2pjCdFVPhLRFiFSdDoGvICxnqSgKu3u8xpxLo6e32qAPLJ5J45u3N7tLmYnuVxG+x9SA
         r47w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595078; x=1796199878; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OgTYY8n6yc3qcbD3zimkqKD2AWn/72ixSa4WihkrKk=;
        b=JYnBbibwmphUIXBEAUa/kCRgqceDjAv/l0WaihxjyopfKawc6bFPMZ7cTmF1eUTr+L
         TTTNgbOLg/4QD020Cx7XQt8dIw/AjE7UoUpmYOgEe+tNmFWjvyo9bA/bvacvwqZmcTyq
         K1ML8TTAed1Ce7U87SlAAPCyU/VCU9Dy7KoXVTVlFqCPjY4yFZUWcvCvHc/PgjuldAwX
         JPgWJ6HbXqGHBqXuaqCtwdvgJ1326sNr4ew0JiCNoeLtluQUnE2Ri5S5hnGSNlCRp9La
         T3ZJquk487Xd8+GyuVbvi7Gqkn1rVwCQQZRLf0u/upQ5wKeu6zZ3GeQcGzgIa5481Xfq
         gSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595078; x=1796199878;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+OgTYY8n6yc3qcbD3zimkqKD2AWn/72ixSa4WihkrKk=;
        b=TPtjKxUy1E6kYWRhSqfdumknDx0j0nndxz67ZfIxFaTwFEwraIMOvatl2g/4IWUCRF
         hjGm3EfYlKmcxEniIASDrqE+at5OfKTFytY57jjTuhEZtCvoi46UoTP1mREcKYxISytf
         dZ4Ox8QWG+S3L2DeWlKhnXL2Kqmh1DhsYEQS6hxzWkan6qWXx+2oBLmSUJErJT0Ecyvn
         CQwcYGZ8KcPOcyWPevYp58RhFl7EH+TkBEzNDMdyL5Cyh46ze26dvHULwu1LIVF1aIx6
         LzyR6Yzx1LTJdLtX+6QqnOB4fgY/m2IGJzP4S+Gt6qKmFGoxuY61GeCNveqNLnGZ+AQJ
         /KCw==
X-Forwarded-Encrypted: i=1; AL+hErE5cylSCSFskI7WWCwK6QipyoUZftnfXJmPE+YDbBMBrPI4VZ+rHtGTMLkGOTnSeXJq4l/gglq4l17ixpODkyquC+I3@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZgzEXiwjieavFVBM/tmqwdBKFzguP+pgidlfbrwdtjlvaiv8X
	qt3AMsK1j7p9arwCjWQC7g1DbSFoK+5ZiAlGZ/VVKgh2lpg7dI/DY00R6m9rUXTy9iKRxxrVYAW
	lwnctSNkfgkMhOQO0F8VMVJpWnEObKxE=
X-Gm-Gg: AZFdTZeJMvJIfSQBYmpv1HYCCEig5uXOmPYkQQLRKOf4oaOHdf/y+yTV7N2mryHKdz+
	XSCqpjX3pBHCMyJH4mi9olC6W9veNq0phk1y0cTe2gsRGkKmqKqw71P6ATnKwnGRimIMYT+GvW7
	cpALnrjTsATsvOrbRguWVpXzv/fXc8uon3u3Kzj2tDe/nRv5ClLGsnKImbEhbsi5gQWxT50/T7h
	8VRSP43sE7mhV62qVBSsmHpoDSj2PROsq7TRIUsM2Rxa+4xEfspZ+wR5vGCpYS/n8PqPumuMxbi
	TcgbS4AlmblLHgbtx0UHlsHjQQFOVQKU9QZX0u8FxgaGKKXok43Ty0+bwrmHAEcPQK+6XgaBj/8
	RJ8NHHg7dkI2wcjwucv2Pkkzy4zLTIRKFeitvzw==
X-Received: by 2002:a17:907:fd15:b0:c40:9e84:942a with SMTP id
 a640c23a62f3a-c513aade153mr1426627166b.48.1795595077992; Wed, 25 Nov 2026
 00:24:37 -0800 (PST)
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Nov 2026 08:24:37 +0000
In-Reply-To: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
References: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Eduard Aliman <edialiman20@gmail.com>
Date: Wed, 25 Nov 2026 08:24:37 +0000
X-Gm-Features: Aa3M54o67SCsnlpq9AQJICAL3atDqUTbJibGMy_iK-r2wySf-JoH44j30Oevkfs
Message-ID: <CAA4HgY+tuBiz06+uq0nfBVfzmVCVPatb+9LGdFN8L3jOPSNfqg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] platform/x86: ideapad-laptop: Trigger the EC on
 YMC events following Windows behavior
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
	Andrew Kallmeyer <kallmeyeras@gmail.com>, Eduard Aliman <edialiman20@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mahir Faisal <mahirfaisalantiq33@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rong,

I tested this v2 series (patches 1-7/7) on top of Linux 7.3.4 (Fedora 45)
with ymc_ec_trigger=1 on a Lenovo Yoga 7 14ARP8, and it completely fixes
the issue: folding into tablet mode now physically turns off the keyboard
backlight, and unfolding restores it, matching Windows 11 behavior.

Tested-by: Eduard Aliman <edialiman20@gmail.com>

Could you also add a DMI quirk entry for this model (matching
DMI_SYS_VENDOR / DMI_PRODUCT_VERSION as in patch 7/7) so it works out of
the box without setting ymc_ec_trigger=1 manually?

DMI info on this machine:
  sys_vendor: LENOVO
  product_name: 82YM
  product_version: Yoga 7 14ARP8

Thanks a lot for tracking this down!

Best regards,
Eduard Aliman
