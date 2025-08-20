Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885B11DFF7;
	Wed, 20 Aug 2025 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700693; cv=none; b=a6CZtCvr6QNLXJw/O1sLuqp/LKWBzrP7BlExBGoWqNSFynQ/+XV6LmREQtuQlJe+cbiwoebJs0A8deoK6DfBF8FIdO6+hXY06bAbDERmDyUJRLr88ONn0+u0NZOhPSzNUmZk7bhsRE3CRZiyAYKq2HBWWcKlJ5uYzYNm00v3Ih4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700693; c=relaxed/simple;
	bh=O6Im4cywTumzSoyXmNM0j8dY7T/DKLzr4M/NQbJw320=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=B0JqXO6NTrrO2kEKW4o1qF6KBwbHiC9qoco4lzmKeEG+kc9FyLvuQ1ozh1+oGMScuRvnsF0YulsL5cMjSNfuIYCD2o7U+YZs/oC9f58M5QrSM806nhQxYq42NwjZ7NRYiAsf2No6ZjNOzLUr+/Rh7Aw/N+I4QUdd9n0XQ32C1io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=HVmqwmbF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MyIlXmk4; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="HVmqwmbF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MyIlXmk4"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B5F8E140035E;
	Wed, 20 Aug 2025 10:38:09 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Wed, 20 Aug 2025 10:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1755700689;
	 x=1755787089; bh=p7Qy5gkWCJwNmaUQJiWYrFfkdql+/xEwXCnaF4G+7EE=; b=
	HVmqwmbF+00sBEnAaUb1+wcGlHKM7OaGGlKfhCC1sysq9RiqZS21/Iz3hrSqCJHz
	EGeoizSOThDpctPshMwMn1RJcPaacE6bkQc1wmXyWj2LnlteUcGxH6hkUH6n7SpI
	DyPmfe6VuQ3gImStU3+7z5oGV0bA6IUrXPiiisLlDvvQFRAQuN8CM9tRkYrq2jvh
	oxZxehCY1eOEvyf0qNvVN57RQV3m5kGhkAckCE73pWbGn9EwM4t/pyP+MVnLhls/
	4p07zINaBStZV6htplmu97HvO48INHvtL711RzP3cd+4vjgCb52pdlPSoa3LWvAa
	PQqt9RalxOo7B9MkkH7kpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755700689; x=
	1755787089; bh=p7Qy5gkWCJwNmaUQJiWYrFfkdql+/xEwXCnaF4G+7EE=; b=M
	yIlXmk4MrFzFLdNaNpiWZjI+1ZyrQARKmiVf1hN11zalAPR7v2ZD7leBQ5eSjRSR
	PmYMTg8jD7/RFrCyScOiVTM3YgNAiEW0AeXkkftfUj7Lhm3DCxrv2KIwD1PrVi9O
	FgGCA3DbLhkFcnwkuASMf/1ewAbCA7IVX3iIjKot4JTm5n2itAVxVSfsDWw/wit7
	kRc3w+MwleWHdKyIxPVnTxZ8XknRPanjKPwjcBRxGelf6NLkHlxwrm7tsueRSlMf
	j2VnQUid1CWBJAt1WpRwtaIEIctd6kMfyV4gPleXXGrS6E+Xr6Rzql1luSvKTKxs
	CR5fQf7+e4bESriZHWUFw==
X-ME-Sender: <xms:0d2laJSiwwg4p_IApOr9-zPEF7sQabyDkK43gkbAAm51b4_WSsxgiQ>
    <xme:0d2laCxNw_8jD3JEQqFYqovfr7QMJXYg3Aund6Ds0_Sgxh6E5Obz6hkLof1gIIF24
    2sy7jqvlRC550vun4o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheekiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpedufefgleehgfevffehheeutddufeffteeitdevtdeh
    gfdvuedvfeegieeihfeigeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepkedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkhhjohhhnhdrtghlrghrkhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehrrghkuhhrrghmrdgvleeisehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepfigprghrmhhinhesghhmgidruggvpdhrtghpthhtohepshhkhhgrnhes
    lhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdr
    ohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehlih
    hnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrght
    fhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:0d2laGxy2XTUZywcA88FiRpMPihS37RG4Dd0AbFOhogST2FZuP1wPA>
    <xmx:0d2laPKUEMgAtEiWtDK28FVJpxzPiKEmsA8KSsVcVG6t1xifm42lQw>
    <xmx:0d2laIGMhU2t2fZhmMbc5wRnpMgM9W629LO3cnB8rvIylQrmqpHHFw>
    <xmx:0d2laL_ohORATXT-Ko21Hgv2oOP6GbmPbi3LDB-dJf1E2d93kw4gnw>
    <xmx:0d2laEIFPe6wTJUM_McxxVht5eE9YjvStTvpW7tyz6T5HpL2-DhvsoqG>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 340032CE0072; Wed, 20 Aug 2025 10:38:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AJ31r0obZhDc
Date: Wed, 20 Aug 2025 10:37:49 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: rakuram <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Message-Id: <31b895a4-edd0-4ce5-a20a-7d0fb67e9721@app.fastmail.com>
In-Reply-To: <20250817170644.5855-1-rakuram.e96@gmail.com>
References: <20250817170644.5855-1-rakuram.e96@gmail.com>
Subject: Re: [PATCH] Documentation/wmi: Fix Typo in lenovo-wmi-gamezone
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sun, Aug 17, 2025, at 1:06 PM, rakuram wrote:
> Fixed the below typo error
>
> freqency ==> frequency
> in Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>
> Signed-off-by: rakuram <rakuram.e96@gmail.com>
> ---
>  Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst 
> b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> index 997263e51a7d..22040250a97d 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> @@ -153,7 +153,7 @@ data using the `bmfdec 
> <https://github.com/pali/bmfdec>`_ utility:
>      [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
>      [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
>      [WmiDataId(3), read, Description("Default value.")] uint32 
> defaultvalue;
> -    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 
> OCOffsetFreq;
> +    [WmiDataId(4), read, Description("OC Offset frequency.")] uint32 
> OCOffsetFreq;
>      [WmiDataId(5), read, Description("OC Min offset value.")] uint32 
> OCMinOffset;
>      [WmiDataId(6), read, Description("OC Max offset value.")] uint32 
> OCMaxOffset;
>      [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 
> OCOffsetScale;
> -- 
> 2.43.0

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
