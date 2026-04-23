Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0724221CC71;
	Thu, 23 Apr 2026 01:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776908129; cv=none; b=nJx6kjAwCcBiXTkf1OkQDYs6HS9Yb7+IeA/Q4YSxOwdXJkvU1UgD+mkyDgbgFMbBdFanMHhw1P6EI3qRUBQxqo0DXX0tLapFT0yMBEHvxjmDZjYBdEQdQiUiN/j9sf4x4U6r1BJ3faeI8Pk89t/pyeCxKEui2rSOkJXePtxUtIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776908129; c=relaxed/simple;
	bh=emXNMfadmBOHm4KUg2eOgAZ7BtL0C7LjwLWeH8I4vdo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WdHwy77ti0Qnx+hz/PQYDriaWssyshyj49sY0N3Iqwev4Io9FixU5owuDRLnxpk7O/q1mO84aP8FfO1qaUmAUe9ryX53aeR/rIOsE1+E39aTH8yWKSxx4DibpYfv00qY9vkOBpJcLpiyOfxMIvlFhqiAlsBumDvpEUzOvKCbceY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=hZdhOQzf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kFDu91uQ; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="hZdhOQzf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kFDu91uQ"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id DD6C71D000BB;
	Wed, 22 Apr 2026 21:35:25 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 22 Apr 2026 21:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1776908125;
	 x=1776994525; bh=NRT4OrK7zK3Crf9IFvFYHlezylTzkha2LRN9rsuXRmo=; b=
	hZdhOQzfaYj/J2hsC4JFcnzy/GplQ4FEXs53IOTKe2el0rTXV1UbY14lpGXSkkh0
	LksxL24X35GDRfmBFRl/gRJ6+MllxPym+CyN4gOvbDgjq7Z+oQm70kellCs0nxfY
	KQdG0UH4tmCvNYiLnr/qQuv1ZJbRsf2Ojvix7ZSHnGQ6zl7UD5kBT2JIMQZ8cJwY
	b+bu5FS6Oa97wGG/Wiw5yUee1F8RtpLEiaWduA4Q6BtB9HjRlzjhTZUGy+Bs+6ii
	QDrcxkvdkeGBuVj1Uu52DqEh6pB7X+Rt/Vd92WbPfOGCqMOg+W1Y9Pcz4DNOpTrX
	BnoJK4I2n25UfXaHuXsR1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776908125; x=
	1776994525; bh=NRT4OrK7zK3Crf9IFvFYHlezylTzkha2LRN9rsuXRmo=; b=k
	FDu91uQuoAimUBEHp/vUZEU3K4dzgYwUfLKjLOS+rZA2tQdRnCsD3DmeyRPsu8q1
	y7aXO03YBoW+uP4U69wlS74fzbopMSo9M05tdDPRqH9TJCRofqC9TnfhBeLP6sTy
	4JCdIsuu4X944tVaBoCwexEdt4SMtQUeenJIXDcEd7YfNl93XWP6YBI7CfB58A/5
	avdt96ysMcNgtEIGJXkEoSFrJ59CTrRANDJSZ97VsJIAD3f6qjSiqs8t68BZYwF2
	I+CNGOCjT2bIoG91fWHYSGnoD2MIyqtuadpOGEZP8fMJqDjfuidBn8rMOJRdXx3i
	aN4g19cNGRRmqdf35lTaQ==
X-ME-Sender: <xms:XXfpaWo7qf6f9xu1gzfnhUEQaUEQi7lNj9ngmv7aHMx5j1iuC9fyWw>
    <xme:XXfpafdbtgazqnn2bIJHhGQIWdaAV436OM53bV0I5xuGA5jtcIBdF5yJm7LvYIo9B
    jVDPwzLeoTkL3SvHs5AXgDSXS1nUxqsDH4ZtAXueQE1Tw-uuKl551Jp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiheekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfeuvdehteeghedthedtveehuddvjeejgffgieejvdeg
    kefhfeelheekhedvffehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkh
    hjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehikhgvphgrnhhh
    tgesghhmrghilhdrtghomhdprhgtphhtthhopehtuhhrkhhosghorhihshesghhmrghilh
    drtghomhdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:XXfpaRsP0uaMXYhS71fZUxdUsxEPekRD2O-OKiI0aRQkB1cEwsEFww>
    <xmx:XXfpaZirT-bqwuBKnpqZBzdhs126bmIDC9C4YKojUR1Z3X2ETPWMsA>
    <xmx:XXfpaa9dwzeQLIQBOK5YfEd4nx1zgRjgDH6Ot-f3Igy6CyuvF93mbA>
    <xmx:XXfpaUs7l9jM2P9fMOFSLzr41yZw4XXF_DF_1jvQMV8iOntg6OsMwQ>
    <xmx:XXfpabch1Xlk1chLY9hD4liYqhzgOsAzX0KhagxcD3GnVTbrT9dIzRb0>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1084D2CE3F93; Wed, 22 Apr 2026 21:35:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AyD85fmXsCP3
Date: Wed, 22 Apr 2026 21:35:03 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Borys Turko" <turkoborys@gmail.com>, "Ike Panhc" <ikepanhc@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <c0c35d9d-92cf-48e1-8e69-e737e580ab3c@app.fastmail.com>
In-Reply-To: <20260422104227.19969-1-turkoborys@gmail.com>
References: <20260422104227.19969-1-turkoborys@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: remap "Star with S" key to
 KEY_DASHBOARD
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Borys,

On Wed, Apr 22, 2026, at 6:42 AM, Borys Turko wrote:
> The customizable Lenovo hotkey ("Star with S") on the Lenovo 82EY is
> currently mapped to KEY_FAVORITES. However, KEY_FAVORITES is primarily
> handled as a browser-specific action (Add to Favorites) and is not
> consistently recognized as a system-wide hotkey by modern desktop
> environments.
>
> Testing on the Cinnamon desktop environment shows that KEY_FAVORITES
> is not captured for system mapping, and it fails to trigger any action
> in modern web browsers.
>
> Remapping this key to KEY_DASHBOARD allows it to be treated as a
> system-level event. This change enables users to map the key to
> system functions (such as a dashboard or launcher) through their
> desktop environment's keyboard settings.
>
> Tested on Lenovo 82EY with evtest and Cinnamon DE.
>
> Signed-off-by: Borys Turko <turkoborys@gmail.com>
> ---
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c 
> b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 4fbc904f1..3a5b5a478 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1333,7 +1333,7 @@ static const struct key_entry ideapad_keymap[] = {
>  	/* Esc (handled by the firmware) */
>  	{ KE_IGNORE,	0x03 | IDEAPAD_WMI_KEY },
>  	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> -	{ KE_KEY,	0x01 | IDEAPAD_WMI_KEY, { KEY_FAVORITES } },
> +	{ KE_KEY,	0x01 | IDEAPAD_WMI_KEY, { KEY_DASHBOARD } },
>  	{ KE_KEY,	0x04 | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
>  	/* Lenovo Support */
>  	{ KE_KEY,	0x07 | IDEAPAD_WMI_KEY, { KEY_HELP } },
> -- 
> 2.54.0

Interestingly thinkpad_acpi uses KEY_BOOKMARKS for the star key.

The Thinkpad user guide entry for the star key says "Customize the function of this key on the Vantage app"....so it's pretty much open season on the intention of the key (I assume Ideapad says similar).

KEY_DASHBOARD seems to intend to do an application overview (as far as I can tell it's an Apple thing)

I did try over-riding KEY_BOOKMARKS in gnome as a keyboard shortcut on my Thinkpad, and I was able to set that to whatever I wanted and it worked. Afraid I don't have any Ideapads handy.

Afraid I would lean towards not changing it. 
It's been this way since 2022 and is a valid use. If we change it there's a chance it will muck it up for someone, and at least currently it does something rather than nothing (unless configured)

If KEY_BOOKMARKS is configurable in Cinnamon then that might be a better choice - but I still lean towards no change (and seeing if Cinnamon can be fixed to let you change it)

I don't feel strongly about this - so see what other maintainers suggest.

Mark
