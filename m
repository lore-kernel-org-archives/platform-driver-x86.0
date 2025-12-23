Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E50315783;
	Tue, 23 Dec 2025 20:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766522182; cv=none; b=oOVHM5x1YDhMkupBDDIXcMa8dLmSNR3vZTFFbw1paY3VsBvMgHM4uLZsk0y3gr0Ms8UbIbQrHaiG++oNrnfT8Dgpr87wohZsjQ7rDlkaASlQby+d7GKGDhVJ3kM4z6pVoni5Ubmuze67mCBUY4fljHY3nyumTZXZnErTQYuXlA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766522182; c=relaxed/simple;
	bh=WoTwv0eON1ZxZ3UupjlBqiICIK4MpRoEJHkfmvgD074=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Mm+7AM5zL8M1utw4sBGUB1e1uKj47vRVjEwsr4a94GtvNep+UKBy07kd03PF/TdGFuaFbwASOPxyGPHD0pack0d3t+m+GwTTXH9N3TukfIqsjEuWZzzQ3NMYdNGFo21NZ6TNAD4PXtBewNdrnDItD8+ovI3a+twVfQnkED1g7tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ZrKUEKER; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PE9tvqcC; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ZrKUEKER";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PE9tvqcC"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 248F3EC00CD;
	Tue, 23 Dec 2025 15:36:20 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 23 Dec 2025 15:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1766522180;
	 x=1766608580; bh=ssyEcbdHGL6nIXhZrEl/ZQnrt3sZlMxwM5XgeWpuCco=; b=
	ZrKUEKERQ5vBlb9+dWIyPamBN/lk3aWauCm/bgR5ebTbOxslj94HiQYGO+L18Rrr
	YlrKd5exxbBdbeGZqccRkGkHOirqkTelxtLMAZMmFUQ/tXUUNPwuInberxugABo+
	hTAe8d/TkQOlpXoA5dmGb0FYBCx9RE6gTWqgjCCC69wugXBU4bm+DPoAixTMLJLL
	AtwwlBlBgdYXeY5VBrHk4z/gHXW+9GzIp+sr+v+Cptc7plWkZA2ZztmZRwFACjlw
	SI6UQ07AWKRFONtZ9b5j7egW0oN4iQD57ympHfxY8IjxB1bSbW1o1KOkrM/5ULIT
	/1c5L28eV8OgtX8a8HB/Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766522180; x=
	1766608580; bh=ssyEcbdHGL6nIXhZrEl/ZQnrt3sZlMxwM5XgeWpuCco=; b=P
	E9tvqcCNt72etP2vU7aC5XUvw/T02y6yOXzkyFCv6G0gxFHhSXW60bMxq4ZitoO0
	BTOybLAV/TcGxkmsloDENZJNmsbwhnhpblJRGVVuO3N/TLFx3XwDJTQvCu+NP2Ns
	zbmhzjBNZ0ppx4sCr/Im3zpofRl3qCa7MktjPlFDta5j4Uno0kWLgu+ryoMMBncD
	7851wnABmnqRchYefN6ETvUvurt8GpvRHLeF7qZD0VMeX4HhrJrvwOhgMqmJ1NJ3
	HpnYl8YUbpQeea9/JUe5KYNTbhrALEpTEPQRLPPlP9H5D62zC6L3ayzeKX2MJGml
	HvLJC9FAQtG3l6puvaMhw==
X-ME-Sender: <xms:RP1KaZ67G9arKmNcHLF2rGjbcb03_rviNZh0fxKZX6kWAVDQUL4xjw>
    <xme:RP1KaRuqlenFv5g1xXz3Hd5Pd0rFn2js7d2g5qvva_LkAau9QvKxhdXz9uBL5B5kK
    3UjW3YNvEQwiy18YosnPfwbwvgaIE2pDE52F4-3xq94gMgBhpywEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdektdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:RP1KaceQVb8eNgyWy4X2Eoz7L07qt2axivWbJHe1yHmPdmxNpdu-cw>
    <xmx:RP1KaQdzw1_7B-meMAc1nX087aU6nBNbqVT5klLsHH-fi2T9pkrrkw>
    <xmx:RP1KafwfSGdLFHxM1nK7mz86jzRbLeLrscQr3sWuKMXqaZW6dWLUIA>
    <xmx:RP1KaX90cVkI1SXR3HQc4GYn2rURyXHEMTBvxbaVtuKh71_olr_kyw>
    <xmx:RP1KabiTvye3JLwE6NovD_iLO0oEUdL_3wk8EXYLHhz70VJDQf12k0Im>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EA8312CE0072; Tue, 23 Dec 2025 15:36:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AzqcpXvAdRWk
Date: Tue, 23 Dec 2025 15:35:59 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Benjamin Philip" <benjamin.philip495@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-Id: <9a5d2dfd-6061-45c1-9180-e45c6a520f4c@app.fastmail.com>
In-Reply-To: 
 <CAMEXYWfO-+7H_9rpmgEruuZunGc69Qh8o1ii_fLkbOKS-0fRnQ@mail.gmail.com>
References: 
 <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com>
 <CAMEXYWfO-+7H_9rpmgEruuZunGc69Qh8o1ii_fLkbOKS-0fRnQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] platform/x86: think-lmi: Clean up alignment
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
> This commit fixes multiple instances of the following checkpatch check:
>
> CHECK: Alignment should match open parenthesis
>
> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
> ---
>  drivers/platform/x86/lenovo/think-lmi.c | 75 +++++++++++++------------
>  1 file changed, 38 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
> b/drivers/platform/x86/lenovo/think-lmi.c
> index 07ba0d84720a..ccb767c3972e 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -424,7 +424,7 @@ static int tlmi_get_bios_selections(const char
> *item, char **value)
>
>  /* ---- Authentication sysfs
> --------------------------------------------------------- */
>  static ssize_t is_enabled_show(struct kobject *kobj, struct
> kobj_attribute *attr,
> -					  char *buf)
> +			       char *buf)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>
> @@ -513,7 +513,7 @@ static ssize_t new_password_store(struct kobject *kobj,
>  		 */
>  		if (tlmi_priv.pwd_admin->pwd_enabled &&
> strlen(tlmi_priv.pwd_admin->password)) {
>  			ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
> -					tlmi_priv.pwd_admin->password);
> +						  tlmi_priv.pwd_admin->password);
>  			if (ret)
>  				goto out;
>  		}
> @@ -527,8 +527,8 @@ static ssize_t new_password_store(struct kobject *kobj,
>  	} else {
>  		/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
>  		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s,%s,%s;",
> -				setting->pwd_type, setting->password, new_pwd,
> -				encoding_options[setting->encoding], setting->kbdlang);
> +				     setting->pwd_type, setting->password, new_pwd,
> +				     encoding_options[setting->encoding], setting->kbdlang);
>  		if (!auth_str) {
>  			ret = -ENOMEM;
>  			goto out;
> @@ -545,7 +545,7 @@ static ssize_t new_password_store(struct kobject *kobj,
>  static struct kobj_attribute auth_new_password = __ATTR_WO(new_password);
>
>  static ssize_t min_password_length_show(struct kobject *kobj, struct
> kobj_attribute *attr,
> -			 char *buf)
> +					char *buf)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>
> @@ -555,16 +555,17 @@ static ssize_t min_password_length_show(struct
> kobject *kobj, struct kobj_attrib
>  static struct kobj_attribute auth_min_pass_length =
> __ATTR_RO(min_password_length);
>
>  static ssize_t max_password_length_show(struct kobject *kobj, struct
> kobj_attribute *attr,
> -			 char *buf)
> +					char *buf)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>
>  	return sysfs_emit(buf, "%d\n", setting->maxlen);
>  }
> +
>  static struct kobj_attribute auth_max_pass_length =
> __ATTR_RO(max_password_length);
>
>  static ssize_t mechanism_show(struct kobject *kobj, struct
> kobj_attribute *attr,
> -			 char *buf)
> +			      char *buf)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>
> @@ -601,16 +602,15 @@ static ssize_t encoding_store(struct kobject
> *kobj, struct kobj_attribute *attr,
>  static struct kobj_attribute auth_encoding = __ATTR_RW(encoding);
>
>  static ssize_t kbdlang_show(struct kobject *kobj, struct kobj_attribute *attr,
> -			 char *buf)
> +			    char *buf)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>
>  	return sysfs_emit(buf, "%s\n", setting->kbdlang);
>  }
>
> -static ssize_t kbdlang_store(struct kobject *kobj,
> -				  struct kobj_attribute *attr,
> -				  const char *buf, size_t count)
> +static ssize_t kbdlang_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			     const char *buf, size_t count)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	int length;
> @@ -665,16 +665,15 @@ static ssize_t index_store(struct kobject *kobj,
> struct kobj_attribute *attr,
>  static struct kobj_attribute auth_index = __ATTR_RW(index);
>
>  static ssize_t level_show(struct kobject *kobj, struct kobj_attribute *attr,
> -			 char *buf)
> +			  char *buf)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>
>  	return sysfs_emit(buf, "%s\n", level_options[setting->level]);
>  }
>
> -static ssize_t level_store(struct kobject *kobj,
> -				  struct kobj_attribute *attr,
> -				  const char *buf, size_t count)
> +static ssize_t level_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			   const char *buf, size_t count)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	int i;
> @@ -731,8 +730,9 @@ static ssize_t cert_thumbprint(char *buf, const
> char *arg, int count)
>
>  static char *thumbtypes[] = {"Md5", "Sha1", "Sha256"};
>
> -static ssize_t certificate_thumbprint_show(struct kobject *kobj,
> struct kobj_attribute *attr,
> -			 char *buf)
> +static ssize_t certificate_thumbprint_show(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	unsigned int i;
> @@ -764,8 +764,8 @@ static ssize_t certificate_thumbprint_show(struct
> kobject *kobj, struct kobj_att
>  static struct kobj_attribute auth_cert_thumb =
> __ATTR_RO(certificate_thumbprint);
>
>  static ssize_t cert_to_password_store(struct kobject *kobj,
> -				  struct kobj_attribute *attr,
> -				  const char *buf, size_t count)
> +				      struct kobj_attribute *attr,
> +				      const char *buf, size_t count)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	char *auth_str, *passwd;
> @@ -809,8 +809,8 @@ enum cert_install_mode {
>  };
>
>  static ssize_t certificate_store(struct kobject *kobj,
> -				  struct kobj_attribute *attr,
> -				  const char *buf, size_t count)
> +				 struct kobj_attribute *attr, const char *buf,
> +				 size_t count)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	enum cert_install_mode install_mode = TLMI_CERT_INSTALL;
> @@ -913,8 +913,8 @@ static ssize_t certificate_store(struct kobject *kobj,
>  static struct kobj_attribute auth_certificate = __ATTR_WO(certificate);
>
>  static ssize_t signature_store(struct kobject *kobj,
> -				  struct kobj_attribute *attr,
> -				  const char *buf, size_t count)
> +			       struct kobj_attribute *attr, const char *buf,
> +			       size_t count)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	char *new_signature;
> @@ -940,8 +940,8 @@ static ssize_t signature_store(struct kobject *kobj,
>  static struct kobj_attribute auth_signature = __ATTR_WO(signature);
>
>  static ssize_t save_signature_store(struct kobject *kobj,
> -				  struct kobj_attribute *attr,
> -				  const char *buf, size_t count)
> +				    struct kobj_attribute *attr,
> +				    const char *buf, size_t count)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	char *new_signature;
> @@ -1029,8 +1029,8 @@ static const struct attribute_group auth_attr_group = {
>  __ATTRIBUTE_GROUPS(auth_attr);
>
>  /* ---- Attributes sysfs
> --------------------------------------------------------- */
> -static ssize_t display_name_show(struct kobject *kobj, struct
> kobj_attribute *attr,
> -		char *buf)
> +static ssize_t display_name_show(struct kobject *kobj,
> +				 struct kobj_attribute *attr, char *buf)
>  {
>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
>
> @@ -1069,7 +1069,7 @@ static ssize_t possible_values_show(struct
> kobject *kobj, struct kobj_attribute
>  }
>
>  static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> -		char *buf)
> +			 char *buf)
>  {
>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
>
> @@ -1491,15 +1491,15 @@ static int tlmi_sysfs_init(void)
>  {
>  	int i, ret;
>
> -	tlmi_priv.class_dev = device_create(&firmware_attributes_class,
> NULL, MKDEV(0, 0),
> -			NULL, "%s", "thinklmi");
> +	tlmi_priv.class_dev = device_create(&firmware_attributes_class, NULL,
> +					    MKDEV(0, 0), NULL, "%s", "thinklmi");
>  	if (IS_ERR(tlmi_priv.class_dev)) {
>  		ret = PTR_ERR(tlmi_priv.class_dev);
>  		goto fail_class_created;
>  	}
>
>  	tlmi_priv.attribute_kset = kset_create_and_add("attributes", NULL,
> -			&tlmi_priv.class_dev->kobj);
> +						       &tlmi_priv.class_dev->kobj);
>  	if (!tlmi_priv.attribute_kset) {
>  		ret = -ENOMEM;
>  		goto fail_device_created;
> @@ -1637,8 +1637,8 @@ static int tlmi_analyze(struct wmi_device *wdev)
>  		tlmi_priv.opcode_support = true;
>
>  	if (wmi_has_guid(LENOVO_SET_BIOS_CERT_GUID) &&
> -		wmi_has_guid(LENOVO_SET_BIOS_SETTING_CERT_GUID) &&
> -		wmi_has_guid(LENOVO_SAVE_BIOS_SETTING_CERT_GUID))
> +	    wmi_has_guid(LENOVO_SET_BIOS_SETTING_CERT_GUID) &&
> +	    wmi_has_guid(LENOVO_SAVE_BIOS_SETTING_CERT_GUID))
>  		tlmi_priv.certificate_support = true;
>
>  	/* ThinkCenter uses different GUIDs for certificate support */
> @@ -1693,7 +1693,7 @@ static int tlmi_analyze(struct wmi_device *wdev)
>  						       &setting->possible_values);
>  			if (ret || !setting->possible_values)
>  				pr_info("Error retrieving possible values for %d : %s\n",
> -						i, setting->display_name);
> +					i, setting->display_name);
>  		} else {
>  			/*
>  			 * Older Thinkstations don't support the bios_selections API.
> @@ -1710,8 +1710,9 @@ static int tlmi_analyze(struct wmi_device *wdev)
>  					optend = strstr(optstart, "]");
>  					if (optend)
>  						setting->possible_values =
> -							kstrndup(optstart, optend - optstart,
> -									GFP_KERNEL);
> +							kstrndup(optstart,
> +								 optend - optstart,
> +								 GFP_KERNEL);
>  				}
>  				kfree(optitem);
>  			}
> @@ -1772,7 +1773,7 @@ static int tlmi_analyze(struct wmi_device *wdev)
>  		if (tlmi_priv.pwdcfg.core.password_state & TLMI_HDD_PWD) {
>  			/* Check if PWD is configured and set index to first drive found */
>  			if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
> -					tlmi_priv.pwdcfg.ext.hdd_master_password) {
> +			    tlmi_priv.pwdcfg.ext.hdd_master_password) {
>  				tlmi_priv.pwd_hdd->pwd_enabled = true;
>  				if (tlmi_priv.pwdcfg.ext.hdd_master_password)
>  					tlmi_priv.pwd_hdd->index =
> -- 
> 2.52.0

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
