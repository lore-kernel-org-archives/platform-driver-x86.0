Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204A525A350
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 18:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760378731; cv=none; b=Lqd2KmzW8JkSCvNcCFE14YbG1E7Bn+YTMzNCYe35xQfyKNCCWCs9FoQ+heikzJnCcQXZifHwEajWgghp0QhT4w254DqJOOlLQNdCyL7b+anyC/4KD52Mc8rUEmmlEwIczvZHuOGne4eqEM7+tcpk4BDpC7XrL6oscS+iArrRUjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760378731; c=relaxed/simple;
	bh=iLurl9tNUmh+3quobAYA4RyjpgsUtqDH+t2N6Js0d4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQ+UZ/cXzi0+rmDvfFYLA75AhqDwYBXJhRxsg190npKTAlRFvGT3+6kt5MTrHv0TJFhUqwJ24wXtD2LZpEWl81fTN1mFkxRA7C12b37d10DurCVXtwy/GANeUfUfahu+1nfirNXUY00ySEqWNx+lrPUGmmTMfimLvnfRz6SRc3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=f44bu6J5; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="f44bu6J5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sJtR6mZ6Ekp31tR+wLBqZGkeaqOd/Cve4q9Ihu02QfM=; b=f44bu6J5iuTo5dwUtp59l8zLnv
	5H536FNb8vwBvxZ1x3D3SqryO0Vodwr8T6ogHqtgRqIn6MjiDivKi33qUE3WCYp/obsNMktYU96z5
	rsey1AFIM4aNOe9lvcTdMZBg2PvVa2gWUmLlcwTUkhIuzNv/lyfg3XUdqqKGN7vUQjEH0lz+/AJCi
	GYhKQM7XqIfnrswIUpPyHq5WsKDIrWPB7MGFzruXm8cIG/e5OmnXDhXoDxXtV/YDJ39WFb/VBTBOA
	KZUjpQKG6YfPgXLoEC5qGEH9OfY2Pf3hP+CAFcCgYItviTqxjrRb9lJ1rmm4J2IfzF0y82vicecDn
	LXtIjdwg==;
Received: from [187.90.170.228] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1v8Mv6-0092nw-3S; Mon, 13 Oct 2025 20:05:16 +0200
Message-ID: <bbd83ee1-4a6d-ee6a-9bb9-cc5aba2ebd21@igalia.com>
Date: Mon, 13 Oct 2025 15:05:12 -0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/4] platform/x86/intel/pmc: Dump raw SLP_Sx_DBG registers
 and distinguish between them
Content-Language: en-US
To: Xi Pardee <xi.pardee@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 david.e.box@intel.com
Cc: platform-driver-x86@vger.kernel.org, irenic.rajneesh@gmail.com,
 kernel-dev@igalia.com, kernel@gpiccoli.net
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-3-gpiccoli@igalia.com>
 <db836cd7-c3aa-ee60-e622-c52fcdb78fb3@linux.intel.com>
 <081cc0a2-f684-e5aa-e87f-05a54db87022@igalia.com>
 <ad1d5457-cae6-03f6-970d-0492727e66a0@linux.intel.com>
 <232ab4da-42ea-4d17-96c8-ca0d93f04f33@linux.intel.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <232ab4da-42ea-4d17-96c8-ca0d93f04f33@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Xi, thanks for you feedback. Comments inline:

On 13/10/2025 14:39, Xi Pardee wrote:
> [...]

> I am still uncertain about the added value of this patch. Could you 
> please elaborate on how displaying the register name would assist with 
> debugging?
> 
> The registers in slps0_dbg_maps are intended for diagnosing slps0 
> related issues, and the register names should follow the format 
> SLP_S0_DBG_(1,2,3).
> 

The names do not help with debugging issues, definitely. It's just a
detail, an improvement - or at least, I consider the output a bit better
with this patch. But that part is superfluous, if you prefer not to
change it, I'm totally OK. And ofc you / Ilpo are right, I changed the
naming in a wrong way, I'd fix that in next iteration (thanks for noticing).


> Additionally, the full 32-bit register data should not be displayed 
> here, as some of the bits are reserved and must not be exposed to users.
> 

Now, this one I respectfully disagree - these raw values have absolutely
no meaning for the end-user, exactly due to the reason you said: there
are many reserved bits. So, for a normal user, a piece of hex values,
junk...

But for Intel, it might be the case you do have internal specs detailing
these reserved bits, this could be meaningful. That's exactly the
purpose of this patch: when debugging rare to reproduce failures, having
this raw register could help Intel to determine the cause of odd
failures and eventually fix it. No harm (or meaning) for end-users though.

Of course the driver is from Intel, and as maintainers you could decide
to not show the raw debug data from these registers - fine as well, let
me know what you prefer.

Thanks,


Guilherme
