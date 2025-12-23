Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693F221D3F6;
	Tue, 23 Dec 2025 20:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521878; cv=none; b=eetyIYTXmAnpzPz8NZ+20T2jjW/EBYHgNhnFfAvnY3WTliUTmEXxNS3Kp8Sa+kYyceIqeuxgUa1WOTo7Y98zZjcOLozkHrGf0OH+UJ+EEWaPmI7U23wMvWp44lIoso0cFicgdu5vC1EoxaaMRk/nTwzJWbAw5/4d3frGqjb1zQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521878; c=relaxed/simple;
	bh=rhIVI0O33kzLB8UoJ3U2eFERmHWoJxpppsn//IoRxPw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DvL/6DeCq4s22XkDmOfVZK9pX3bNg92QIz8OQJvh0rrjjG3+vXokcGQBBHfqdT67aqkXgUD5peaPZKrwVjpmLbM5bVvqGTa1ibrniicJGmwMGbN3kkcjNlEGeykgj84x1dUn0UI/kKorpGAuOWG7zMGc+KBsuU9D96KpL12obTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=gBR1NgAU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BwBLaKdX; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="gBR1NgAU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BwBLaKdX"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 541971400126;
	Tue, 23 Dec 2025 15:31:15 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 23 Dec 2025 15:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1766521875;
	 x=1766608275; bh=ncg9XHg06l5U0iYF1lmXedZ67NuqGTsPAW52U7Z9p8c=; b=
	gBR1NgAUx18JtXJVlnnqplmw5V+JODGulBIWkHhzXjPPx1AEh8jmhWWv5CKiJW/n
	ZdV07RPlaLv1F126OZ2Jgufjk8KYZZ7Xh4W3uO4HGZYQjhxIcbj8yJgY5FOgBdWK
	jPVNnhoLVdV1L4nukHa4X1tdJt6e6S+TcLXhmowyYKS0nEonGR3nkQ802vIedVw6
	TmVTx5pdIPae6MNXT/byNBFL+1l5qA9zWivc751CMvh5WysoQr6QjVn6g+trABwr
	oDNt9HzUyhrWkdj3StR0+CrX79NM6NZc2lFVnYC8H+OJB3rroJNNeS/4kbFf0xVV
	MWMjUxH9i40Q3qBpGVMq+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766521875; x=
	1766608275; bh=ncg9XHg06l5U0iYF1lmXedZ67NuqGTsPAW52U7Z9p8c=; b=B
	wBLaKdXzE6QFtN+7ggKSBshi82zEucFIBzEOdgSc/g+NItLtwzuHKnJTLijNe0Z6
	46sG23bJAjQqu2D03affOtG9VxLtl62tjJXRYkoR7qVGNDt3sIXkj7O639QRqbVc
	JjOZ81/ftbt//PK5fcjIYy9cfFZTJzq5F25zsXGBXpswoTbJWC570h6BBI42rjh5
	//rpQiC64bwCEbCBFeGxR43/3GjA7FE2Q0ZXAXOmbWqP9UA+KCh+KTpK572OylEO
	xQ8yajKxUK5c075s5aeJdWpEB9FD6I03RIcB1QT1U0AmYSHJDzA1V+k4alVTbb++
	oGePU7iJzzolikS5LnNXg==
X-ME-Sender: <xms:E_xKaUPZyObxQU1KbiCklfa0P1nzDdzwMCOK06abLmy5-sXpBEFwnQ>
    <xme:E_xKaVyHCfYIeKoupTtBo50JlQMzSS7CYRjQ8zw0u9Ktsw6Vxvr4_AVmfEKhWyuPD
    lwS5eqZEzYgOniKfThI2qPu5_5NfGVOrFQZy4Yd2j_tHQAWRaL9q1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdejlecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:E_xKadw7sUtwV9Ak-j1_Y8Uzt24hqkOS8wz0F-bmR37ogZ9DhbAPOQ>
    <xmx:E_xKafgo3GuF7V6g7LVznkEmjt1T56ujKLznwXhblrWmpQHkPWzPgw>
    <xmx:E_xKaZkdcHkwiVNu2mwWQD4Ysu-qnxR0GXiCDKlAQ8s8RcfRy29-Gw>
    <xmx:E_xKaVh-D_ULLmstINSvrFf1AhPdYGmX1l88Gm6TVIsKmL1f7Qvs5Q>
    <xmx:E_xKaRkKxLT1-fRj6F_qTq7Bz0bxtIRZkp_bzuWqGRor2XPo1Eyc9Nfy>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 162C92CE0072; Tue, 23 Dec 2025 15:31:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aq84NCJrzX0R
Date: Tue, 23 Dec 2025 15:30:54 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Benjamin Philip" <benjamin.philip495@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-Id: <14753762-a3b5-454e-88bb-14bf851de9bb@app.fastmail.com>
In-Reply-To: 
 <CAMEXYWcuZXx285npcPB3q0Umit2bAwmFzo1sBPLYnyhoUT0EnQ@mail.gmail.com>
References: 
 <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com>
 <CAMEXYWcuZXx285npcPB3q0Umit2bAwmFzo1sBPLYnyhoUT0EnQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] platform/x86: think-lmi: Clean up misc checks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
> This commit cleans up the following checks:
>
> - CHECK: braces {} should be used on all arms of this statement
> - CHECK: Please use a blank line after function/struct/union/enum
>   declarations
> - CHECK: Prefer kzalloc(sizeof(*new_pwd)...) over
>   kzalloc(sizeof(struct tlmi_pwd_setting)...)
> - CHECK: spaces preferred around that '/' (ctx:VxV)
> - CHECK: Unbalanced braces around else statement
>
> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
> ---
>  drivers/platform/x86/lenovo/think-lmi.c | 32 +++++++++++++------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
> b/drivers/platform/x86/lenovo/think-lmi.c
> index 1fac8986d077..1ada4d800383 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -223,14 +223,16 @@ static const struct tlmi_err_codes tlmi_errs[] = {
>  	{"Set Certificate operation failed with status:Certificate too
> large.", -EFBIG},
>  };
>
> -static const char * const encoding_options[] = {
> +static const char *const encoding_options[] = {
>  	[TLMI_ENCODING_ASCII] = "ascii",
>  	[TLMI_ENCODING_SCANCODE] = "scancode",
>  };
> -static const char * const level_options[] = {
> +
> +static const char *const level_options[] = {
>  	[TLMI_LEVEL_USER] = "user",
>  	[TLMI_LEVEL_MASTER] = "master",
>  };
> +
>  static struct think_lmi tlmi_priv;
>  static DEFINE_MUTEX(tlmi_mutex);
>
> @@ -249,7 +251,7 @@ static int tlmi_errstr_to_err(const char *errstr)
>  {
>  	int i;
>
> -	for (i = 0; i < sizeof(tlmi_errs)/sizeof(struct tlmi_err_codes); i++) {
> +	for (i = 0; i < sizeof(tlmi_errs) / sizeof(struct tlmi_err_codes); i++) {
>  		if (!strcmp(tlmi_errs[i].err_str, errstr))
>  			return tlmi_errs[i].err_code;
>  	}
> @@ -570,19 +572,19 @@ static ssize_t mechanism_show(struct kobject
> *kobj, struct kobj_attribute *attr,
>  		return sysfs_emit(buf, "certificate\n");
>  	return sysfs_emit(buf, "password\n");
>  }
> +
>  static struct kobj_attribute auth_mechanism = __ATTR_RO(mechanism);
>
>  static ssize_t encoding_show(struct kobject *kobj, struct kobj_attribute *attr,
> -			 char *buf)
> +			     char *buf)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>
>  	return sysfs_emit(buf, "%s\n", encoding_options[setting->encoding]);
>  }
>
> -static ssize_t encoding_store(struct kobject *kobj,
> -				  struct kobj_attribute *attr,
> -				  const char *buf, size_t count)
> +static ssize_t encoding_store(struct kobject *kobj, struct
> kobj_attribute *attr,
> +			      const char *buf, size_t count)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	int i;
> @@ -632,19 +634,19 @@ static ssize_t role_show(struct kobject *kobj,
> struct kobj_attribute *attr,
>
>  	return sysfs_emit(buf, "%s\n", setting->role);
>  }
> +
>  static struct kobj_attribute auth_role = __ATTR_RO(role);
>
>  static ssize_t index_show(struct kobject *kobj, struct kobj_attribute *attr,
> -			 char *buf)
> +			  char *buf)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>
>  	return sysfs_emit(buf, "%d\n", setting->index);
>  }
>
> -static ssize_t index_store(struct kobject *kobj,
> -				  struct kobj_attribute *attr,
> -				  const char *buf, size_t count)
> +static ssize_t index_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			   const char *buf, size_t count)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	int err, val;
> @@ -1047,9 +1049,9 @@ static ssize_t current_value_show(struct kobject
> *kobj, struct kobj_attribute *a
>
>  	/* validate and split from `item,value` -> `value` */
>  	value = strpbrk(item, ",");
> -	if (!value || value == item || !strlen(value + 1))
> +	if (!value || value == item || !strlen(value + 1)) {
>  		ret = -EINVAL;
> -	else {
> +	} else {
>  		/* On Workstations remove the Options part after the value */
>  		strreplace(value, ';', '\0');
>  		ret = sysfs_emit(buf, "%s\n", value + 1);
> @@ -1585,11 +1587,11 @@ static int tlmi_sysfs_init(void)
>
>  /* ---- Base Driver -------------------------------------------------------- */
>  static struct tlmi_pwd_setting *tlmi_create_auth(const char *pwd_type,
> -			    const char *pwd_role)
> +						 const char *pwd_role)
>  {
>  	struct tlmi_pwd_setting *new_pwd;
>
> -	new_pwd = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
> +	new_pwd = kzalloc(sizeof(*new_pwd), GFP_KERNEL);
>  	if (!new_pwd)
>  		return NULL;
>
> -- 
> 2.52.0

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
