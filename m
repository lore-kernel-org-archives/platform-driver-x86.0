Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCC2BA3D
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757962521; cv=none; b=WIALO08hgEDGyS5akLZ9PVFgy/VBxnShUvLYo09OOCmSZzO0gs7wZ57hYjg++vyCjugdDcXkmweNsA6itG4kQp9fYCmbbyEwc/NeCb5LozzGk1y8JeNv5qw6cyk5kuk9JeAkPLVjb4VY5amIz3qOCrY0ZdbfuCk3x00TbTtx+d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757962521; c=relaxed/simple;
	bh=XNmb7Zcq89yx/WlPmokC9Ef/AlpImnLswT/BTKPa1/M=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=e5PRiFYQAOFBzHKoHBOwo/Syo1CrY2ddNNfyk2jN51dUt/WAxAvYO7YRIG+sb9YH7u28iuZ/tq7mCpzT2aW2H0ZrL31vfk/CAWAE9on4cskuYixz9PCBFtBHzwKT9s2c51oYDDAHrl5Bj0I39VbXOvfM3fStSXYdMdqDk0jZ7dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lyndeno.ca; spf=pass smtp.mailfrom=lyndeno.ca; dkim=pass (2048-bit key) header.d=lyndeno.ca header.i=@lyndeno.ca header.b=r/7EAY3g; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eLnu55vn; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lyndeno.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lyndeno.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lyndeno.ca header.i=@lyndeno.ca header.b="r/7EAY3g";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eLnu55vn"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 23084EC027E;
	Mon, 15 Sep 2025 14:55:17 -0400 (EDT)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-06.internal (MEProxy); Mon, 15 Sep 2025 14:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lyndeno.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757962517;
	 x=1758048917; bh=XNmb7Zcq89yx/WlPmokC9Ef/AlpImnLswT/BTKPa1/M=; b=
	r/7EAY3gygdXOxAhIM8lfrCN2ygY7PJM1bfNSXitcsb0HbCCFvi1rDeGcFD5ZkrS
	Nnr13sNQt8fGKXjWq8zM2ynI8/P1Eiqs1XWY6GFpaMRx7MVaT/GpyO8opCvlcdGT
	WCX0T+Gsg+idMBh01T1VO9ht0onJzq8p+LQaahylp3RwYkugGn2ppbXRtqEocx0O
	JATTQ6cII1CeAwY+A/D/fP4UC/6F6Qlx2MOAPTQRmJswaFtTqCnNil1TG41XkT6V
	4Yn0LmNIDGTeRDEPvNPGyvN8ryNkAM/ZTtlgZuNW/9fQ5r1DhtSY3j1I3u66Bm+P
	k97Fa8XSDTwiTSY9vHS9pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757962517; x=
	1758048917; bh=XNmb7Zcq89yx/WlPmokC9Ef/AlpImnLswT/BTKPa1/M=; b=e
	Lnu55vnwihsPlfA5fp+wsMtFq1IyoDiYYVniUfoOFy0Gu3//keWZIkreJyKdw73B
	RNzlDOqE7lAKmbcoOznmibbsAGfP62SUA7WW3JkDjV2qhjNKXzaowqQydEQXdTLL
	93GEzGwdmYpaq5/KvxIqbYAbhzxNUhL62yhByuouSNnNUIoQVIBG28ixn5/t1U8T
	ONFJMle+aGp1zQGaDHkB+7m3GPEgvZ+rVvY9lariF8yHFwXoMpcu6/zWcpbct+u+
	1MirXxeFIxwVvvq84gF9Bq7Dc6pz4TPuYni0x8a3GsYcxtB5aLZm/gJcX7o5jsF1
	36Sun7r8ouvl22Aw0si2g==
X-ME-Sender: <xms:FGHIaJ8ThVQCnBYtVUjuvDDo63eAXOgcIDz0YVeJqWOvIUkoHf_krg>
    <xme:FGHIaNtQ1MxsemBRaXJQDKVMghLmkM9wm3_f3gtcfhMQJI2SfHQitUjOhu_4-ryTg
    toGCoANi0xMPtzemdU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkeegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnhihnugho
    nhcuufgrnhgthhgvfdcuoehlshgrnhgthhgvsehlhihnuggvnhhordgtrgeqnecuggftrf
    grthhtvghrnhepudeftdeuffefkedujeehheduvdevvdfhteeuueffvddtvedtleellefh
    vdekjedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eplhhsrghntghhvgeslhihnhguvghnohdrtggrpdhnsggprhgtphhtthhopeejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehprghtihhlrdhrvgguugihsegrmhgurdgtoh
    hmpdhrtghpthhtohepshhhhigrmhdqshhunhgurghrrdhsqdhksegrmhgurdgtohhmpdhr
    tghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdprhgtph
    htthhopeihihhjuhhnrdhshhgvnhesuggvlhhlrdgtohhmpdhrtghpthhtohepihhlphho
    rdhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhug
    gvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepphhlrghtfhhorhhmqdgu
    rhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:FGHIaKPH0fxdz8OTz85AcWgwLbjGRpDR-kY1hfgQN201N2hZwBktFQ>
    <xmx:FGHIaIBtWxG96XwrumtlK8o0EXYUL6hPij5VRdkZ884FbQjXKG4dfA>
    <xmx:FGHIaHdd2w10mEHrzem8FQSxZdexSuLyymAHeKx2Z3fKA4t4ZXFcUQ>
    <xmx:FGHIaHPT_Mz3y4iRIgpL7rqsz56RDzFXDsr0nzJUgVW6XyUtF-LHsA>
    <xmx:FWHIaPvdaFTXD3uccLnDODD7vQwvrA6E5e5S8vH-YsDJIAkRGSHsbuIC>
Feedback-ID: i1719461a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6F75C3020073; Mon, 15 Sep 2025 14:55:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ar-a14923kmR
Date: Mon, 15 Sep 2025 12:54:55 -0600
From: "Lyndon Sanche" <lsanche@lyndeno.ca>
To: "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 "Yijun Shen" <Yijun.Shen@dell.com>
Message-Id: <9fac1d5b-9ee0-4867-bf2b-1f4128c1f17a@app.fastmail.com>
In-Reply-To: <20250915094154.2765361-1-Shyam-sundar.S-k@amd.com>
References: <20250915094154.2765361-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH] platform/x86/dell: Set USTT mode according to BIOS after reboot
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 15, 2025, at 3:41 AM, Shyam Sundar S K wrote:
> After a reboot, if the user changes the thermal setting in the BIOS, the
> BIOS applies this change. However, the current `dell-pc` driver does not
> recognize the updated USTT value, resulting in inconsistent thermal
> profiles between Windows and Linux.
>
> To ensure alignment with Windows behavior, the proposed change involves
> reading the current USTT setting during driver initialization and updating
> the dell-pc USTT profile accordingly whenever a change is detected.

Hello:

Thank you for the patch. I think I need help understanding why this is not working currently, as this is implemented in the thermal_get_mode functionality.

This change, upon my first read, seems to read the mode from the BIOS and then write what it read back to the BIOS. Is my understanding correct? I do not have a computer where I can change the mode from the BIOS, so I cannot test that specific case. What does the platform_profile get set to on boot without this patch?

Thanks,

Lyndon
