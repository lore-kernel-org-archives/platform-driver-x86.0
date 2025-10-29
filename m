Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E6530AD0A
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734432; cv=none; b=CP+DKKiwlpvIf7EqqM/lrLQ8pS7Ca6lczLP98vT6Tn9S8/4mooPw707hcxGaLXUBYywzhCMxoAZ9ZH9zgEnPqVwARApyPqWJEaS1x98QUUaFdZ4Cbjxx7szHhU0Aw6q8wnyzAahggrMcnUgKYkWLnAhFX+OyWeeV5567mXWSn+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734432; c=relaxed/simple;
	bh=JfzAn9sSDc1qDJVZK96W+YHwxa+dh1iExC5K3+gvRks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxdHbcteaE5MW/qiBqN3JVlOVj2MB8qNdKvDUuRqWrp0CBzy94sWu3gXluZX6hzypnHPt9eCygI3abkw2CiC7ruyO+ncfH/nDqUxmGnAvwo7j7xpIXCtEStxR/hQAwt9A/b5nI2y4fG0QBwUybXELDcqCDTJdmkIRku58TrYmVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B90kQBey; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B90kQBey"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-592f7733dd6so7523035e87.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761734429; x=1762339229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfzAn9sSDc1qDJVZK96W+YHwxa+dh1iExC5K3+gvRks=;
        b=B90kQBeyS+zPJg7F0wgBnAKs9GiRCuz9v6d9LDEJRe4R5Higmlzol9+w0+GhCnwYAD
         3z1uvjvNoJyoW7w0zkCurW+FQsSkqbSqpSDQykRlM0qUGTjYEYxUjqjAPluZfAYTINM5
         Sue4u6Fpdaz2EcwDf+QReYuTHbL+Uhjad+fqFYK1+/VwNGz5GeuIiHz35nFWQbDJCAis
         k501n11ZL9Gv/3DpuaLD5PfH9X9zF89GnMySJgUfVezpJl1I/FR23h8nPxzuSqDSSJzU
         MAPrP8v8RLJVGGhAWSSec1Pm+yIRWfCWSx4gt2hXVkmvNaF38Z+US6fc1rm+MOQXy9Pj
         Twzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734429; x=1762339229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfzAn9sSDc1qDJVZK96W+YHwxa+dh1iExC5K3+gvRks=;
        b=qOiknzuzjpmIb7UTEA7XUqGge/Byap8EBnRNfvmUQWdyg4SgKH+gR1ZA6Z/k5avLlY
         zraNmDMSfQSAnJJcif84vVXcbHBNI4SHYVI1z89HgqJFJlpq2HdMPVVCBo/lEcPUu4/x
         l1gFETRrq9YmmuOWlM/dVAggRi2ELykLGOrKJR4HNVu+DOkLrFBcoGlNgMZeDcIvZhx+
         PkBxLeznkCddZcnDhy741Bx/Dmym/WqXlt8NmX40X05rWLRP1yZxx43HDqmmU7meutoS
         NbEhzyvEyVBdI2zkD1cVy/b6WnPx6VbgLeWI8uMb7rV6g6A4GQnIeorSM9HcHXp0UhgT
         /5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtVshQa2NSp/0XOU+q7iQjFyIp7UROu+Rw+widNWg/KB4IVEzA19YVXJ0B6ZR6X7CUcCZfLBv6swhJTxKH2ZzVlJmM@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLZ22G/uuhNYltd1rWvNKU+c9PjavqOlLt1HWfQltRlQ8+nLD
	klt5qBZ92DNvMX9oSGBaJ50z6YgZccN7fvLhziKmcneZvK4oXXad9rwxVwVWUCl32CfNOhuRboQ
	oG+uWGvGKQV+oMBAK9pld13MpMsEuU0Q9pd4inI5xBQ==
X-Gm-Gg: ASbGncsM2ji7FnUCPsKfen9Yp5giNFHareqoe6JPVG73pXXCysvLsXLNwFhgEs1VZlC
	FAFT+TFBJe2fQ0Pm2vQh54HvOltC9kCcO+20H5bp2St2SifT9oS3czGmYGYmKdNcaLPLvUIPw9U
	EwmQ4nwUB0bRo95T1mBPpZT8LtmRQnKKUr9D2yGz8k0V3lPPrtlxLBKi8dovPhF4iBrMSRyU4sr
	3wXnPjqqmxECb8PIhk6upCy94jPjA3Vjpre3nMMXJsqD8Qhersap+oIP7bH8viyI4gSrUa3bn40
	lLYpQygIHaTPlHos
X-Google-Smtp-Source: AGHT+IHyDLW+hth4EaXe4cLca2vPqJJ5c/R4HYjWQC56YL1rSNqEk6nZ5SgVyrFqOZiGu1SitPQa0Ycy0KVVQyOFy1w=
X-Received: by 2002:a05:6512:a82:b0:592:fad3:9d02 with SMTP id
 2adb3069b0e04-5941287142bmr760380e87.22.1761734428954; Wed, 29 Oct 2025
 03:40:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029062050.4160517-1-raag.jadav@intel.com> <20251029062050.4160517-3-raag.jadav@intel.com>
In-Reply-To: <20251029062050.4160517-3-raag.jadav@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 11:40:17 +0100
X-Gm-Features: AWmQ_bnr-3SjGf9coBjCZmyQe_Yu7Q0DUNbpdgrzhPxUmo6g2IaZATu8NPPB_bA
Message-ID: <CAMRc=Mcz3df6KUx6q5MLGfB06jQhBTGfhCM7yovHBE3k1vn+nQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: elkhartlake: Convert to auxiliary driver
To: Raag Jadav <raag.jadav@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org, 
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 7:21=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> w=
rote:
>
> Since PCI device should not be abusing platform device, MFD parent to
> platform child path is no longer being pursued for this driver. Convert
> it to auxiliary driver, which will be used by EHL PSE auxiliary device.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---

Are there build-time dependencies between this and patch 1/2?

Bart
