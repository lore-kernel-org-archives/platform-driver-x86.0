Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CD270568
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 19:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760471935; cv=none; b=CwL+z+p38LuuDJT2e5FD4nOkkzdUHkqttWqToKcYEZFhesPBrZRdsk+gdFAljmBUwYsocYckvbDEg4TDsnMpn50ADcR/c2/DY2huROix56oRwYIO+sh4z+dhw2vPh0XspUTW82H3yDgpdz0HPxiBRIIazG+PDX4ttKsUi06E2ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760471935; c=relaxed/simple;
	bh=pL3BMdlaiSA146eyzhJHViZlZqvQhouEUjvogWYW0VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dH2EQ0ncNwGJFVP7LDk7UFHPrYnn72z87YGz7d7BafM2y3EcWyhKZHYKDmJ0i+doFtD6ElX+ByZuDWX8+4zDWNMrLX94JBeCUBu+TWdfd56aj/nVd1BBBw7gLJq+ZEwpUOZHESxAhhsAKJCow2zGhkjqH7PIe+DY2HVOcNhk7ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=AZ3j4C5N; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="AZ3j4C5N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a2iSF/chQfoGdMZj8q2NgO/7Na19Q0H4GhUx4hPSD2c=; b=AZ3j4C5NwihKyG2rgKxWDU+TL3
	1Td4SUsqKHlAlMrl5qZm9bQ8BhfrelRU3ybL7RpRj8UFhiqIwnBkvoiMdbvcfr9EIK8eCicG0wSWc
	srpiZRiilXN9SHV1Q1UV3LAtsg05y1flUmATgEWt9XFLvNUYTqAjehxR5inZDmsCEvTuB3a6uHsgE
	4uR34a/ZEwsTnpy64QxKWUCDMbsLsFjfzgwzUMo1HcBKibm0HpKQKpFRZBXV72weJGeaYVg6HAvxv
	x9+wGNCxLTs+15+aOdpaJSJTBKoMDoeY+EZtLrGIWpmd48q2t6aTUZkdaxmbOXXFuOMI4Lr5/dWss
	P3HQ7OJQ==;
Received: from 201-43-219-13.dsl.telesp.net.br ([201.43.219.13] helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1v8lAU-009bbx-9i; Tue, 14 Oct 2025 21:58:46 +0200
Message-ID: <71fef5d2-15fe-27ce-4004-998aadc9a8cb@igalia.com>
Date: Tue, 14 Oct 2025 16:58:40 -0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] platform/x86/intel/pmc: Always dump LPM status regs
 on unsuccessful paths
Content-Language: en-US
To: Xi Pardee <xi.pardee@linux.intel.com>, platform-driver-x86@vger.kernel.org
Cc: irenic.rajneesh@gmail.com, david.e.box@intel.com, kernel-dev@igalia.com,
 kernel@gpiccoli.net
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-4-gpiccoli@igalia.com>
 <dcd817d1-6ce5-4c09-a65b-21507424849b@linux.intel.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <dcd817d1-6ce5-4c09-a65b-21507424849b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks Xi! Response inline:

On 14/10/2025 16:29, Xi Pardee wrote:
> [...]
> 
> Entering the S0ix state requires the system to reach the deepest package 
> C-state, PC10. If the system fails to achieve PC10 residency during 
> suspend, the slps0_dbg_maps data becomes irrelevant and may mislead 
> users. For this reason, the driver hides this information when PC10 
> residency is not attained.
> 

Indeed, I agree - this is even mentioned in the spec.

But the patch here doesn't change that (or shouldn't - except if I did
something wrong heh).

The idea of this patch is to dump the LPM registers in any failure path,
the ones printed by pmc_core_lpm_display() - not related with the
slps0_dbg_maps.

Lemme know your thoughts on this.
Cheers,


Guilherme
