Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5318A313539;
	Tue, 23 Dec 2025 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766522096; cv=none; b=srS4jaqQCZSvfZ2ZT5Xf26c+jNJvjVCeYOo+qNQ8pQ91PDmc+j11UKC8I8rtkSQR/qNBBbkNsSRmgcrKjzan7Yi+HmpVMpu4wOlhX+2+NcTbnDcty/5NaIR18v+0AZ2A3oMBzIWPrShVKyQvYlRTsQJvG6CT5VvVq3YjCS+G33M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766522096; c=relaxed/simple;
	bh=66VC8Jl1Nz4UseMwf40je1PajxUvteujd3q5ce1qilQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZsUrycr1dBu4nyerdoorw+MPXtCJTTLcKvu2aWHaZIfeJc/IW1JkHAbcwBJl/CjM9heiZ9ttrRlbf8VjW7JW29CAP7PV3L6UFRE7QPCFgM4zATXW7XEUA90Fq3ZZt44Xl/LrAvOLNIjt2Gwf5OI4Xaw+gC/2Fxia0H1Pwcjve5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=MPmp6teK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uel5h3th; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="MPmp6teK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uel5h3th"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8851E1400143;
	Tue, 23 Dec 2025 15:34:54 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 23 Dec 2025 15:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1766522094;
	 x=1766608494; bh=9kswkJzR8yvGLuw/imitqRY4qex836jKMJIhnbyRuEw=; b=
	MPmp6teKcBThbjHV9l642rMdDe4rxAFMBUub8DaeF4foj2g9sEFe/fGm9O2UKjs0
	6ADuKMoG43Qdx9e2bniMuul5fGVNPinYreSy6LBowaPIyom/EE/uMB970Y6XPvu8
	3TXSBJRU3m0Y6TBKygveKkcGdgWILqvCpekCSxPiiMplHdIvC/uMJXQVZ9zdMeFj
	CokBdIYRbGy1zj/s7SZEJq8ezTO7Xl1TpBFy7Vdqnt/1VWRUK3cJrnwIGM/evmdj
	WTd+NNix+iwQLXgcXG3RNeps8tUDfS0LY/o+dYwaBmuSyXAACg0wBkYqrPO9iGLt
	cWQKc3YlSefdfPJbeTM4Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766522094; x=
	1766608494; bh=9kswkJzR8yvGLuw/imitqRY4qex836jKMJIhnbyRuEw=; b=u
	el5h3thJNOMT9SnyJMiFlGaX7/cQn/+WL8LxFvajT+LzZLkhKitZ3s4v3H9GmKnQ
	9lBLmVLvDoSz5wcBVaKXQycPskOHlXAv3Zd+qjhIXoEO6CMkJIYimdCq84q7gARo
	lguP1oYW1PqGcXf1AjThPcAx1TadiGDGyMeI9oawThlHDMzFINV4k0RjWE5DKHHS
	wlzXPqiclX8DYgI+HjaQzrZH1S/MckZcSsA7SiTeJB+3pj36gqxnm5HrnCVp4tyK
	VWfgIyMUQ6dw+MmgTGU0oEA5JPIVrFWrpv3yCcSYmlGNhmk2JGeYEyCux5p8/NkX
	sozF6k0RK0Vuhp/fna7+g==
X-ME-Sender: <xms:7vxKaWBV7VAGdH6Jvbf7kIb6TGseURjFgDsgO2AjI2c9IFbxhc-o6w>
    <xme:7vxKabVt0H9RgheL2JFCOnLUxdnRYIBL4_najpxxqEltpNGYhO1MwaLDRl1Q4atxv
    HtZGpQLGOhOnxffStOeOR6d0Ulu4QOtBCMmSNmxeJVupeKBLnuQLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfeuvdehteeghedthedtveehuddvjeejgffgieejvdeg
    kefhfeelheekhedvffehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsggvnhhjrg
    hmihhnrdhphhhilhhiphegleehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvrhgv
    khhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehhrghnshhgse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhn
    uhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgv
    rhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:7vxKaelXbfnbZ-nCQ-uk9H6xCHIOvbu0z2qvALa-XKCDSVvlnWBShQ>
    <xmx:7vxKaYHII4g61U7m8GZ-Fz-L2NQzW5DBqJWnHBJAett6PSS-oHsGaA>
    <xmx:7vxKae4gkL2CETYhBNd8rESEWkpZVfmMhC8gNcJ_qiSalSHQOnyvNg>
    <xmx:7vxKaYlHC4I3uAJ7CPtv5QqYBf-Y5IpFZAQOzwZdjaDnYwH4VmLHug>
    <xmx:7vxKaZJETo4AH2wPNdwZzlJzIsRzPT_ZUpQMEAvxRlUFrkR_p_AvnX0M>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 577082CE0072; Tue, 23 Dec 2025 15:34:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AgG1KmZ3azLF
Date: Tue, 23 Dec 2025 15:34:34 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Benjamin Philip" <benjamin.philip495@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-Id: <572f5363-c23b-435f-a36b-7b708704a3c1@app.fastmail.com>
In-Reply-To: 
 <CAMEXYWf_m8PL-ZGAv_1ufLp_1ryQK15ziaO90_OxmMV4VkpTPQ@mail.gmail.com>
References: 
 <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com>
 <CAMEXYWf_m8PL-ZGAv_1ufLp_1ryQK15ziaO90_OxmMV4VkpTPQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] platform/x86: think-lmi: fix column limit overflow
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
> This commit handles some column limit overflows (that occur after fixing
> their alignment), i.e. the following check:
>
> CHECK: line length of ... exceeds 100 columns
>
> by defining a constant opt, and replacing the offending
> expression with opt.
>
> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
> ---
>  drivers/platform/x86/lenovo/think-lmi.c | 31 +++++++++++++++----------
>  1 file changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
> b/drivers/platform/x86/lenovo/think-lmi.c
> index 1ada4d800383..07ba0d84720a 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -1083,12 +1083,13 @@ static ssize_t type_show(struct kobject *kobj,
> struct kobj_attribute *attr,
>  }
>
>  static ssize_t current_value_store(struct kobject *kobj,
> -		struct kobj_attribute *attr,
> -		const char *buf, size_t count)
> +				   struct kobj_attribute *attr, const char *buf,
> +				   size_t count)
>  {
>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
>  	char *set_str = NULL, *new_setting = NULL;
>  	char *auth_str = NULL;
> +	const char *opt;
>  	int ret;
>
>  	if (!tlmi_priv.can_set_bios_settings)
> @@ -1163,10 +1164,11 @@ static ssize_t current_value_store(struct kobject *kobj,
>  			ret = tlmi_save_bios_settings("");
>  	} else { /* old non-opcode based authentication method (deprecated) */
>  		if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
> +			opt = encoding_options[tlmi_priv.pwd_admin->encoding];
>  			auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
> -					tlmi_priv.pwd_admin->password,
> -					encoding_options[tlmi_priv.pwd_admin->encoding],
> -					tlmi_priv.pwd_admin->kbdlang);
> +					     tlmi_priv.pwd_admin->password,
> +					     opt,
> +					     tlmi_priv.pwd_admin->kbdlang);
>  			if (!auth_str) {
>  				ret = -ENOMEM;
>  				goto out;
> @@ -1299,6 +1301,7 @@ static ssize_t save_settings_store(struct
> kobject *kobj, struct kobj_attribute *
>  				   const char *buf, size_t count)
>  {
>  	char *auth_str = NULL;
> +	const char *opt;
>  	int ret = 0;
>  	int cmd;
>
> @@ -1347,9 +1350,10 @@ static ssize_t save_settings_store(struct
> kobject *kobj, struct kobj_attribute *
>  			ret = tlmi_save_bios_settings("");
>  		} else { /* old non-opcode based authentication method (deprecated) */
>  			if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
> +				opt = encoding_options[tlmi_priv.pwd_admin->encoding];
>  				auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
>  						     tlmi_priv.pwd_admin->password,
> -						     encoding_options[tlmi_priv.pwd_admin->encoding],
> +						     opt,
>  						     tlmi_priv.pwd_admin->kbdlang);
>  				if (!auth_str) {
>  					ret = -ENOMEM;
> @@ -1381,11 +1385,13 @@ static ssize_t save_settings_store(struct
> kobject *kobj, struct kobj_attribute *
>  static struct kobj_attribute save_settings = __ATTR_RW(save_settings);
>
>  /* ---- Debug 
> interface---------------------------------------------------------
> */
> -static ssize_t debug_cmd_store(struct kobject *kobj, struct
> kobj_attribute *attr,
> -				const char *buf, size_t count)
> +static ssize_t debug_cmd_store(struct kobject *kobj,
> +			       struct kobj_attribute *attr, const char *buf,
> +			       size_t count)
>  {
>  	char *set_str = NULL, *new_setting = NULL;
>  	char *auth_str = NULL;
> +	const char *opt;
>  	int ret;
>
>  	if (!tlmi_priv.can_debug_cmd)
> @@ -1397,10 +1403,11 @@ static ssize_t debug_cmd_store(struct kobject
> *kobj, struct kobj_attribute *attr
>  		return -ENOMEM;
>
>  	if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
> +		opt = encoding_options[tlmi_priv.pwd_admin->encoding];
>  		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
> -				tlmi_priv.pwd_admin->password,
> -				encoding_options[tlmi_priv.pwd_admin->encoding],
> -				tlmi_priv.pwd_admin->kbdlang);
> +				     tlmi_priv.pwd_admin->password,
> +				     opt,
> +				     tlmi_priv.pwd_admin->kbdlang);
>  		if (!auth_str) {
>  			ret = -ENOMEM;
>  			goto out;
> @@ -1775,7 +1782,7 @@ static int tlmi_analyze(struct wmi_device *wdev)
>  						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>  			}
>  			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
> -					tlmi_priv.pwdcfg.ext.nvme_master_password) {
> +			    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>  				tlmi_priv.pwd_nvme->pwd_enabled = true;
>  				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>  					tlmi_priv.pwd_nvme->index =
> -- 
> 2.52.0

I'll defer to the pdx86 reviewers for this set of changes.

This seems to me to make things more complicated than needed, purely to address a 100 column limit. I personally don't like the change.

Nothing wrong with the code, and if more experienced maintainers prefer it, I'm happy to defer to them. Otherwise it seems to me noise for the sake of noise I'm afraid

Mark
