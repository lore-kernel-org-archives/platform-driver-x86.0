Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507CE155322
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 22:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886994; cv=none; b=Svxc2ABAUaL0AMZsgcz69IAEPH7AM9qW8v72zQEZBbS77VesQmxelc05ZToWlw6Ky7AvYgpdKMvcQ3xIKig8LVYkQeWX3NGb0ZHCovnpq+o7zpN17c4xOljOreaJkwSB1gLb+tNrywXJ/6Ko0bQOu7V2HBdFwc+AxtY0E2es5rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886994; c=relaxed/simple;
	bh=qlEpNobmE56jE2zb5NLqeNknhFq50jKTG+DPtrE4fgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciCIVCUMXxZZL9p76oVFO74fI0sMwtmhrq7Ov8Jm56jGUoa4rEe7HzZy36x0r1S2ozjhYeM1o+CrFTwheir4eZktikP7F0PlxQtnCiJbA+ZhdGjZvLSf4A7W+udRJd7tJvuiuaWHcX8cIVNenLiCFwtre4WxlXooA2sWXnvDcV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd9L79nV; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd9L79nV"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cb5c9ba82bso791444185a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 14:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771886992; x=1772491792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlEpNobmE56jE2zb5NLqeNknhFq50jKTG+DPtrE4fgU=;
        b=nd9L79nVgrBex4Xr04uZdFEumNV3FCCGUW379ydpmgp8CRCtGSQzzStwvR4LQtt46x
         5iTV2UNW1o7MI5DP44rBcV8XWyhnNxvcNC89RcnEcXTh1fzMc9wzZ405H2imuDMyip3M
         7xB4QhaM5Q5o1xW4plSfNn/2X03JsXvZYJnCWpYDjwYI3ADaOQRkfgOuuW2WnBjxNTPX
         K0PU6eXK8phdu6+vchCmYF4PE6gfM4ifyi/DumREbtH3BiUrYaDZXTpK1N4H0MGa+/bs
         fyCe2U2NJfk2QS9Zo1EvD2/w7coK7+a7pfghaneKy3Q8XS8N1rwDKcBjZYqLCDULXUXN
         Lwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886992; x=1772491792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qlEpNobmE56jE2zb5NLqeNknhFq50jKTG+DPtrE4fgU=;
        b=HchB9ZutW+mCLrWW7RfFCiWskCftec2tBuplXMD0+Rag+YNytG0ygzzwiHwKddEwGf
         +JWnerrpxulSo2a+ERG0y87LOKE5QRmjBQREw5tA95/wzy+S57d4G88kLJo1hM5msmex
         lMELlN9z/sBAAvvwMOCl6n7JwlF9ApVjqgADucg4JtconDkV0KtDMOlF/YRQ50cZecJZ
         Ad7zDdwqDgPniJ6zh6Ibf3mh8x8CTxNr+oh5XWYQOul4gI6F2FCG5ClmZju43pK0YrLk
         SM+QeNzBKoyYTAp77zSULc89EDPP15CUMryMYWSwvfzDf07GUDA9kUxu2SPUo94B3ARQ
         +ewA==
X-Forwarded-Encrypted: i=1; AJvYcCUjGjZtuT+pXSPVem2qUz3WKHK/4qj0P6SqRDeVM7vcC8CtVqY4ej20DsHa9DOKGxX5TGpxk0lNpRFNvOUJXIfOx4RQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/iNPXoGjWSE0dsCFdVJUzo0dEQs/TxPBpFwA0aExA6aDIbPit
	TuZHY/zZmAw79EQss8mblpkm4rdAqnKD+Sx/6bVvOThHHNy22im9VqeN
X-Gm-Gg: AZuq6aLqjgDDBeYOJBv4NUThxpGDGc1GU66jWgd3GGwR2kXb81Z0GO2opeJmX83XT6Y
	qFt1k+B4FWwqfPQAXfRrp1tU3CxKZEXXJQZc2UDn+UbvBaPc9c2Xgl9eMVJEZXzuaZ6MLarv21o
	fxnx7b4ateApHLOuJ0r01ruffFCQAMzFCF8lNf/KheLMjjAsrlPQwc4ddbf3Oy8zUaoAsb11XcU
	tKz45XI6gfg5utuHg+DH9aUKUvP8MFb3yM7LP76xrydL+DTjmxi5yUUUhbNqYBFBnOwt+lu57Ds
	ksImBM2Yw4wIgsBDOugnkKPfI2TNSqKDVOVxdtoaMqJPEiixvBCZGsSTIQYgow8r6RL4Xz3S0ia
	j4CeUKcHHbqvyG4OdpyxJyaWxRPPLTyihEaIN34OizARfP+YwTnvGLcHh/20v88rCYq+HCbeKhQ
	w0Pee/6Vl31lpgEpI7Rgu3iE0wI39WiYP9i7F8isRRE6uHiQ==
X-Received: by 2002:a05:620a:371a:b0:8ca:2cf9:8197 with SMTP id af79cd13be357-8cb8ca6d928mr1338040585a.47.1771886992064;
        Mon, 23 Feb 2026 14:49:52 -0800 (PST)
Received: from Jurij.rolna3517.home (d176-77.icpnet.pl. [109.173.176.77])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8cd9d4c9sm836687585a.0.2026.02.23.14.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:49:51 -0800 (PST)
From: Daniel Kamil Kozar <dkk089@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: dkk089@gmail.com,
	hansg@kernel.org,
	jorge.lopez2@hp.com,
	mario.limonciello@amd.com,
	platform-driver-x86@vger.kernel.org
Subject: Re: [hp-bioscfg] warning from kobject on module load, OmniBook 7 14-fr0220
Date: Mon, 23 Feb 2026 23:49:47 +0100
Message-ID: <20260223224947.12052-1-dkk089@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <42962490-6817-d7b2-c6ae-a300676a001a@linux.intel.com>
References: <42962490-6817-d7b2-c6ae-a300676a001a@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ilpo.
Thanks. I can confirm that these messages are gone when using 6.18.13. Sorry
about the false alarm.

Kind regards,
Daniel

