Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA8537CD45
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187780; cv=none; b=pnJazczrIuSpxyIPcJGo2yXhGZQ0jOq74zs2Ro4l7wulTA/bgqwsigC2Iu2KEJX5fQXkrs0aErop0EBGoU7jBP7/HEMG/IH6I9ek5yWCjOCqZGJvIrUJLnMMa4NcL/AGhytdistDqJXKnHenDYyVkwkDMhLVVzNaDYdB9ClzuhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187780; c=relaxed/simple;
	bh=sp7moOFoU87sCpnpLRLXygO7kV5Zv5K8JRGo+3bzcNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fr7eMWrV62Dr49qsNWD95IpFH9couDmRYxyZDkWgTgvyXDdSwo/iZevEzbSTnMo/cyIkzs9KMEE3G7wgb1Q9YozcSDPf8mxnps0inzZj6PMvay4aw3rNvYZFnC7pYzvVkXgmBgCXSQlAsk0s+jyqZdWoLzcsZJ30OifJXmJOl9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNwRMr65; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNwRMr65"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso13717375e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Oct 2026 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791187777; x=1791792577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0RLBXv8GCFvA3UGkYd6Vj6CuQ4sgMyjZDG6+lIJvG0=;
        b=WNwRMr65sSzCDbOqcWkfdFXNmq+KAQaiurLJU8dCNJJW7ct55202RdvRyzhpPKJig0
         JP/F6nzmlZF3HH38xvyF5YiCShvaqET4UqDTT77b0Zwd8MeMtkc9xvTgE83WQCKX7VVy
         NRlDK/CJsRnBqNyAKtXDTM7ExU56FFUvOQ2lw8C8k7FyiX5etn2v/hWfHBaPnM5sOyAy
         PBp+435F2cZqkTpOh2wGz1PabasnOUbblXGrp911qgsx06QSgIWgeyQX8dFLFG/paBQN
         cNgHCZ3KdnZ3yfRvWCqTJiBisa55/LQwD/TdDdsBQXfVHM/xe8nNOa3jTBoYP3oudA1J
         h4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791187777; x=1791792577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0RLBXv8GCFvA3UGkYd6Vj6CuQ4sgMyjZDG6+lIJvG0=;
        b=cMrDG5RqFOvW4tzgHN4/05Ea7Paz55XXmq81+t5dYLKxajR0pdiywgcF0spDO+BF3G
         vqkiyBG/fB/IDFSJrZT7fsgAafXqCJzVZ4ShuRFlewYuno74I4s1nUyXqdLPcv4FCecM
         l9geIX1QW+sN39YF/F/wD7p1cvDyUuociH5FqAM/IhB/+v6EzINL0gcuhuQz2mrXee0v
         LEZACsXJBg4epF8QewaFEP+jqUc6Eea6chfJUWomFj+f8ybcsU+U5T0OWmH2VYU38mJ+
         ea7OFuSLwQ96MYHB6HVOnoYAGC6wfHPalQf0z05PlFW26snXltmnuLl+lZl7nTGbniAM
         nLzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCtL5wzrFBSmcdQN+B3HdstSSJM5zPBgxLQNN2jCcGZtFPom7mUgNb0g3g245AOdvvhdTQcZFCDx1bVkprnUGyqC00@vger.kernel.org
X-Gm-Message-State: AFuF++nTudeZh7X59lSxoCVNY+JcASLcITM6/2/Q14L26H7lwI5oD8Mm
	ahZIo3izZmdMeapirrjxcp0ApUIjwsy1+K5VeRq4oMcByHljg8xFbfxTksl/0Rtw9ts=
X-Gm-Gg: AYBFou1B5tNiIMns0EeGKBsdRpqRqVE+Rtr6MO1EfO4ZOvTECqUYEh9+Fha3avkukJp
	ueauLVNatgQO3hfVNthrGHN+IsYNBzizH3ku2JXc1VjnokA7i2qrJYxY9lpKVqf41fp6t52NvUP
	DDdOnXdFoapvWwcx5ZZdaJeFefSvNisZTThzLqYw52qFL0tCJFo0XizVX9rVVwAzzQ5Gu4JwlHn
	ChwL2prDjlyf2odeo5vGpeEX5FFZOL6UtCPB457rtL3m93wSSK0tV88zJQikhylCJjEyqvRyKs0
	QdbmTdZrk/cdepyvjync+dWu+5Ng5ez95Q2YjcZKv7SzIKBcq08R6FOKgGzkteVEURrgIZyYmOO
	BMYSY9AfUWSd9ddp3egM5ojfg1fJ4CGSGtqbQhlz7Gy4DqV55kLURJpFXzyZqReRyboFEnLWEG6
	d6LA5bXjgT+TY9KMflpvcHaTuJj/KKX1zq1yobzAI5S45dU0kEGsPia6IC/js2aRXxNTc88ObyP
	5yyZox1OykA
X-Received: by 2002:a05:600c:4594:b0:4a0:22d5:908c with SMTP id 5b1f17b1804b1-4a1680eee54mr83735285e9.12.1791187777343;
        Mon, 05 Oct 2026 01:09:37 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:ec49:36a8:7075:6d05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ab326sm1850803f8f.35.2026.10.05.01.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:09:36 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:09:34 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Alex Robinson <alex@ironrobin.net>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Steev Klimaszewski <threeway@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Lenovo ThinkPad X13s embedded controller support
Message-ID: <asNbPjMB_Jf9PL5C@linaro.org>
References: <20261002154231.31376-1-alex@ironrobin.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002154231.31376-1-alex@ironrobin.net>

On Fri, Oct 02, 2026 at 03:42:48PM +0000, Alex Robinson wrote:
> Add Device Tree support for the ThinkPad X13s embedded controller,
> providing keyboard-backlight control and firmware-driven brightness
> notifications. Its event, backlight and power-management interfaces
> differ from the T14s EC and require a separate driver.
> 
> EC wakeup remains disabled by default because lid closure can trigger
> an unwanted wakeup and no selective event mask is known. Other EC event
> mappings remain outside the scope of this series.
> 
> This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.
> Development was assisted by an LLM, including analysis of the X13s ACPI
> DSDT and review of the implementation.
> 
> [...]
> Testing:
> - Confirmed GPIO103's firmware-inherited pull-up on a ThinkPad X13s using
>   a vanilla kernel with temporary probe-time instrumentation.
> - Verified that all three v5 patches apply in order to Linux v7.3-rc4
>   without the separate PCI workaround and reproduce the current EC
>   source files byte-for-byte.
> - Earlier v2 hardware testing covered keyboard-backlight control,
>   firmware brightness changes, s2idle, lid-close/open brightness
>   restoration, and EC wake events. Those results are historical and do
>   not establish validation of the complete v5 series or its revised PM
>   handling. No v5 build or runtime validation was performed while
>   preparing this submission directory.
> 

Nitpick: I assume your LLM added this bullet point(?), but for
submitting a series upstream this is kind of like "shooting yourself in
the foot". You haven't tested this series for 3 revisions and your LLM
hasn't even build-tested it? Please make sure you test your submissions. :-)

Thanks,
Stephan
