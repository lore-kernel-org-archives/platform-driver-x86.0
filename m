Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7666436B901
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 14:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272336; cv=none; b=arZ914jFrAE+gj4q0f4Gvef/F4k0hVMPI/6Oy5d4LYs/GtBLMocU5B/dRNozggqaA7TKS6g5lmEi50MfFjRsJXSn+P/LkmjpQukNAuj4CIl87qKF9E7J6kExSPqf2ByL0qvynd1aX9L8keMWNdfJQLWBmXY6bJWsXaVpvcXUI/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272336; c=relaxed/simple;
	bh=woJiB8K0LeShA9aB8DmGEak5D/ZNM5PjGjBLk3ZtCLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TCO7SdWCQCvn8Ih8bDnCBgVp+XeNwB1/FWIIVMVaotsiB6aUi43/g37uqO+yhXi0uto4UsjtJWJKWrh8+PIiHdh4lLqaoNn5hbPv6X5tUtEhSC/hbTZvalGRnqRkylB49yHgLweAt4gNglbEcL4TCs96Gnu9ZG97f93oVXCUmKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJp7rvKu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJp7rvKu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso68544225e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Sep 2026 07:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788272333; x=1788877133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=woJiB8K0LeShA9aB8DmGEak5D/ZNM5PjGjBLk3ZtCLo=;
        b=tJp7rvKuNXudQnAen7LkRkbc6pu3WQiwbx+1IEE1DWHF85S2jAM/54ZDCnMKotfvRZ
         VST47cq+FRJ/5/SkKo75iIfq6sioR1ijPRTtjjY1ueM2Wpalh0SBVYEgjxt8RJr4v8U1
         xDX34UNmz9wjGVPSTf6hYpHTN4EmlYoNS75MfADFEItIL+CrUeTon/XObJfQ4H5+NyfJ
         g91JWC9JOwPMnGi8HUVyFRWNb+VfoqFRP9QYAARt9pvJ+S8cyFTG8AzLs647wFflmDci
         JMXRj36kU6ZQttyNXzbciTCKHPb1433cn/pZTokyZMPSG4p4jjce+l+CvAPsv+89fT7k
         tCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272333; x=1788877133;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woJiB8K0LeShA9aB8DmGEak5D/ZNM5PjGjBLk3ZtCLo=;
        b=A72I09YFvS4DeB5cuVjG3NxR6pbLG2A0M8VURVNN0mfbu8yrQmdXPnOGuq4bhbskU2
         UxCH09/6lqbbaKPsI26B/mhmu/O0hCvGNrFwOKJsm6QZAS88yWZFMvsuXUpD+FEvoV+m
         aDYVfghb8xQKRrecmEr3DD62aXwObJoIMOA+j/X3VxPgurvUck1Y2vhHLzzFwkAirGq8
         5E7b/DjMVstbl0EWgwKDYSnaSElPNBJNUApIuV1UMI6GLwNor/9Mhy7ZGR3Ruzdb+D2X
         nXdK8yRueRukrN9B+exEkx2G4nvAXRvXVBU3OiJQMTb4EzqwWHDHXmhYsoikwCKt0HjT
         TOXg==
X-Gm-Message-State: AFuF++n59lqsN64whDRXj/sKBDy8EGariao5hIuorwLIkSkssH9qj7JL
	i3SPCW95eukSncgZ9hT8OWTJWCS9lDuGS4eg+YAKotdDnRGVte+iIhNv
X-Gm-Gg: AR+sD112huo/cMBHG+kpHQ6qlrXQsjka+LErYy5Uc/DOaWF9AaVasZ8qDF1hjs1fTEX
	+FV3ti9TqDlHH8FlfOna4OWR7MGakLRQ4N94RNW5vZrSNUChwJVdBkP6Ok5MZJ9b/FZ3IS9rRQ0
	qla1nNNensNkwU6Wv+7u+EvdoOTKibixFFxdzE7O+KpcqW9A56wQg4xIdtX3s46dwaDv7vyPqSw
	S0obYjfC5wxZZ1ocba5eY55g0udKd4SlEuAXylH7cJ32NFVoFUutulySInDIZIcH89Zcs5i6Pv9
	LjCsfWny1GeU0cMKbAz7gE/iD1Fud+hp1qEPkeGVxDg1sCKkRptQKh4YWnBR0HqDYtvZtMKwo8o
	CwSDakVDWaWbS8TUKXpIOg1KExuhmAIBCt1NsJgjacFiTdtJzWDBpEL89XAvR6A3DyCWmsG4myv
	W/TUghi4JjLk2uHLC8Pl4/KGPJ6X7whYndc7jPp7RYVHPVBIV5dHL8Hc+bdTo=
X-Received: by 2002:a05:600c:81ca:b0:49b:47b3:d6d with SMTP id 5b1f17b1804b1-49b91c3b7c4mr600777375e9.10.1788272333267;
        Tue, 01 Sep 2026 07:18:53 -0700 (PDT)
Received: from fedora ([2a02:ff0:220:b213:dfd1:35e6:957c:b8c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d781bcsm4831531f8f.26.2026.09.01.07.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:18:52 -0700 (PDT)
From: =?UTF-8?q?Ertu=C4=9Frul=20Top=C3=A7u?= <ertugtopcu0@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ertu=C4=9Frul=20Top=C3=A7u?= <ertugtopcu0@gmail.com>
Subject: Re: [PATCH v3] platform/x86: Add Goodix fingerprint EC mailbox transport
Date: Tue,  1 Sep 2026 17:12:25 +0300
Message-ID: <20260901141225.282753-1-ertugtopcu0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816194955.468107-1-ertugtopcu0@gmail.com>
References: <20260727205837.91413-1-ertugtopcu0@gmail.com> <20260803074454.49474-1-ertugtopcu0@gmail.com> <20260816194955.468107-1-ertugtopcu0@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping on this patch. v3 fixes the i386 build failure reported by
the kernel test robot and has been verified with the reported i386 W=1
configuration. The driver has also been tested on the target hardware.

I would appreciate any review or feedback when convenient.

Thanks,
Ertuğrul
