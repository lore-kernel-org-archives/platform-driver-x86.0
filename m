Received: from wfout3-smtp.messagingengine.com (wfout3-smtp.messagingengine.com [64.147.123.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C815B1E9
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 12:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713874561; cv=none; b=HXMycR/dkr0mxS38Do4Vwwb0UGF0i6wiZ0IZ3xLYExf6mCYKyssrkoNT9sWtsRlb7PQOQ3RPLucFBTs+TCEoFqxGnUxl8IRa4346aYvoW4yGoKriDVhf4ENeE0itnuw07+ZgWTwjbs7FU6Li0U9+CzWJnGzJL1VQKcSFtpNQbig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713874561; c=relaxed/simple;
	bh=bzCpoaPh5GW4RfrrwCVcWHf3MFdm6yolzDonNgI/LJw=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=ZlGynjIq+JoL2JrBtBtcQRHasHadxkpgenAjavVgqu/qt0K5eN2dapRgNoprEETKsI1ffWUVfGbBcB6QK3fs0XjiOIpxXjQqd8u+UBpiV5d5ICs9FG7eQzRGyoJCa1VNx6oMf4LtPBWDIbm+pddy/J1U8axjyfwrdWvtXR+Uouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ZmmH/PCV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QbAYx2gj; arc=none smtp.client-ip=64.147.123.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ZmmH/PCV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QbAYx2gj"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id B7E2B1C00126;
	Tue, 23 Apr 2024 08:15:56 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Tue, 23 Apr 2024 08:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713874556; x=1713960956; bh=lw9vyf1MxB
	K3dcbVpA93l8s0JjELSrKDiOCUvdiNkjU=; b=ZmmH/PCVOSMo9YUSrC4BAY0rwY
	q4z1Q0mUYE7UmrmPGKcCQGJEUkjMHlLcv2EAmVgf/tkALLe4t9cLBQ6013XTsoy9
	dLNP7itiPTLQYwXeG3r7tiZhqNPppeCQnErUNXBkb40kXQgSzxgD762lPqChPh/w
	dOXoT5rzo8gSHNLBODHgooZJwOrfxGL+0iW2qaaCs3OAQo6igaCqIimwDlPbo6sx
	50JPkcGac6aOC59DVjb6gNauFsRMOFZkpk4aLCQr7A7wB44D/xLH7pptAIGVuCCF
	SndcsW2+qGY4AmH0tv/ppwRTbRwUrC1J/iyEsKMcPGxKEPvNXFiSN22lO/IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713874556; x=1713960956; bh=lw9vyf1MxBK3dcbVpA93l8s0JjEL
	SrKDiOCUvdiNkjU=; b=QbAYx2gjQTh/4R0+FWT1sgHVZaeCSHxKdqLpNOD/iowd
	a1QQzi+/E6hBR9gpSDwWjK8s0gyxnNvHUCfBhHDnnCQZfZ2pXsVQzdbaybPpXh0I
	8b4exp+qw9jZFk3vPgyOipMWCZbaUZXqOI4F7dOU4XVIkzAFNPpgU1Few1CBeIuh
	/OkfhKcBArROn4VNOoBGipITCRklg59E59GGHVhL7pSHtjQgz0SAc/QlFP4vcyym
	6SKNHi+08dXI80EBi0ewXp1X0e/jt+GDReUe49De24NMeoUSO2psPlnO4CYfkhaA
	SlLKmZJ6JGoYO7eZHBcUOLwpgCMxX2h0NtQ3nQJtuQ==
X-ME-Sender: <xms:e6YnZt34QYfM-X5o1PH3LY6i6TlPybSz9r3a5sb9mtIgxWdC3SjTZQ>
    <xme:e6YnZkGgXzYqMQXvBBrUCCEbRPmC1NP2yPxSBWUwtTZRn67qifssz5joTx-dvhLHi
    u8JylEt2rCi-kcl9YE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeluddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssg
    drtggrqeenucggtffrrghtthgvrhhnpeeiueefjeeiveetuddvkeetfeeltdevffevudeh
    ffefjedufedvieejgedugeekhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:e6YnZt75_SG70p0Zy0mGhIcm88Y3tC4H0poiZyJkKfU9D_QAMEnyCQ>
    <xmx:e6YnZq1DLMljXu8HKGx4GAVJyxkcffji-StZ75ItoophaUACzXy3kg>
    <xmx:e6YnZgEDZhJrZP-N-Vm8b9KCC8ic1SEM3thlIFPeqqNo49l8WD94Sg>
    <xmx:e6YnZr_J9J9FZnzQiAgCVq4HR3GdrPplLE5mu_DJ60BH4lvbXGmK9w>
    <xmx:fKYnZr28ZX2omIv1R9xnUodsbplVKd6JhC2zX_E-aTCk811VvUM8q3BJ>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id ACDB2C60097; Tue, 23 Apr 2024 08:15:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <be2db1e4-159f-4b69-a07e-70e8e04fb5c3@app.fastmail.com>
In-Reply-To: <48408c1a-1745-46a8-bd33-a13861dc9884@redhat.com>
References: <20240421154520.37089-1-hdegoede@redhat.com>
 <20240421154520.37089-9-hdegoede@redhat.com>
 <3b8a783f-eeaf-4f30-8a12-57c14f51bfc5@app.fastmail.com>
 <48408c1a-1745-46a8-bd33-a13861dc9884@redhat.com>
Date: Tue, 23 Apr 2024 08:15:33 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: "Vishnu Sankar" <vishnuocv@gmail.com>,
 "Nitin Joshi1" <njoshi1@lenovo.com>, ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 08/24] platform/x86: thinkpad_acpi: Move adaptive kbd event
 handling to tpacpi_driver_event()
Content-Type: text/plain

Hi Hans

On Tue, Apr 23, 2024, at 4:35 AM, Hans de Goede wrote:
> Hi Mark,
>
> On 4/22/24 9:27 PM, Mark Pearson wrote:
>> Hi Hans,
>> 
>> On Sun, Apr 21, 2024, at 11:45 AM, Hans de Goede wrote:
>>> Factor out the adaptive kbd non hotkey event handling into
>>> adaptive_keyboard_change_row() and adaptive_keyboard_s_quickview_row()
>>> helpers and move the handling of TP_HKEY_EV_DFR_CHANGE_ROW and
>>> TP_HKEY_EV_DFR_S_QUICKVIEW_ROW to tpacpi_driver_event().
>>>
>>> This groups all the handling of hotkey events which do not emit
>>> a key press event together in tpacpi_driver_event().
>>>
>>> This is a preparation patch for moving to sparse-keymaps.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  drivers/platform/x86/thinkpad_acpi.c | 85 +++++++++++++++-------------
>>>  1 file changed, 45 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
>>> b/drivers/platform/x86/thinkpad_acpi.c
>>> index 0bbc462d604c..e8d30f4af126 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -3677,51 +3677,50 @@ static int adaptive_keyboard_get_next_mode(int 
>>> mode)
>>>  	return adaptive_keyboard_modes[i];
>>>  }
>>>
>>> +static void adaptive_keyboard_change_row(void)
>>> +{
>>> +	int mode;
>>> +
>>> +	if (adaptive_keyboard_mode_is_saved) {
>>> +		mode = adaptive_keyboard_prev_mode;
>>> +		adaptive_keyboard_mode_is_saved = false;
>>> +	} else {
>>> +		mode = adaptive_keyboard_get_mode();
>>> +		if (mode < 0)
>>> +			return;
>>> +		mode = adaptive_keyboard_get_next_mode(mode);
>>> +	}
>>> +
>>> +	adaptive_keyboard_set_mode(mode);
>>> +}
>>> +
>>> +static void adaptive_keyboard_s_quickview_row(void)
>>> +{
>>> +	int mode = adaptive_keyboard_get_mode();
>>> +
>>> +	if (mode < 0)
>>> +		return;
>>> +
>>> +	adaptive_keyboard_prev_mode = mode;
>>> +	adaptive_keyboard_mode_is_saved = true;
>>> +
>>> +	adaptive_keyboard_set_mode(FUNCTION_MODE);
>>> +}
>>> +
>>>  static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
>>>  {
>>> -	int current_mode = 0;
>>> -	int new_mode = 0;
>>> -
>>> -	switch (hkey) {
>>> -	case TP_HKEY_EV_DFR_CHANGE_ROW:
>>> -		if (adaptive_keyboard_mode_is_saved) {
>>> -			new_mode = adaptive_keyboard_prev_mode;
>>> -			adaptive_keyboard_mode_is_saved = false;
>>> -		} else {
>>> -			current_mode = adaptive_keyboard_get_mode();
>>> -			if (current_mode < 0)
>>> -				return false;
>>> -			new_mode = adaptive_keyboard_get_next_mode(
>>> -					current_mode);
>>> -		}
>>> -
>>> -		if (adaptive_keyboard_set_mode(new_mode) < 0)
>>> -			return false;
>>> -
>>> +	if (tpacpi_driver_event(hkey))
>>>  		return true;
>>>
>>> -	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
>>> -		current_mode = adaptive_keyboard_get_mode();
>>> -		if (current_mode < 0)
>>> -			return false;
>>> -
>>> -		adaptive_keyboard_prev_mode = current_mode;
>>> -		adaptive_keyboard_mode_is_saved = true;
>>> -
>>> -		if (adaptive_keyboard_set_mode (FUNCTION_MODE) < 0)
>>> -			return false;
>>> -		return true;
>>> -
>>> -	default:
>>> -		if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
>>> -		    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
>>> -			pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
>>> -			return false;
>>> -		}
>>> -		tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
>>> -				      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
>>> -		return true;
>>> +	if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
>>> +	    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
>>> +		pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
>>> +		return false;
>>>  	}
>>> +
>>> +	tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
>>> +			      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
>>> +	return true;
>>>  }
>>>
>>>  static bool hotkey_notify_extended_hotkey(const u32 hkey)
>>> @@ -11117,6 +11116,12 @@ static bool tpacpi_driver_event(const unsigned 
>>> int hkey_event)
>>>  		}
>>>  		/* Key events are suppressed by default hotkey_user_mask */
>>>  		return false;
>>> +	case TP_HKEY_EV_DFR_CHANGE_ROW:
>>> +		adaptive_keyboard_change_row();
>>> +		return true;
>>> +	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
>>> +		adaptive_keyboard_s_quickview_row();
>> 
>> Was there a reason to get rid of error handling that was previously done with adaptive_keyboard_set_mode and is now not used here?
>
> The error handling consisted of returning false instead of true
> (for known_ev), causing an unknown event message to get logged on
> top of the error already logged by adaptive_keyboard_get_mode() /
> adaptive_keyboard_set_mode().
>
> This second unknown event error is consfusin / not helpful so
> I've dropped the "return false" on error behavior, note that
> the new helpers do still return early if get_mode() fails just
> as before.
>
> I'll add a note about this to the commit message for v2 of
> the series.
>
Thanks for the explanation - makes sense.

Reviwed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

As a note - I've been working my way thru the patches. Is it OK to send one Reviewed-by at the end for all the patches for which I had no questions, or is it better to ack each one individually?

Mark
