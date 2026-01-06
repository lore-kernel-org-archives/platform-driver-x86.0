Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02052236EB;
	Tue,  6 Jan 2026 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690679; cv=none; b=Y/9tmfPoNBxUB9fl54xATMBRn2TTeZagtpybz/NjGQl/KNaNKDpjPhzVFOjA2QqRONFWKWZK3xpcuI+I5T+4YLj3jkNzB5vXgLyE2IEVw/GGkcIQ5dE2CRYtEtnwLTw6leEnR69YvASA/CRxqtvkl3+pGCQlVHSBVyj9Wi2yVVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690679; c=relaxed/simple;
	bh=gt2j7TxeUmFD6avT7aPK/UXJa/Y3Pvxzo44rD5P5RwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SUKcX9zXSma4CtI/1dkMmPR2vYuGgIm3ARxTyjbCoyulmNaxm4Sujhc0tlpTf31saARNzuPRjgiUernht0u3IbFqm/l0MIl6YvQUw/Cdyii9vwSbabZHvWwmOaiHk6ieLgQrCDhS07Deg+dWlupw+OBA2vA4Q3FTlsEsQaBz1xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=McaI7yWV; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="McaI7yWV"
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2fa9d9785;
	Tue, 6 Jan 2026 17:11:04 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: ilpo.jarvinen@linux.intel.com
Cc: Markus.Elfring@web.de,
	hansg@kernel.org,
	jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	zilin@seu.edu.cn
Subject: Re: [PATCH v2] platform/x86/amd: Fix memory leak in wbrf_record()
Date: Tue,  6 Jan 2026 09:11:04 +0000
Message-Id: <20260106091104.745278-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <513faa30-9241-49d4-873a-96ffdd314504@linux.intel.com>
References: <513faa30-9241-49d4-873a-96ffdd314504@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b9292fb3403a1kunm1c331d583a7cbb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEtNVhkZTk1LGhhJQ09IGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=McaI7yWVMgMUSFAyv+3hCbdxdB+uq9THMgLNl9MHolaeM0nliojnnU8xM5DbLCp5Jv9u54PSRfYytuQOw+4BtQaOhx5GmHetp+UyzyimqPfrCP4HS5hYRQsThJPM70FEptTJKgXP2Wp/uq8RdPPb/dDZHnhIQyyjJsWiVC3tNCo=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=ole+8JfZAOSz62LiZZywUf235fzeRab7pRxSvFVB7G4=;
	h=date:mime-version:subject:message-id:from;

On Mon, Jan 05, 2026 at 03:52:14PM +0200, "Ilpo Järvinen" wrote:
> While I'm certainly not against in converting also 'obj', this patch 
> should be split to two, where the first patch fixes the case that is 
> current lacking kfree(), and the second that does convert 'obj'. IIRC, on 
> can just use kfree() directly for releasing it so adding the new 
> DEFINE_FREE() doesn't seem necessary.

Hi Ilpo,

Thanks for your review.

I will follow your suggestion to split the patch into two in v3.

Just for context, the reason I modified 'obj' in v2 is to avoid mixing 
goto-based cleanup with scope-based cleanup, as recommended in 
cleanup.h [1]. This was also why I stuck to goto in v1 
(to avoid touching 'obj'). 

[1] https://elixir.bootlin.com/linux/v6.19-rc4/source/include/linux/cleanup.h#L148-L153

Best regards,
Zilin Guan
