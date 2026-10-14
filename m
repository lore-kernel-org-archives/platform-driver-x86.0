Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF168566C73
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000277; cv=none; b=Gd389EFtG8Q6KdayqFVvcbVBWv/xBARV4gPgaqDOQaBv0kmGSB80jf/WjvIwppADfH7iKJHGIjtfwUbiQ3GcZQp0iTUcv2FL7c6bgJm0zifhWtlkIJCFteksyYfcKSyRQq8hZACz7fN1KiLO6LjGFZPjWl8HzMOxKCJaCGNP2Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000277; c=relaxed/simple;
	bh=7iGNeJmfcOi2YoNxyNO1yWmrCItQX18NxpfvwkGF9MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=im8yh9c55BT6hORAm7NfWhB3bbmI70FrlLPs4/rP8Qjn6Y73ju4cc6pFw1ZTj9xOUszuTkAKJ629zDrkOO6dG35wwE4gtpsmL6KxvVI6DT50U+LDFrzkM9r5nQh6qYRd2NfBQEmeLAHx6ok0kgqWjyBOoHdWw9BAqrWOrYadbDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6hb0nMW; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6hb0nMW"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1438d9363fbso386664c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 10:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000274; x=1792605074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6nF2QdVqRFSLLz3favTr6+7W+Pw3c0RMBGNFXIbHvjY=;
        b=n6hb0nMW8pWiyj0GtmHiqXijhDEvp+6GtRKBvjiiJvLZD7HwCiETPLsKnq6He+cH/S
         iVZew3J2mKYL2DzdRU6VfjfEZnc2szgBNB3Am1zI4w4LCCwC/NsM8MhjR8iz9/84PhSI
         6ZuruOcciRflSPPARQE/DS050JY4F6FMlJR62a9Qw5l1SpRWMaEyM6ci8ZOAbK1r4Jt9
         7MNrDaznpiIx/eHS/CaakDVl73CoS75kJ7XknCsoDDoR3rfbIjWr1BVL+DoK1+nlvwc2
         j5oY8WvNbnNvACHVhQLyl8YHne+d/0zoN80EtYELhGruylldpBwfHo7I+ENWRwganJvu
         uTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000274; x=1792605074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nF2QdVqRFSLLz3favTr6+7W+Pw3c0RMBGNFXIbHvjY=;
        b=Huk0ZEauY6wKfCqGB8KDxnSV4P8WbEfTEad4tkIXSnvV5ZU/0EHS9xnoyA/otAz5TW
         EhxUZFwFSlkHhrtPFtszdtb5a2fb4oYiJDl+IxhXAAndbQOXAZr02/AS1jHaGalGgUfX
         kJrw8OS00O61DGYGXAE5qJGApZFcbXvSB5wQS1kxOYGO0eTds5KIU1JvXc/ozLTUQofy
         C31ML8NG9YtkrFlpNz3h3ukFzskcgpN9+ZvOOJp6Q3qINLFqgmEXqtNPtcOYmvW7YHDh
         Jm52goIKDFKwXRFs9FwAtkwZ88Q9/KN0Kmpza3qCTCQEAxbKYatv7ngZlO+AFARZg18Q
         uQHg==
X-Forwarded-Encrypted: i=1; AKwUvBz3PI6rXc6PUa2BOADhQ7aPsAsYYFkQ3yIc0pkx3TOLiG7ctUpE60ZIzFx285gDNNBZz4ZABFUiofHXTmW9/QVz8f1l@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+l2DW5nwxTlhQgcQZFkaMvo3EUha/P04jUg/2J4VvXtNzEOA8
	ZxXvArNUKcvWeGOJvL18bEoPCW/Z7+DFsl40cRu29/inZtkmznqTV4QN
X-Gm-Gg: AYBFou2oT1Mxr5eGRWoNU7JxoUyHhanu6AFSA1HFy3WyktQPPNRBsLOVDqDvS7Rj6GX
	4v0ipZpsg/aWqHNr9yBcdBxk5bYZqKV2a/zLbIcsAPTqfKVHf1BkM4HiHdf7umG4IiM2lhQ7j2t
	7sc4Pgl+/ETo6jqwrVISkOXWa93My0JLYD/gKMiQTDLWs0wJUa7z4E3R/H5do/t6LiPSNElWpy2
	mZ0AB3pOaQMoMkKAXZBZ5Vw6JnTG5fBxtgyyPT/CkyHCnQq4gP89ceF3vHwR1A8pnq+yC3nM7J7
	Rr/Eufm75n+C157iw/PaRAYiWgVQWYLdGzcG7/Xj2IMN0h30HYyI63Dms2jXTjgHBYJStMn4Lyg
	D3Hm8N+AfCzt/Y/lyqsvtq/cgX0RoLOBZuS+4rSOO0iGHe5csl38XUtIEH4mmawkRF9gk1mJMhi
	zTd1+JHfW8QjamJpjmZINsb7mJ9uTJxHgJLQgaCzHhs/bnYx0fFEB0WRmD5f8BauOJiXChvfBzm
	iT5WVwZrPP7ltb2642NO/d56xvvkmR/vqfUj+dH
X-Received: by 2002:a05:7022:e881:b0:14b:1ef8:698d with SMTP id a92af1059eb24-16a5d174c3bmr23967745c88.15.1792000273790;
        Wed, 14 Oct 2026 10:51:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm48611107c88.2.2026.10.14.10.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:51:13 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:51:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/4] Input: use designated initializers for acpi_device_id
Message-ID: <as_A_l4h24eAtUE8@google.com>
References: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>

On Tue, Oct 13, 2026 at 04:15:21PM +0100, Pawel Zalewski wrote:
> This series is converting lists that contain the acpi_device_id struct,
> which is defined in the include/linux/device-id/acpi.h to make use of named
> initializers (which they do not use currently). This work is part of the on
> going effort in the kernel associated with device-ids [1]
> 
> The plan is to convert acpi_device_id::driver_data to have an anonymous
> union, similarly to what was introduced for PCI and I2C device ID tables.
> The goal is to increase type-safety (most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
> 
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
> 
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces. I already have
> patches that implement this and touching a lot of kernel subsystmes that
> use the acpi_device_id struct and that list keeps on growing. Therefore,
> I have decided to split the series per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers
>   (which is this series)
> - actual implementations that make some of the modules use the new
>   driver_data_ptr member
> 
> That way the task can be fragmented into manageable and independent chunks
> of work and makes this effort easier to review.
> 
> Tested builds on x86-64 and a64 in Yocto using 7.3-rc7.
> 
> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Applied the lot, thank you.

-- 
Dmitry
