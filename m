Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC53B28D;
	Sat, 14 Mar 2026 18:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773512881; cv=none; b=aR+3xKlw4CQ/xKVtdRcG2j4Hvlc3ItVDQQOg4z9795z0679sYOqDcEmWKaWX1yoUOA4vj8yFbx0RtQh/Qq4BcGS+woRncRnP8nV76tqdl47a7/bNXNCcK4m3im55zE5aQ3SEA2YIETrxUief8/IiRw2AzPfrTqRLZ6c2U+7Ncbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773512881; c=relaxed/simple;
	bh=HKSsRnfzffAbYLb98p4JpOELh/1qOwhs2FTLoDheZBA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ToGWT5dHXUvO7HZmirX9/9IAPJjA4zZBrgZ+NYQ/VgfFYYzBfjHPnnMpVqN6FarJmbpPWew6AHwqiiDDTayHwmx8ZlhFLaSZ29VRn32gXHaAo8gsqskcRJ/01isv0+/WtqHdnqoFn0bzcmFbxaqGuYUtvKg5N1lR+gDfYIfhY50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=q7zOYy5m; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bBVBEyIz; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="q7zOYy5m";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bBVBEyIz"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 41B3414001CD;
	Sat, 14 Mar 2026 14:27:59 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sat, 14 Mar 2026 14:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1773512879;
	 x=1773599279; bh=zwvZIdtzNvwv3gc/Y2+DCOvzGe/Jibu+16UIKaHpJ/0=; b=
	q7zOYy5m8tTyODSA0Z8sZJmehYxTyz/SaHsliLIwDo2dvq3rE5XwmtZOsgUu0OtK
	VwU9IA8HkX2lJQRzo5IEVJiQporiS4RtwaHgaa0OXe764wCuhamvzNtZs0kvReu5
	SBg30an6tPypPzPwX6tBDp+B8apkJbKffeXy0aWAV6TrifHygLZJfLG6Iw5stOZM
	yrESKnoHH4FnTYiRNs6ETEBKp30zuEbECnUzxkRZ+/k4Gh/h4JW0B+3dOCP943Hp
	nlKTzym3cSDWkXIzeyziLoXYp/rYVdoepoKwxY7HgkJ4iO9DyVjwQ+uU+rcmpxya
	hg1rqjKtnPRs4A1hp5ip0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773512879; x=
	1773599279; bh=zwvZIdtzNvwv3gc/Y2+DCOvzGe/Jibu+16UIKaHpJ/0=; b=b
	BVBEyIzeNhp166rvYqJe/ELIIU6cEdrUO9PvMwBPjx26901hSnD6goWp7xMzBhCo
	+IbZZWCDG3BePCFrum/HN6JsGHndJtWEEvFQBL8I4xEU6fyp9cfCk+wu/ceKmDcl
	5B9kCcp/kp9kaMgdmHyizKu0OctMfhEy3H0jYCm8FlqkCu8zlL9zUSFTJk1UVKxr
	EdCxE5QFvYkjSh5TG1Tl7bgKo74DtvDz7CXsVCz7Kw7Ml3CoNYEGz0f5qlawGS+Z
	ocwr7mqSwmOi1fgFeUule8RgzS6i7Hc3jBYfw4W6uXeC9UbQWD0AWzvRAm0gfyiN
	lfpGhllONLZVhXQRZcCiQ==
X-ME-Sender: <xms:rqi1aRHSwajVnGUjjLha5kXiiLbhdxApJGlvc7cGPCY1OUCu6wkPXA>
    <xme:rqi1aRKLfD5TjWYC8bFkA1ti6po2y8Ms0VmPCtq38lsxx42m1Q-U5bs7-XDiW0NLC
    mqmxZR1OyOuqsq9ay0yXflysK-4F3F7mqxBveVBwRPuyKQzlVt_qs4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhuedvheetgeehtdehtdevheduvdejjefggfeijedv
    geekhfefleehkeehvdffheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhn
    sggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrh
    gvkhhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopeifpggrrhhm
    ihhnsehgmhigrdguvgdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopegsohhquhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehh
    rghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpth
    htoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:rqi1aZCivVg1GZ-LUiZnYCwitxNARzPwljSCM_87REZy0ZoX3_ZIJQ>
    <xmx:rqi1ad4V9jfC3AW3gGf5bdHRm9YdekrAKNaKGOs3uG2kehFDy6yhmA>
    <xmx:rqi1aQ3lBBUsdKo1xsWm0lSCI8Ku1jRT_4WfS6D9Q01ZzAtQG6ByMQ>
    <xmx:rqi1aRnUSCyVnTFEigg4HkB8GBU80AiaFtmwdwyZTv4ExyHFU6Q75g>
    <xmx:r6i1aTlZLD2r0LkzKqaHkY7plqtc76FDm2OLSoPHVIGD1guk731J8ndq>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 82AD72CE0072; Sat, 14 Mar 2026 14:27:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AsDRK56wv-PZ
Date: Sat, 14 Mar 2026 14:27:38 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Waiman Long" <longman@redhat.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <de903152-9df9-4c2f-95ca-4b91690b6e22@app.fastmail.com>
In-Reply-To: 
 <20260313-lenovo-wmi-gamezone-remove-gz_chain_head-v1-1-ce5231f0c6fa@kernel.org>
References: 
 <20260313-lenovo-wmi-gamezone-remove-gz_chain_head-v1-1-ce5231f0c6fa@kernel.org>
Subject: Re: [PATCH] platform/x86: lenovo: wmi-gamezone: Drop gz_chain_head
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Fri, Mar 13, 2026, at 5:06 PM, Nathan Chancellor wrote:
> After commit 1ea4b473504b ("locking/rwsem: Remove the list_head from
> struct rw_semaphore"), which removed a reference to the variable passed
> to __RWSEM_INITIALIZER(), certain configurations show an unused variable
> warning from the Lenovo wmi-gamezone driver:
>
>   drivers/platform/x86/lenovo/wmi-gamezone.c:34:31: warning: 
> 'gz_chain_head' defined but not used [-Wunused-variable]
>      34 | static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
>         |                               ^~~~~~~~~~~~~
>   include/linux/notifier.h:119:39: note: in definition of macro 
> 'BLOCKING_NOTIFIER_HEAD'
>     119 |         struct blocking_notifier_head name =                  
>   \
>         |                                       ^~~~
>
> This variable has been unused since the driver's initial addition to the
> tree. Its use was eliminated between v3 and v4 during development but
> due to the reference of gz_chain_head's wait_list member, the compiler
> could not warn that it was unused.
>
> Remove the variable to clear up the warning.
>
> Fixes: 22024ac5366f ("platform/x86: Add Lenovo Gamezone WMI Driver")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Peter, as 1ea4b473504b is in -tip, this should go there as well. Even
> though this only shows up after 1ea4b473504b, I think it is more fair to
> say this fixes 22024ac5366f.
> ---
>  drivers/platform/x86/lenovo/wmi-gamezone.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c 
> b/drivers/platform/x86/lenovo/wmi-gamezone.c
> index 381836d29a96..c7fe7e3c9f17 100644
> --- a/drivers/platform/x86/lenovo/wmi-gamezone.c
> +++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
> @@ -31,8 +31,6 @@
>  #define LWMI_GZ_METHOD_ID_SMARTFAN_SET 44
>  #define LWMI_GZ_METHOD_ID_SMARTFAN_GET 45
> 
> -static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
> -
>  struct lwmi_gz_priv {
>  	enum thermal_mode current_mode;
>  	struct notifier_block event_nb;
>
> ---
> base-commit: 739690915ce1f017223ef4e6f3cc966ccfa3c861
> change-id: 20260313-lenovo-wmi-gamezone-remove-gz_chain_head-71d48410ad10
>
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>

Change looks good to me
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
