Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22657330307
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 05:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745214; cv=none; b=uYQydkfg98Bhh7GvoUH4WzY2m+M0xTZO74JMrHj/8l/gOsmaF8LADl7AnNOg9021BLsrPaTk2koyHRA7HuHfpHNDr6HPWFKSuX+i0+5xoOyo50X4K7DudaSsrr95kQa6KRBgPJeYv264aGM3qmiX+dzJqp7ypOLa+42jE3u/+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745214; c=relaxed/simple;
	bh=MypcxZlDJd+r7SofOnuSEe+Q+SDR8+gy+W2gDGm+htI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWV4Um1pYpHQmi4IPn8qVfRyGJd6/YVOhf61Yhj2nzEhjHlWmq9xzfkX1fY6fhMwH2h9WUogx7Z7w8v2luwVERfz2kgBmoSycw9XSX8N1O5HTH4AU9YNQeP0i4DKGT5p/HzsPBYDElxMKgYJ2wuw0n2L2MQNWpaiV11SY7cGePs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaF26YjB; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaF26YjB"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4843971bdd0so626334f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 22:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790745211; x=1791350011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+c4qh3TxeW41f6Urn6eqBomxhi1RyxqZL+PP0oFbtfA=;
        b=ZaF26YjBt5Tf/Urlb2fYs5tk03xGtB3BHGKJFDGiWK/Ka5s/QlKBoY0KoPnJiDYOjl
         eGELlzxatMebJa68buj5kVv7/7tycHuzILBYZ2fZf0gjLH76W10IjH143CVhf7hku/Od
         QxxK4kvkO4thY+4LeyfMs09wCczdpZHXDA9JUVvhsR9lceYGf5A0y2+fgXHZCfnyDVEn
         gM6La1pqqJ2oRhK7jrBs+YRQE9M2B/dzh5JvV/OCbvp2STYr3mHCq7sKL3584XIiuJ1S
         abXtjqYzusLnHCnuo/d3V0Aaox8bJDuwlJpTms2UOS2VdOrsETQcX6PIqxAA/73UvvFP
         cOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790745211; x=1791350011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+c4qh3TxeW41f6Urn6eqBomxhi1RyxqZL+PP0oFbtfA=;
        b=VdNf0uxlvRck5QaQC+52bDtmx4kDctHe4uMPbuoysSn02Kdw+nqqqbSOrkEHkAIaE+
         nvzxsHZcGBVpBzCbJVSyYz1iTgrU6b2liTIEms0TAeuej5/t6vs7M1jcPGSPklT6XWjc
         Prb4xcNZRUBT/jlak2YOlea5lFTw9vCbko+0LccioHAOiWf8NJUD4WCfAVF3hYxnB3Be
         TIF2RMC2xHSB3bozrI+Wiezdhf1IMKwUbXMLJxOBFB+cyc74CO1+XiCS4qOyjNFZBY0S
         jIqltpnLl8fajqGHhMfYjzQX6x/gmnlF03C4E+Jnbph75v22JuwUR3r7XjfIwhyx+CA9
         9sJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfCh8DfPgw8aJWaRKr8eQ6GxytbPstm95qcNI5nfBtGhCBjXRbY52uC4XqJ98YHq/+w1KFsWNio3QQT8xVkCPcCHWG@vger.kernel.org
X-Gm-Message-State: AFuF++mxW2TFMdtCNXAbhgTMn3ZeWb1kMvDjgdSBd8dd0hDvee0+THVc
	YgeYGOf+oL5G2Qa5jGshqSAtlAdgf5LwcRPm0O64XPxnIqNwdxNs2sSr
X-Gm-Gg: AYBFou0l7jsByWnj/9L3A5DiKnHzqperTN+htUFWWNoXfkFsxKD7S1ffzpqJUNesyiF
	DAecuSqERs/aUQ7++BHi24mGkgEjI3N35x3emCalDR3qZ9gBY5OEUciU2F9C+0bxGhtLTp+hkFH
	EifF/Wt5CqHtOk7bkFMzRGtxYWUjXhxrucFZnSgPT96mnAdRkHB811h7cN1i4yoKxd99mhMzrAk
	lcgiVcNzUepKfLyM7VXigpUgNF5GBmHOeLHcWNTz/cUsEa97aTSGw6j3P1apHXezA7FWTVTO3n4
	f1Q1ahokc1yZvKMaa9aUoieQjahcqkLhhRjWCyXL9gon8+nP/1hZbTMenoQzzkCBN84jJJ5ZmnH
	Ej9sbEPCBPJCUgSg8mP8dAJ4Hk2qFsuow/mmnLvFYJaINv+NpcTTCGfty2Wd0D1HSo/qdeZ/uiH
	Z/b5p/05dcXr2WODq3W3jEL6toBqaBDL65hlYtNSWTJ80KQagprNFn3iUGTNffmktGQawYlW1pY
	/kxh9zQuNIZY+DZSirF
X-Received: by 2002:a05:600d:82e5:b0:4a0:1a3:bf6 with SMTP id 5b1f17b1804b1-4a01ab4f1abmr2284165e9.0.1790745211216;
        Tue, 29 Sep 2026 22:13:31 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174d8738sm36542285e9.2.2026.09.29.22.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:13:30 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: tim.c.chen@linux.intel.com
Cc: KPrateek.Nayak@amd.com,
	Vishal.Badole@amd.com,
	justinstitt@google.com,
	kayracizmeci@gmail.com,
	klaus.kusche@computerix.info,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	mario.limonciello@amd.com,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peterz@infradead.org,
	platform-driver-x86@vger.kernel.org,
	ricardo.neri@intel.com,
	stable@vger.kernel.org,
	x86@kernel.org,
	yu.c.chen@intel.com
Subject: Re: [PATCH] sched/cache: Honor asym packing over cache aware scheduling on hybrid system 
Date: Wed, 30 Sep 2026 08:13:27 +0300
Message-ID: <20260930051327.206529-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7790ab6c5da3aeac42f6878f0a167c6cddebb354.camel@linux.intel.com>
References: <7790ab6c5da3aeac42f6878f0a167c6cddebb354.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Are you saying that we should update the first chunk to add an env->idle check
> to match the asym_packing migration pre-requisite? Like below?

> @@ -10847,6 +10849,10 @@ static enum llc_mig can_migrate_llc_task(struct lb_env *env,
>  	if (cpu < 0 || cpus_share_cache(src_cpu, dst_cpu))
>  		return mig_unrestricted;
 
> +	/* Prioritize asym packing over cache awareness */
> +	if (env->idle && sched_asym(env->sd, dst_cpu, src_cpu))
> +		return mig_unrestricted;
> +  

> I think this is a valid point.

Yeah. :>.

Thaks,
Kayra

> Tim

