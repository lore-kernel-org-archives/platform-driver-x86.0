Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1FA309F01;
	Tue, 30 Dec 2025 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767086253; cv=none; b=bp1woPx6m5+ECNZQBS+kfZv68B/AVR6OsNnkrFVJmk9L1TLysG6FnKIlSzxsFgXJoi1Z3io/QgVnvGebm/pRYPC89b6uBlGdlzDRuOfnQuwgyHcYatcBHeyXVCGn0Ofw4dWFM3dm5+WfF3q7YBonP5kQmecffd6QUatFipS+ykE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767086253; c=relaxed/simple;
	bh=Cgv3AFo88Qu+EaJb6WNB7A0WhqC6uxLpDpbzcffCvek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=itO0RgzBMLpkiy8bYalI54I/LMNqD4yHooYKCnD+Z4j7JkorAj3JqLGs9sXrQ1YdBOlnlYJVKv8+D9kJGnzqZMQwIY1MBVQq3Gyx7mbXsX5ENOKM8Jzg983yPRG83ZRyXSsXtbjylqk80PKnMRQAWcpbVK09vH9+qKNDtjC/ImY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Up1uR7I3; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="Up1uR7I3"
Received: from LAPTOP-N070L597.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2f04a4e00;
	Tue, 30 Dec 2025 17:17:27 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: zilin@seu.edu.cn
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/amd: Fix memory leak in wbrf_record()
Date: Tue, 30 Dec 2025 09:17:25 +0000
Message-Id: <20251230091725.1140570-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230064325.1036637-1-zilin@seu.edu.cn>
References: <20251230064325.1036637-1-zilin@seu.edu.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b6e8c4c7d03a1kunmaffaf60d1569cb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTk5CVkpIHhlITRkeQh9DSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Up1uR7I3D+v+ONotACxYVe9DgYB6ReEXdGYVGp8ub8O59icvfog+6bdOlSBD/lTbLDGLvHkLH4Z8Z7Ib63Vsq9QrV4Ui5Fi9Il7aVmpipMO0ZqwmCG6A+ZCFsY/tjSnltjeEJDxEFURZaryGWWgYpd74xZvZJ4PNb2oPtzSDw+8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=uYUSXaydU/3pikWQ0IwKBVHyBxX58eRt8auDBeL7b+s=;
	h=date:mime-version:subject:message-id:from;

On Tue, Dec 30, 2025 at 09:51:06AM+0100, Markus Elfring wrote:
> …
> > Fix this by adding a free_tmp label and jumping to it when obj is NULL,
> > ensuring tmp is properly freed.
> 
> How do you think about to increase the application of scope-based resource management?
> 
> Regards,
> Markus

Thanks for the suggestion.

While scope-based resource management is a valid improvement, I prefer to 
keep this patch focused solely on fixing the memory leak using the 
existing coding style of the file. This ensures the fix is minimal and 
easier to backport.

Such refactoring is arguably outside the scope of this fix.

Regards,
Zilin Guan
