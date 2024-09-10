Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C332920314
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Sep 2024 03:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725938730; cv=none; b=bf0j1pRBv/NeAzv9N2kwtsLyFG0SPavgvCCE8FtiaMSdXIGcAdPqAAhzInVjyheiIXn/HGxGrDUVo8bDsdqFID2SPYUCshvmb9jzJ4D8vnFbjiFGdQCxpxDV0PbDzfxC/3NEVN53VGYcv14/dVzB3VZQMTSzoOwstaLvcR54NL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725938730; c=relaxed/simple;
	bh=wRGHrX/Ec/g+JJ3S5vO6rInpVlU4N57aTsUecq+kxpE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ahuwkjc+rNjJ+Fyfs37W4GMha5vgdd5FeGO4nN3mqEQm014GDqZeddxgLbiV7wkYgUu91xt9vqniHBeLfZKQ7e+IiR2z7UKerpZhFWStUk4MkrVd2FeR47KGX968Sm5PRiSCTd4YYcwwolus5NvzN8tI89eDKQmyIGd6mRSQmIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=tk0fWREN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qpTmTiDG; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="tk0fWREN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qpTmTiDG"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B415C11402C6;
	Mon,  9 Sep 2024 23:25:26 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Mon, 09 Sep 2024 23:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725938726;
	 x=1726025126; bh=TVl5Z4VzV3dlESfBWZk/i/zaXYUXZKQ7pPXlUmpQo+M=; b=
	tk0fWRENE5523mfbCwhSX9kmKEzi7gRJuwasNMTC4Rfr/cdb41sQPl21YEoFNkIu
	pwmfuZW+yPG9KRolZnQDGZdAtVrMrS4lo/yN1tGiNw7ERlYUlu7eVwA3X77NafFs
	dhiEjl4Y6FUTk4ewxmYdedPbRetaajNZyVqnP0O7xf3YgbGGS8sMvTGq/UJjCy/2
	r8uA6ssGj+ccqhcBzinSGXhEljHKdGigXyuNR41GbQfCj/ZLl+hRDC0z6yolteWg
	ID75VCzFPIMsLLOplGfqNc8qnEFVYM4XCSlmz+zRb9liJDmY+YVSdZVk2Z+70byC
	hi3iJWKg2b6epOu3kNR4eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725938726; x=
	1726025126; bh=TVl5Z4VzV3dlESfBWZk/i/zaXYUXZKQ7pPXlUmpQo+M=; b=q
	pTmTiDGdMCalqCJNnVguJErgV5SUDuDxldTN3SfEVX8UofhK2g2ESvPkuUcba9by
	msp0zNgY24xQyTHeRZtl3qp5NtbvU+P+40EBH+/glecgzvsWJpnhebQWFjeesicJ
	+HZ7I5jjpYfF5/aBzwh9pKe9T1oPYa3jQn9JpG/+ImiofM/pxllHDJGJocTQpz1m
	BWYshD0FrBRwhsOyia+37UsiY/r2IMJ2bYWYOiAHHnBTDTLYHZqlAdtdZuEBqrp0
	0SpGVddmLTQ+rk/wFP/eMRz2y65cmpO65UYb1QC8CYWnss4qN+HaekZsNtuQh/ET
	9pAs3BxzFCYfiOS40um+A==
X-ME-Sender: <xms:JrzfZpHkXsr9EadQgKctROK-nvuysb3GysVuhzqUtxlkb4dc6V74Aw>
    <xme:JrzfZuWzYye4BfsTdSLYzRjF9WjxH29DnTsEXW-_NCZIeAdNcNR3LZPqp83rqxUu5
    CV3fzrzpoGT2-Tf8YM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeikedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefoggffhf
    fvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnuhhkvgculfhonhgvshdf
    uceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepieetteelgf
    dufffhhfdvuefgtdevtdevteduudffveeuheejgfevgffhhfdufefhnecuffhomhgrihhn
    pegrrhgthhhlihhnuhigrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthht
    ohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsggrshessggrshhnihgvuh
    ifvghnhhhuihiivghnrdhnlhdprhgtphhtthhopegtohhrvghnthhinhdrtghhrghrhies
    ghhmrghilhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigke
    eisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:JrzfZrKuj71G5--HlJ8Rdck1dQ6rBn5KWN8wevT4xwkh_0-OU4IZFQ>
    <xmx:JrzfZvG5HHrncpMn6pBKStR3Xm--veDtSZ0GSmioV5sob-zJXMDRIw>
    <xmx:JrzfZvV1uXFpk63WWsowN2Jxpln6w3daxAKbhGKsaMk53rLyYDxGaw>
    <xmx:JrzfZqPzs8Bviz91Stu0FFlbsSyuIQ6bvt_cz5UrEwYcqhioIuTTYA>
    <xmx:JrzfZmeyXD8S1qZSvdEhnPu2lHK2bfUKSSmlG3l-0lVOuZ8NEyPNAVFc>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 62A1A3360077; Mon,  9 Sep 2024 23:25:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 15:24:14 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Bas Nieuwenhuizen" <bas@basnieuwenhuizen.nl>,
 platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com
Message-Id: <883ebf71-fc38-4685-8137-ab11976499d3@app.fastmail.com>
In-Reply-To: <20240909223503.1445779-1-bas@basnieuwenhuizen.nl>
References: <20240909223503.1445779-1-bas@basnieuwenhuizen.nl>
Subject: Re: [PATCH] platform/x86: asus-wmi: Disable OOBE experience on Zenbook S 16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 10 Sep 2024, at 10:35 AM, Bas Nieuwenhuizen wrote:
> The OOBE experience fades the keyboard backlight in & out continuously,
> and make the backlight uncontrollable using its device.
> 
> Workaround taken from
> https://wiki.archlinux.org/index.php?title=ASUS_Zenbook_UM5606&diff=next&oldid=815547
> 
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
> drivers/platform/x86/asus-wmi.c            | 10 ++++++++++
> include/linux/platform_data/x86/asus-wmi.h |  1 +
> 2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index cc735931f97b..3b333d6076ac 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1779,6 +1779,16 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
> goto error;
> }
>  
> + if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE)) {
> + /*
> + * Disable OOBE state, so that e.g. the keyboard backlight
> + * works.
> + */
> + rv = asus_wmi_set_devstate(ASUS_WMI_DEVID_OOBE, 1, NULL);
> + if (rv)
> + goto error;
> + }
> +
> error:
> if (rv)
> asus_wmi_led_exit(asus);
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 0aeeae1c1943..ae9bf7479e7b 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -62,6 +62,7 @@
> #define ASUS_WMI_DEVID_KBD_BACKLIGHT 0x00050021
> #define ASUS_WMI_DEVID_LIGHT_SENSOR 0x00050022 /* ?? */
> #define ASUS_WMI_DEVID_LIGHTBAR 0x00050025
> +#define ASUS_WMI_DEVID_OOBE 0x0005002F
> /* This can only be used to disable the screen, not re-enable */
> #define ASUS_WMI_DEVID_SCREENPAD_POWER 0x00050031
> /* Writing a brightness re-enables the screen if disabled */
> -- 
> 2.45.2
> 
> 

Looks good. Quite an important fix, thanks for taking care of it.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
