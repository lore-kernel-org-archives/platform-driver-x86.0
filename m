Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC3038D;
	Mon, 16 Mar 2026 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773685479; cv=none; b=fO32EArQ8KdarW8/Aj0FccfzsLIo5nfjhtAPvCN/yFdyBQ/l87GjVLyjhqhrpK3q3U0Wn+TKZ82uZxnOdXQWbVtwknFqiYqPTgd8jSGjmYaIs7t3G8Cl8g53KdGEck0QOg00PUtbogAodsNDiOCiZ35/szOGbHTBJuKI9gaIiEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773685479; c=relaxed/simple;
	bh=4ah3Lhx2a0Q959c5Ru5js7tDa5Ale7wnpPk0rx7K+N4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VfXn4m3N5Lxu9gAtvtJX+Sw2rn9nsF4YHBqGqS0KNEsXQHIuCS80ST+tsvi4YU5Kv1Aj5HTVlb9l3Kn6zu0TEhY4/8AcVQwLJ0opF9oXaC9wtjTn59yXzo/24DGzoDyNVKBeQLZjyjOElaTPkijiSFZ+bOaCr943B1Y7icondu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=sfHtUBv6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=1wi1tIOk; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="sfHtUBv6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1wi1tIOk"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 08600EC0C5A;
	Mon, 16 Mar 2026 14:24:37 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 16 Mar 2026 14:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1773685477;
	 x=1773771877; bh=4ah3Lhx2a0Q959c5Ru5js7tDa5Ale7wnpPk0rx7K+N4=; b=
	sfHtUBv6B7kc5vbbMagvJAtUn/UBy3mrc7nqsgmq2f62K66hmYt/b+Yn/tNvYgV7
	zYcj9J9rPUvoM3B56hbKd5QNOVg+T4nCJ19k78dsg6y9fQxqWmWfCfXbXZpcjzXn
	/MKd2vEBQmtKrOk88yaIwElPJVfKEgGN/eIwp1v7FSZ4197xve1e0QVRmLzX//pH
	ymkJAMZMLk2ZdMN+CvBuRhZt8PNrbwnhyWDbv7ci5eYLCYN+ka0LghyCKrgmkncf
	Q0SVOsUzjldUbDHuJbyiYQ7Y4JLx0ug+gJd8YeQoMRZ9pQbU5DN3gtOtTV7myOa1
	z0CN7K8OSaUL/HWHCQyYzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773685477; x=
	1773771877; bh=4ah3Lhx2a0Q959c5Ru5js7tDa5Ale7wnpPk0rx7K+N4=; b=1
	wi1tIOklhRqUC49O4LlcrUSGaNs5cJIxQ60ds7Q3zudprS3VchKGPtSBXsHJXXwh
	QQwsKVN8LQ1kWZ7BoynJRwFilyOU1fVrPK++f7I/260391jr1b+YciC2fy4LGol8
	F0wLf0KB0NTl3M4GjT/Q9yg0sdb+rwA7gMOPYdw9O751L5bjhDXEjyh6tJxjJXNj
	WvqdZFhyTW8nT2wiyoDHpQz+0mXLVUr3K34m/KC7Z2DVJPgsSi/Fi3lfqKTZglnT
	QR50b2alIMLY2ypZObDysYmY81sMQnENs1SlTgcVKHyzu85Mqro8KpO9C8iEgIEK
	mEUOk60m+Ytp1pFmsuC/A==
X-ME-Sender: <xms:5Eq4aU1dR4vyFLg9rhI1CbaPNuII1akXC5nlLsZu4DS3LwHvBgFqxA>
    <xme:5Eq4aZ67wA8ekId3G8OAxaSPPTSg50VH2xHGjGLNLDBPwjY8zMvNt4J_JyPdNQb0y
    PxmYSmlPn4m84VWMOH7qXNOseTvAoMJ-_CU5T5qieiEWuW_JvLpcp0D>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleeltdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhuedvheetgeehtdehtdevheduvdejjefggfeijedv
    geekhfefleehkeehvdffheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhn
    sggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghrvg
    hkjhhohhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepphhithhhvghn
    rhhitghhvdgusehgohhoghhlvghmrghilhdrtghomhdprhgtphhtthhopehhmhhhsehhmh
    hhrdgvnhhgrdgsrhdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpd
    hrtghpthhtohepihgsmhdqrggtphhiqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghf
    ohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiek
    ieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:5Eq4aZF-THU99xpCLSGUbyyuoriOFfO30j4bdQ1k7aOWX5_HwATKPw>
    <xmx:5Eq4aezflShlYULQlvVFeMPXLU3pTufNU5CJ5BMNt7bx4Wud5tvKHQ>
    <xmx:5Eq4ab1blc330nvYNciJXW8Sfz0m3_d_Wjvml7AIJtzXUM1Ihv1Yxw>
    <xmx:5Eq4aWrEC6kq1SdpA0DbYxrq80J6TN2Aubgk0XEBIGJ-tIW6GOu9Iw>
    <xmx:5Uq4afajdrAjznFsBFlNtAOfRuRSyVJ8k5tNHandmiJ21o9ly2hBMag0>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5D7942CE0072; Mon, 16 Mar 2026 14:24:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXcetOvEVYjc
Date: Mon, 16 Mar 2026 14:24:16 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Pit Henrich" <pithenrich2d@googlemail.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <0f758298-3b74-470b-ae73-12270ae98285@app.fastmail.com>
In-Reply-To: 
 <CAMBPg2c7rev33ZcF+5v=6AmCTPROBePL4Yotb-QskXdtCkP4vg@mail.gmail.com>
References: <20260314142236.74514-1-pithenrich2d@gmail.com>
 <0b0f6ef9-ae3a-4642-85af-fbdf7ebafd1e@app.fastmail.com>
 <080e0cbe-d8d0-48af-abe3-f10f5797333a@kernel.org>
 <CAMBPg2c7rev33ZcF+5v=6AmCTPROBePL4Yotb-QskXdtCkP4vg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add X1 Fold keyboard attachment
 detection
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, Mar 16, 2026, at 2:06 PM, Pit Henrich wrote:
> On Mon, 16 Mar 2026 at 14:24, Hans de Goede <hansg@kernel.org> wrote:
>> Looking at pictures of the Fold 16 gen 1, I assume this sysfs attr will return 1 when the keyboard
>> is clicked on one half of the foldable screen, covering that half so that the laptop resembles
>> a classic clamshell design in this mode. Since this is actually covering half the screen I think
>> that keyboard_attached_on_screen actually is a good name :)
>
> Yes, exactly right :)
>
> The keyboard can also be used when it is not attached, via Bluetooth.
> And there is actually another way that Lenovo intended the keyboard
> to be attached, but that way is not detectable (and wouldn't affect
> any functional behavior anyway).
>
> The intended userspace use case for this sysfs attr is to detect when
> the keyboard is attached on the lower half of the display, so that UI
> elements can be moved up and only the top half of the screen is used.
> It's a very unique use case for sure.
>
Got it - my bad. My (mild) objection is retracted ;)

Mark
