Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332BE1531C1;
	Sat,  3 Jan 2026 12:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767442653; cv=none; b=WXLMHLT0PTgEYoVQ9f31xNka5AxM8wS0js5Go+i9pY4fsfejHiJoHy1M0OzwuK3V+DdNoddFFKeOWw7MPn34LE2Zvv2uc+Zx8NbY5H+Xt7qwTDNMChguL+Tp1z/X0W6DxHu4P6vtM9rSNTNEnHBOO1M9ouojEpsK+Sh/feHwIpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767442653; c=relaxed/simple;
	bh=/I6FC2lOI06rZFTqqn2qDUC4fIfIGE8OZ1j8cjM6CK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7SW5a0/WFtNWiDv5nFvN3bVIruXE6VZuqG2XUUFqrpHPtiS8SPTsGpDaPmgOZB9AjR07TtQ9tKJF4CIDqDzsmFAZ1BgVIh/DqLKayL1E9SHkjKZk+6yuaVW6L392pDnLZnsc7zG7jSvLfnmFIIfUnY7Gcb/5fJlwzmj+Q86LlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=DZ9x9QxE; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="DZ9x9QxE"
Received: from LAPTOP-N070L597.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2f5c42245;
	Sat, 3 Jan 2026 20:17:17 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	zilin@seu.edu.cn,
	Markus.Elfring@web.de
Subject: Re: [PATCH] platform/x86/amd: Fix memory leak in wbrf_record()
Date: Sat,  3 Jan 2026 12:17:17 +0000
Message-Id: <20260103121717.149678-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <df87cb9d-467b-e9bd-52d6-5ca4f0c1137a@linux.intel.com>
References: <df87cb9d-467b-e9bd-52d6-5ca4f0c1137a@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b83ca631903a1kunm2a697204263123
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSRlDVk5OTksdQ0JKGUxJTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=DZ9x9QxETIpO1qIxi+Q1uDzXGVKcPCyA088sLFGwSl7I/D2LGFPoSqXsOi5w354JLsZBadfPkNS9naFRm5Nax2clApEmkEi6C1vpkE032593BegOfLqOa/cWiBGyHc+Ca5AknMeWp15btBSh8RhMh8Lemvwcfndn8vdZQ6BBzuU=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=bqYIWHHDF4c+wxvZYtRjO6jhoYkedwYhCCPq2RWhdtI=;
	h=date:mime-version:subject:message-id:from;

On Fri, Jan 02, 2026 at 01:29:20PM +0200, "Ilpo Järvinen" wrote:
> Hi,
> 
> Lets not get too attached to the ways of the past, using __free() is
> what we want to use even as a fix here. Adding goto labels adds 
> complexity, not reduces it, so I don't buy the easier backport argument
> (on backport each goto target should be carefully reviewed which is 
> something __free() does not require because it simply is better 
> interface).
> 
> You just need to remember to move also the variable declaration down to 
> the alloc site as per the guidance in cleanup.h.

Hi Ilpo,

Thanks for the feedback. I agree that using __free() is a better approach 
here to reduce complexity. I have updated the patch to use scope-based 
resource management and will send a v2 shortly.

Best regards,
Zilin Guan
