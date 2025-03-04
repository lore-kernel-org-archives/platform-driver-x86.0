Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D649842077
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Mar 2025 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741082097; cv=none; b=kVlhvX45GZ91g8vV6y1VWo8ILmk3ikml4vDQrWJt1oLy3s/dh/qDW0Ks8j9kqkmEsSlXN0/jYGyUmB+LVKxe0Oajc7GIKwDrlZU8uRRoGB0MgVwi+EjMpXEvOKRiWgJ90kvj6CCGmRB/TKRuz5yALjA89JUUYC5tJ9HLdQUKwZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741082097; c=relaxed/simple;
	bh=bEZtTwPyY37XnL+BOrDB3iYLlnxsxgbs+5Nwb5ZPZ5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcjkOukwOB0cFQb5stKRfHYIkixmja+DUgwDKGhPoFWZ15RXCBUa2qKkRP+iea7kPFdEP32M8oCfo29WyjAkgJnDrNW55NgqOYQ3Rrl0PmvV5dPUsPE1PVy5+S4Jb4KYyiJUoUHbZmeRkdYc8QU8G/6LYN1m2C/EhDpkE58Pp6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RmI8Fbbg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RmI8Fbbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741082094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7cLRomgT9aYrM8YJE7hwcT94wlH0qz2XRoudr3Vr10=;
	b=RmI8FbbgvIgLHEBOZ5iYMt/6YX+hxUXwxMmXCwdszlOjjhmawMxeMTVAn1d1vXvIYkFuL1
	TElO9oOqi/ITgtalgUVFf4HftP7iehb/YGoARWZSZ6I9nWgCHPm94PNH+mBDD4w1/LemND
	yjGFV0BoBzk+G3Cqikbql1A6A8m9nnU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-jmAxhgaSON2bMAjVtHJE-Q-1; Tue, 04 Mar 2025 04:54:38 -0500
X-MC-Unique: jmAxhgaSON2bMAjVtHJE-Q-1
X-Mimecast-MFC-AGG-ID: jmAxhgaSON2bMAjVtHJE-Q_1741082077
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4394c0a58e7so38063475e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Mar 2025 01:54:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741082077; x=1741686877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7cLRomgT9aYrM8YJE7hwcT94wlH0qz2XRoudr3Vr10=;
        b=kJ6eUDFrUwaTmVdLRW+xhbn0sIG9QmAL+Z14iBOc/KzaiFC+WPN37rrueny1eLCqYB
         XNj46t3f54wUNoPKcw2poEK/8nr+6udTzFBaD9AGJvk11QEyKXl4pBuTgBMwbjrEIocZ
         IfggtE2w+XlXbOZV9wyPwf6gnOvJ5YYUXdMcClwiQKGu4dvVsILO1Qgx/oz+Qff+Xj5v
         ooYe7fL8taPKftknK+cK2vzxVCPC9fjXz7j/eW4TuXeEfOoy9fdYvsU7+DJJCyo2QF7u
         wZpJ+ex8STCzTNHpauql8/S35oVdV19GTYHp3VWyFkSL2zu8Z3MhtgVJcwWd/exOgP4v
         EJgw==
X-Forwarded-Encrypted: i=1; AJvYcCVm3h+R2hWX8tQDPGAMOFcd6PiWvqvgi7njDjWWUy8LTlwF1VwDxXQBbVX/YRerYlPM3nlQ+FJUmqOqo7769jS98fku@vger.kernel.org
X-Gm-Message-State: AOJu0YwftQIKYk0ZCDrHXj5S2ZMoW7hosNwla8ThWlJYp+ITri66aaub
	sapu8P9WV6ulXuC7lyrsQyaMNwHFycm/hfJ6d/gJ1TZX25C1eO8N9uhDfNSJCnZRNp+3zLyz12X
	19RY0yifBIODqguhCObigEjG+WuoIghM634yLREGtV7kCLPeaN/V1k3anUw9cDKCyb0kmzYE=
X-Gm-Gg: ASbGncs0duzRtIiXPt2FVOj755wx0tY6ZxQlNxtOqNdFaGZG2F5sUyiqrW1cttJrCIi
	qhWzmyjIv2WSRfjEDxQcix7fVFpF42aboxe31H92Y6VvLyvmN1bW/nFMNkNTI9j7ZBkWC1ej/ii
	6Q1cY3VgFQuMD4bdM7et9L0q4gvO6AVJ99HKOs86Z2jeUukps0FeYYjiYv6FuX1wTJzfwzbw82O
	c7m/WJGxOQ2jvc7DVM4s8l3cooLIgH2dJDYLFOPhS3Kr5RA+gTWf4trw4azBczr+wUUOv7lmKv3
	N9rDbK2VteTJEWRJVvkq3ZJ66SXRHSwXUuS6rAezGDFs2w==
X-Received: by 2002:a05:600c:1c8c:b0:439:9ba1:5f7e with SMTP id 5b1f17b1804b1-43ba675a843mr118312505e9.21.1741082077443;
        Tue, 04 Mar 2025 01:54:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCYvnIe76LEUSPaxBjczhESkT9xksjygv9YFGPgN7D+cz81nubOVGbUrKCatMMMLTJvcstbw==
X-Received: by 2002:a05:600c:1c8c:b0:439:9ba1:5f7e with SMTP id 5b1f17b1804b1-43ba675a843mr118312285e9.21.1741082077032;
        Tue, 04 Mar 2025 01:54:37 -0800 (PST)
Received: from [192.168.88.253] (146-241-81-153.dyn.eolo.it. [146.241.81.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbc030d24sm82094335e9.22.2025.03.04.01.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 01:54:36 -0800 (PST)
Message-ID: <48885074-b590-41e6-9794-49ec12713cce@redhat.com>
Date: Tue, 4 Mar 2025 10:54:34 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 3/6] arch: x86: add IPC mailbox accessor
 function and add SoC register access
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 David E Box <david.e.box@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, David E Box <david.e.box@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, Russell King <linux@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-4-yong.liang.choong@linux.intel.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250227121522.1802832-4-yong.liang.choong@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/27/25 1:15 PM, Choong Yong Liang wrote:
> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
> - Enables the host to access specific SoC registers through the PMC
> firmware using IPC commands. This access method is necessary for
> registers that are not available through direct Memory-Mapped I/O (MMIO),
> which is used for other accessible parts of the PMC.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Chao Qin <chao.qin@intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

Hans, Ilpo, are you ok with this patch going through the netdev/net-next
tree?

Thanks,

Paolo

