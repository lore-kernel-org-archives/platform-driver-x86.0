Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524D3322E
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714394401; cv=none; b=tmQi8vpXSo9q8+BZZO3M3dM4wMcXkwsns+qwnKfvrHlN3Hpq3gNQtbdQYA09/4lK0x84Z2MtAlTaGTC7lepp1BDn+dJlbO0ZQh1G54EINR+uoghrC0t0BUdfKPFUHxp3LmL8fh8I2M1ikd98M6AL5cppTkYnPKjgWcKqwA1ep8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714394401; c=relaxed/simple;
	bh=4PrKeir4bK54yWYxShK9W9HqP2DMEvTGNVTCCSOTXoc=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=b2YxrII4p5aQ6YoI4mccZhqcnBQd1VSDgswTxNaocCe5kwt/8eTeIOXBB9LI2AHeJt+Chcl/sAhxfK+bWqQmKMpt2lVqHEThOzwqWh5IolGNk8a5FC7p6up0yKNkWlzy+cl4WMscWN3s/MtbnmYng/rwO9uhFmB+4GSw3rl78l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=bP0yGN4U; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HooB3xL2; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="bP0yGN4U";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HooB3xL2"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4094B138197F;
	Mon, 29 Apr 2024 08:39:58 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Mon, 29 Apr 2024 08:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1714394398; x=1714480798; bh=hjKiwpe50k
	J00uK1INTrQaTFhpsCGRDJdX8lxLYPHtE=; b=bP0yGN4UfldUlNlBNiN4e2G2hi
	2at3zt+RsMZqWOeUN3P9QCdWRstqCjZoJGTV7B2mqnkpUTqGy26rI6lCbtQ7/ZVz
	ZjLW2wSETanSsZN5a+PNmdsgD7sPktvnsQ/eX8pKsJSodpNsfFddeaf/LPMMTz01
	xYU4aSRN/fPifu1tA/T7hLs6+XYI66HtIE9+tZ/jULctxFPBYhq8xVKWejwh8YBQ
	Do69xFe4pKPo/FjUChbzQWniI42LQFrt1vCCzYe+BpcbKokWG6YI9bjSdMdAjiRB
	UgtFLg+61QLhLLiGfeLps8wLW6WNI6KniX0rRIwefXu/MHGCKj1SXaaku1+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714394398; x=1714480798; bh=hjKiwpe50kJ00uK1INTrQaTFhpsC
	GRDJdX8lxLYPHtE=; b=HooB3xL2RpwZ0scS80kbLylH8hsChyTp74ai+H7TnPFy
	iTE6bBJ2bz3LudHH7ypX6HGDugSgUo6rIn9Nvx24Q+w5sDa7gJjyotnwklPefEhq
	7ldl0ocJ18eDyhSv8nasL5FLefLYBjBLdnvbNI+9WG0UVjMDlahSevkvbLjjz+Pc
	v6ySaSIw7bji7+HWkp9gcHx40JRPB6v8/o0oMYfE5QLfbzWNmKVoB+l3dFAOhYjz
	junYOmpc+bZSLIZkc0T+GJZdPBEv3/Gy+eKJZIAsFDTY029V6YbsdUALG0z5rm0Q
	UmPBZGltTEMzKgyK50yoHoR49EaB55TzR5q+IPfbLQ==
X-ME-Sender: <xms:HZUvZsrynyYmOlFje4tSbx2rsEHbrJZc3FdzpafgS58p8Vgobgvs8Q>
    <xme:HZUvZir4aWxSgpZp8g-CdwTvY5HzUBcm58xhv8qTdZlViZxp1b9Q36x3nukAEsxZb
    O1TphuzeJD43g37Cd8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduuddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssg
    drtggrqeenucggtffrrghtthgvrhhnpeeivedtkeeftdefhfdugfelgeehieeivdefffek
    jeetuddvueeijefgjeekudevtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhs
    ohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:HZUvZhO-LIiZLRM2wiyxNeymKN2mImvV-D_R4FFeKzG2I4Udk6jQzQ>
    <xmx:HZUvZj5sOSYDzqaaecqJ18cV57jwrk5SUwO3uwKrJOB741oJeiVt4g>
    <xmx:HZUvZr6OHqevGU6YJYEUZNnDvDotihrARX9Rw1dQJ3pXkYCAickGtw>
    <xmx:HZUvZjgXUHhDpDSh2DfxnG3GtpJ7TZzNXZfR6vSbs1PE0A9bLfuyPg>
    <xmx:HpUvZubgSYBUUSZDJbraoJIbAtvW_GMgV4Axw7pKQS5Y0khgqHiynq3c>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 935CFC60099; Mon, 29 Apr 2024 08:39:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <28d295a8-7226-4222-b167-060a99134607@app.fastmail.com>
In-Reply-To: <5ea90914-16f7-4904-b7a6-e1997880e5f0@redhat.com>
References: <20240424122834.19801-1-hdegoede@redhat.com>
 <20240424122834.19801-23-hdegoede@redhat.com>
 <8f150aef-0d56-4c5b-af17-9c66084a3ae7@app.fastmail.com>
 <5ea90914-16f7-4904-b7a6-e1997880e5f0@redhat.com>
Date: Mon, 29 Apr 2024 08:40:50 -0400
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



On Mon, Apr 29, 2024, at 5:57 AM, Hans de Goede wrote:
> Hi Mark,
>
> On 4/24/24 8:19 PM, Mark Pearson wrote:
>> Hi Hans,
>> 
>> On Wed, Apr 24, 2024, at 8:28 AM, Hans de Goede wrote:
>>> From: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>
>>> Lenovo trackpoints are adding the ability to generate a doubletap event.
>>> This handles the doubletap event and sends the KEY_PROG4 event to
>>> userspace. Despite the driver itself not using KEY_PROG1 - KEY_PROG3 this
>>> still uses KEY_PROG4 because of some keys being remapped to KEY_PROG1 -
>>> KEY_PROG3 by default by the upstream udev hwdb containing:
>>>
>>> evdev:name:ThinkPad Extra Buttons:dmi:bvn*:bvr*:bd*:svnLENOVO*:pn*:*
>>>  ...
>>>  KEYBOARD_KEY_17=prog1
>>>  KEYBOARD_KEY_1a=f20       # Microphone mute button
>>>  KEYBOARD_KEY_45=bookmarks
>>>  KEYBOARD_KEY_46=prog2     # Fn + PrtSc, on Windows: Snipping tool
>>>  KEYBOARD_KEY_4a=prog3     # Fn + Right shift, on Windows: No idea
>>>
>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
>>> Link: https://lore.kernel.org/r/20240417173124.9953-2-mpearson-lenovo@squebb.ca
>>> [hdegoede@redhat.com: Adjust for switch to sparse-keymap keymaps]
>>> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  drivers/platform/x86/thinkpad_acpi.c | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
>>> b/drivers/platform/x86/thinkpad_acpi.c
>>> index a53b00fecf1a..b6d6466215e1 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -248,6 +248,9 @@ enum tpacpi_hkey_event_t {
>>>
>>>  	/* Misc */
>>>  	TP_HKEY_EV_RFKILL_CHANGED	= 0x7000, /* rfkill switch changed */
>>> +
>>> +	/* Misc2 */
>>> +	TP_HKEY_EV_TRACK_DOUBLETAP      = 0x8036, /* trackpoint doubletap */
>>>  };
>>>
>>>  
>>> /****************************************************************************
>>> @@ -3268,6 +3271,7 @@ static const struct key_entry keymap_lenovo[] 
>>> __initconst = {
>>>  	 * after switching to sparse keymap support. The mappings above use 
>>> translated
>>>  	 * scancodes to preserve uAPI compatibility, see 
>>> tpacpi_input_send_key().
>>>  	 */
>>> +	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
>>>  	{ KE_END }
>>>  };
>>>
>>> @@ -3817,6 +3821,17 @@ static bool hotkey_notify_6xxx(const u32 hkey, 
>>> bool *send_acpi_ev)
>>>  	return true;
>>>  }
>>>
>>> +static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
>>> +{
>>> +	switch (hkey) {
>>> +	case TP_HKEY_EV_TRACK_DOUBLETAP:
>>> +		tpacpi_input_send_key(hkey, send_acpi_ev);
>>> +		return true;
>>> +	default:
>>> +		return false;
>>> +	}
>>> +}
>>> +
>>>  static void hotkey_notify(struct ibm_struct *ibm, u32 event)
>>>  {
>>>  	u32 hkey;
>>> @@ -3893,6 +3908,10 @@ static void hotkey_notify(struct ibm_struct 
>>> *ibm, u32 event)
>>>  				known_ev = true;
>>>  			}
>>>  			break;
>>> +		case 8:
>>> +			/* 0x8000-0x8FFF: misc2 */
>>> +			known_ev = hotkey_notify_8xxx(hkey, &send_acpi_ev);
>>> +			break;
>>>  		}
>>>  		if (!known_ev) {
>>>  			pr_notice("unhandled HKEY event 0x%04x\n", hkey);
>>> -- 
>>> 2.44.0
>> 
>> Instead of needing hotkey_notify_8xxx, now we are using the sparse_keymap can we just use hotkey_notify_hotkey for case 8? No need to check what the hkey is either.
>
> I prefer to keep things consistent and have each case #: path call a separate
> helper for those #xxx codes.
>
> ATM some of the simpler cases handle things directly, but as more 
> handling for
> different events get added that becomes a bit messy IMHO. I would 
> actually
> like to see those other cases converted to use a small helper function 
> too
> (with a switch-case in the helper for future proofing) to make things 
> consistent.
>
Got it - no problem.

> Patches to do this small cleanup are welcome.
>
Sounds good. Will look at doing this.

Mark
