Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791628;
	b=aGJVrhHQr35WabRMR9NogTlZ49PGmS+DgWfsGMb1GrsrIEVjx+bqZ5sm7kf0aPcDvVtl
	 XkA32HUU01F6oBsOCIB5qtsxb396m1ZO0NcCmvdZp58AW694Cg4M3ps+9DJ4/PCYu1z53
	 p4IfN63rd1rAXfH0B/kNV8SPM0sZlp5xE4IGc0bGX7eFQVUzITjLFlfVYPP/zFyiW7HrI
	 wxWHba7Odqf4JDROgOJg3UrKjsWvgfKxR1HZ6cd5dViRNGw7p3uTARn7zEjZf6i8mGvs3
	 zpV9hpUDxzHTwNIHh+JgL8aMFJJ8KdL3K48GLJ8lP+6LGVfBK9ASrpc6MD+ewqTEXkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791628;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FVEgFYoYhtqGyH1evmt7A9DFPvQCSlwryloZBMN/Syg=;
	b=bQFUxLIGi+HNM+6cpwvSJAx7bXcwqgit1qV5c3YPPIP2rGjmqar+m4PNuTbUr0k+7zOq
	 Tvn9t4bz7c3tDq43PVSHjvzHI88PZPSvuNaB8gQeQQ9jNjUkxUqULEhTIYfeXROZKBGt6
	 onSr9BjetAFa+jmZSkbi2cfZklCL/ioSd/KgtCpfllq3a9xxt+73FwgjjClzFWrETev4r
	 Y087tidynhVLJ1MoWGvQufgcPJZHZWGI7tsfrURSs9Ap2M30gr1hCi6ERhWDLq42+6aLu
	 dQVZLRGG2dGy35mv1ZF0GPEVAqc4oEgnO7Kvpt7uqqlsEPA2dEOOJP7dGF0J887kujA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=OE53mCew;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E95606A32C;
	Fri, 27 Nov 2026 15:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E95606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=OE53mCew
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: be8926f0-53f7-4e49-afc6-deafbaf5e0c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795791625;
	bh=uZFyBbuyMu6Q9xrtJRjlB0ZIJBs2x9cl6bdnwyfzNWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OE53mCewgz9FxqJAMqkL85YVdwIcn6arhiTGcMwuK83w1YUOnHYxayXyylQN9Yxsy
	 qwldsDFxnZw67lwTJYTKANzTIvTkcYIZBb1XgJT5LlD2pkvKW+B0/A3R4R6Q9LoXce
	 H0ZQ2zX75xNxm1rXUfAtV+jdE/BGklHKa8AQyAiuDzvnx59VfWCsIGvlVnNTDlzb9D
	 j0aBRQmLg5vwtW8Td4xohKT9ZfobCXr3fQdPL20cIKxMSmcf9uSJ/xaPFox6JsZliz
	 hFSb8soUVfhdBtuuAxemRwoklrQpUvr+bmHgHQ7Z4wbCfJhZokRqxgvmBGKkzREL0n
	 NYBtd6/pB3fLQ==
To: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/backlight: restore the gmux brightness on dual GPU T2 MacBook Pros
Date: Fri, 27 Nov 2026 16:00:21 +0100
Message-ID: <20261127150021.285379-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108100926.28950-1-dev@deq.rocks>
References: <20261108100926.28950-1-dev@deq.rocks>
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

Hi,

gentle ping on this patch.

The Intel CI reported VerificationFailed for it, but only because my
address is not on the CI allowlist, so it wasn't tested. Could
someone with Patchwork access click retest on

  https://patchwork.freedesktop.org/series/178109/
  https://patchwork.freedesktop.org/series/178113/

Andre
