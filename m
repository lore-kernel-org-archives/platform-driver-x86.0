Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9B62E3383;
	Wed,  5 Mar 2025 03:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741144849; cv=none; b=LNkQOiVl5g8s1LqjS5KzW0ufQvHOZsagM5f5c1iOhgGPbBPQzKYtF7ATSDHx/PB6H4u4Y3pHdirjg694LhxaARVuVWllviO3s1VpXL0KJEAsjIdhpyPb4GATDJ+gxpwgLB54tzKz8JtM2giI9r5/zfBMYaHxEHDfhMsOBAF6HKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741144849; c=relaxed/simple;
	bh=DHgoGZ0qX7cTXT6R7MS14QaeHg+jC+soL0Tkn5Z3GeE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=O389OgEEsZ5qzknf0ztsbGXP8UjQV4bTed71IHq0G/uoMGoQzc5ReQ6pKKSNVSeD9R1hX3lutbnGvjrEW7pcxVBP1mQIRRIar0IRbCADSlNQF/W0RnXetZGGOW1WSzENmT8YDaE/pksGy1XPj730Z+LQ0keni6dGrKr5cjH8Y1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=JUEUqnJJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E1iYtkh4; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="JUEUqnJJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E1iYtkh4"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 5087311401BA;
	Tue,  4 Mar 2025 22:20:44 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-06.internal (MEProxy); Tue, 04 Mar 2025 22:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1741144844;
	 x=1741231244; bh=hs1JOBCtOs6uvUuOlg7Ww2Sx+hHGJabLYw2G13Hxk4k=; b=
	JUEUqnJJhQdL9R5JDD0Pa+hfz+vmmIYXP/OpHNtCZTNaPEwd4ZTOZVAbZH4sRUnB
	twvimisOSzpj8lbfkuCDbBmqzsjjM7jeaOfpEiT3GgNnrz98QRHIFwUpq6Cib27a
	YmgD+sro4PRe9GyFsTGld2N23iJYEEt8MCp3BjAPGuE1dqhsImfNOUf9AjjBlhCg
	XYQagBGlB+C9uwWK53SzCeHFvp5l3hWDXef2QVVCU5E/dmCM7RLrqDAQNXvD/7+K
	wXN7CR0znP+y1DHuT1jWdhUsV9r97jC4iAfQd2edzlJRZJcXLvY9km46hYyDYrTT
	OwtHPWTyNsITwdhj1UFxSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741144844; x=
	1741231244; bh=hs1JOBCtOs6uvUuOlg7Ww2Sx+hHGJabLYw2G13Hxk4k=; b=E
	1iYtkh4xqo2XToS9lVvzPWE6RJqCfzrN0tbP5FacDguKfzS8JmvictYhYQgAqWgB
	JtSGD228nigHXUDmTjPdc4P6zsIrtLsuydxfY1la30NzmzS6RLcfQFuq+IrWY+B7
	PJ0J5F3y48xln59/3ykJwbLHPmHZ65qIE9KLafTWCg/Yt7u2/GoFRyZdq0f/Eapi
	AtINVyiMUf3vmnFsKHs2uAsCE5cFC3Imr5VkPUkcZ0O6XLf71yL75NH5CKP1xp9p
	ceEySoif/RJM5VvVSEPnDsJy+Qq3I1GK1EbAf1z8wcIsurC1zhkbCL78vPU0GDx9
	H15JhNlbLggoonBp8B3+A==
X-ME-Sender: <xms:C8PHZx8UpM_Dn3zeC_QNjBYxFcEfSHWHOZ8GgwdJZvqQRNRNZ8LJNA>
    <xme:C8PHZ1uHeonKLMGHDR5DLPXUU5CYEbCZ0DT3i6fcFdwNEbC207q4XjEAD5rzsVF0c
    v1AzZCEEHCv7VCzcW0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdefjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlh
    gvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhuedvheetgeeh
    tdehtdevheduvdejjefggfeijedvgeekhfefleehkeehvdffheenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhho
    vhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehnihhtjhhoshhhihesghhmrghilhdrtghomhdprhgtphhtthho
    pehnjhhoshhhihdusehlvghnohhvohdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrh
    hvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihgsmhdqrggt
    phhiqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpth
    htohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhig
    qdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorh
    hmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:C8PHZ_C7C0g-s3pEAXfzboTq0P5nQoUS1VH-3T2jENHzWTuebZEtdA>
    <xmx:C8PHZ1cR_N2LLrZL1_HbypqeMqTjc5fGeoI038SdXBlAM_f4t6ml_A>
    <xmx:C8PHZ2NQX6ZH1VAfqOr5-FCWuT6ihG_UN601jwknPQEtgrSt1xvRsw>
    <xmx:C8PHZ3nI-O6G-cs5voRXCsf3GG3A_DH-8fJJywjaUrNC5uIE4482tw>
    <xmx:DMPHZyC_Smqoipxp2BjZ3UvimVGq2JygKH8eGYv0jKx5JMBx8fwMWTIJ>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 558943C0066; Tue,  4 Mar 2025 22:20:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 04 Mar 2025 22:20:23 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Nitin Joshi" <nitjoshi@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
 "Nitin Joshi1" <njoshi1@lenovo.com>
Message-Id: <0cedc065-8cb7-4ef8-8989-6b113eb43460@app.fastmail.com>
In-Reply-To: <20250305023319.6318-1-nitjoshi@gmail.com>
References: <20250305023319.6318-1-nitjoshi@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add new sysfs to check user presence
 sensing status
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, Mar 4, 2025, at 9:33 PM, Nitin Joshi wrote:
> Some Thinkpad products support Human Presence Detection (HPD) features.
> Add new sysfs entry so that userspace can determine if feature is
> supported or not.
>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Just in case we're breaking protocol - I have reviewed this off mailing list with Nitin and gave it the thumbs up. The tag is correct.

Mark

> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++
>  drivers/platform/x86/thinkpad_acpi.c          | 79 +++++++++++++++++++
>  2 files changed, 99 insertions(+)
>
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst 
> b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 4ab0fef7d440..02e6c4306f90 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -1576,6 +1576,26 @@ percentage level, above which charging will stop.
>  The exact semantics of the attributes may be found in
>  Documentation/ABI/testing/sysfs-class-power.
> 
> +User Presence Sensing Detection
> +------
> +
> +sysfs: hpd_bios_enabled
> +
> +Some Thinkpad products support Human Presence Detection (HPD) features.
> +Added new sysfs entry so that userspace can determine if feature related to
> +HPD should be enabled or disabled.
> +
> +The available commands are::
> +
> +        cat /sys/devices/platform/thinkpad_acpi/hpd_bios_enabled
> +
> +BIOS status is mentioned as below:
> +- 0 = Disable
> +- 1 = Enable
> +
> +The property is read-only. If the platform doesn't have support the sysfs
> +class is not created.
> +
>  Multiple Commands, Module Parameters
>  ------------------------------------
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
> b/drivers/platform/x86/thinkpad_acpi.c
> index 72a10ed2017c..daf31b2a4c73 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -11039,6 +11039,80 @@ static const struct attribute_group 
> auxmac_attr_group = {
>  	.attrs = auxmac_attributes,
>  };
> 
> +/*************************************************************************
> + * CHPD subdriver, for the Lenovo Human Presence Detection feature.
> + */
> +#define CHPD_GET_SENSOR_STATUS           0x00200000
> +#define CHPD_GET_BIOS_UI_STATUS          0x00100000
> +
> +static bool has_user_presence_sensing;
> +static int hpd_bios_status;
> +static int chpd_command(int command, int *output)
> +{
> +	acpi_handle chpd_handle;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "CHPD", &chpd_handle))) {
> +		/* Platform doesn't support CHPD */
> +		return -ENODEV;
> +	}
> +
> +	if (!acpi_evalf(chpd_handle, output, NULL, "dd", command))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/* sysfs hpd bios status */
> +static ssize_t hpd_bios_enabled_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", hpd_bios_status);
> +}
> +static DEVICE_ATTR_RO(hpd_bios_enabled);
> +
> +static struct attribute *chpd_attributes[] = {
> +	&dev_attr_hpd_bios_enabled.attr,
> +	NULL
> +};
> +
> +static umode_t chpd_attr_is_visible(struct kobject *kobj,
> +					struct attribute *attr, int n)
> +{
> +	return has_user_presence_sensing ? attr->mode : 0;
> +}
> +
> +static const struct attribute_group chpd_attr_group = {
> +	.is_visible = chpd_attr_is_visible,
> +	.attrs = chpd_attributes,
> +};
> +
> +static int tpacpi_chpd_init(struct ibm_init_struct *iibm)
> +{
> +	int err, output;
> +
> +	err = chpd_command(CHPD_GET_SENSOR_STATUS, &output);
> +	if (err)
> +		return err;
> +
> +	if (output == 1)
> +		return -ENODEV;
> +
> +	has_user_presence_sensing = true;
> +	/* Get User Presence Sensing BIOS status */
> +	err = chpd_command(CHPD_GET_BIOS_UI_STATUS, &output);
> +	if (err)
> +		return err;
> +
> +	hpd_bios_status = (output >> 1) & BIT(0);
> +
> +	return err;
> +}
> +
> +static struct ibm_struct chpd_driver_data = {
> +	.name = "chpd",
> +};
> +
>  /* --------------------------------------------------------------------- */
> 
>  static struct attribute *tpacpi_driver_attributes[] = {
> @@ -11098,6 +11172,7 @@ static const struct attribute_group *tpacpi_groups[] = {
>  	&kbdlang_attr_group,
>  	&dprc_attr_group,
>  	&auxmac_attr_group,
> +	&chpd_attr_group,
>  	NULL,
>  };
> 
> @@ -11694,6 +11769,10 @@ static struct ibm_init_struct ibms_init[] 
> __initdata = {
>  		.init = auxmac_init,
>  		.data = &auxmac_data,
>  	},
> +	{
> +		.init = tpacpi_chpd_init,
> +		.data = &chpd_driver_data,
> +	},
>  };
> 
>  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
> -- 
> 2.43.0
