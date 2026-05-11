Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [178.154.239.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF54C8FFB;
	Mon, 11 May 2026 19:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527178; cv=none; b=K5iMtV0XXSSPI4PkMLvqWZkxEkTDkswjmMfNis9bywey6rMfzLljmc0e7ak8b/oWDX5kSftBFHYsl/cKl046e5etJ3J/jdpAZhG+XBUB9LDVL5ucaFHShvZr8ENGIqoY0SI3QMvOhDXL6oB/WubhlfHInd01hRT1QsGz8ZFATWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527178; c=relaxed/simple;
	bh=7YZgC9v2psXKWo8vwtHn8Ng63j8NjfekrHW/o3/Vd+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wr7B12hcvyqCRnCsyCITvrUH6ffOXIr97yM3f5f1tEYm1NZqh5he9A2OFsENiPDXxgDSbhwJW3iCwfXVwaD/urfa/GQvtlCl8Ge4OyFVC3XVVcQk3qVa9TKKWGiEeij24/SSgWItgH/RRpE/rnxUwirPfKzOSaqzC3t2h9zt5B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=nkmpFC0v; arc=none smtp.client-ip=178.154.239.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="nkmpFC0v"
Received: from mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net [IPv6:2a02:6b8:c1c:2e1d:0:640:64e7:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 07CA7805F4;
	Mon, 11 May 2026 22:19:32 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (smtp) with ESMTPSA id RJPmt9vS20U0-iIcugpzo;
	Mon, 11 May 2026 22:19:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noirlang.tr; s=mail;
	t=1778527171; bh=7YZgC9v2psXKWo8vwtHn8Ng63j8NjfekrHW/o3/Vd+0=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=nkmpFC0v58YP1okEGMZOILoCyR0jWgJrbxytEfWT6PbI//lTCxl5aCvGoUIabSg42
	 4wD8tGuKpoa/f8fvxMPVWNw9qZ4J4bK13FQIpyc1TcVJijz95GpHoX8ux8PLqmXAw3
	 pk6J5LV0gEf3BoI0RoQMWYJchyEg+tGysOrRF3W0=
Authentication-Results: mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net; dkim=pass header.i=@noirlang.tr
From: Melih Emik <melihemik@noirlang.tr>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Melih Emik <melihemik@noirlang.tr>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: replace strcpy() with strscpy()
Date: Mon, 11 May 2026 22:19:27 +0300
Message-ID: <20260511191927.32274-1-melihemik@noirlang.tr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <de236862-343f-8322-b6c4-06c99122d7db@linux.intel.com>
References: <20260506175031.25337-1-melihemik@noirlang.tr> <de236862-343f-8322-b6c4-06c99122d7db@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, May 11, 2026 at 07:45:34PM +0300, Ilpo Järvinen wrote:
> As the sizeof information for image_type is available here, you should use
> two input strscpy() variant instead.

Thanks for the review.

I noticed this has already been addressed in linux-next by commit
0b9f109c318a ("platform/x86: dell_rbu: use strscpy in image_type_write"),
which also uses the two-argument strscpy() form.

Please ignore this patch.

Thanks,
Melih
