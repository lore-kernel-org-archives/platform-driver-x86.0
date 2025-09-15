Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F451A9F89;
	Mon, 15 Sep 2025 18:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757960632; cv=none; b=rSZKAOpfYEhwWFG+/I9w8USsaSibSrPM8yao8Lh++W7yexlseaIyNwP/Zz5ETX6fb2t7lsBQGuSAfPnDWVp+MOdcjgavzeGrg76sTDFMf5h6jOstT/er329bzMlRMZC6KlI7ogLjnBJDbuZmpxM89Jh+WnYo/S2le4x5s2+uL4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757960632; c=relaxed/simple;
	bh=QtPdwaI2bogUn91Tv21sPvB8XzumQUomt9YFpzeUaec=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PrA7PzBmdTXdnOrU5r2k03uw8qQ95X7/0nV33nSl+GUM03mLnvN+v9BHi2w+rP85lUQpstGUL3OORhZ3BRzDFExLREcbFQoQiZQfYBvXsqW+GDnJ6inxwS46B8v1zKfdPkRbVpTgFMPI/JMPGsq6JlyxB0w4VbPVK69CXLccFxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=vukdtKN+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CzNl9sPc; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="vukdtKN+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CzNl9sPc"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C40817A0060;
	Mon, 15 Sep 2025 14:23:47 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Mon, 15 Sep 2025 14:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1757960627;
	 x=1758047027; bh=cVisTyKHXr1No5n0KbcR+7S89dUhcp76H3/kwGhLyo8=; b=
	vukdtKN+W/EBBG1hTQPfdQNGdjhNqAUxLiQs1uhtG3sa5w7XK/dKvhq87rfJbcqZ
	E7pJVSPoWZbtojPoqbDWRA5b+cUpaHdh2hmYP+84x46GZKXeGYyyQgdi35hHmQNc
	f+IwVMPrI0LwY4otXEMlH3jYWL2LuL3xII2ROYQXTvow/0Oa0ixurOJ2KnLbqvrx
	QkKVCh8YdN2fAxqG3X045LREYz5sMcppQPObWC450x7kvi/a0qZvdWL4CBIhrsMv
	l6yXIGOt28ryiUBoO4fvR/H+QhlSl8I31mSz1GsulH0xJSejVKUsRtRfUTgHZGcP
	avLvt4v3eNADGSa8+ucWWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757960627; x=
	1758047027; bh=cVisTyKHXr1No5n0KbcR+7S89dUhcp76H3/kwGhLyo8=; b=C
	zNl9sPc/4k4xlS7sLkRbk7w5GxYq0CxpsbD7sW5ZJpNiaVr068OrOzyaB0wj8Ilt
	agZXs7e9OUjxXE5E07xB+zRG6oGjJd/BE4ouMiUzccw0nuh/nKmGHZYdI7su1on4
	9v6Rvtf5jgNfOm82mfwqbY7Gndc5k6bNdxQ4mf9q9ESCZCalBITM0QE8fjVNFbT6
	VhPRhlsqXJFDIDmKHPxZ+VcVdUYSlQlYR5re2AREfEseVpWQt1lQQn6rvG1ibIap
	Stca+kEJEYuKz8B+HtdHcFeCLvFZf8/W5QFBSgVZdFHrmcn4frGqwYvfmBAp2Ir4
	c2SZZ14AOBmvUlOuDFKvA==
X-ME-Sender: <xms:slnIaP34QYCUw3nUDRxJvJUuNpvHZYg56rhkwaUGMX-4mTHjBE06Iw>
    <xme:slnIaOFt_BgDMIB802h-LJnFjBbvRWxnh945SELKe5yHeZRefxZTzoPDTTVDAFoEB
    vHQXBmJIucTfDQz1dI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkeegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhepffeugfefteelgedtjeejvefhvefhvdehtdehleettdev
    tefhjeduieffudelfffhnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopeguvghrvghkjhhohhhnrdgtlhgrrhhksehgmhgrihhl
    rdgtohhmpdhrtghpthhtoheprhgrkhhurhgrmhdrvgelieesghhmrghilhdrtghomhdprh
    gtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopehilhhpohdrjhgr
    rhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepshhkhhgrnh
    eslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonh
    drohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehl
    ihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrg
    htfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:slnIaNkTSqfE_RSUByKVlMpC0lCocz_tH9TWj8Xru5HYGlCS0PabFQ>
    <xmx:slnIaGNBiZ6OsuuPx0YoCpq2pTGP2R570ZvbYx9GBVvaJHt-Q4Foog>
    <xmx:slnIaK9AdssjtmCdwZPiHhe4_uhGXtovFK9KiqKmslrhLtfNaJzwrA>
    <xmx:slnIaIEti9Y_4b5cxqsY8kVXg4ul29yTi-Ym5BtWk7JNuU-cr1kPuA>
    <xmx:s1nIaPJYb116CgQNGmxm_9EJbaPajOdYIbxaaZzoU5rE9ualNpQYR69V>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B1F832CE0078; Mon, 15 Sep 2025 14:23:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AJ31r0obZhDc
Date: Mon, 15 Sep 2025 14:23:26 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: rakuram <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Armin Wolf" <W_Armin@gmx.de>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Message-Id: <4d218ba7-71ba-4dfe-9a6f-a1997345c35a@app.fastmail.com>
In-Reply-To: <444b64a7-631e-4acf-d2c8-2f0acd379d61@linux.intel.com>
References: <20250817170644.5855-1-rakuram.e96@gmail.com>
 <31b895a4-edd0-4ce5-a20a-7d0fb67e9721@app.fastmail.com>
 <444b64a7-631e-4acf-d2c8-2f0acd379d61@linux.intel.com>
Subject: Re: [PATCH] Documentation/wmi: Fix Typo in lenovo-wmi-gamezone
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Mon, Sep 15, 2025, at 6:32 AM, Ilpo J=C3=A4rvinen wrote:
> On Wed, 20 Aug 2025, Mark Pearson wrote:
>> On Sun, Aug 17, 2025, at 1:06 PM, rakuram wrote:
>> > Fixed the below typo error
>> >
>> > freqency =3D=3D> frequency
>> > in Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>> >
>> > Signed-off-by: rakuram <rakuram.e96@gmail.com>
>> > ---
>> >  Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst=20
>> > b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>> > index 997263e51a7d..22040250a97d 100644
>> > --- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>> > +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>> > @@ -153,7 +153,7 @@ data using the `bmfdec=20
>> > <https://github.com/pali/bmfdec>`_ utility:
>> >      [WmiDataId(1), read, Description("P-State ID.")] uint32 PState=
ID;
>> >      [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
>> >      [WmiDataId(3), read, Description("Default value.")] uint32=20
>> > defaultvalue;
>> > -    [WmiDataId(4), read, Description("OC Offset freqency.")] uint3=
2=20
>> > OCOffsetFreq;
>> > +    [WmiDataId(4), read, Description("OC Offset frequency.")] uint=
32=20
>> > OCOffsetFreq;
>> >      [WmiDataId(5), read, Description("OC Min offset value.")] uint=
32=20
>> > OCMinOffset;
>> >      [WmiDataId(6), read, Description("OC Max offset value.")] uint=
32=20
>> > OCMaxOffset;
>> >      [WmiDataId(7), read, Description("OC Offset Scale.")] uint32=20
>> > OCOffsetScale;
>> > --=20
>> > 2.43.0
>>=20
>> Looks good to me.
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>
> Hi,
>
> Isn't the typo in the original interface as well? I'm not very keen in=20
> accepting this kind of patches as this part is not really user=20
> documentation to begin with.
>
I haven't had a chance to double check - but it's kinda bad that we had =
that typo in the original implementation to be honest. I can ask to get =
that fixed, but it will likely take a long time for something minor.=20
I defer to you on the preference for kernel documentation - I suspect we=
'll get a bunch of these though (part of the 'getting started to contrib=
uting to the kernel' is always typos and documentation right?).

Mark
