Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D99F35942
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 21:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758316154; cv=none; b=hPg5s/9pLbOuS7Bi7HkcNNtnyyaYzV71K9DYoENBGdECWKI7KiWuCPW4EHaZY6l4nvOc8mkHpyA8DKbBaK3MqghiMeTagQVoW52lJ/EIhclJXntxW3BAah03Xw+PDQr3OLeB9KlKfwdU3If1mYkYmBAgp0SzXrSUAADJ3pmIp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758316154; c=relaxed/simple;
	bh=A3q6D3r64ECBS3FuD1J4+UKmWERI8/hBZIPQb47egkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNN7oNdRqKqrRttARRSnRgwb78qynM+gOlXyaDgeFMBSgTcmwtwcJhbo3AQw5LOlifhKNwoRMA9Cmw5OTpQ2hCiX2tFQAh+I+izDQrHAyglPNP1FoVbtkZJiiTJPiEcHZVxmadeh9rX7Ah5zQrgn404F8D7BYfEumNvYS6d0csQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6QLRoKy; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6QLRoKy"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b54c707374fso1825603a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 14:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758316153; x=1758920953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbk7TAYMPzATV98J2hKiPMaGGiFQLVhSI3Slan6yRpw=;
        b=F6QLRoKyIAJAcx3e4OOYpdzpAWxqNp04ikagNbl6RQjPCQbyyRPBPyal7W5baMMYc4
         16SqEj3B5vP8AJpNspaHsOQrsG7OSKPrd53zeS6lkD+pC0WUBJGkWUT4YgP2Uq0oLY9r
         ywvYhOtzx05FwfhsfdxQ88SX6+zYVQ29fE8RlKRWOOFgNXJsHrUznIcInEZVnCXqfD2g
         9BSy4yf9BfXRZYQB9CT3m+Qwez/Uz5Lyt4EgC3yQNuVfTA6iAg6YCof0s9uh/uy/eDU5
         UjMTSSk7rj3abaG5MHUDO+Rf2HTo634jPfrCSDMtZ1t5EcpfrcDNBOKnUQ0KV9obYWMg
         W47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758316153; x=1758920953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fbk7TAYMPzATV98J2hKiPMaGGiFQLVhSI3Slan6yRpw=;
        b=mGH+zhnvuYvyJLC569UJ0uSvegbXxLXewV43CBPC6pd/jqbIDNg40hCReO95N1KItR
         c3Izt04P3QlkqoN60v2TsQWK70N1lHSQgTwiFxr/YDY1GEW8IADzPIQ8I+1aNP6qRoz/
         tFHlUcSRU1RcVhyOfcCARWsgjeqhffvPVOgWTochQu8/e0B1LxcW5DhbqPSkXAdyIOMi
         KbDFGXJCjw55D0h1Mv3hHlXI2Nla6GHA9lPf4SAExubpw8QEq+GX4HtfqJgDrUSGAN+b
         e8CjfTxJkcOuyQlY/+93a+Qw/X+LylI2D7z/t5LeVmodFCMcwk4sFrDWMy1K2jRBcj9X
         J1sw==
X-Forwarded-Encrypted: i=1; AJvYcCXaltOz2eHRTh4TzjUCFGHw3I+eouLbP1IRp8kNH2nA/m8KXv59NikotTgWO8QrBTfMxwiZz2ccGLGUZNv3iDdBsMLQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyHrYjQdcIjWavtxmtuWQ3kJ1lsWx5Gdk0dNfkQceMPkfDF590P
	497Kv6G+LVcd0kqOfgzIXUWD7soiTd8EI0uq/l21BuCR/oU5WKiqT+kHJJEkIA==
X-Gm-Gg: ASbGncvekBKhHZcCuMjkVxW6L6jMX2AozQEc8WwFxeM3JGrEXUFxUyeohIu0MVM3gcp
	pgqKcB0GsiyjUSlcSs1IXGuCPaMIlcM6xm/9SJFHPwPtARmF9fwibTaXRAfLXejRW05lBudAHGx
	t6MvLwn6HzN4KC4lV5oUaHqQbqe5H4BnATPqlgn7F0Q5Ij/7kmu6d7qEpr1d1Fk/RMuGZ4JhAKD
	ss6ZkIQ+66gT/cinXE5UqgRotf5CVxLehxLP26bd+P4MZKamAPZFwC1ewluh52BIFpr4jbNx0Lj
	i7yUao4DiCPcj8Y3fe6VcACUv87S32KeSvhFetlKyJ0gB+QNRNIH0uIXIvmprzWFHukR8yPQdxV
	XWclVG+o7vf05rTqZDs5RpZ4=
X-Google-Smtp-Source: AGHT+IGrSk4jyHdRPmqjEZQYhvr5lExYu6iAGTU3zovxdHIOLwiB41h6reAHhTblL5jU/WO/DhyNFQ==
X-Received: by 2002:a17:902:f689:b0:25c:25f1:542d with SMTP id d9443c01a7336-269ba4f01e4mr58124425ad.36.1758316152670;
        Fri, 19 Sep 2025 14:09:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5621:6657:a035:d5ee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800529cdsm64052975ad.22.2025.09.19.14.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:09:12 -0700 (PDT)
Date: Fri, 19 Sep 2025 14:09:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 13/19] platform/x86: x86-android-tablets: use
 swnode_group instead of manual registering
Message-ID: <l4c5owihdantlfcciieytvgakvrajkbyysifu5ewl6tdwexgmk@jt7o6iim3nqx>
References: <20250919204742.25581-1-hansg@kernel.org>
 <20250919204742.25581-14-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919204742.25581-14-hansg@kernel.org>

On Fri, Sep 19, 2025 at 10:47:36PM +0200, Hans de Goede wrote:
> Replace manually calling software_node_register_node_group() from init()
> with the new swnode_group registration mechanism.
> 
> Note this also fixes a missing software_node_unregister_node_group()
> for lenovo_yt3_swnodes.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
