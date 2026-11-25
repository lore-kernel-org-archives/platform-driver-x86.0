Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648895;
	b=pZmIID2j/VJqzm80ELfq1a7/t0Ncdz8z8ybZNUPCs2iBhwtStNdwR/XW6Y7EF9B1C5NB
	 Aym8VSW/ZpZ78y5LMtVjx8iDCHhlfn/ZUY6rHLY+NgLMzU/cpJHwYaFE08Xz+fVvrPd4+
	 0zYYx/uKLL0aiVkf1qzwH97Jx7J1ow+jMRh+Qt7QjB5wpPvy7VZtFS77doN14VsjnEnNS
	 IqaNaPAYbQd5pdzk44yNsNpEMHr/b8SodvXim+YxtVI30TSkViTt+0GNKIGTSUe4kT4TG
	 pXTAO6Dpf3c4PTGluOmiVR8EB+dJizwNrW0hmnH1Q9vEqnSuMGxvyNT9vdYPLClEF3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pCW63ny83XiZTDhtRYPG7u2cPmHKUXsowEsKPqJdTRw=;
	b=JZWaARMIkgqAv9KtOzOOE+boQ6oQ9cenOA2VdUeYmZPauSHDyoirjvcJSNf9suiXNW53
	 ICGZ/DzMBYpykRC8uJNolpIPYkLnso7UDY8GqTev0NRrkMytxTkKN6zsiYl/2HL/Ih87g
	 UjNTtj9bS0aW42SuF08PD+nUEKdstT4ONe/PErb7zd7D/2OT674MW9uOUKb4G+RaH7KXu
	 FlbX3vOLLXcGvOuMzJUHrW/oZarXkhe4peUJZw7BqNMGR+z/okyjuexOcl0xEf1VV690Y
	 Vw/8Y0VELF3gr+7t2FLfDHsufYpAWUPtA5mIgb98MeSTVR5AXeqsNyOaZ69lKOObaIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EduQ3it1;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E77606A32E
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E77606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EduQ3it1
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so2175677b3a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648894; x=1796253694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCW63ny83XiZTDhtRYPG7u2cPmHKUXsowEsKPqJdTRw=;
        b=EduQ3it10AvwcrGZFygvafX4/s08ajPrZ9AFWJASWXvAkNzzb6C0JwTNLauQAZEn57
         8sbshVnuB/Bzlup5YhWPh4OyOTkWtrbgapT+9XioRGKoKAcSZrIIB/byvCoU8fz1Yv8M
         0QADQwsC0vX7O0DKa1loHDk/wjHyrCBaMU/w6QggYVd/3eoZi0nmGJP+dyOZjoysWKdA
         Z2U+OxVTDohfsxXfQ5g59D2w1+RWJx4Ao2LG0fnBHQn8yFkmRE21KMr/i7f6dF8oII3N
         JVLrPACYEgQVor8fpl+BLLAKFX6U5yvuggCsm+/ulZgS2RPv6P6l/woNPtSFvs3sTj5I
         XSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648894; x=1796253694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pCW63ny83XiZTDhtRYPG7u2cPmHKUXsowEsKPqJdTRw=;
        b=BVfoKdaprWCBOmnIVj8zyV9TNUDrq4AN8hOaQL1LcOslBm3M+u5mhocBEmqaXS9aTM
         PEhtuCaqDjh3qA58Cg8N0PwXc9HMM0P1CZzCYo9B99L0jHRyh+5ucQ7gALfofeRmMVW/
         avhjGPWggIGg4BR6A3WvXbhj4er35C8k0FKpeKZNBYj0i44PnQxeBxmjF52nF6Jd462v
         TyYT41edchOctG2moZ3yO/HHC3AOsqiw2H8xwmlp+IM27RyKlYzxqCQxMvg8+WFJCfd/
         PO5Z76Shph0hre/iRf750heBW2YlACE+3fLoAK5cX9G2mJYfSjipj9oeLAOh458nJghO
         h5Mg==
X-Gm-Message-State: APuU4Z/ysyQOT0vv2XTDWksKo8zhNtCGNsLZR1siDFhgjvc9Voe3r4Wd
	Hl6Cj3cIxBVIARlvD4CXDxra3+PMuuoD0NXXG8Dsa2cgBYQB7Zi5PvLg
X-Gm-Gg: AZFdTZfQfRcK00TOpS/wvZlmNQkph1tgPf3LmKRcoC4zfkZRUNzTthgpbVKPEHzU4TL
	LLgQ2nie5aIQ1tgvcAbc1Ikz0jQQ8ah4/6bB+WneORnNbdgen+o2qRJ1K1iv2i+AAVosW2gWzE3
	CR+lPKzmEO4xCo1CPZ0uuq+Uxnj/XfjLO80wO5dVKVwKaJE9lrHMCaZj4Y1ihLcszukt7qAeCRO
	CsgD8x5l+gEtanloIL1CE7UgRi1f/pepd4+JM5MLAKTJliNkNRusFHMLulD+C04BCj11Mzf0shq
	3B355+MFox3mjhXBTkYeGfeMY+rmV+Fu5tA3Oko3ey6KMaRv+LaV+JNq65L7iUMmXEQBivmR/Ut
	lOG5gJoLQReK0KspMNun2+47VMuI3OX2xgmznlw9BJprS0RXPR5C31LYb6ipwFX6gVqDBpvA+QX
	S5trfW0HsvVF/tLyXxpcC0FexoaTjS3eSIH21kgiSt8CXzK0xSC2MSxplGeJQ86GM6xWYjh3dUD
	nKKaESQWxXMJp0db0v0pN5Xky8WauAF4oS0qVggqPy/BoHXb4JUsPGQZTE6NcynCC/zh/7cXgO5
	8v3Mg9qI2piIq4tn9jeqXLz4/nmKaK8OvckX9I7p4QPVlTG/ynhvU0RNDV+1MJUoUKZYjrj/z1F
	s0A7cgetJo4obc7Sk9SAsegmaKmxoMgsREsq/lbwDlsky/wXJ2x4vFBGD46K3KTYQT/+h5d8O1w
	4UJCCs1Yom28xkZ2XbTfHD55o=
X-Received: by 2002:a05:6372:a748:b0:3e1:885f:b4ab with SMTP id adf61e73a8af0-4014a27e905mr15369180637.8.1795648894120;
        Wed, 25 Nov 2026 15:21:34 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm9864471b3a.46.2026.11.25.15.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:21:33 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] platform/x86: dell-laptop: Make the charge end threshold unsigned
Date: Wed, 25 Nov 2026 15:21:09 -0800
Message-ID: <d46ed46896f3712e8a5368f9c2d8ef1bbc36f815.1795648586.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795648586.git.rosenp@gmail.com>
References: <cover.1795648586.git.rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

charge_control_end_threshold_store() passes a pointer to an int to
kstrtouint(), which only builds because the kernel disables
-Wpointer-sign, and makes the following "end < 0" check dead code.

Declare end as unsigned int to match kstrtouint() and drop the dead
check. kstrtouint() already rejects negative input, so the accepted
range is unchanged.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v3: make end unsigned int and drop the dead check instead of switching
    to kstrtoint(); retitled (review feedback)
v2: unchanged

 drivers/platform/x86/dell/dell-laptop.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index eca348497ac3..1e2867f182c8 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2380,12 +2380,13 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t size)
 {
-	int ret, end;
+	unsigned int end;
+	int ret;
 
 	ret = kstrtouint(buf, 10, &end);
 	if (ret)
 		return ret;
-	if (end < 0 || end > 100)
+	if (end > 100)
 		return -EINVAL;
 
 	ret = dell_battery_set_custom_charge_end(end);
-- 
2.56.1

