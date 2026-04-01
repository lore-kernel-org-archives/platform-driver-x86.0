Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7443806DB;
	Wed,  1 Apr 2026 17:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063629; cv=none; b=ZGpPrmkiyUyTPiuMC8BzIz3aAJ61Ib8fixGln/p0GHx2rhM899JmSslb9dixmVO7f6O1ti1uVKZ2CbP4mKGLGOBNbBaIMU8zLqgrUewEyXPkMRf05U200Agr7ahDNE43O8N28ppc1sdlNmCgfoomEvEGKNasz+zdIJZ5Lsj6IGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063629; c=relaxed/simple;
	bh=e44ROtbMvSPwMo+F59QlBgSXg2Srjt1Zn89COTzgQW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=mNZGWjtfZ43cpR2TbJ8AvSZsen6YMH8b92lhBo3F85XkspjTYMxuCtj5IyoV7uPv9odULo0fKvn8eVn0Cl7rtOd54woHxBSG/w+Au+LFnO5p1tpjnb9kIdhBt3SHmFpHfCJ/+y496hE3UGEwJsDQ7PkrJlzPM3nTsxGluUbJJIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=dlmhlApC; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="dlmhlApC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=aBL2yUylUVSDm169RhdSLKoFhacBOWvVYMwnVM1p2u8=; b=dlmhlApCKRHzfcPYdENI4aeBjJ
	NPHgbcjsuI7kqvWNFOpeRm+TGRWr7RTKYKd7NlzHpvi+h1NF1+M8/Xwg4AVbjLIeuIb5Jze7pYN0Z
	YFc/vQBZ7rj5x9Qgsvz1rrrNTsZROQuHCbngmmquq/Q87CCOA5sjMWy47+4vf3FlS8WE=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7z8O-006hvF-1P;
	Wed, 01 Apr 2026 19:13:40 +0200
Date: Wed, 1 Apr 2026 19:13:40 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: johannes.goede@oss.qualcomm.com, sakari.ailus@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com, djrscally@gmail.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe)
Message-ID: <ac1SRO2nEt99IgBk@spark.kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9b66e79-751b-476e-90e9-670ef44f131e@oss.qualcomm.com>
References: <b9b66e79-751b-476e-90e9-670ef44f131e@oss.qualcomm.com>

On 01-Apr-26 15:38, johannes.goede@oss.qualcomm.com wrote:
> TL;DR: my proposal is:
> 
> 1. Name the new LED classdev ir_flood[_led] including
>    adding an "ir_flood" LED lookup with the sensor as
>    consuming device of the LED.
> 
> 2. Make v4l2-core turn the ir_flood on automatically while
>    streaming, just like it does for a "privacy" LED currently
>    (mostly re-using the existing privacy LED code).
> 
> 3. If in the future userspace needs more fine-grained control
>    at a ir_flood V4L2 menu control on the sensor with
>    auto/on/off values, defaulting to auto which preserves
>    the behavior from 2.

This plan sounds good to me.

I have a v8 ready that addresses your feedback on patch 4/4: the LED
lookup is now always registered (for ir_flood too), removing the type
parameter and the conditional switch-case. Shall I go ahead and send it?

Marco
