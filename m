Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BEA2F6920;
	Tue, 23 Dec 2025 20:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521722; cv=none; b=jHtLyd46wAGFWnd63kuZVBtT2Y6fu5d4jA8OYc1YsMqH0nRugCFBQZQy0bCaAroJc/tl/Arv/uxOiisLJRcSm7mIozAV5Uq//SfouchM6heya1PvOfPfGdfvEUYMJvqSnZE3G5ijDReXIEPlX/d5OHcCRQ+bqelzmcMd+r1i8oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521722; c=relaxed/simple;
	bh=BauWw57FIhtmlBexVCVQafxKLAR/gNKjRmIXI0Dk/M4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PPRNbl+mptN3mWO1EUZBlChFBWOmbPV1zeZCYneXrHLWSbYly+lIxKxAMSzExWI765UHzGfcFEiYMMiuoVCmK4XFmuyx6LjB8fL0uFvKPHudXdK6iPHGyxDVwTOAtKp6CWPzNG4E8XSop2QAtS2SCkpUco1ZnresuSrL2dcOq6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ZFi6vqzd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Sf7dAcVC; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ZFi6vqzd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Sf7dAcVC"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 3F8F7EC00C4;
	Tue, 23 Dec 2025 15:28:39 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 23 Dec 2025 15:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1766521719;
	 x=1766608119; bh=3iywZD4a55lSKNBbJFRUaZL+VOyrp5lYIa+wmkaB21c=; b=
	ZFi6vqzd2WemBJq5vR3So5UuABQeFZRZSlHxgD5pI4SXOiZLrKflRIy1nDJYPp5X
	xMGqI4zouhaoE4xQDo0YKE67axb0/MaQKEAwVLkoGzEToe/aXDB8G5c04t6WF5su
	eCUq/tcnB/X5LL42zOsyDfo1udy21xZQht/IfGFxkC7ySpuWOQBgyMhYzLjZG+Rr
	5zrxR7MR7yZcHipdAV64CqJfY71jS9v7Dh9cxmeNTbap3iVD9Msxp9Lnl6961hkh
	nwBanvReUJ4w3Fp9QrHlzazR1pfSfORb0s202lAd0ngB2v6YGxeCrXU873c0Q2Z+
	GJct5diRKYQTU1aGIYVb/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766521719; x=
	1766608119; bh=3iywZD4a55lSKNBbJFRUaZL+VOyrp5lYIa+wmkaB21c=; b=S
	f7dAcVCjUikY03N2P8n8nYhsfgD+e8pWyFHgj8HmbmDX4+1WqOwAx6bc5BV+hFX+
	psPwFp8LGvk72TBVyNj4xiVVIkucT7CrYJBbHYC2fKJ8GjDhaVG4BrRh7PEwzP3v
	E+v4n4Fp94WRdaYCfg7m95+jQWJcsUlSrdtGY9ng3rjtUeP7h10UOfFBea7GfaOE
	Fmtd9OqvkT50+LbSYxhbE8iMtG4x5e0NTh4Aa9k6oB6ucGdOA6Wzep/NDO1ssB+3
	AnQ/GrML18Hec581U4u5AdoxpJVVH2hb7dG015mqGUlTMnnYgM2katuTzviMpWc1
	ctrfqbzjYNpUVCFAF2Gvg==
X-ME-Sender: <xms:d_tKaUhMP3F-PBiZard9BAz1mUpgI3CvjbPkD-H_A3ocJZQpy11Faw>
    <xme:d_tKaX3-arQP3txKD5kYfoK3DJmf_kmkY0tWniavWydZSQIo-G7lRYu1OFKkm-V7X
    fcyb7eIfHSELxqNjFG6D4srU4rqVvYVvPpznw6NnbJzYpRshCkKe8Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfeuvdehteeghedthedtveehuddvjeejgffgieejvdeg
    kefhfeelheekhedvffehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsggvnhhjrg
    hmihhnrdhphhhilhhiphegleehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvrhgv
    khhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehhrghnshhgse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhn
    uhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgv
    rhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:d_tKaVFuUxR76V-gEyjbPM7q2kFZ60eEowhGsPqy_p59BESSKjSMNA>
    <xmx:d_tKacnCHIyzqY4zz1oiUGyQ4rtTDXrROQyYN8v1Eu6kMA14qgZHrA>
    <xmx:d_tKaZZhz0kUU3E-FKx_l9lNILeFrDwJ5KJyL94e_66XPwRuK-BodQ>
    <xmx:d_tKaRG_8FfUjINJXgdhI20ESXr4yS8KzEeV9PbkS2Auth5xGZUT2w>
    <xmx:d_tKaVo2bStcFmZ90b3jnBx0KTZ0exsW3514KLwvdMk5adHoE7ujCSoa>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 056C82CE0072; Tue, 23 Dec 2025 15:28:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ADjs08aGbTrs
Date: Tue, 23 Dec 2025 15:28:18 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Benjamin Philip" <benjamin.philip495@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-Id: <ca3cca35-9f30-4c77-87c2-7ac3ec85d2dd@app.fastmail.com>
In-Reply-To: 
 <CAMEXYWdFn05=kx-NYejm4nznbKQahHUJJDesc_W1OKk_X3OOgg@mail.gmail.com>
References: 
 <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com>
 <CAMEXYWdFn05=kx-NYejm4nznbKQahHUJJDesc_W1OKk_X3OOgg@mail.gmail.com>
Subject: Re: [PATCH 2/5] platform/x86: think-lmi: Remove unnecessary parens
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Dec 23, 2025, at 2:23 PM, Benjamin Philip wrote:
> This commit removes any unnecessary parentheses as flagged by
> checkpatch in the following check:
>
> CHECK: Unnecessary parentheses around '...'
>

Shouldn't you mention that you also corrected pieces of code alignment here too?

> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
> ---
>  drivers/platform/x86/lenovo/think-lmi.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
> b/drivers/platform/x86/lenovo/think-lmi.c
> index 540b472b1bf3..1fac8986d077 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -440,7 +440,7 @@ static ssize_t current_password_store(struct kobject *kobj,
>
>  	pwdlen = strlen(buf);
>  	/* pwdlen == 0 is allowed to clear the password */
> -	if (pwdlen && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen)))
> +	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen))
>  		return -EINVAL;
>
>  	strscpy(setting->password, buf, setting->maxlen);
> @@ -476,7 +476,7 @@ static ssize_t new_password_store(struct kobject *kobj,
>
>  	pwdlen = strlen(new_pwd);
>  	/* pwdlen == 0 is allowed to clear the password */
> -	if (pwdlen && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen))) {
> +	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen)) {
>  		ret = -EINVAL;
>  		goto out;
>  	}
> @@ -859,7 +859,7 @@ static ssize_t certificate_store(struct kobject *kobj,
>  			signature = setting->signature;
>  	} else { /* Cert install */
>  		/* Check if SMC and SVC already installed */
> -		if ((setting == tlmi_priv.pwd_system) &&
> tlmi_priv.pwd_admin->cert_installed) {
> +		if (setting == tlmi_priv.pwd_system && tlmi_priv.pwd_admin->cert_installed) {
>  			/* This gets treated as a cert update */
>  			install_mode = TLMI_CERT_UPDATE;
>  			signature = tlmi_priv.pwd_admin->signature;
> @@ -881,7 +881,7 @@ static ssize_t certificate_store(struct kobject *kobj,
>  	} else {
>  		/* This is a fresh install */
>  		/* To set admin cert, a password must be enabled */
> -		if ((setting == tlmi_priv.pwd_admin) &&
> +		if (setting == tlmi_priv.pwd_admin &&
>  		    (!setting->pwd_enabled || !setting->password[0])) {
>  			kfree(new_cert);
>  			return -EACCES;
> @@ -965,13 +965,13 @@ static ssize_t save_signature_store(struct kobject *kobj,
>  static struct kobj_attribute auth_save_signature = __ATTR_WO(save_signature);
>
>  static umode_t auth_attr_is_visible(struct kobject *kobj,
> -					     struct attribute *attr, int n)
> +				    struct attribute *attr, int n)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>
>  	/* We only want to display level and index settings on HDD/NVMe */
>  	if (attr == &auth_index.attr || attr == &auth_level.attr) {
> -		if ((setting == tlmi_priv.pwd_hdd) || (setting == tlmi_priv.pwd_nvme))
> +		if (setting == tlmi_priv.pwd_hdd || setting == tlmi_priv.pwd_nvme)
>  			return attr->mode;
>  		return 0;
>  	}
> @@ -985,8 +985,8 @@ static umode_t auth_attr_is_visible(struct kobject *kobj,
>  		if (tlmi_priv.certificate_support) {
>  			if (setting == tlmi_priv.pwd_admin)
>  				return attr->mode;
> -			if ((tlmi_priv.pwdcfg.core.password_mode >= TLMI_PWDCFG_MODE_MULTICERT) &&
> -			    (setting == tlmi_priv.pwd_system))
> +			if (tlmi_priv.pwdcfg.core.password_mode >= TLMI_PWDCFG_MODE_MULTICERT &&
> +			    setting == tlmi_priv.pwd_system)
>  				return attr->mode;
>  		}
>  		return 0;
> @@ -1216,13 +1216,13 @@ static struct kobj_attribute attr_current_val
> = __ATTR_RW_MODE(current_value, 06
>
>  static struct kobj_attribute attr_type = __ATTR_RO(type);
>
> -static umode_t attr_is_visible(struct kobject *kobj,
> -					     struct attribute *attr, int n)
> +static umode_t attr_is_visible(struct kobject *kobj, struct attribute *attr,
> +			       int n)
>  {
>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
>
>  	/* We don't want to display possible_values attributes if not available */
> -	if ((attr == &attr_possible_values.attr) && (!setting->possible_values))
> +	if (attr == &attr_possible_values.attr && !setting->possible_values)
>  		return 0;
>
>  	return attr->mode;
> -- 
> 2.52.0

I prefer the brackets as they were - for me it's clearer and removing them adds little value.
But the changes are fine, and I guess it's preferred overall by kernel community, so shrug.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
