Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A05330679;
	Tue, 17 Feb 2026 23:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771372213; cv=none; b=f6e8RFwMlqxlygq1XRKUBqb2En89l1pmKS/dpCpEanfQcx0oVyTvkoY1DwR2izwZUJUjs7MewPDhPuCSGdm6bghN4EEz341aMVGvydcj18YTCZwYZDz1yPmhNcUJdmH9ZlT1r1gSdeVnJ7DX8SuMDf2BROb9xgJDB3OnVxG3s+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771372213; c=relaxed/simple;
	bh=v+E2LWYGeO83JOCJ9365NiHuZGD4xJj/jb8iklpvk74=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=haG90uuarNtAGebTmhub7QmSyN9S+KfCXXfUk4BPTtuTHWv0y/VgwgPm4/rFzDkxvaoq44HhqCuxd8RCg6wZ5Xbz9EfYL/Sjo7RfHZs2IBtJXappXyRD0qGrrR+6mGXzcABDLSjw/hmIXioMbXsaFuzSG7IfRWwSq/YHln+3m8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=dWP60zFk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pRRQkt6q; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="dWP60zFk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pRRQkt6q"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D0F8C7A00BC;
	Tue, 17 Feb 2026 18:50:09 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 17 Feb 2026 18:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1771372209;
	 x=1771458609; bh=mlkY45oMijt5ANfhaBa9ZE6nCGaxTKqGJLkwzPfSxUA=; b=
	dWP60zFk8WXgdydlqcw/GI6L0WXWfUkYXt95X066OIvMdO/57txJf1PgE22hzPzS
	4BV9z0AdzF7S498NQgD2rrD9kTO4t7JWmeN+lE3vA+pSJfrpLchQC6razOarVz/9
	esmkA3kUFCyi6Z34iJXer91qVB+GwpEFWrjrhEhclbzCUuD0D3JWA1RM4TyMOc6W
	W1QrcJfPvqJsRbnk1ClTOzu95JwiWC1OseX2XScpNDjBmL2roVg6jZFatGfkIqXa
	DzRo87lL0QgNP3Uri0uc4u8DHLKVOvnYHFAOv1sCP2Q5cuIN6is31fKnKj1IRwrk
	OSGEWF/WhIhpF1r7IFo6xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771372209; x=
	1771458609; bh=mlkY45oMijt5ANfhaBa9ZE6nCGaxTKqGJLkwzPfSxUA=; b=p
	RRQkt6qtgTfRS3G75N9tPEUU+EU9gXfxPhO52+FQx4bjHBpG2QXokwiK2Z3iaba2
	X3Na2oHaJCboCpM6v2pvUwLqScA/TWLujhydaisxTUfyAzH8r0CH9dknN28AH7Pi
	PXhyZr7cN1XbMsRuFm4uYYg0QG0imMfbRnSgARybPsguPCYRc/Jfu5P3T/Db2vdm
	LMzrRQa2Lh/Zp6v+IAGiOthYxTe53noVXNdt4FNr0IIEcCF9SfXNDIp+t0nHhmUp
	qjIVIcBI0goVKBZl2vvnXjwSfXgqWSTwOdI4nObQ/yR7or028MT5BwdUtS219v0n
	HuttfcT32hHLfKQpskcGQ==
X-ME-Sender: <xms:sf6UackjhdQ6MXOu_fV9itsSBGA06hWpUR9HpXm0l-gI6yYzvy8Img>
    <xme:sf6UaWqmsUF1pBPKmeTdDF0dL05pNbRO9STVLbFUAqvVggEfUPrzsaKuuTbnRvC-r
    rWEB6P8h8hWteG6psTb-6IboFqypW28nEvgO14rgBJ6H6TojGbaUF8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdduuddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpedtffevgfethfevteduvdefleevkedtuddvlefghefg
    ieekffejteejveffkedthfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepledpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkhhjohhhnhdrtghlrghrkhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehkuhhurhhtsgesghhmrghilhdrtghomhdprhgtphhtth
    hopeifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopehhrghnshhgsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinh
    htvghlrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthht
    ohepihesrhhonhhgrdhmohgvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgv
    rhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:sf6UadkCgVdF0HuRcjm_ljkAG6GCN1RWYHYiES8nHBZWw1Ys1F1n_w>
    <xmx:sf6UaVYTVXBA4U6I7g5AKa0fa_6G46ViAmGXoahII1P1rySYDWdWzg>
    <xmx:sf6UaYG4hh5B0ttpOh1VcaVxQXPtaoSGCqa5T-fUzMGr_zCTJzIyfw>
    <xmx:sf6UaUZ2gS5qq4iiiOXe0S9KS6R6PoPLrFqqgRVCs4-Eon1T0AbXOg>
    <xmx:sf6UaSp4wKQKx0ZrKy_CH2ScHbVCLn72zOfqLIC8sKefRH11ndufwcE7>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 14A4F2CE0072; Tue, 17 Feb 2026 18:50:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AHYBVvpqSUWZ
Date: Tue, 17 Feb 2026 18:49:48 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "Rong Zhang" <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <72f2005b-b1bc-45a0-9ac1-2863fcbda1cc@app.fastmail.com>
In-Reply-To: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
References: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
Subject: Re: [PATCH v2 0/6] platform-x86: lenovo-wmi: Add fixes and enhancement
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sun, Feb 15, 2026, at 1:12 AM, Derek J. Clark wrote:
> This series adds many much needed features and fixes to the lenovo-wmi
> drivers.
>
> Patch 1 adds a macro to make assigning attribute ID's for capdata
> cleaner and easier.
> Patch 2 addresses bugs where devices that don't support exposed
> attributes would still create the attribute, and also attempts to
> identify the correct capdata and set/get methods as some legacy
> interfaces don't use the custom mode in the method or capdata ID.
> Patch 3 adds the remaining CPU attributes that weren't previously
> exposed.
> Patch 4 adds the GPU attributes that weren't previously exposed.
> Patch 5 consolidates name constants in preparation for patch 6.
> Patch 6 adds battery charge-type limiting when supported only by WMI.
>
> After applying Rong's series from
> https://lore.kernel.org/platform-driver-x86/20260210191938.137234-1-i@rong.moe/
> I found that there weren't any conflicts, so rather than combine
> the series we can just review each separately.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v2:
>  - Fix gpu_mode misisng from attributes list.
>  - Fix prototypes for power suppy patch.
>  - Reorganize CPU and GPU attributes alphabetically.
>  - Break out the patch consolidating the driver name cost.
>  - Move some of the refactoring of attribute_id back to into patch 1
>    where it belongs.
>  - Fix some additional typos in function prototypes.
> v1: 
> https://lore.kernel.org/platform-driver-x86/20260213081243.794288-1-derekjohn.clark@gmail.com/
>
> Derek J. Clark (6):
>   platform/x86: lenovo-wmi-other: Add LWMI_ATTR_ID Macro
>   platform/x86: lenovo-wmi-other: Limit adding attributes to supported
>     devices
>   platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
>   platform/x86: lenovo-wmi-other: Add GPU tunable attributes
>   platform-x86: lenovo-wmi-other: Consolidate name into single const
>   platform/x86: lenovo-wmi-other: Add WMI battery charge limiting.
>
>  .../wmi/devices/lenovo-wmi-other.rst          |  21 +
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  13 +-
>  drivers/platform/x86/lenovo/wmi-gamezone.h    |   1 +
>  drivers/platform/x86/lenovo/wmi-other.c       | 606 ++++++++++++++++--
>  4 files changed, 592 insertions(+), 49 deletions(-)
>
>
> base-commit: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c
> -- 
> 2.52.0

For the series - looked good to me (I didn't know the hwmon limitation Kurt highlighted)
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
