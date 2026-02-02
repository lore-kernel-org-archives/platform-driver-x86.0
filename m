Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8234B1A5;
	Mon,  2 Feb 2026 22:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770070906; cv=none; b=I3HgaRIJ2CSVCC8pq6FCPFNRERjXnacLe0Ynmdygl1sK+Qk91ddX1jP6XaJ3i/EOJw9ltvxiia+DSDnosB9vbbcFw5As0YBso4TENwTWsXY52FSfv3bSl4tfJU3LdYbKxeRZ8IS2j1jKGezB+RbBEqJlrxuyyNDBNWz6JFPIpYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770070906; c=relaxed/simple;
	bh=bzsZIa0g4GwfhCy3fYb2FfU5uG6BdvDO1YvmM0iWU8Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=h+6d5ec8a/ACEWMuoBKln0dg6r3k0SMO3tYF4Eb1w+8xroyZ1M/9LTTN4AnY2+PTmU2hQmO3DQTfhl2YR9DpUw8ZPuZeyGSadhKNAo6hMOuPcD2KEuEY7qgfyTTLCOi13od6Hh55E0hjZr9uRipTUP/xbIawaWgW5lNTQDvur7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=iCDU7uwW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PoOtQv6u; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="iCDU7uwW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PoOtQv6u"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 628F47A0033;
	Mon,  2 Feb 2026 17:21:40 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 02 Feb 2026 17:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1770070900;
	 x=1770157300; bh=GIHhdvbgfouUqgTO6JGsJtbTO9lUUF9al1cNIIuHJ7w=; b=
	iCDU7uwWnG/imAcXm7o6tuI4JstzAFxDpwDXTX7xRUxVpteGZ5CQUeOHfsc3+eOZ
	RrLYE3qia20OGH2NI4OYGOdYuyMRnNHoo2GvKUdw9ubTF4WqqaX8h9FgR/sJ/5Jv
	4qUeelAd6VZjDooRZz/wYvRksnCVnQsI71EhBciEgnT17I33IJAG7/PBZH06QzBB
	au1+tbtUG+0CAB5NXX7f4GLsIpcZ+r9PLl/FfJfoiNpgSlk3eS85QIdPL99cV2XF
	3q1Q0oj2dPq492kq8+BbuaF34T4IdK0C1Hneymaruf1hy03uTCM8lXxT7D9xVDMO
	tDpcyNdWl0jtDa8ioAw4tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770070900; x=
	1770157300; bh=GIHhdvbgfouUqgTO6JGsJtbTO9lUUF9al1cNIIuHJ7w=; b=P
	oOtQv6u9cV4DNhEj1xx1pPZSQlERBp3G7G6CgB5Ok2hlOLomDpw7TliO+CFXSSNm
	TiQkNDvfbvphAi8cWJKG4yqvfTH7n7LOci6IzQywXf9GIFKnCNmoFoITPny71kTT
	6zvJiY/Mgt7wvn9W+yQRMJ1yW+qH2Da/4TOkX13LPuNQSOsVkr4mmlPgE46AanTs
	KMXai1Q3X7rnrNwnhVuaF02MRRclH0vdGJJgIWCAwAL4rcQRrsQuPuXF+KMRRceN
	k4u6JW3tGSbs3E6yXqOUmUwIjQo/WKtiuSW/GzeAd7gW3Yk1hQfoAn/afRRIJ0z9
	68UzaC6KNjaYuD3/UCJUA==
X-ME-Sender: <xms:cyOBade50CXTIj33kEk63MI-_J87lOXVSoNn7knUTtpKWwgsjYj72A>
    <xme:cyOBaWAemUDypDhtlsOTHHuDNA9BwmUGzqXMaaJHVAeB_ftSnRVysPiXY1OJX7PSR
    W6WmufBdlv5LLvOQauUIjrjN4YwKHVDpxSgqE54BsrjQZrvWOAiCd8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeekkedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhuedvheetgeehtdehtdevheduvdejjefggfeijedv
    geekhfefleehkeehvdffheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhn
    sggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtohgshi
    essgihthgvmhgrphdrshhprggtvgdprhgtphhtthhopeguvghrvghkjhhohhhnrdgtlhgr
    rhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohephhhmhheshhhmhhdrvghnghdrsghrpd
    hrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphho
    rdhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisg
    hmqdgrtghpihdquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:cyOBaXuACOBKcYEdNz2TNasuo0n95lI-aNFZXV3nieTxfTrprGJOww>
    <xmx:cyOBaY7sEjT17SS7_pNFNdX9FQlkBOkkfmotb9zbwtcK_5jM0jMq0A>
    <xmx:cyOBabdIhSyD9iZyfYriUS2RAG1iRz45NcdnU-uNkJCSnDlcfLwlVg>
    <xmx:cyOBadxGlObR4xYQzs7PuOw29Z8qD6JX8SDcn_G7jNYbBYfunWwblQ>
    <xmx:dCOBaV-Z5RKxGPA1X5c5Z5L4h7DRzk6Eyqq7Lxz1hM911rslNr3u_2wH>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0718F2CE0072; Mon,  2 Feb 2026 17:21:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AzspBGjVLsSB
Date: Mon, 02 Feb 2026 17:21:18 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Coby McKinney" <coby@bytemap.space>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "open list:THINKPAD ACPI EXTRAS DRIVER" <ibm-acpi-devel@lists.sourceforge.net>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>
Message-Id: <4106b16f-4537-4b14-b5ba-545e2d1e0734@app.fastmail.com>
In-Reply-To: <20260202205214.18898-1-coby@bytemap.space>
References: <20260202205214.18898-1-coby@bytemap.space>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: use seq_puts() instead of
 seq_printf()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 2, 2026, at 3:52 PM, Coby McKinney wrote:
> checkpatch.pl reported warnings where seq_printf() was used for simple
> strings with no format specifiers.
>
> Replace these instances with seq_puts() to avoid the overhead of runtime
> string parsing and to conform to kernel coding standards.
>
> Signed-off-by: Coby McKinney <coby@bytemap.space>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 86 ++++++++++-----------
>  1 file changed, 43 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 6b0e4b4c485e..ffe71cbf3cb8 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -1315,7 +1315,7 @@ static ssize_t 
> tpacpi_rfk_sysfs_enable_store(const enum tpacpi_rfk_id id,
>  static int tpacpi_rfk_procfs_read(const enum tpacpi_rfk_id id, struct 
> seq_file *m)
>  {
>  	if (id >= TPACPI_RFK_SW_MAX)
> -		seq_printf(m, "status:\t\tnot supported\n");
> +		seq_puts(m, "status:\t\tnot supported\n");
>  	else {
>  		int status;
> 
> @@ -1330,7 +1330,7 @@ static int tpacpi_rfk_procfs_read(const enum 
> tpacpi_rfk_id id, struct seq_file *
>  		}
> 
>  		seq_printf(m, "status:\t\t%s\n", str_enabled_disabled(status == 
> TPACPI_RFK_RADIO_ON));
> -		seq_printf(m, "commands:\tenable, disable\n");
> +		seq_puts(m, "commands:\tenable, disable\n");
>  	}
> 
>  	return 0;
> @@ -4017,7 +4017,7 @@ static int hotkey_read(struct seq_file *m)
>  	int res, status;
> 
>  	if (!tp_features.hotkey) {
> -		seq_printf(m, "status:\t\tnot supported\n");
> +		seq_puts(m, "status:\t\tnot supported\n");
>  		return 0;
>  	}
> 
> @@ -4033,10 +4033,10 @@ static int hotkey_read(struct seq_file *m)
>  	seq_printf(m, "status:\t\t%s\n", str_enabled_disabled(status & BIT(0)));
>  	if (hotkey_all_mask) {
>  		seq_printf(m, "mask:\t\t0x%08x\n", hotkey_user_mask);
> -		seq_printf(m, "commands:\tenable, disable, reset, <mask>\n");
> +		seq_puts(m, "commands:\tenable, disable, reset, <mask>\n");
>  	} else {
> -		seq_printf(m, "mask:\t\tnot supported\n");
> -		seq_printf(m, "commands:\tenable, disable, reset\n");
> +		seq_puts(m, "mask:\t\tnot supported\n");
> +		seq_puts(m, "commands:\tenable, disable, reset\n");
>  	}
> 
>  	return 0;
> @@ -4933,7 +4933,7 @@ static int video_read(struct seq_file *m)
>  	int status, autosw;
> 
>  	if (video_supported == TPACPI_VIDEO_NONE) {
> -		seq_printf(m, "status:\t\tnot supported\n");
> +		seq_puts(m, "status:\t\tnot supported\n");
>  		return 0;
>  	}
> 
> @@ -4949,18 +4949,18 @@ static int video_read(struct seq_file *m)
>  	if (autosw < 0)
>  		return autosw;
> 
> -	seq_printf(m, "status:\t\tsupported\n");
> +	seq_puts(m, "status:\t\tsupported\n");
>  	seq_printf(m, "lcd:\t\t%s\n", str_enabled_disabled(status & BIT(0)));
>  	seq_printf(m, "crt:\t\t%s\n", str_enabled_disabled(status & BIT(1)));
>  	if (video_supported == TPACPI_VIDEO_NEW)
>  		seq_printf(m, "dvi:\t\t%s\n", str_enabled_disabled(status & BIT(3)));
>  	seq_printf(m, "auto:\t\t%s\n", str_enabled_disabled(autosw & BIT(0)));
> -	seq_printf(m, "commands:\tlcd_enable, lcd_disable\n");
> -	seq_printf(m, "commands:\tcrt_enable, crt_disable\n");
> +	seq_puts(m, "commands:\tlcd_enable, lcd_disable\n");
> +	seq_puts(m, "commands:\tcrt_enable, crt_disable\n");
>  	if (video_supported == TPACPI_VIDEO_NEW)
> -		seq_printf(m, "commands:\tdvi_enable, dvi_disable\n");
> -	seq_printf(m, "commands:\tauto_enable, auto_disable\n");
> -	seq_printf(m, "commands:\tvideo_switch, expand_toggle\n");
> +		seq_puts(m, "commands:\tdvi_enable, dvi_disable\n");
> +	seq_puts(m, "commands:\tauto_enable, auto_disable\n");
> +	seq_puts(m, "commands:\tvideo_switch, expand_toggle\n");
> 
>  	return 0;
>  }
> @@ -5204,14 +5204,14 @@ static int kbdlight_read(struct seq_file *m)
>  	int level;
> 
>  	if (!tp_features.kbdlight) {
> -		seq_printf(m, "status:\t\tnot supported\n");
> +		seq_puts(m, "status:\t\tnot supported\n");
>  	} else {
>  		level = kbdlight_get_level();
>  		if (level < 0)
>  			seq_printf(m, "status:\t\terror %d\n", level);
>  		else
>  			seq_printf(m, "status:\t\t%d\n", level);
> -		seq_printf(m, "commands:\t0, 1, 2\n");
> +		seq_puts(m, "commands:\t0, 1, 2\n");
>  	}
> 
>  	return 0;
> @@ -5378,16 +5378,16 @@ static int light_read(struct seq_file *m)
>  	int status;
> 
>  	if (!tp_features.light) {
> -		seq_printf(m, "status:\t\tnot supported\n");
> +		seq_puts(m, "status:\t\tnot supported\n");
>  	} else if (!tp_features.light_status) {
> -		seq_printf(m, "status:\t\tunknown\n");
> -		seq_printf(m, "commands:\ton, off\n");
> +		seq_puts(m, "status:\t\tunknown\n");
> +		seq_puts(m, "commands:\ton, off\n");
>  	} else {
>  		status = light_get_status();
>  		if (status < 0)
>  			return status;
>  		seq_printf(m, "status:\t\t%s\n", str_on_off(status & BIT(0)));
> -		seq_printf(m, "commands:\ton, off\n");
> +		seq_puts(m, "commands:\ton, off\n");
>  	}
> 
>  	return 0;
> @@ -5477,10 +5477,10 @@ static int cmos_read(struct seq_file *m)
>  	/* cmos not supported on 570, 600e/x, 770e, 770x, A21e, A2xm/p,
>  	   R30, R31, T20-22, X20-21 */
>  	if (!cmos_handle)
> -		seq_printf(m, "status:\t\tnot supported\n");
> +		seq_puts(m, "status:\t\tnot supported\n");
>  	else {
> -		seq_printf(m, "status:\t\tsupported\n");
> -		seq_printf(m, "commands:\t<cmd> (<cmd> is 0-21)\n");
> +		seq_puts(m, "status:\t\tsupported\n");
> +		seq_puts(m, "commands:\t<cmd> (<cmd> is 0-21)\n");
>  	}
> 
>  	return 0;
> @@ -5847,10 +5847,10 @@ static int __init led_init(struct ibm_init_struct *iibm)
>  static int led_read(struct seq_file *m)
>  {
>  	if (!led_supported) {
> -		seq_printf(m, "status:\t\tnot supported\n");
> +		seq_puts(m, "status:\t\tnot supported\n");
>  		return 0;
>  	}
> -	seq_printf(m, "status:\t\tsupported\n");
> +	seq_puts(m, "status:\t\tsupported\n");
> 
>  	if (led_supported == TPACPI_LED_570) {
>  		/* 570 */
> @@ -5863,7 +5863,7 @@ static int led_read(struct seq_file *m)
>  		}
>  	}
> 
> -	seq_printf(m, "commands:\t<led> on, <led> off, <led> blink (<led> is 
> 0-15)\n");
> +	seq_puts(m, "commands:\t<led> on, <led> off, <led> blink (<led> is 
> 0-15)\n");
> 
>  	return 0;
>  }
> @@ -5947,10 +5947,10 @@ static int __init beep_init(struct 
> ibm_init_struct *iibm)
>  static int beep_read(struct seq_file *m)
>  {
>  	if (!beep_handle)
> -		seq_printf(m, "status:\t\tnot supported\n");
> +		seq_puts(m, "status:\t\tnot supported\n");
>  	else {
> -		seq_printf(m, "status:\t\tsupported\n");
> -		seq_printf(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
> +		seq_puts(m, "status:\t\tsupported\n");
> +		seq_puts(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
>  	}
> 
>  	return 0;
> @@ -6399,14 +6399,14 @@ static int thermal_read(struct seq_file *m)
>  	if (unlikely(n < 0))
>  		return n;
> 
> -	seq_printf(m, "temperatures:\t");
> +	seq_puts(m, "temperatures:\t");
> 
>  	if (n > 0) {
>  		for (i = 0; i < (n - 1); i++)
>  			seq_printf(m, "%d ", t.temp[i] / 1000);
>  		seq_printf(m, "%d\n", t.temp[i] / 1000);
>  	} else
> -		seq_printf(m, "not supported\n");
> +		seq_puts(m, "not supported\n");
> 
>  	return 0;
>  }
> @@ -6919,10 +6919,10 @@ static int brightness_read(struct seq_file *m)
> 
>  	level = brightness_get(NULL);
>  	if (level < 0) {
> -		seq_printf(m, "level:\t\tunreadable\n");
> +		seq_puts(m, "level:\t\tunreadable\n");
>  	} else {
>  		seq_printf(m, "level:\t\t%d\n", level);
> -		seq_printf(m, "commands:\tup, down\n");
> +		seq_puts(m, "commands:\tup, down\n");
>  		seq_printf(m, "commands:\tlevel <level> (<level> is 0-%d)\n",
>  			       bright_maxlvl);
>  	}
> @@ -7638,10 +7638,10 @@ static int volume_read(struct seq_file *m)
>  	u8 status;
> 
>  	if (volume_get_status(&status) < 0) {
> -		seq_printf(m, "level:\t\tunreadable\n");
> +		seq_puts(m, "level:\t\tunreadable\n");
>  	} else {
>  		if (tp_features.mixer_no_level_control)
> -			seq_printf(m, "level:\t\tunsupported\n");
> +			seq_puts(m, "level:\t\tunsupported\n");
>  		else
>  			seq_printf(m, "level:\t\t%d\n",
>  					status & TP_EC_AUDIO_LVL_MSK);
> @@ -7649,9 +7649,9 @@ static int volume_read(struct seq_file *m)
>  		seq_printf(m, "mute:\t\t%s\n", str_on_off(status & BIT(TP_EC_AUDIO_MUTESW)));
> 
>  		if (volume_control_allowed) {
> -			seq_printf(m, "commands:\tunmute, mute\n");
> +			seq_puts(m, "commands:\tunmute, mute\n");
>  			if (!tp_features.mixer_no_level_control) {
> -				seq_printf(m, "commands:\tup, down\n");
> +				seq_puts(m, "commands:\tup, down\n");
>  				seq_printf(m, "commands:\tlevel <level> (<level> is 0-%d)\n",
>  					      TP_EC_VOLUME_MAX);
>  			}
> @@ -9157,9 +9157,9 @@ static int fan_read(struct seq_file *m)
>  		} else if (fan_status_access_mode == TPACPI_FAN_RD_TPEC) {
>  			if (status & TP_EC_FAN_FULLSPEED)
>  				/* Disengaged mode takes precedence */
> -				seq_printf(m, "level:\t\tdisengaged\n");
> +				seq_puts(m, "level:\t\tdisengaged\n");
>  			else if (status & TP_EC_FAN_AUTO)
> -				seq_printf(m, "level:\t\tauto\n");
> +				seq_puts(m, "level:\t\tauto\n");
>  			else
>  				seq_printf(m, "level:\t\t%d\n", status);
>  		}
> @@ -9167,19 +9167,19 @@ static int fan_read(struct seq_file *m)
> 
>  	case TPACPI_FAN_NONE:
>  	default:
> -		seq_printf(m, "status:\t\tnot supported\n");
> +		seq_puts(m, "status:\t\tnot supported\n");
>  	}
> 
>  	if (fan_control_commands & TPACPI_FAN_CMD_LEVEL) {
> -		seq_printf(m, "commands:\tlevel <level>");
> +		seq_puts(m, "commands:\tlevel <level>");
> 
>  		switch (fan_control_access_mode) {
>  		case TPACPI_FAN_WR_ACPI_SFAN:
> -			seq_printf(m, " (<level> is 0-7)\n");
> +			seq_puts(m, " (<level> is 0-7)\n");
>  			break;
> 
>  		default:
> -			seq_printf(m, " (<level> is 0-7, auto, disengaged, full-speed)\n");
> +			seq_puts(m, " (<level> is 0-7, auto, disengaged, full-speed)\n");
>  			break;
>  		}
>  	}
> @@ -9189,7 +9189,7 @@ static int fan_read(struct seq_file *m)
>  			       "commands:\twatchdog <timeout> (<timeout> is 0 (off), 1-120 
> (seconds))\n");
> 
>  	if (fan_control_commands & TPACPI_FAN_CMD_SPEED)
> -		seq_printf(m, "commands:\tspeed <speed> (<speed> is 0-65535)\n");
> +		seq_puts(m, "commands:\tspeed <speed> (<speed> is 0-65535)\n");
> 
>  	return 0;
>  }
> -- 
> 2.52.0

Looks good to me. Thanks!
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
