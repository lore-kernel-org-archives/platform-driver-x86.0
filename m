Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7EE4A2E11
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096795; cv=none; b=PMpiSLXtMcFKyWkWxCFtsJM1rHuQ/34Wlv5eUFGMjKcaCdXpWJZQSGooz1LpSYklinDi4qNJ75ANjeq9wf8RevySwpMyTbaeTt2tqGVHX/n/G1XEm144kmZ1k2skdvqOYo5kH0wECIPScu9Rbo/SHV5ChEtFT69IdDSQ7QDORUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096795; c=relaxed/simple;
	bh=F/yknEjVnOgXNzgaqkIW4LNMshOafNq6pbF7rAtp4ZY=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GCQfmhJMlF/4Trp04XSC/KuzM1ICFmAZUomGqi/nZVttkV2Isj3nUzcKvYL/wN/8/S9BmO7+dMaHYLPTal0EwgKsQcGK/K3w7tPjZgDga2YvPi/X3IpRc/p/bgrEVETBa5JVIrnBzZMXo51j01vLFvN4GYGgI/2sua/rUfgr51o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1EE4Q+i; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1EE4Q+i"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c53198a65fso108965585a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 07:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769096789; x=1769701589; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/yknEjVnOgXNzgaqkIW4LNMshOafNq6pbF7rAtp4ZY=;
        b=l1EE4Q+iZjV5aJ3rlnd0YMfi8Co0KdJO880fK7ujtxKpj4u1GDR6dFHls8cGCAy9fH
         f74K0hxC+rcPc3vQB3kfObAs06NoJMhpGGSlvtl1teSIoSuwKnvJx0pzd641mSUqUMBN
         S83CrAERhtjKy2/DiGE412W49u9VU94VFDMbCd9D+ykZMax9XhASVCnndOk3l5QCdjNb
         rRuTgo7T4hyVj9jym41lH8t9Rfw8AOOUY3GN8svYSyY5YWOKxbT5up27QskVNMioQyC/
         7OIZS/mGmz6GskYMP5+DqBX2VxxpzlyRWu63LCwM05xk6se2oayriq+78BI5vqa5sCRi
         nXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096789; x=1769701589;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/yknEjVnOgXNzgaqkIW4LNMshOafNq6pbF7rAtp4ZY=;
        b=cxbxIvcGA6Ys56XiMIg2IpBEtISdbnzzTAX4Hw+U+lTW3SivPlTGeNYWjzVzL2MRZF
         EA2IydFuiq1mpCZAYreCeOTI3LmW3zU5j40/CAAcWRelOpvtjOcEsD3+xH52UdC7vXQA
         3y++6By5VtyPXNMQFEb88R+1F2HxHhwVAxk1AmVhjB72DO7TQ/03Q4ifcVf3rgJ1NOZL
         NpQGGsDcSZPPyzMEneassLtCNU0RsMzYFrqt2yzzYBpY0qk8Z+8x8QbVpriauwlXHmJz
         O3msfvbVqxivJemrvKpaODX7QoDMmv/5K9SqAqCbqkMFfK+AklGpKx/ish+m7R1ZkMFH
         q6ng==
X-Gm-Message-State: AOJu0YzEjg/pSEq1ZgPMhhBbA1qsRyAcmWPkrTsy7qWnPQRM8MrOMQhl
	3oew/b7qHLxFwsR9o1zJ1XyrmNhXBylFiUl6qnB7oxQOdTbRfIwHtGq/
X-Gm-Gg: AZuq6aIQCvq3ZzmuT9RfjBiVl2sx2OG7zNxXI5zkAupsYSWQbWGK4A8tflYa0LfGjFQ
	ypkg6oBj9DASlQaPFxUaDvq7L0n9HabrGFT30O4q0F4fYlqGhggnLYluUDOhCg0/9hnmaOK9ilp
	wt98+mKSFN2vgXXZ31J1guLFOqSV/bKb+BohYnyM8aHxcXR57vsTWIztpKSnO+T8luiPWch6HbM
	tTNVXgDSpm5tSFF3NXS5WqiWAfsXpCkBsG5ytw5QPPOmPOyiK8OfhxWDwiJTsgJUvDHHn/r9L0c
	okz8RsT74NVWYbLci4AGxC9LZhRgkY4V3BwtFvsDplF9BlUYKwuZ1O+aH/MIi7IF6btnAQIATI4
	gouE9DMEA+ljvy4I6U5xEFLWIOjKyECI8C3z7PlScehM4TAM+1V5jst8wr+u68LSd21cwr8mx4d
	FVCy7C6oIDWnZwz8PBx+dmk4VPTnW0sDKBOsSM6UOhC+IAinVpXurVZYzD7zHENCiTmbgPAeKUR
	PflaJFOaWgc
X-Received: by 2002:a05:620a:1721:b0:8b2:33f5:fa49 with SMTP id af79cd13be357-8c6a68bda73mr2935770585a.14.1769096788882;
        Thu, 22 Jan 2026 07:46:28 -0800 (PST)
Received: from office-nix (hlfxns018gw-134-41-57-104.dhcp-dynamic.fibreop.ns.bellaliant.net. [134.41.57.104])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6c9defsm157617276d6.48.2026.01.22.07.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:46:28 -0800 (PST)
From: David McFarland <corngood@gmail.com>
To: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86/intel: disable wakeup_mode during
 hibernation
In-Reply-To: <20260120161100.29342-2-corngood@gmail.com> (David McFarland's
	message of "Tue, 20 Jan 2026 12:10:54 -0400")
References: <20260120141758.3496-1-corngood@gmail.com>
	<20260120161100.29342-2-corngood@gmail.com>
Date: Thu, 22 Jan 2026 11:46:27 -0400
Message-ID: <874iodk5v0.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Sorry, I should have sent to maintainers originally.

I'm especially looking for feedback on the implementation. Calling the
suspend handler from the freeze handler could potentially be confusing.
