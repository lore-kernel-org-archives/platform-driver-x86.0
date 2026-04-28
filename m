Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98002217F27;
	Tue, 28 Apr 2026 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382152; cv=none; b=XkXcDtpGqCYTm5Jy6PR8wOGo2BWfYSEZF/l1+/o2xlS/1DtQ0csw8LN7jwjaDq1SLEdiCQuZYlJ1HZoP5jxPWqe4q4qYfXN4LOxyEc5pva6jRlmnVBIt6dZ5Eh8KaHTRcqhy7m4/BIDJJWwbhPZHpRmVkX7tUepDxgESvINRrrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382152; c=relaxed/simple;
	bh=rwTs2COBHRKSFigOd8mXopJzM1pLG9Zt2emOYe546V4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JXPCrAfuHX/HfydE9RFVwS8saSxwr8gFkYKoj3vhOwTXp83IxmwEgSyCN9jA3/zOOPMwibvqoHcUl4rxcY0ziuCpZ8alBkdL0DxC65Bh0Vw1cxVuqcPr/FkQOIeJ1SdL9o9Z/UC6O564EIEbiyQGT7oSOWdwWSO63bNcDYccUog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=aGUdRS5O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gr2ZBwMq; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="aGUdRS5O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gr2ZBwMq"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id B0A1C1D00077;
	Tue, 28 Apr 2026 09:15:50 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 28 Apr 2026 09:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1777382150;
	 x=1777468550; bh=rwTs2COBHRKSFigOd8mXopJzM1pLG9Zt2emOYe546V4=; b=
	aGUdRS5OvTeMLSX1vUSkO8LEX+Li0KFXHoinTfHnh1R+D5ejvzGagGSHNVK9Em7p
	cmk9iSDVtSj15lR3vyawTr4Au7/1nMaDsRssZpXTPOVc9SkGUUJ3bTAk/f9O1NQi
	eX0kaNHmqy42JTHx3WyCDUGHTyJMeEJCNepiQdbs/cFbQwZJeofpPxpAqxZCpBSM
	NJbDxvK+zlnFevjvE58VHM5fD1DNIogP/IIrFyyUSASfxBseGlMC1bk83Pmt9wPZ
	tki45mSdpiY/DS+VFZm1wUfXQML6O8/CdXfj/moFZEKGe7UUxZB2IcfBNIAVsUMB
	OpAnPdOtimAn3pRVESvvLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777382150; x=
	1777468550; bh=rwTs2COBHRKSFigOd8mXopJzM1pLG9Zt2emOYe546V4=; b=g
	r2ZBwMqf4DmIfNvTo4weOLBwtl+nXk0QU16rxOX6JYP3R+JbNwStc0OkkiPs5lfA
	VSmqnl/YMasQQBQ6VX/EyowqD+QUBadyE8JLUZmBYQIQ9Tg29nV3UC3aQRtHOMFy
	y5myADxBuw34hpTcGGSdkbxtxFXwv0gdPrtGtLkDTcyYBXhVaoMvBlcPO4Ti/qzy
	fUbmLU5xAw3tJoaGfExRoMyy2yjnmoeSlyCy0gsuQVFNtt9kxUQVCelTzStPRhmI
	fuo/qdm9FMLiUmF4UcpMdSR6y03WPOt/99sAsSSQzGSQT0fIWBFeEISjIkC/gVk9
	O0PX9qaxavx23nqr/2FUw==
X-ME-Sender: <xms:BrPwabw975Ag_MMGTUiVHYxlcoMbkbcGLkB9pOU2m8DZlI7e79QqSQ>
    <xme:BrPwaeEEM3Q0JAejtWIu8Feti_nS7JsiOa7MofE2abyq47rmrInloLRsETkisntHW
    4kW6WRlyjYKPBGuQWZ5y9pdCsntNcsJdQbbdr9udidexHFlcb3Kr6v5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekudeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfevkeejueeukeefhfelleejheeuudfgteffvdetkeff
    jeduleffvdejkeefhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhgrnhhsgh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqdgrtghpihdquggvvhgvlh
    eslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrth
    hfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BrPwafer1z47Q3U_Z8ViEhd9XcIoEYHjNi22blirUPBdBXizp-M8Vg>
    <xmx:BrPwaeiR9SM6b5kLDhRa65lQ1Ny58j3yh6XF9_DZ3QOOuX3MhEZbFA>
    <xmx:BrPwafxe-wi11ijAkxY96HUAko5i0HUQT8NbpHdTygPVVqNbWGavXg>
    <xmx:BrPwaSP43VHFcKh5uz5yVdxR6jEJydr09R-uSLV2ewI1NIJpDrc8Yw>
    <xmx:BrPwaZJRmmVS7GcYwcmZ5-vHOtjLcxMGsZ4sajYN-vw5M3GzvGfR1jiY>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 352462CE0072; Tue, 28 Apr 2026 09:15:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AxZ2eQP5mGjc
Date: Tue, 28 Apr 2026 09:15:29 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Hans de Goede" <hansg@kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>
Message-Id: <c858deda-4a9b-4617-baab-d4171f927337@app.fastmail.com>
In-Reply-To: <75ad46f0-2c1f-9831-eff6-92df477f7db8@linux.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20260428125327.1196296-1-mpearson-lenovo@squebb.ca>
 <75ad46f0-2c1f-9831-eff6-92df477f7db8@linux.intel.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add sysfs to display HWDD raw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026, at 9:00 AM, Ilpo J=C3=A4rvinen wrote:
> On Tue, 28 Apr 2026, Mark Pearson wrote:
>
>> The Lenovo diagnostics and support team have requested a mechanism
>> to get the raw data from the HWDD commands to support customer debug
>> situations.
>>=20
>> Add a sysfs entry to display the raw data.
>>=20
>> As it shouldn't be needed in normal operation, add a hwdd_raw_enable
>> module parameter for when it is needed
>
> Wouldn't debugfs be more appropriate for things like this? By using it=
,=20
> you can avoid adding the module parameter as well.
>
Yeah - you're right. I was thinking of what we did on think-lmi and didn=
't think of that.
I'll revisit this.

Thanks for the quick review :)
Mark
