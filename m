Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C45016D9D7
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 18:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713982756; cv=none; b=ZVyDQs9ZdeXdUYBwNAdeT+t/txPxnoEfeBVqa4LfQPdfKdHOcyhnVcUYksbcgo4lJYoRaP2eq8YAifz4DaK7A90o5EQYKAlw7PTKRVrt5NY7DHM+QEHp/dOg9cAuoBXzKjHiKOs2I3mxG5pFXnfEDVnHp5A7eCV8M4MUdu1R3B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713982756; c=relaxed/simple;
	bh=G2zxHfP936p2JbvFgeMAVQyE79oSTLBESHYm6JandlI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Uq9VdCbV8itCKWLWk7ddgzKh08+PhvmS4HHOhhDPMnNFgL6yjrWtm1UC8lWQq1NDETFMtIYYZDopxOLo05t4vPEQfl/npUsRwBEwof+ihVolR+OFlhEl+tuFBf1ijGzcCxYK+qkplv/pyMY54VR0NAYAwPRBgldYAmi/+yjHtsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=EgPYTfZu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Tz0zDUQN; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="EgPYTfZu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Tz0zDUQN"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id DCA3C1800126;
	Wed, 24 Apr 2024 14:19:12 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Wed, 24 Apr 2024 14:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713982752; x=1714069152; bh=p3NzkKKYuy
	UG+6KgbxqEHm1k+2YfJhY6iMUSSgfltac=; b=EgPYTfZuTiE5Kre6KUpd966bef
	IzLx65IXl04dc638w4vJDH2Ha6L3GA4r8xagWcsweARtGv2JiwYCiQYJi3igMLEc
	94HfATS6O8HrWovJRLdKfE73GOpRf6rMi/qmf/YMLNSJSlh/FzX+5+iEgaFJHzNe
	nOHyDYFFBwEXjImfRCoMUMNzYAX9Ly6aVliWts3UsDKH7UG3qB1yrz2/s+o/utaY
	Um+mISKxJNeyNw+DsO2Cu6fB68V51gCs4njdpxAlL4+BW1pv3eXV0wuNiiyjNdd9
	09u5hVOr0hEyItUaRiNnrUBerCPWEh5Y+4Z/kWB7VBNXsxVE2bMvPzTm+TeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713982752; x=1714069152; bh=p3NzkKKYuyUG+6KgbxqEHm1k+2Yf
	JhY6iMUSSgfltac=; b=Tz0zDUQNJ7Eix74TnsEUfQvIcK+ajtTUgnWwz2wBaTRd
	SOI9pJyjX3NQ+ZPUN+p+jXBRWj4qCLcFx49V/4MCL2CYe2JGGt/NaW3KNwWoQrrC
	E0BLFOqMxwHz9E+2FBoRvdGsVWGwBLuyTClgxfsEnEVz9a5bYIzmHpkJO9J9neHe
	ZHGaF7QgZXmC1z+jdB4qugpC7iyyLnXSnm6DUUF3frfiU9nN/jW2IqL86TNxkrWJ
	5KpLWt8+1kfygpic32Uiaf+zEQ41/bMU2Wwk0VLI4IuH9TAgHe0vihteOlu/c6Cy
	h805dOr6XqMnUc8/oxn7248Y6hBQMJGc06Xi1kOfUA==
X-ME-Sender: <xms:H00pZhw4WbO36SCty2PN2Jcvc_eCj9-Y6QR16hXWQG5ty0xOVBjE_A>
    <xme:H00pZhQoLM92Nx8rzjFv9XUDPj3X9NDnRygdwx7o1bGK4FScm5db8HqlrlUOSZ2YH
    yEtZBROcUxuNhZkHKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelhedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssg
    drtggrqeenucggtffrrghtthgvrhhnpeeivedtkeeftdefhfdugfelgeehieeivdefffek
    jeetuddvueeijefgjeekudevtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhs
    ohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:H00pZrVgnyPsT8uKy4aQtH7oEk3pn4XAvtxmPlEqp8Q_xEI2YxNI6A>
    <xmx:IE0pZjg3fr1J93an07iFx3quT2hEaQ2drEtsFSe_UbV0soAM1Hx5uw>
    <xmx:IE0pZjCXPcjUUWgmeoDUwF6anjgVgwZKdujuVztpD7NXHuLz0tI_1w>
    <xmx:IE0pZsIbNRkhBAZYqnvBbJt1IGakAz_ppR46WL50dm8CJJfvJN-RsA>
    <xmx:IE0pZlDf_43mQdoQKtyX0A9bujrZK2U5sXKyBWuV6elKpkkvhDeDDCbq>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D5B48C60097; Wed, 24 Apr 2024 14:19:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <8f150aef-0d56-4c5b-af17-9c66084a3ae7@app.fastmail.com>
In-Reply-To: <20240424122834.19801-23-hdegoede@redhat.com>
References: <20240424122834.19801-1-hdegoede@redhat.com>
 <20240424122834.19801-23-hdegoede@redhat.com>
Date: Wed, 24 Apr 2024 14:19:40 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: "Vishnu Sankar" <vishnuocv@gmail.com>,
 "Nitin Joshi1" <njoshi1@lenovo.com>, ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v2 22/24] platform/x86: thinkpad_acpi: Support for trackpoint
 doubletap
Content-Type: text/plain

Hi Hans,

On Wed, Apr 24, 2024, at 8:28 AM, Hans de Goede wrote:
> From: Mark Pearson <mpearson-lenovo@squebb.ca>
>
> Lenovo trackpoints are adding the ability to generate a doubletap event.
> This handles the doubletap event and sends the KEY_PROG4 event to
> userspace. Despite the driver itself not using KEY_PROG1 - KEY_PROG3 this
> still uses KEY_PROG4 because of some keys being remapped to KEY_PROG1 -
> KEY_PROG3 by default by the upstream udev hwdb containing:
>
> evdev:name:ThinkPad Extra Buttons:dmi:bvn*:bvr*:bd*:svnLENOVO*:pn*:*
>  ...
>  KEYBOARD_KEY_17=prog1
>  KEYBOARD_KEY_1a=f20       # Microphone mute button
>  KEYBOARD_KEY_45=bookmarks
>  KEYBOARD_KEY_46=prog2     # Fn + PrtSc, on Windows: Snipping tool
>  KEYBOARD_KEY_4a=prog3     # Fn + Right shift, on Windows: No idea
>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Link: https://lore.kernel.org/r/20240417173124.9953-2-mpearson-lenovo@squebb.ca
> [hdegoede@redhat.com: Adjust for switch to sparse-keymap keymaps]
> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
> b/drivers/platform/x86/thinkpad_acpi.c
> index a53b00fecf1a..b6d6466215e1 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -248,6 +248,9 @@ enum tpacpi_hkey_event_t {
> 
>  	/* Misc */
>  	TP_HKEY_EV_RFKILL_CHANGED	= 0x7000, /* rfkill switch changed */
> +
> +	/* Misc2 */
> +	TP_HKEY_EV_TRACK_DOUBLETAP      = 0x8036, /* trackpoint doubletap */
>  };
> 
>  
> /****************************************************************************
> @@ -3268,6 +3271,7 @@ static const struct key_entry keymap_lenovo[] 
> __initconst = {
>  	 * after switching to sparse keymap support. The mappings above use 
> translated
>  	 * scancodes to preserve uAPI compatibility, see 
> tpacpi_input_send_key().
>  	 */
> +	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
>  	{ KE_END }
>  };
> 
> @@ -3817,6 +3821,17 @@ static bool hotkey_notify_6xxx(const u32 hkey, 
> bool *send_acpi_ev)
>  	return true;
>  }
> 
> +static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
> +{
> +	switch (hkey) {
> +	case TP_HKEY_EV_TRACK_DOUBLETAP:
> +		tpacpi_input_send_key(hkey, send_acpi_ev);
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  static void hotkey_notify(struct ibm_struct *ibm, u32 event)
>  {
>  	u32 hkey;
> @@ -3893,6 +3908,10 @@ static void hotkey_notify(struct ibm_struct 
> *ibm, u32 event)
>  				known_ev = true;
>  			}
>  			break;
> +		case 8:
> +			/* 0x8000-0x8FFF: misc2 */
> +			known_ev = hotkey_notify_8xxx(hkey, &send_acpi_ev);
> +			break;
>  		}
>  		if (!known_ev) {
>  			pr_notice("unhandled HKEY event 0x%04x\n", hkey);
> -- 
> 2.44.0

Instead of needing hotkey_notify_8xxx, now we are using the sparse_keymap can we just use hotkey_notify_hotkey for case 8? No need to check what the hkey is either.

Note - the future patch for the FN+G key (patch 24/24) will also need modifying as we'll need to move the check if the doubletap has been disabled for the doubletap hkey, but it's two lines so still seems cleaner overall.

I prototyped it on my system, and it worked.

Mark
