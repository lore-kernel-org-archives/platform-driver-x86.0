Received: from wfout3-smtp.messagingengine.com (wfout3-smtp.messagingengine.com [64.147.123.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF00535A8
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713971437; cv=none; b=QRjSb6rR0q8l/JbkTIZ05HYC7XniswzN4QHJRoh8wM3z18i3OOxPNnQFlb9GxDg/j1l2dMp5caNWCETeHC2qnbYKciKwCzH7q7B4Kq4RiFNvDS/1cWuto7JmD1CsPfe7XZ+Ck62LZFps7gcVyAvlFSBnPJj7u08ggfT7aTEtE50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713971437; c=relaxed/simple;
	bh=Xk7mr91fReg1A2kGgr4TjVBaxp6hmefKQsQJ2stsTXI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=m3EY5JypQy7eY7qKj655yefT7D3Gt8twZFfOv9ur4gBOb7OFwEBiIcOlHNlMLiwz3B9pl1EPgK1mhH0bbtGB0CYbewnjWXtKZ8KiaecJjM1OTtqyA7HcyQX123QEjjIK/d/jc0ndtr0jf3GDdH9EC7Wivb1k/a6pzMHdQZ1bR+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=cepLRKMI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JRgJpyoT; arc=none smtp.client-ip=64.147.123.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="cepLRKMI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JRgJpyoT"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id 8442E1C0018E;
	Wed, 24 Apr 2024 11:10:33 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Wed, 24 Apr 2024 11:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713971433; x=1714057833; bh=VZAWpB6Ocd
	kpz4p+ylKN0qFjUruBbqLgESwFAjcrV/I=; b=cepLRKMIXbRFPDqchg+Q/z+mEw
	OPZ7Cf/u9xKR81FMrTp/uE7//fMx/2Un/6UvzvvguEDnFKwmipVy1R7sA7qw3OdE
	QfrJyAHBs/UmEd+eC+0oLXHKWl1mbrUT3FuCDoy0yDO/omiPrN/bArB4eP6V3+en
	xbaw1DEeGxWiN0PcD38DMA/2rTjba7HKOHH2lf/OvmchX60juSy+ujfxFghMeA1T
	xtLikwRu91UxufRUdX/brSkgOGWVvQgjTLcb4gyiXRUia1fqcLvGSQReJrWNJC1S
	aH1bvCX0yqI0asCQz2H8PusofSAJ6tpZqvRLcgE6LYylb5l2fiAYRM3XYlxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713971433; x=1714057833; bh=VZAWpB6Ocdkpz4p+ylKN0qFjUruB
	bqLgESwFAjcrV/I=; b=JRgJpyoTHpjfa6WMB9CQNto5Gb7IaWKzUiYgkt+EvEBT
	ZRuR3gA3RrRvsc7VupQuM7z/ztEULkp8wvJgCC3NFKildioxpki9mr/K1gW3wb5I
	b+WrC8qYhnO1DQ+utGRS8HrtVoYqUiWgH7PKw5fcbnzginG84+hgpCb26rfPJvKO
	YjssxPaVtSCPcMTmC+U3vyQ8XYFeL8QVQ58DTpiBhBV1YFZY8HbMZgOimx4q59gN
	SkHp+0phb9cy0msR17r5cOv7gSY7VkVrEwFKkWgMM7+0rMBQ/QsDQ1Gq2Fg2/qPw
	BnTGU8i/6EM8Zgla6JxMXHWobKTeCwHAtHPx5vYDzg==
X-ME-Sender: <xms:5yApZnHQb9-z4DXR-5rHWU3ZX-cPSUC509Qlqdo2c_4l0x7svpuQUg>
    <xme:5yApZkViAwZ6uhC1_eNsX5E3Z1aHZRwbJXULul2Rt_EKrE0-jBnHN0hKAr0S_QoO6
    1EmGWWCmUbGuDpyV5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelhedgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssg
    drtggrqeenucggtffrrghtthgvrhhnpeeiueefjeeiveetuddvkeetfeeltdevffevudeh
    ffefjedufedvieejgedugeekhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:5yApZpItt_77mxhRq-hJ4zxxowBlAj99HHxvoMs4R4nwoxWLgj_D5g>
    <xmx:5yApZlH_aur8Rp7AzzckPff9LPk1nwZLvqhrUqzLznRqtwRyGqaLPw>
    <xmx:5yApZtU_4clf8mquSdg8qTNZe8IVTTq9Hh_aF-t2TD-_hu50T_uZyg>
    <xmx:5yApZgMohGO-d005XWyr28E2S8Pt5M02DBJT4_UlDM8OepksuThv4w>
    <xmx:6SApZsEHTufyiPyDo6WhU2ydSUECnV0HlPWR-_dTFu9b8o7EMY9VwXc_>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B2AF0C60097; Wed, 24 Apr 2024 11:10:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <30bc231b-4893-40d2-bfae-250a4ddb0c8f@app.fastmail.com>
In-Reply-To: <77524ca0-89bb-4223-bd42-532f34fdd055@redhat.com>
References: <20240424122834.19801-1-hdegoede@redhat.com>
 <20240424122834.19801-17-hdegoede@redhat.com>
 <5e0e0317-9e27-4a6b-8b7a-3828f4e3f7fb@app.fastmail.com>
 <77524ca0-89bb-4223-bd42-532f34fdd055@redhat.com>
Date: Wed, 24 Apr 2024 11:11:34 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: "Vishnu Sankar" <vishnuocv@gmail.com>,
 "Nitin Joshi1" <njoshi1@lenovo.com>, ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v2 16/24] platform/x86: thinkpad_acpi: Change hotkey_reserved_mask
 initialization
Content-Type: text/plain



On Wed, Apr 24, 2024, at 10:47 AM, Hans de Goede wrote:
> Hi Mark,
>
> On 4/24/24 4:17 PM, Mark Pearson wrote:
>> Hi Hans,
>> 
>> On Wed, Apr 24, 2024, at 8:28 AM, Hans de Goede wrote:
>>> Change the hotkey_reserved_mask initialization to hardcode the list
>>> of reserved keys. There are only a few reserved keys and the code to
>>> iterate over the keymap will be removed when moving to sparse-keymaps.
>>>
>>> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  drivers/platform/x86/thinkpad_acpi.c | 21 +++++++++++++++------
>>>  1 file changed, 15 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
>>> b/drivers/platform/x86/thinkpad_acpi.c
>>> index 952bac635a18..cf5c741d1343 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -3545,6 +3545,19 @@ static int __init hotkey_init(struct 
>>> ibm_init_struct *iibm)
>>>  	dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>>>  		   "using keymap number %lu\n", keymap_id);
>>>
>>> +	/* Keys which should be reserved on both IBM and Lenovo models */
>>> +	hotkey_reserved_mask = TP_ACPI_HKEY_KBD_LIGHT_MASK |
>>> +			       TP_ACPI_HKEY_VOLUP_MASK |
>>> +			       TP_ACPI_HKEY_VOLDWN_MASK |
>>> +			       TP_ACPI_HKEY_MUTE_MASK;
>>> +	/*
>>> +	 * Reserve brightness up/down unconditionally on IBM models, on Lenovo
>>> +	 * models these are disabled based on acpi_video_get_backlight_type().
>>> +	 */
>>> +	if (keymap_id == TPACPI_KEYMAP_IBM_GENERIC)
>>> +		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
>>> +					TP_ACPI_HKEY_BRGHTDWN_MASK;
>>> +
>>>  	hotkey_keycode_map = kmemdup(&tpacpi_keymaps[keymap_id],
>>>  			TPACPI_HOTKEY_MAP_SIZE,	GFP_KERNEL);
>>>  	if (!hotkey_keycode_map) {
>>> @@ -3560,9 +3573,6 @@ static int __init hotkey_init(struct 
>>> ibm_init_struct *iibm)
>>>  		if (hotkey_keycode_map[i] != KEY_RESERVED) {
>>>  			input_set_capability(tpacpi_inputdev, EV_KEY,
>>>  						hotkey_keycode_map[i]);
>>> -		} else {
>>> -			if (i < sizeof(hotkey_reserved_mask)*8)
>>> -				hotkey_reserved_mask |= 1 << i;
>> 
>> Just to check my understanding here - does this change mean that the keys marked as KEY_RESERVED in the lenovo map won't make it into the mask?
>> 
>> e.g the ones in this block:
>>                 KEY_RESERVED,        /* Mute held, 0x103 */
>>                 KEY_BRIGHTNESS_MIN,  /* Backlight off */
>>                 KEY_RESERVED,        /* Clipping tool */
>>                 KEY_RESERVED,        /* Cloud */
>>                 KEY_RESERVED,
>>                 KEY_VOICECOMMAND,    /* Voice */
>>                 KEY_RESERVED,
>>                 KEY_RESERVED,        /* Gestures */
>>                 KEY_RESERVED,
>>                 KEY_RESERVED,
>>                 KEY_RESERVED,
>>                 KEY_CONFIG,          /* Settings */
>>                 KEY_RESERVED,        /* New tab */
>>                 KEY_REFRESH,         /* Reload */
>>                 KEY_BACK,            /* Back */
>>                 KEY_RESERVED,        /* Microphone down */
>>                 KEY_RESERVED,        /* Microphone up */
>>                 KEY_RESERVED,        /* Microphone cancellation */
>>                 KEY_RESERVED,        /* Camera mode */
>>                 KEY_RESERVED,        /* Rotate display, 0x116 */
>> 
>> I'm not sure what the effect will be and I don't have the 2014 X1 Carbon (I assume it's the G1) available to test with unfortunately.
>
> Only the 32 original hotkeys are affected by any of the hotkey_*_mask
> values, note:
>
> 			if (i < sizeof(hotkey_reserved_mask)*8)
> 				hotkey_reserved_mask |= 1 << i;
>
> The (i < sizeof(hotkey_reserved_mask)*8) condition translates to
> (i < 32) so this code only ever set bits in hotkey_reserved_mask
> for the 32 original hotkeys.
>
Ah - excellent. I had missed that.
Thanks!

Reviewed-by Mark Pearson <mpearson-lenovo@squebb.ca>
(and that applies for all patches in the series up to this one...getting through them slowly)

Mark
