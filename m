Received: from mail.espeweb.net (espeweb.net [146.185.173.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1260214434
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 23:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.185.173.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245522; cv=none; b=lV1jUWnJvyftdjonYrxvU4sGUsdW/0LzV2opUMc0Peze0kRM9jNS5WaCwF2BLT9ZaJ12xs0mhvBoTMkJCmHtkwTgFclqKMcyF4PgCMa8T+y5bRsCk+YrsU1+qA5RlBuwmdu4Pxv/vrdu72BnqeX3x+pA72nCFnBTTPE6ZQCjlRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245522; c=relaxed/simple;
	bh=9XXT/wmcma+M0yV6ppZ4TbVWjJw/gAADWCq3oSwsTcI=;
	h=Message-ID:Date:Mime-Version:To:Cc:From:Subject:Content-Type; b=Dcf4kDWDYBSIqgUkF0lzlV6VPwnXQiZXiizpiCtJOFHQfNGoGM8iOxyOGU3GAklfIa/mf6/xhzJJa6uXPzgrZlj/Jj8+OGJcIHBb7FnKFweNTOW0L/kmbUIBgLVCmw8cy8c1bTgu50S27weqJuThLRfhJFdpDkzVq1ibl+rvnT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=espeweb.net; spf=pass smtp.mailfrom=espeweb.net; dkim=pass (1024-bit key) header.d=espeweb.net header.i=@espeweb.net header.b=F8iuifMA; arc=none smtp.client-ip=146.185.173.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=espeweb.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=espeweb.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=espeweb.net header.i=@espeweb.net header.b="F8iuifMA"
Received: from [192.168.1.133] (unknown [207.188.169.202])
	by mail.espeweb.net (Postfix) with ESMTPSA id CCFF910087D;
	Wed, 30 Oct 2024 00:37:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=espeweb.net;
	s=myselector; t=1730245033;
	bh=9XXT/wmcma+M0yV6ppZ4TbVWjJw/gAADWCq3oSwsTcI=;
	h=Date:To:Cc:From:Subject;
	b=F8iuifMASKX82GWdLQEh2uW/X20CCXkfPPZnNj2cWQ+tqCnidsYGwDpmrngitqw+t
	 CWBWpAJimAIS1Xafq3rY7PZVc5D4hm7/pMzZ9aj0ef4P06B0k5bO4IgpbM8Ql5Lo08
	 kbl7VkhniG0SKVW7jeCBIXdtUdXHNs8BS6cxHNuI=
Message-ID: <54d4860b-ec9c-4992-acf6-db3f90388293@espeweb.net>
Date: Wed, 30 Oct 2024 00:37:13 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Language: en-US
To: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org
From: Pau Espin Pedrol <pespin@espeweb.net>
Subject: "asus_wmi: Unknown key code 0xcf" when plugging in charger to laptop
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

I was using an Asus laptop today running Ubuntu 24.10 (kernel 6.11.5), 
and I noticed that every time I plug in the laptop charger I get the 
following message in dmesg:

"asus_wmi: Unknown key code 0xcf"

Having a quick look at current linux master 
drivers/platform/x86/asus-wmi.c, I couldn't find any reference to such 
code, so I guess specific handling for it is still missing in there.  I 
don't know how that code should be handled or ignored, so sharing here 
in case somebody familiar with it wants to make the message disappear.

Regards,

Pau

