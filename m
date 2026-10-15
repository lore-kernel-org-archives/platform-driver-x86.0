Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A44AEBD2
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052728; cv=none; b=JEWI0uCo5BDRTkiZDuuvOVRB1PttngWaVfv9/ipIjtuvfHNKX+qMiBVregn2tz959bsUxHru4rbMM7fKcqKZSmXgwdDHWn474xMelJwB4RPRMbUa8la+B3ehsyh5rNeCR0cDbGB1kzCtS4G+naTSI/QFSvAplSY8YsNqEZ1LuIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052728; c=relaxed/simple;
	bh=MjGHXq0yR9Gpo3xrFudvRWYYUefJtXK6z7zXZk3zLic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oyi7kh7bN6pmN2c+U79LqG01fGUIXvbBmVwfvje9XOU9HxVri9EeinhwpBy8tctDhGNP5jeKj7Q+WeoVb9mO0gClbA1rng+7Jrb1VwCFX4TazbjJLw1pFBvoghDD4br0VyddWFv8VNb1M0BWE809aV632EJHa7bqlVTJiEhTT54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJlVG0Ro; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJlVG0Ro"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so22351265e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792052726; x=1792657526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MjGHXq0yR9Gpo3xrFudvRWYYUefJtXK6z7zXZk3zLic=;
        b=iJlVG0RoylsmHtfdnUUWKj3ZTp0HL7VhAFwbyCK/A8NqXZSaAYs3+rd5DUUEYAKzfk
         s1rCdOa1OoRa/OkSQbCBaA0AdDdIRTwQ5k0SzdOdYzLWfflpSLbhihu56idctutqAdZY
         PB+3vwZ/b1rsGRwAbEP3PRsLQ/7Ic2LlJ+8pmd4LyX5uDXInz7vEYKJMctDkvAndkdVD
         b9CcfMZXyGLymW9mfrhFQIi8sX5Pfvm0IdXBFA5WwOGC11hCpXQfpM8+xP6rBvwUrdMc
         G+qCanUGqUFpFIukNdgIchl7MDp/ROmPd626gsEIhoWGxamsilSfzPzq83y5LjfbK7Qc
         KOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052726; x=1792657526;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjGHXq0yR9Gpo3xrFudvRWYYUefJtXK6z7zXZk3zLic=;
        b=a8FD4jSiSXPBCzpVV+Pt65OpGVxea+twdOPXHi2MtvI8SZVebE04iaLSHaFInzTLkZ
         eFwExeh0FTxCwa9XdxLXy6d4Fhpb2QwNRJFW5X9Py9y8SWk5R566SH6Dpji2h9X5KRyH
         XWnILwcUY/aoEigAzvkHZ76szZeTlUGaPVWCcjT5qL83bl1ez3AsrFIAAsud+AAJSlLK
         ZTRxpc8JAlspiig9/a/bJOWAUikQKUPfp+M7gHhaVH08sbHs8n7dfLhzMCIpchkG6ss6
         FlL8VrcwXQjEtUh8Zvl1rEAfNKb2pmjemADbDmpdiKCQkxsKu03MTBm/EqMIlgwRnzXy
         BGvA==
X-Forwarded-Encrypted: i=1; AKwUvBw+gshWJ8xabWtk3+vZwsLL+s5H3Ks0+rFbCh+xHTNsjY/tf3BPOxxEMvKnGNsP8/FpkYiYarxxpwEb5cB861F75R8X@vger.kernel.org
X-Gm-Message-State: AFq9FYJeCBYcfsFGDpQNLLQ3tdSExJ/fSBBztjPpOlwl9ixFxE68xqO0
	sPdmj8rxkctvsdC5wdt3lQHke0e5B3s0zIFzmU7lo2fFAiaaXZ1E5ZKH
X-Gm-Gg: AYBFou26rfg2bbYkSNGoSBnSljHvknkRs2b2K+iescTa3HAfghzyNOr7Ht0ll789Zvh
	6l79mCbiiT619M0xQqoFM3RvOk9/raf7VBqKlZcj2s4AGEsef3NX1XXrN23+9gArR+28F6+7wBj
	AvrybpB1LqXtx2O1+fq0gwLHTuybzFWQ/r79drXcW//xfvZrd3ZAo7EHGLvQotYVtyMNacfKdvi
	3nUNGyXjte/Y/Ukdj7QCHqA/P63iCbQ/hV1R1MVlJsswnF6eBPTfdIAmMz8/ZGfB4+essQMIbSL
	AgY+/dze/Yl8hl1yY526Dmc+cfI+T4cglZBpg15TolnbWGkjjoHAeoy79JzcuDbf6oDvVBWPUZf
	YKp+g5+h/au5+4oyTlyQGQD/tGB7dGPbiQVEqC28BX0mTVijuyhM3pUb1Xjf6IEoUy3FLgXPk9U
	W5qdfKjxyPZlWrUvGRitJFe1povMGhVol1nvMbhIVenpBj8GYGAiKOY8HFhxQcjvA33R3UVFltx
	mM4MZ4k
X-Received: by 2002:a05:600c:4ec9:b0:4a1:7739:f9ab with SMTP id 5b1f17b1804b1-4a18e4ca953mr370896815e9.20.1792052725437;
        Thu, 15 Oct 2026 01:25:25 -0700 (PDT)
Received: from localhost.localdomain ([94.252.74.55])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67a080sm51822765e9.3.2026.10.15.01.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:25:24 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 2/3] platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver
Date: Thu, 15 Oct 2026 10:25:16 +0200
Message-ID: <179205271598.452373.17818636318443679532@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3df5fce1-509b-1362-3b78-8f79337ebc05@linux.intel.com>
References: <3df5fce1-509b-1362-3b78-8f79337ebc05@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026, Ilpo Järvinen wrote:

> Thanks for the update. I've applied patch 2 to the review-ilpo-next branch
> in the platform drivers (pdx86) tree.

Thanks!

Oleg
