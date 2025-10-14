Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031A30649D
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 20:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760473292; cv=none; b=BKvYDTFRTRCNXP/FUC+nz5AjQrVSfzeypuwswn7qR8zcu6viewa04IdNMO/Hz6AnjCnr85U1YkxRZXcJEFZFClxDtOk3HMWavAZiGa3ciCwLTOnE8wXqxzJR9lEVbRLtKYze0mC8GV7KS9VrJoyu8LrZ0BQwQX1usdrwAR/ltu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760473292; c=relaxed/simple;
	bh=M5nivzv2G1+l+sDR1UEnkDvnIf060iONM0I9mgQZnTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z01N8c4zW1m0Z7Uv5HxWsBvl/7MMWWxNJkjXCFyrcKi/rihRLVjmA0A3lLRGtXXvniRpKGiws7I9PyEYvPIomBKVKDup+q2c9ExEIpkbHl+RudSWy2LzgyACJDx1drDL12DfsmMaqjV7eUAT6moxH/d2LvK6jhDbl4ghI3wovms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Ox67y8eL; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Ox67y8eL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=45h6VZExRTu6jXukMHz/6nvLlZKKAnizQvlnUyDcoR0=; b=Ox67y8eLhRKdRyWYT2B3YEpS2e
	X3c3sZbL7lc1aa5T84AB7OinN9Q7TUZ+dXsmEi7I08IpNfaXv3auZCNLMa1zqwG44BDj3xhiPS1vX
	fQRnGMXEzvu4lxsYr6fKQnpaJrTgjPpAEGmo4KQg0ngCDrPzbSwSlkHFmWbznoCN5vOC4PI2glwrx
	UeDpeUzG6PEOeQbJWuwXbcMUZ73R47wdd7X1PCs3Xmb08qUSzEVJb/NWn2W8TG490DFE7WGZsxB9v
	9Tiqpf31V9i/oOn7+hrretv/ClK7U/kg+0OPnRhzxyXete+erc7uLH7hqqkQv7g89L+rqvTKcN8X9
	LlbbYEzw==;
Received: from 201-43-219-13.dsl.telesp.net.br ([201.43.219.13] helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1v8lWP-009c4w-IC; Tue, 14 Oct 2025 22:21:25 +0200
Message-ID: <7afc43e7-7145-5d23-ba94-828fe607b263@igalia.com>
Date: Tue, 14 Oct 2025 17:21:18 -0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/4][RFC] platform/x86/intel/pmc: Re-add SLP_S0_DBG
 register dump on Tiger Lake
Content-Language: en-US
To: Xi Pardee <xi.pardee@linux.intel.com>, platform-driver-x86@vger.kernel.org
Cc: irenic.rajneesh@gmail.com, david.e.box@intel.com, kernel-dev@igalia.com,
 kernel@gpiccoli.net
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-5-gpiccoli@igalia.com>
 <c38c3b32-fce0-437c-b174-bf602927b0bb@linux.intel.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <c38c3b32-fce0-437c-b174-bf602927b0bb@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2025 16:24, Xi Pardee wrote:
> [...]
> 
> Starting with Tiger Lake platforms, the slp_s0_dbg register maps are 
> deprecated. The data provided by these registers may no longer be valid.
> 
> On Tiger Lake and newer platforms, the intel_pmc_core driver introduces 
> substate_status_registers and other updated attributes that offer 
> information useful for debugging S0ix-related issues.
> 

Thanks for the clarification Xi.
So, this one is clearly a patch to drop in a potential re-submission!
Cheers,


Guilherme
