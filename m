Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE065303C87;
	Fri, 19 Dec 2025 15:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766158757; cv=none; b=sTzEuJKBO0vo36HYIumu8S+fTXl2J7oQDteG2NrGWHbMv8AQTY9G0bfkOMiqgqlv8ILMo/kUEaBBrbcueo7kvSdcMupaQHPoxmkszJygBip2UrEACJN4BBosIVVEZcKglCyyCgKKoXu0t8oSEhyDLIAsw7yPfaZhGkX7oEzT5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766158757; c=relaxed/simple;
	bh=pwUNub46A6T6HH+SbMvbCQ1Lq5+MaD8nOQBpVCSmKf4=;
	h=MIME-Version:Date:From:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FbGQvY9gRskwrtqCH+p8AfnSQu+A9C7Ucu+xLVnS12QB+SLmHIC4OGRYO7NTz6b2Am12ieYM5tpAemvCfSXkckyqSmvQ3bUopN58t63WXBdpT7hZj2/+hcbO+bI59AcYyOs4ACzK3539Egs+7DAqu+9ycGlDNCo7RBvrgqnJpDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ll2hMbol; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QR+pl184; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ll2hMbol";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QR+pl184"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D0AA41400054;
	Fri, 19 Dec 2025 10:39:13 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Fri, 19 Dec 2025 10:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to; s=fm2; t=1766158753; x=
	1766245153; bh=d7juB06YucnF/Qp8ulL/06AMeoxCKD/YEFXfJKlh048=; b=l
	l2hMbol2p02tMPVknP3wdGHjidyJb4f7JlGmAfVbi16o8jGTvNDVH4M2s0SNEGQh
	Yj63OvraD8jFTgOTjXvUKMlNMTWJ6S/5PuQ43Y4lEdQGgSNxF1LbJDMwTM4J+6mv
	ombVv9YyNSGGcX6plXDZWemof+ayC4DgzfIif550EN8xXoI7j5zV/7qd9u6uYk8M
	wg3yGPVdyQMtxQMdg8nBR3aGtB01V3eCNjB4w2FdhhGEJtzbS65OAejwboLgndgK
	wMDCOFh8R5IzP/kNocJ323PoAUMfq4ojTLq6cRJSjK+QUCLYJGUgw4Y2VC5ECmlH
	PwtdR0TUs7E9GnLlGWPtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1766158753; x=1766245153; bh=d
	7juB06YucnF/Qp8ulL/06AMeoxCKD/YEFXfJKlh048=; b=QR+pl184CTGhkGyCo
	Mog136reZ98mDRT5Jk70Wf/0QwZymL3po3rH/WU3J7V5auV9H19mrALlxwrkvhNR
	jshfQ/ukbEiRrTcrypewkrS74xTsLmKWSJgII3zqTXH+5payC1lhjXkiR9IaK/8z
	bJK64sWv/FKND8Vf4vVrg2BcUlpY/0HfsURCHXJHCzEGU44tg5AOzZaWYAtceK2i
	CBu9s1JGIfyOQFJj9WECkgIgVQluKugGJ3sP7XCtDsLyparK67gospSqghAdmpcT
	DfOZnyI08IzkFFhFuvvtIasqW9UvW5Wu32y79QJeK8v/RJBfhBiWr+yZn4G6xSyF
	pNjXg==
X-ME-Sender: <xms:oXFFaX0J6i82svhP3Py5Y_LFvmqibFd2B5-4r5jCDwSTaS6yBBrVxg>
    <xme:oXFFaQ4s96teFpKUOli_jxASfce_kIgAZp3Xjt-TQf0irjGcuhjj45mM6UD5-h-PX
    tSUVEOBnFqDVgvdqdPvBnkePjjB3V0tH2WnW265p7zYEBl9tvq58Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegkeeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenmhhish
    hsihhnghcuvffquchfihgvlhguucdlfedtmdenucfjughrpefoggffhfevkfgjfhfutgfg
    sehtjeertdertddtnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrg
    hrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpedv
    keefueefvddvfeevudejffeugfelvddugeegteetudefhedtveejffelteelueenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshho
    nhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:oXFFaZimrdehWiSyiHOa2k8hDTSTYc0kYLBee-tSeqjHqB7lYg7NfA>
    <xmx:oXFFaU5l6Vc1nRvuOpjpSByYY_Zq_4Qc_hn4oVRV3ncMDX0ZKTnRDA>
    <xmx:oXFFaRbJXsrqGWTu-t0_GzWZySgKF8ybtdWHdEqoiAjZo1V6TOGKrQ>
    <xmx:oXFFaZ6M7kzOwAu7Mxmv00Fm930Fa8GR7Rrrh09wqLESp53d8E4nSA>
    <xmx:oXFFaagaO6OP9ZZ0MbyZEjJZBtjQCixsPB9yE9VkcR4GG1kcprznVBU4>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8255A2CE0072; Fri, 19 Dec 2025 10:39:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AKqE3OuVU7B-
Date: Fri, 19 Dec 2025 10:38:49 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <32d95a0f-4027-4ae7-811c-cef18a48c41c@app.fastmail.com>
In-Reply-To: <20251127202959.399040-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20251127202959.399040-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] platform/x86: think-lmi: Add WMI certificate thumbprint support
 for ThinkCenter
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 27, 2025, at 3:29 PM, Mark Pearson wrote:
> The ThinkCenter team are adding WMI certificate thumbprint support.
>
> Updating the driver to enable it. They are using the same GUID as
> Thinkpad/ThinkStation.
> Tested on M75q Gen 5.
>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/platform/x86/lenovo/think-lmi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c 
> b/drivers/platform/x86/lenovo/think-lmi.c
> index 540b472b1bf3..c45f0206b4ab 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -195,7 +195,7 @@ static const struct tlmi_cert_guids 
> thinkpad_cert_guid = {
>  };
> 
>  static const struct tlmi_cert_guids thinkcenter_cert_guid = {
> -	.thumbprint = NULL,
> +	.thumbprint = LENOVO_CERT_THUMBPRINT_GUID, /* Same GUID as TP */
>  	.set_bios_setting = LENOVO_TC_SET_BIOS_SETTING_CERT_GUID,
>  	.save_bios_setting = LENOVO_TC_SAVE_BIOS_SETTING_CERT_GUID,
>  	.cert_to_password = LENOVO_TC_CERT_TO_PASSWORD_GUID,
> @@ -709,6 +709,10 @@ static ssize_t cert_thumbprint(char *buf, const 
> char *arg, int count)
>  	if (!tlmi_priv.cert_guid->thumbprint)
>  		return -EOPNOTSUPP;
> 
> +	/* Older ThinkCenter BIOS may not have support */
> +	if (!wmi_has_guid(tlmi_priv.cert_guid->thumbprint))
> +		return -EOPNOTSUPP;
> +
>  	status = wmi_evaluate_method(tlmi_priv.cert_guid->thumbprint, 0, 0, 
> &input, &output);
>  	if (ACPI_FAILURE(status)) {
>  		kfree(output.pointer);
> -- 
> 2.43.0

Would it be possible to get a review for this please? It's pretty minor and would like to get this feature available to users.

Thanks
Mark
