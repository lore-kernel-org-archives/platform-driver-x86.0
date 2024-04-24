Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA4217A926
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 18:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713983271; cv=none; b=ghatseqvXOUy1kEBa1I4CZlATdp/Mz3Jz272X6fVyUkkIqIgakrlwjiLn3JCwbA6OSSAMeatq0icDRUuAV8eLBRENDfxrj29j3/x4osdViwPx5Cd2vSAMO4kFwZOuFvUi/Ee3G55MpPdYwP5Kub+jUEmlpq9R0+wti3p8+kzEOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713983271; c=relaxed/simple;
	bh=3a52tJ68FTtaP8GFrrTej/q4GaYuPRq3nVlS3nNrW1o=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=s3NrzmbWXgBPwlz6wuMtgHS7w8GuWc4yGoNuD1h6/B+X034oXu8NFXfSqprGaAULdph7Xy/0H7aBX/ZAbmmxMfiLlad/GpnZm/sSTcYKeoFjkQpX4uY6/pHDHD82poY2vk3zOeJ82V3L+Hsl+l4m11nzgWHqOEYx8vcV8SWtnFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=CvYrMC4W; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EWoPgRej; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="CvYrMC4W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EWoPgRej"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 2934418000C3;
	Wed, 24 Apr 2024 14:27:48 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Wed, 24 Apr 2024 14:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713983267; x=1714069667; bh=b1igEN2FEv
	ryVdN0GD97w9dQJ5HJoT+BTW4hH0R+1/I=; b=CvYrMC4Wi33f7aEpp0ds9oPPAB
	i20s7tndcG4Z0oCGsl9BJTgG46xvpRBxpGaQHyNZV6ccbNguy5WJHh1itdwsKjKP
	tvVlHSCbg9FYSqm2qyQ1unlzHvcdwKyhhSXQn2cgtonU/DRL2sdoXupdlH2qNHej
	R8438da80zoO6fMcSSeRuuBhn3nyxTwQMo1jcSlnsMCLblsKOeUYtzveO4aNcXow
	XikJD/B/fTGw5C4ffP494mMPyzDWl3oA5CrAyFPLEru2oEnVc+1flMjs6Ou32GrO
	zI4eaMxpezUMH4F6ULpF/A0WDFj+V+TKZV6t5Fsql5zG7e3DyjxCkF785tow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713983267; x=1714069667; bh=b1igEN2FEvryVdN0GD97w9dQJ5HJ
	oT+BTW4hH0R+1/I=; b=EWoPgRejW3hmlskFFYONJ0G/qCUOPAPYAnmLxC73c5O2
	Z478jZGV6qdgLdCYXiwXxIl3Q1/nzTMKHzRPNXcZXoO5WwtbX9OPOsLvD8+981/F
	ZhSsg9HuDXU56npr2xoGBqBqEonlaTbDLpQ81nSBxhRYmkTDVkwU8EmcTi/PKj9r
	iMIRIxNspZ5p3t5vEyV5z1bnuBzPSeP0DY6h4on6QthaIWG2puielnDq67fVRkWH
	S33GMuFir7BnTmj9DaSHtmSWxkiJLs/vV9v9RWonSxfWihW6G55bEQabIIExjtFx
	fnhrXa45GCXVQ0/64kc6/ROHrfHGApfPJkN+yG3Vug==
X-ME-Sender: <xms:I08pZi-39Eh3ATZGPG_od5sIhHbAcG1hZwhmtIVZ-DNDCv9ooWF2Nw>
    <xme:I08pZitVENbOdW1ftmxGJ8zX2DMlJaYTAF5iT3GOFzPLHeEbBsppM7PYm7-9YcFR7
    e9sCIKrAx7vYebIFg0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelhedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssg
    drtggrqeenucggtffrrghtthgvrhhnpeeiueefjeeiveetuddvkeetfeeltdevffevudeh
    ffefjedufedvieejgedugeekhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:I08pZoA9fZZxAvQjr7DFV1mPWXCW5WKWddhezNKwlo9N5SVjYJ_bMg>
    <xmx:I08pZqebd4-IgsblKbtA0w0TdcM9ThZ5h-7T8lQuYLFmmm1SSM_jSw>
    <xmx:I08pZnMU_RcQds-BRkxnLqTCnrmElXVSeWKw28rkiWA3ISplAMPUyw>
    <xmx:I08pZkmjC6zp4CAraXG6cgI0yM7mcx6G76QIoT5ZwMlSjVEbKuKgrQ>
    <xmx:I08pZieAtSS1_XcV8wXUWc9EFFD7EJcBLdzY6C5hetrmh0-iz8g7WIOz>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4DF3DC60097; Wed, 24 Apr 2024 14:27:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <10eeb2d3-0786-43e5-99dd-f609804021a2@app.fastmail.com>
In-Reply-To: <20240424122834.19801-1-hdegoede@redhat.com>
References: <20240424122834.19801-1-hdegoede@redhat.com>
Date: Wed, 24 Apr 2024 14:28:49 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: "Vishnu Sankar" <vishnuocv@gmail.com>,
 "Nitin Joshi1" <njoshi1@lenovo.com>, ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v2 00/24] platform/x86: thinkpad_acpi: Refactor hotkey handling and
 add support for some new hotkeys
Content-Type: text/plain



On Wed, Apr 24, 2024, at 8:28 AM, Hans de Goede wrote:
> Hi All,
>
> Here is v2 of my patch-series to refactor thinkpad_acpi's hotkey handling
> and to add support for some new hotkeys on new models.
>
> Changes in v2:
> - Some small code style tweaks in response to reviews
> - Add various Reviewed-by and Tested-by tags
>
> Relevant parts of v1 cover-letter:
>
> I have been very careful to not introduce any changes wrt support for
> the original ThinkPad models / hotkeys which use the hotkey_*_mask
> related code.
>
> I've also done my best to avoid any *significant* functional change but
> there are still some functional changes, which should all not impact
> userspace compatibility:
>
> 1. Adaptive keyboard special keys will now also send EV_MSC events with
>    the scancode, just like all the other hotkeys.
>
> 2. Rely on the input core for KEY_RESERVED suppression. This means that
>    keys marked as KEY_RESERVED will still send EV_MSC evdev events when
>    pressed (which helps users with mapping them to non reserved KEY_FOO
>    values if desired).
>
> 3. Align the keycodes for volume up/down/mute and brightness up/down with
>    those set by userspace through udev upstream's hwdb. Note these are all
>    for keys which are suppressed by hotkey_reserved_mask by default.
>    So this is only a functional change for users who override the default
>    hotkey-mask *and* who do not have udev's default hwdb installed.
>
> 4. Suppress ACPI netlink event generation for unknown 0x1xxx hkey events to
>    avoid userspace starting to rely on the netlink events for new hotkeys
>    before these have been added to the keymap, only to have the netlink
>    events get disabled by the adding of the new hotkeys to the keymap.
>
>    This should not cause a behavior change for existing models since all
>    currently known 0x1xxx events have a mapping.
>
> Here is a quick breakdown of the patches in this series:
>
> Patch 1 - 2: Fix a small locking issue on rmmod the only problem here
>    really is a lockdep warning, so I plan to route these fixes through
>    for-next together with the rest to keep things simple.
>
> Patch 3 - 14: Do a bunch of cleanups and refactoring
>
> Patch 15: Implements functional change no 4. I really kinda want to just
>    completely disable ACPI netlink event generation when also sending evdev
>    events instead of reporting these twice. But for the 0x11xx / 0x13xx
>    hkey events the kernel has send ACPI netlink events for years now. So
>    this disables ACPI netlink events for any new hotkeys going forward.
>
> Patch 16 - 18: Refactor / cleanup reserved key handling
>
> Patch 19: Actually move to sparse-keymaps
>
> Patch 20: Update the keymap for 2 adaptive kbd Fn row keys
>
> Patch 21 - 24: Mark's original patches adding support for the new Fn + N
>    key combo and for trackpoint doubletap slightly reworked to use
>    the new sparse-keymap.
>
> Regards,
>
> Hans
>
>
> Hans de Goede (20):
>   platform/x86: thinkpad_acpi: Take hotkey_mutex during hotkey_exit()
>   platform/x86: thinkpad_acpi: Provide hotkey_poll_stop_sync() dummy
>   platform/x86: thinkpad_acpi: Drop setting send_/ignore_acpi_ev
>     defaults twice
>   platform/x86: thinkpad_acpi: Drop ignore_acpi_ev
>   platform/x86: thinkpad_acpi: Use tpacpi_input_send_key() in adaptive
>     kbd code
>   platform/x86: thinkpad_acpi: Do hkey to scancode translation later
>   platform/x86: thinkpad_acpi: Make tpacpi_driver_event() return if it
>     handled the event
>   platform/x86: thinkpad_acpi: Move adaptive kbd event handling to
>     tpacpi_driver_event()
>   platform/x86: thinkpad_acpi: Move special original hotkeys handling
>     out of switch-case
>   platform/x86: thinkpad_acpi: Move hotkey_user_mask check to
>     tpacpi_input_send_key()
>   platform/x86: thinkpad_acpi: Always call tpacpi_driver_event() for
>     hotkeys
>   platform/x86: thinkpad_acpi: Drop tpacpi_input_send_key_masked() and
>     hotkey_driver_event()
>   platform/x86: thinkpad_acpi: Move hkey > scancode mapping to
>     tpacpi_input_send_key()
>   platform/x86: thinkpad_acpi: Move tpacpi_driver_event() call to
>     tpacpi_input_send_key()
>   platform/x86: thinkpad_acpi: Do not send ACPI netlink events for
>     unknown hotkeys
>   platform/x86: thinkpad_acpi: Change hotkey_reserved_mask
>     initialization
>   platform/x86: thinkpad_acpi: Use correct keycodes for volume and
>     brightness keys
>   platform/x86: thinkpad_acpi: Drop KEY_RESERVED special handling
>   platform/x86: thinkpad_acpi: Switch to using sparse-keymap helpers
>   platform/x86: thinkpad_acpi: Add mappings for adaptive kbd
>     clipping-tool and cloud keys
>
> Mark Pearson (4):
>   platform/x86: thinkpad_acpi: Simplify known_ev handling
>   platform/x86: thinkpad_acpi: Support for trackpoint doubletap
>   platform/x86: thinkpad_acpi: Support for system debug info hotkey
>   platform/x86: thinkpad_acpi: Support hotkey to disable trackpoint
>     doubletap
>
>  drivers/platform/x86/thinkpad_acpi.c | 854 +++++++++++----------------
>  1 file changed, 353 insertions(+), 501 deletions(-)
>
> -- 
> 2.44.0

For the entire v2 series:
Reviewed-by: mpearson-lenovo@squebb.ca

Plus a thank you. I learnt a bunch about the keymap interface/sub-system from reviewing the patch series; and I think the new sparse-keymap is a really nice cleanup.

Mark 
