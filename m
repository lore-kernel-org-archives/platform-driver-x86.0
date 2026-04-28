Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB4E2580F2;
	Tue, 28 Apr 2026 13:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384390; cv=none; b=XU1vTVbYTNT78mmpBZ0DYh+dhqoQq1hptStJ3DKGfc28XCEONAFqQj1HytiUzDUmyyJzwlmm+rLV+BBz7YYEsSqnCyIvKQTELkI3o/1Eqw4e3GQy4hnnOxRkSvnyJxt1ewJN57/+WqDwHmF4VTZZbirs6uwv+xU8A96VXo3Zs9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384390; c=relaxed/simple;
	bh=53qIqxxz/XNOqbbfinURBn5wYk5U6H+tvcJe/3ei4+U=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Lg32ind5EkDTEzBNbmGkRWLwWz47Qi2Fj3uWeRBlEVFP+QiiP+q4DjOEYILAUPk6KmuXA+gjXBl+dekGVL+iAW259JAUco/hhjH6+8/hnnrovijyUkxXniHJypdd57a/IFZbW0otgn1ui+GRV071hwNNRP9gcn80Ixw+218GFHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=LOkK8N4G; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CB19rJmd; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="LOkK8N4G";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CB19rJmd"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 7FEE91D0012D;
	Tue, 28 Apr 2026 09:53:07 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 28 Apr 2026 09:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1777384387;
	 x=1777470787; bh=PZROB5RIwR8bg38G5R6zN0thaRiax54t5eM8xVPbcsE=; b=
	LOkK8N4G2bioz8EOmelKPUNmQBf+0Q8DFPdm9/7ZtRmOZ/TG5zmyKkKf6y/CVc7V
	Sb0WCjG6ueG1qEOfudFE1ySpQxSlb81GOOY5ViDmaIeD2C/DwU2YEYyMB3KIhL4q
	bkUK9ZTetQsAmPeKMsnh2vEaDPMYteKYn2P9LPz5mtQrJ7ll7CPtHL2OIIYeqPqR
	TT9M/o9HNJnAjvmikpvXCX2PBZq0jFViZQ8hWQ0jUaNY3dOJJiRSfGJBQ9fnHPWc
	9KkVhFZ5G0OpgYC5YN3g4QDJLyi0z4z7K/WLpfuB6TuvyHSKC1oGXImjgfZLbtP3
	YDqRrfg4Ts7RbAHT55JdvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1777384387; x=1777470787; bh=P
	ZROB5RIwR8bg38G5R6zN0thaRiax54t5eM8xVPbcsE=; b=CB19rJmdpx0+rPZji
	x0oDAvOvExGwJCjmf7AYz3bgg43qXW5AMOFJqEGOdiANpCW8SOw3OafVEPgx3ijO
	Kemk+Sb/KGfrDBWKRv0OY7NLTnPZGisqR+c5J37XBpjJyepTzdyG+iu7kjk1WEXD
	GdJFXlMLQcZGaX7b2yUIGpqjeVDUKvIlBlaEI8eP2UTqoHOWKA50EvzCzNvESGw1
	0InuWN2xoFWNjrmJXqs/6Ec2dCXxS/DEhy/3ohABU4r1RwecRK2cCgEvWPbGpFC7
	Q96ZbIfDtV5mimSVU390s29xUepZzqNjs69ZX7qWEJ08T1fQjPKide4M4TGQoCXW
	+CtGw==
X-ME-Sender: <xms:w7vwaV0IGwkcTdz0XNIvwpYgTiXpWcPVI4jfieCExwICArhTV4C2yg>
    <xme:w7vwaW7xUGGjPNRNc_hz4EW62tjZmPNRnERpUNKyDWuhpSVjcU3US04pzEo6vGHvD
    8si62mVk6gJ-W57-EalWbHzyWGWY_eLoOqepjKa1hJclhySp3jDjVc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekudejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhkucfr
    vggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqe
    enucggtffrrghtthgvrhhnpeekffeutdevkeejueekgfeljeegteeludeutedufeduheef
    hfehfeelheehffffkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggp
    rhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghrvghkjh
    hohhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhuuhhrthgssehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheplhhgshdvtdduledvtddufedtvdeggeesghhmrg
    hilhdrtghomhdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:w7vwaQbvsYC_ut_jopawlCt4gxX_tRBJerKGE5A1BzbRW5mVnmTmsg>
    <xmx:w7vwaackc8Rbq7QhU7geXeRlWEE6UZ3fHsTCTYAr1fJpKCQ_7951EQ>
    <xmx:w7vwaRJjdUd2fSPJJFTmH3k24WmoCDrWgEpTpee8rxi6KNCs9hpNhw>
    <xmx:w7vwaXJ4fkldIa5MCGip3F4oDDEoDlkNGe9VNCLqVd2lA0bZxK6jtg>
    <xmx:w7vwaWTLZ90BUe6HQJrKNzjJ9F3eAGdTxLMe-s4xMME49BbNYm4Bypwq>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0C3F92CE0072; Tue, 28 Apr 2026 09:53:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AkNZcPbidIPJ
Date: Tue, 28 Apr 2026 09:52:46 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Guangshuo Li" <lgs201920130244@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <10e5297b-86d1-41a0-a683-914f3809e0af@app.fastmail.com>
In-Reply-To: <20260428082207.357522-1-lgs201920130244@gmail.com>
References: <20260428082207.357522-1-lgs201920130244@gmail.com>
Subject: Re: [PATCH] platform/x86: think-lmi: fix possible memory leak in
 tlmi_sysfs_init()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Guangshuo,

On Tue, Apr 28, 2026, at 4:22 AM, Guangshuo Li wrote:
> Once kobject_init_and_add() fails, kobject_put() should be called to
> decrement the reference count for cleanup. Otherwise, the memory associated
> with the object may leak.
>
> tlmi_sysfs_init() jumps to fail_create_attr after kobject_init_and_add()
> fails. The error path calls tlmi_release_attr(), which walks the kset
> lists and puts the kobjects found there. However, when the add operation
> fails, the kobject core removes the failed object from the kset list
> before returning the error. Therefore tlmi_release_attr() cannot put the
> kobject whose kobject_init_and_add() failed.
>
> Fix this by calling kobject_put() for the failed kobject before jumping to
> the common error path. Since pwd_admin's saved signatures are released
> outside of its kobject release callback, release them before putting a
> failed pwd_admin object.
>
> This issue was found by a static analysis tool I am developing.
>
> Fixes: 9110056fe10b ("platform/x86: think-lmi: Fix kobject cleanup")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/platform/x86/lenovo/think-lmi.c | 40 ++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c 
> b/drivers/platform/x86/lenovo/think-lmi.c
> index e215e86e3db7..994475eb0b9c 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -1454,8 +1454,10 @@ static void tlmi_release_attr(void)
>  	kset_unregister(tlmi_priv.attribute_kset);
> 
>  	/* Free up any saved signatures */
> -	kfree(tlmi_priv.pwd_admin->signature);
> -	kfree(tlmi_priv.pwd_admin->save_signature);
> +	if (tlmi_priv.pwd_admin) {
> +		kfree(tlmi_priv.pwd_admin->signature);
> +		kfree(tlmi_priv.pwd_admin->save_signature);
> +	}
> 
>  	/* Authentication structures */
>  	list_for_each_entry_safe(pos, n, 
> &tlmi_priv.authentication_kset->list, entry)
> @@ -1526,8 +1528,11 @@ static int tlmi_sysfs_init(void)
>  		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
>  		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, 
> &tlmi_attr_setting_ktype,
>  					   NULL, "%s", tlmi_priv.setting[i]->display_name);
> -		if (ret)
> +		if (ret) {
> +			kobject_put(&tlmi_priv.setting[i]->kobj);
> +			tlmi_priv.setting[i] = NULL;
>  			goto fail_create_attr;
> +		}
>  	}
> 
>  	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, 
> &pending_reboot.attr);
> @@ -1548,33 +1553,52 @@ static int tlmi_sysfs_init(void)
>  	tlmi_priv.pwd_admin->kobj.kset = tlmi_priv.authentication_kset;
>  	ret = kobject_init_and_add(&tlmi_priv.pwd_admin->kobj, 
> &tlmi_pwd_setting_ktype,
>  				   NULL, "%s", "Admin");
> -	if (ret)
> +	if (ret) {
> +		kfree(tlmi_priv.pwd_admin->signature);
> +		kfree(tlmi_priv.pwd_admin->save_signature);
> +		tlmi_priv.pwd_admin->signature = NULL;
> +		tlmi_priv.pwd_admin->save_signature = NULL;
> +		kobject_put(&tlmi_priv.pwd_admin->kobj);
> +		tlmi_priv.pwd_admin = NULL;
>  		goto fail_create_attr;
> +	}
> 
>  	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
>  	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, 
> &tlmi_pwd_setting_ktype,
>  				   NULL, "%s", "Power-on");
> -	if (ret)
> +	if (ret) {
> +		kobject_put(&tlmi_priv.pwd_power->kobj);
> +		tlmi_priv.pwd_power = NULL;
>  		goto fail_create_attr;
> +	}
> 
>  	if (tlmi_priv.opcode_support) {
>  		tlmi_priv.pwd_system->kobj.kset = tlmi_priv.authentication_kset;
>  		ret = kobject_init_and_add(&tlmi_priv.pwd_system->kobj, 
> &tlmi_pwd_setting_ktype,
>  					   NULL, "%s", "System");
> -		if (ret)
> +		if (ret) {
> +			kobject_put(&tlmi_priv.pwd_system->kobj);
> +			tlmi_priv.pwd_system = NULL;
>  			goto fail_create_attr;
> +		}
> 
>  		tlmi_priv.pwd_hdd->kobj.kset = tlmi_priv.authentication_kset;
>  		ret = kobject_init_and_add(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype,
>  					   NULL, "%s", "HDD");
> -		if (ret)
> +		if (ret) {
> +			kobject_put(&tlmi_priv.pwd_hdd->kobj);
> +			tlmi_priv.pwd_hdd = NULL;
>  			goto fail_create_attr;
> +		}
> 
>  		tlmi_priv.pwd_nvme->kobj.kset = tlmi_priv.authentication_kset;
>  		ret = kobject_init_and_add(&tlmi_priv.pwd_nvme->kobj, 
> &tlmi_pwd_setting_ktype,
>  					   NULL, "%s", "NVMe");
> -		if (ret)
> +		if (ret) {
> +			kobject_put(&tlmi_priv.pwd_nvme->kobj);
> +			tlmi_priv.pwd_nvme = NULL;
>  			goto fail_create_attr;
> +		}
>  	}
> 
>  	return ret;
> -- 
> 2.43.0

This looks good to me (good find).

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
